Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8DBDD60796
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 07:53:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8Q7rohB027281
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 00:53:50 -0700 (PDT)
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Sep 2016 00:53:49 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Sep 2016 15:53:48 +0800
Message-ID: <1474876428-5053-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] hostapd: Security Advisory-CVE-2016-4476
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Sep 2016 07:53:52 -0000
Content-Type: text/plain

Add CVE-2016-4476 patch for avoiding \n and \r characters in passphrase
parameters, which allows remote attackers to cause a denial of service
(daemon outage) via a crafted WPS operation.
patches came from http://w1.fi/security/2016-1/

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...ject-a-Credential-with-invalid-passphrase.patch | 86 ++++++++++++++++++++++
 .../recipes-connectivity/hostapd/hostapd_2.5.bb    |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch
new file mode 100644
index 0000000..2fc7896
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch
@@ -0,0 +1,86 @@
+From ecbb0b3dc122b0d290987cf9c84010bbe53e1022 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@qca.qualcomm.com>
+Date: Fri, 4 Mar 2016 17:20:18 +0200
+Subject: [PATCH 1/1] WPS: Reject a Credential with invalid passphrase
+
+WPA/WPA2-Personal passphrase is not allowed to include control
+characters. Reject a Credential received from a WPS Registrar both as
+STA (Credential) and AP (AP Settings) if the credential is for WPAPSK or
+WPA2PSK authentication type and includes an invalid passphrase.
+
+This fixes an issue where hostapd or wpa_supplicant could have updated
+the configuration file PSK/passphrase parameter with arbitrary data from
+an external device (Registrar) that may not be fully trusted. Should
+such data include a newline character, the resulting configuration file
+could become invalid and fail to be parsed.
+
+Upstream-Status: Backport
+
+CVE: CVE-2016-4476
+
+Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
+Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
+---
+ src/utils/common.c         | 12 ++++++++++++
+ src/utils/common.h         |  1 +
+ src/wps/wps_attr_process.c | 10 ++++++++++
+ 3 files changed, 23 insertions(+)
+
+diff --git a/src/utils/common.c b/src/utils/common.c
+index 450e2c6..27b7c02 100644
+--- a/src/utils/common.c
++++ b/src/utils/common.c
+@@ -697,6 +697,18 @@ int is_hex(const u8 *data, size_t len)
+ }
+ 
+ 
++int has_ctrl_char(const u8 *data, size_t len)
++{
++	size_t i;
++
++	for (i = 0; i < len; i++) {
++		if (data[i] < 32 || data[i] == 127)
++			return 1;
++	}
++	return 0;
++}
++
++
+ size_t merge_byte_arrays(u8 *res, size_t res_len,
+ 			 const u8 *src1, size_t src1_len,
+ 			 const u8 *src2, size_t src2_len)
+diff --git a/src/utils/common.h b/src/utils/common.h
+index 701dbb2..a972240 100644
+--- a/src/utils/common.h
++++ b/src/utils/common.h
+@@ -488,6 +488,7 @@ const char * wpa_ssid_txt(const u8 *ssid, size_t ssid_len);
+ 
+ char * wpa_config_parse_string(const char *value, size_t *len);
+ int is_hex(const u8 *data, size_t len);
++int has_ctrl_char(const u8 *data, size_t len);
+ size_t merge_byte_arrays(u8 *res, size_t res_len,
+ 			 const u8 *src1, size_t src1_len,
+ 			 const u8 *src2, size_t src2_len);
+diff --git a/src/wps/wps_attr_process.c b/src/wps/wps_attr_process.c
+index eadb22f..e8c4579 100644
+--- a/src/wps/wps_attr_process.c
++++ b/src/wps/wps_attr_process.c
+@@ -229,6 +229,16 @@ static int wps_workaround_cred_key(struct wps_credential *cred)
+ 		cred->key_len--;
+ #endif /* CONFIG_WPS_STRICT */
+ 	}
++
++
++	if (cred->auth_type & (WPS_AUTH_WPAPSK | WPS_AUTH_WPA2PSK) &&
++	    (cred->key_len < 8 || has_ctrl_char(cred->key, cred->key_len))) {
++		wpa_printf(MSG_INFO, "WPS: Reject credential with invalid WPA/WPA2-Personal passphrase");
++		wpa_hexdump_ascii_key(MSG_INFO, "WPS: Network Key",
++				      cred->key, cred->key_len);
++		return -1;
++	}
++
+ 	return 0;
+ }
+ 
+--
+1.9.1
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
index c38e20a..ab01235 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://defconfig \
     file://init \
     file://hostapd.service \
+    file://0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch \
 "
 
 S = "${WORKDIR}/hostapd-${PV}"
-- 
1.9.1


