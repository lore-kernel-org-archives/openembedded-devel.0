Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DF95B77B41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 02:21:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18161677"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Apr 2017 10:21:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5132247E6343
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 10:21:50 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 26 Apr 2017 10:21:50 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Apr 2017 10:22:03 +0800
Message-ID: <1493173324-7172-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 5132247E6343.A229B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] hostapd: 2.5 -> 2.6
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
X-List-Received-Date: Wed, 26 Apr 2017 02:21:56 -0000
Content-Type: text/plain

1) Upgrade hostapd from 2.5 to 2.6.
2) License checksum changed,since the copyright years were updated.
2) Delete patch "0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch", since it is integrated upstream.


Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 ...ject-a-Credential-with-invalid-passphrase.patch | 86 ----------------------
 .../hostapd/{hostapd_2.5.bb => hostapd_2.6.bb}     |  8 +-
 2 files changed, 4 insertions(+), 90 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch
 rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.5.bb => hostapd_2.6.bb} (81%)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch
deleted file mode 100644
index 2fc7896..0000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From ecbb0b3dc122b0d290987cf9c84010bbe53e1022 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@qca.qualcomm.com>
-Date: Fri, 4 Mar 2016 17:20:18 +0200
-Subject: [PATCH 1/1] WPS: Reject a Credential with invalid passphrase
-
-WPA/WPA2-Personal passphrase is not allowed to include control
-characters. Reject a Credential received from a WPS Registrar both as
-STA (Credential) and AP (AP Settings) if the credential is for WPAPSK or
-WPA2PSK authentication type and includes an invalid passphrase.
-
-This fixes an issue where hostapd or wpa_supplicant could have updated
-the configuration file PSK/passphrase parameter with arbitrary data from
-an external device (Registrar) that may not be fully trusted. Should
-such data include a newline character, the resulting configuration file
-could become invalid and fail to be parsed.
-
-Upstream-Status: Backport
-
-CVE: CVE-2016-4476
-
-Signed-off-by: Jouni Malinen <jouni@qca.qualcomm.com>
-Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
----
- src/utils/common.c         | 12 ++++++++++++
- src/utils/common.h         |  1 +
- src/wps/wps_attr_process.c | 10 ++++++++++
- 3 files changed, 23 insertions(+)
-
-diff --git a/src/utils/common.c b/src/utils/common.c
-index 450e2c6..27b7c02 100644
---- a/src/utils/common.c
-+++ b/src/utils/common.c
-@@ -697,6 +697,18 @@ int is_hex(const u8 *data, size_t len)
- }
- 
- 
-+int has_ctrl_char(const u8 *data, size_t len)
-+{
-+	size_t i;
-+
-+	for (i = 0; i < len; i++) {
-+		if (data[i] < 32 || data[i] == 127)
-+			return 1;
-+	}
-+	return 0;
-+}
-+
-+
- size_t merge_byte_arrays(u8 *res, size_t res_len,
- 			 const u8 *src1, size_t src1_len,
- 			 const u8 *src2, size_t src2_len)
-diff --git a/src/utils/common.h b/src/utils/common.h
-index 701dbb2..a972240 100644
---- a/src/utils/common.h
-+++ b/src/utils/common.h
-@@ -488,6 +488,7 @@ const char * wpa_ssid_txt(const u8 *ssid, size_t ssid_len);
- 
- char * wpa_config_parse_string(const char *value, size_t *len);
- int is_hex(const u8 *data, size_t len);
-+int has_ctrl_char(const u8 *data, size_t len);
- size_t merge_byte_arrays(u8 *res, size_t res_len,
- 			 const u8 *src1, size_t src1_len,
- 			 const u8 *src2, size_t src2_len);
-diff --git a/src/wps/wps_attr_process.c b/src/wps/wps_attr_process.c
-index eadb22f..e8c4579 100644
---- a/src/wps/wps_attr_process.c
-+++ b/src/wps/wps_attr_process.c
-@@ -229,6 +229,16 @@ static int wps_workaround_cred_key(struct wps_credential *cred)
- 		cred->key_len--;
- #endif /* CONFIG_WPS_STRICT */
- 	}
-+
-+
-+	if (cred->auth_type & (WPS_AUTH_WPAPSK | WPS_AUTH_WPA2PSK) &&
-+	    (cred->key_len < 8 || has_ctrl_char(cred->key, cred->key_len))) {
-+		wpa_printf(MSG_INFO, "WPS: Reject credential with invalid WPA/WPA2-Personal passphrase");
-+		wpa_hexdump_ascii_key(MSG_INFO, "WPS: Network Key",
-+				      cred->key, cred->key_len);
-+		return -1;
-+	}
-+
- 	return 0;
- }
- 
---
-1.9.1
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
similarity index 81%
rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
index ab01235..3b74f48 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.6.bb
@@ -1,7 +1,7 @@
 HOMEPAGE = "http://w1.fi/hostapd/"
 SECTION = "kernel/userland"
 LICENSE = "GPLv2 | BSD"
-LIC_FILES_CHKSUM = "file://${B}/README;md5=4d53178f44d4b38418a4fa8de365e11c"
+LIC_FILES_CHKSUM = "file://${B}/README;md5=8aa4e8c78b59b12016c4cb2d0a8db350"
 DEPENDS = "libnl openssl"
 SUMMARY = "User space daemon for extended IEEE 802.11 management"
 
@@ -16,7 +16,6 @@ SRC_URI = " \
     file://defconfig \
     file://init \
     file://hostapd.service \
-    file://0001-WPS-Reject-a-Credential-with-invalid-passphrase.patch \
 "
 
 S = "${WORKDIR}/hostapd-${PV}"
@@ -43,5 +42,6 @@ do_install() {
 
 CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
 
-SRC_URI[md5sum] = "69f9cec3f76d74f402864a43e4f8624f"
-SRC_URI[sha256sum] = "8e272d954dc0d7026c264b79b15389ec2b2c555b32970de39f506b9f463ec74a"
+SRC_URI[md5sum] = "eaa56dce9bd8f1d195eb62596eab34c7"
+SRC_URI[sha256sum] = "01526b90c1d23bec4b0f052039cc4456c2fd19347b4d830d1d58a0a6aea7117d"
+
-- 
2.7.4




