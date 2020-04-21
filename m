Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3383.1587446706879908657
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 22:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,408,1580745600"; 
   d="scan'208";a="89320497"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Apr 2020 11:06:01 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 531D750A9984
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 10:55:22 +0800 (CST)
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Apr 2020 11:05:55 +0800
Received: from localhost.local (10.167.225.81) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 21 Apr 2020 11:06:06 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] hostapd: CVE-2019-16275.patch
Date: Tue, 21 Apr 2020 11:09:00 +0800
Message-ID: <20200421030900.12076-1-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 531D750A9984.A8863
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

security Advisory

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-16275

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../hostapd/hostapd/CVE-2019-16275.patch      | 79 +++++++++++++++++++
 .../hostapd/hostapd_2.9.bb                    |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-16275.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-16275.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-16275.patch
new file mode 100644
index 000000000..9cefd4f2a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-16275.patch
@@ -0,0 +1,79 @@
+From d86d66dc073bc21d3b12faf4112062ae00c1773f Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Thu, 29 Aug 2019 11:52:04 +0300
+Subject: AP: Silently ignore management frame from unexpected source
+address
+
+Do not process any received Management frames with unexpected/invalid SA
+so that we do not add any state for unexpected STA addresses or end up
+sending out frames to unexpected destination. This prevents unexpected
+sequences where an unprotected frame might end up causing the AP to send
+out a response to another device and that other device processing the
+unexpected response.
+
+In particular, this prevents some potential denial of service cases
+where the unexpected response frame from the AP might result in a
+connected station dropping its association.
+
+Upstream-Status: Accepted
+CVE: CVE-2019-16275
+
+Reference to upstream patch:
+https://w1.fi/cgit/hostap/commit/?id=d86d66dc073bc21d3b12faf4112062ae00c1773f
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+---
+ src/ap/drv_callbacks.c | 13 +++++++++++++
+ src/ap/ieee802_11.c    | 12 ++++++++++++
+ 2 files changed, 25 insertions(+)
+
+diff --git a/src/ap/drv_callbacks.c b/src/ap/drv_callbacks.c
+index 3158768..34ca379 100644
+--- a/src/ap/drv_callbacks.c
++++ b/src/ap/drv_callbacks.c
+@@ -131,6 +131,19 @@ int hostapd_notif_assoc(struct hostapd_data *hapd, const u8 *addr,
+ 			   "hostapd_notif_assoc: Skip event with no address");
+ 		return -1;
+ 	}
++
++	if (is_multicast_ether_addr(addr) ||
++	    is_zero_ether_addr(addr) ||
++	    os_memcmp(addr, hapd->own_addr, ETH_ALEN) == 0) {
++		/* Do not process any frames with unexpected/invalid SA so that
++		 * we do not add any state for unexpected STA addresses or end
++		 * up sending out frames to unexpected destination. */
++		wpa_printf(MSG_DEBUG, "%s: Invalid SA=" MACSTR
++			   " in received indication - ignore this indication silently",
++			   __func__, MAC2STR(addr));
++		return 0;
++	}
++
+ 	random_add_randomness(addr, ETH_ALEN);
+ 
+ 	hostapd_logger(hapd, addr, HOSTAPD_MODULE_IEEE80211,
+diff --git a/src/ap/ieee802_11.c b/src/ap/ieee802_11.c
+index c85a28d..2816812 100644
+--- a/src/ap/ieee802_11.c
++++ b/src/ap/ieee802_11.c
+@@ -4626,6 +4626,18 @@ int ieee802_11_mgmt(struct hostapd_data *hapd, const u8 *buf, size_t len,
+ 	fc = le_to_host16(mgmt->frame_control);
+ 	stype = WLAN_FC_GET_STYPE(fc);
+ 
++	if (is_multicast_ether_addr(mgmt->sa) ||
++	    is_zero_ether_addr(mgmt->sa) ||
++	    os_memcmp(mgmt->sa, hapd->own_addr, ETH_ALEN) == 0) {
++		/* Do not process any frames with unexpected/invalid SA so that
++		 * we do not add any state for unexpected STA addresses or end
++		 * up sending out frames to unexpected destination. */
++		wpa_printf(MSG_DEBUG, "MGMT: Invalid SA=" MACSTR
++			   " in received frame - ignore this frame silently",
++			   MAC2STR(mgmt->sa));
++		return 0;
++	}
++
+ 	if (stype == WLAN_FC_STYPE_BEACON) {
+ 		handle_beacon(hapd, mgmt, len, fi);
+ 		return 1;
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
index 982514f5d..68dc12370 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
     file://defconfig \
     file://init \
     file://hostapd.service \
+    file://CVE-2019-16275.patch \
 "
 
 SRC_URI[md5sum] = "f188fc53a495fe7af3b6d77d3c31dee8"
-- 
2.17.1



