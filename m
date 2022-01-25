Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5907FC433FE
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:19:44 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.6759.1643116780654593480
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Qtqy2vNy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643116778; i=@fujitsu.com;
	bh=TVVoRnjrwXgizg7ltL7VEw1tWbrV5eqbm1rpaBoJyfc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Qtqy2vNyOBOFc0mynADTXyVyBwHelzefE9vSIQ5a8jUSU6bwiMDfkdasqMC4cHvT0
	 32bRvI9yIdX80EgB7WElhvsVG1SG94QtR2ku39Gnt3K1oVPJWgrvpwtjwTDHu1Is50
	 n8D7id3BK0JNa0RngDkbycDFdJAueo5koJ6vB9DlSIrZ1SOZfsKP6NgcB8l4QL5UUE
	 +GnwAkG3psO0Q8ZRTp03ClfyQnWZnDscabckhHTCc1Hfwh/V19rhmTy/ecd6+hKyXA
	 xMAG0OUskJ0SFR0ZRauWWsfaZAei5iFddMC/JlRCUMm6aqvkXhuAVpGs0TPY4NTW2q
	 mM2Ox07t6FAuQ==
Received: from [100.115.65.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 08/47-24566-AE8FFE16; Tue, 25 Jan 2022 13:19:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRWlGSWpSXmKPExsViZ8ORqPvyx/t
  Egz33lCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ox/+6eyFyy/y1Tx9MdDxgbGd8uYuhi5OIQE
  njBK/Jk5jxHCucAkcWDOL+YuRk4g5wSjxKc5niA2m4CaxPRbN1hBbBEBfYmls/eA1TALqEi8+
  N3DDmILC9hI7Nl1ixHEZhFQlWjf9QCshlfAUeJo/zMwW0JAQWLKw/dgNqeAk8TSh09ZIHY5Sr
  yffRaqXlDi5MwnLBDzJSQOvngB1asoMftyMwuEXSExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjXVJRZnpGSW5iZo6uoYGBrqGhqa65oa6hsbFeYpVuol5qqW5yal5JUSJQWi+xvFgvtbhY
  r7gyNzknRS8vtWQTIzCgU4rdW3cwXu77qXeIUZKDSUmUN3Hd+0QhvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKErxvvwHlBItS01Mr0jJzgNEFk5bg4FES4b0OkuYtLkjMLc5Mh0idYizluHx93iJmjg
  l/QeSbtUuA5Fsw2XbvLpBsB5OrDkxfxcwxc8HB1cwcs8Dk/fZDQPIBmGyetHw7M8frlp87mIV
  Y8vLzUqXEec2+Ay0TAFmWUZoHdwos8VxilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMyrBjKF
  JzOvBO7iV0DPMAE98/v8O5BnShIRUlINTB3n+n54q7D+lmfoalnIFxB9rNN+wZGcBEXZxhQbO
  ZWuW+tSbNKya4tr3t5YtK7bvuar1AWtO14LQ6bqbDnOeIRNJuGE+2RjHq/SkGvK96XUswP8iq
  f8qH9q/y34yLXTandEUwMymkvDy8qbHjxym3LkteTuaXoSYiLTBRudj/iyvDvyKWVRoPVa8zM
  Pls5/L3sgc4spwwvF/TWyRcK7U66znJ5zbHnoQZebl5+W1SXbXwmRzfK9L9BUE21xY2WatJ+K
  mcvN5S9ks4uDV9ZWRFxZGW6nlby1YX3d9vdWfp9uJvO/P1O54oVuc4f+EqNlTT/6Ha7+eWMmo
  JpersWwe5Jkp8D0Ded38mYrWP1WYinOSDTUYi4qTgQABqJsVbcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-532.messagelabs.com!1643116777!18416!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21141 invoked from network); 25 Jan 2022 13:19:37 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Jan 2022 13:19:37 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E597D100197
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:19:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D6E51100182
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:19:36 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 25 Jan 2022 13:19:15 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hostapd: upgrade 2.9 -> 2.10
Date: Tue, 25 Jan 2022 21:19:02 +0800
Message-ID: <1643116744-7391-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643116744-7391-1-git-send-email-wangmy@fujitsu.com>
References: <1643116744-7391-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 13:19:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95064

0001-Prepare-for-CVE-2021-30004.patch.patch
CVE-2019-16275.patch
CVE-2019-5061.patch
CVE-2021-0326.patch
CVE-2021-27803.patch
CVE-2021-30004.patch
removed since they're included in 2.10

License-Update: year updated to 2022.

Changelog:
=========
* SAE changes
  - improved protection against side channel attacks
    [https://w1.fi/security/2022-1/]
  - added option send SAE Confirm immediately (sae_config_immediate=1)
    after SAE Commit
  - added support for the hash-to-element mechanism (sae_pwe=1 or
    sae_pwe=2)
  - fixed PMKSA caching with OKC
  - added support for SAE-PK
* EAP-pwd changes
  - improved protection against side channel attacks
    [https://w1.fi/security/2022-1/]
* fixed WPS UPnP SUBSCRIBE handling of invalid operations
  [https://w1.fi/security/2020-1/]
* fixed PMF disconnection protection bypass
  [https://w1.fi/security/2019-7/]
* added support for using OpenSSL 3.0
* fixed various issues in experimental support for EAP-TEAP server
* added configuration (max_auth_rounds, max_auth_rounds_short) to
  increase the maximum number of EAP message exchanges (mainly to
  support cases with very large certificates) for the EAP server
* added support for DPP release 2 (Wi-Fi Device Provisioning Protocol)
* extended HE (IEEE 802.11ax) support, including 6 GHz support
* removed obsolete IAPP functionality
* fixed EAP-FAST server with TLS GCM/CCM ciphers
* dropped support for libnl 1.1
* added support for nl80211 control port for EAPOL frame TX/RX
* fixed OWE key derivation with groups 20 and 21; this breaks backwards
  compatibility for these groups while the default group 19 remains
  backwards compatible; owe_ptk_workaround=1 can be used to enabled a
  a workaround for the group 20/21 backwards compatibility
* added support for Beacon protection
* added support for Extended Key ID for pairwise keys
* removed WEP support from the default build (CONFIG_WEP=y can be used
  to enable it, if really needed)
* added a build option to remove TKIP support (CONFIG_NO_TKIP=y)
* added support for Transition Disable mechanism to allow the AP to
  automatically disable transition mode to improve security
* added support for PASN
* added EAP-TLS server support for TLS 1.3 (disabled by default for now)
* a large number of other fixes, cleanup, and extensions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...001-Prepare-for-CVE-2021-30004.patch.patch |  45 -
 .../hostapd/hostapd/CVE-2019-16275.patch      |  79 --
 .../hostapd/hostapd/CVE-2019-5061.patch       | 854 ------------------
 .../hostapd/hostapd/CVE-2021-0326.patch       |  43 -
 .../hostapd/hostapd/CVE-2021-27803.patch      |  54 --
 .../hostapd/hostapd/CVE-2021-30004.patch      | 123 ---
 .../{hostapd_2.9.bb => hostapd_2.10.bb}       |  12 +-
 7 files changed, 3 insertions(+), 1207 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-16275.patch
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-5061.patch
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
 rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.9.bb => hostapd_2.10.bb} (75%)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch
deleted file mode 100644
index 1bedb4f75..000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Prepare-for-CVE-2021-30004.patch.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 14fab0772db19297c82dd1b8612c9335369dce41 Mon Sep 17 00:00:00 2001
-From: Alexander Vickberg <wickbergster@gmail.com>
-Date: Mon, 17 May 2021 17:54:13 +0200
-Subject: [PATCH] Prepare for CVE-2021-30004.patch
-
-Without this building fails for CONFIG_TLS=internal
-
-Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
----
- src/tls/asn1.h       | 6 ++++++
- src/utils/includes.h | 1 +
- 2 files changed, 7 insertions(+)
-
-diff --git a/src/tls/asn1.h b/src/tls/asn1.h
-index 6bd7df5..77b94ef 100644
---- a/src/tls/asn1.h
-+++ b/src/tls/asn1.h
-@@ -66,6 +66,12 @@ void asn1_oid_to_str(const struct asn1_oid *oid, char *buf, size_t len);
- unsigned long asn1_bit_string_to_long(const u8 *buf, size_t len);
- int asn1_oid_equal(const struct asn1_oid *a, const struct asn1_oid *b);
- 
-+static inline bool asn1_is_null(const struct asn1_hdr *hdr)
-+{
-+	return hdr->class == ASN1_CLASS_UNIVERSAL &&
-+		hdr->tag == ASN1_TAG_NULL;
-+}
-+
- extern struct asn1_oid asn1_sha1_oid;
- extern struct asn1_oid asn1_sha256_oid;
- 
-diff --git a/src/utils/includes.h b/src/utils/includes.h
-index 75513fc..741fc9c 100644
---- a/src/utils/includes.h
-+++ b/src/utils/includes.h
-@@ -18,6 +18,7 @@
- 
- #include <stdlib.h>
- #include <stddef.h>
-+#include <stdbool.h>
- #include <stdio.h>
- #include <stdarg.h>
- #include <string.h>
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-16275.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-16275.patch
deleted file mode 100644
index 9cefd4f2a..000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-16275.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From d86d66dc073bc21d3b12faf4112062ae00c1773f Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Thu, 29 Aug 2019 11:52:04 +0300
-Subject: AP: Silently ignore management frame from unexpected source
-address
-
-Do not process any received Management frames with unexpected/invalid SA
-so that we do not add any state for unexpected STA addresses or end up
-sending out frames to unexpected destination. This prevents unexpected
-sequences where an unprotected frame might end up causing the AP to send
-out a response to another device and that other device processing the
-unexpected response.
-
-In particular, this prevents some potential denial of service cases
-where the unexpected response frame from the AP might result in a
-connected station dropping its association.
-
-Upstream-Status: Accepted
-CVE: CVE-2019-16275
-
-Reference to upstream patch:
-https://w1.fi/cgit/hostap/commit/?id=d86d66dc073bc21d3b12faf4112062ae00c1773f
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
----
- src/ap/drv_callbacks.c | 13 +++++++++++++
- src/ap/ieee802_11.c    | 12 ++++++++++++
- 2 files changed, 25 insertions(+)
-
-diff --git a/src/ap/drv_callbacks.c b/src/ap/drv_callbacks.c
-index 3158768..34ca379 100644
---- a/src/ap/drv_callbacks.c
-+++ b/src/ap/drv_callbacks.c
-@@ -131,6 +131,19 @@ int hostapd_notif_assoc(struct hostapd_data *hapd, const u8 *addr,
- 			   "hostapd_notif_assoc: Skip event with no address");
- 		return -1;
- 	}
-+
-+	if (is_multicast_ether_addr(addr) ||
-+	    is_zero_ether_addr(addr) ||
-+	    os_memcmp(addr, hapd->own_addr, ETH_ALEN) == 0) {
-+		/* Do not process any frames with unexpected/invalid SA so that
-+		 * we do not add any state for unexpected STA addresses or end
-+		 * up sending out frames to unexpected destination. */
-+		wpa_printf(MSG_DEBUG, "%s: Invalid SA=" MACSTR
-+			   " in received indication - ignore this indication silently",
-+			   __func__, MAC2STR(addr));
-+		return 0;
-+	}
-+
- 	random_add_randomness(addr, ETH_ALEN);
- 
- 	hostapd_logger(hapd, addr, HOSTAPD_MODULE_IEEE80211,
-diff --git a/src/ap/ieee802_11.c b/src/ap/ieee802_11.c
-index c85a28d..2816812 100644
---- a/src/ap/ieee802_11.c
-+++ b/src/ap/ieee802_11.c
-@@ -4626,6 +4626,18 @@ int ieee802_11_mgmt(struct hostapd_data *hapd, const u8 *buf, size_t len,
- 	fc = le_to_host16(mgmt->frame_control);
- 	stype = WLAN_FC_GET_STYPE(fc);
- 
-+	if (is_multicast_ether_addr(mgmt->sa) ||
-+	    is_zero_ether_addr(mgmt->sa) ||
-+	    os_memcmp(mgmt->sa, hapd->own_addr, ETH_ALEN) == 0) {
-+		/* Do not process any frames with unexpected/invalid SA so that
-+		 * we do not add any state for unexpected STA addresses or end
-+		 * up sending out frames to unexpected destination. */
-+		wpa_printf(MSG_DEBUG, "MGMT: Invalid SA=" MACSTR
-+			   " in received frame - ignore this frame silently",
-+			   MAC2STR(mgmt->sa));
-+		return 0;
-+	}
-+
- 	if (stype == WLAN_FC_STYPE_BEACON) {
- 		handle_beacon(hapd, mgmt, len, fi);
- 		return 1;
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-5061.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-5061.patch
deleted file mode 100644
index 9214615d1..000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2019-5061.patch
+++ /dev/null
@@ -1,854 +0,0 @@
-From 018edec9b2bd3db20605117c32ff79c1e625c432 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Wed, 11 Sep 2019 12:34:28 +0300
-Subject: [PATCH] Remove IAPP functionality from hostapd
-
-IEEE Std 802.11F-2003 was withdrawn in 2006 and as such it has not been
-maintained nor is there any expectation of the withdrawn trial-use
-recommended practice to be maintained in the future. Furthermore,
-implementation of IAPP in hostapd was not complete, i.e., only parts of
-the recommended practice were included. The main item of some real use
-long time ago was the Layer 2 Update frame to update bridges when a STA
-roams within an ESS, but that functionality has, in practice, been moved
-to kernel drivers to provide better integration with the networking
-stack.
-
-CVE: CVE-2019-5061
-
-Upstream-Status: Backport
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- hostapd/Android.mk                        |   5 -
- hostapd/Makefile                          |   5 -
- hostapd/android.config                    |   3 -
- hostapd/config_file.c                     |   3 +-
- hostapd/defconfig                         |   3 -
- hostapd/hostapd.conf                      |   6 -
- hostapd/main.c                            |   3 -
- src/ap/Makefile                           |   2 -
- src/ap/ap_config.h                        |   4 -
- src/ap/hostapd.c                          |  14 -
- src/ap/hostapd.h                          |   2 -
- src/ap/iapp.c                             | 542 ----------------------
- src/ap/iapp.h                             |  39 --
- src/utils/wpa_debug.h                     |   1 -
- 14 files changed, 1 insertion(+), 633 deletions(-)
- delete mode 100644 src/ap/iapp.c
- delete mode 100644 src/ap/iapp.h
-
-diff --git a/hostapd/Android.mk b/hostapd/Android.mk
-index 3183323ef..a87ac8144 100644
---- a/hostapd/Android.mk
-+++ b/hostapd/Android.mk
-@@ -205,11 +205,6 @@ endif
- 
- L_CFLAGS += -DCONFIG_CTRL_IFACE -DCONFIG_CTRL_IFACE_UNIX
- 
--ifdef CONFIG_IAPP
--L_CFLAGS += -DCONFIG_IAPP
--OBJS += src/ap/iapp.c
--endif
--
- ifdef CONFIG_RSN_PREAUTH
- L_CFLAGS += -DCONFIG_RSN_PREAUTH
- CONFIG_L2_PACKET=y
-diff --git a/hostapd/Makefile b/hostapd/Makefile
-index f7f4c785b..42bb9e4c8 100644
---- a/hostapd/Makefile
-+++ b/hostapd/Makefile
-@@ -248,11 +248,6 @@ ifndef CONFIG_NO_CTRL_IFACE
- CFLAGS += -DCONFIG_CTRL_IFACE
- endif
- 
--ifdef CONFIG_IAPP
--CFLAGS += -DCONFIG_IAPP
--OBJS += ../src/ap/iapp.o
--endif
--
- ifdef CONFIG_RSN_PREAUTH
- CFLAGS += -DCONFIG_RSN_PREAUTH
- CONFIG_L2_PACKET=y
-diff --git a/hostapd/android.config b/hostapd/android.config
-index efe252332..e2e6c7821 100644
---- a/hostapd/android.config
-+++ b/hostapd/android.config
-@@ -38,9 +38,6 @@ CONFIG_DRIVER_NL80211_QCA=y
- # Driver interface for no driver (e.g., RADIUS server only)
- #CONFIG_DRIVER_NONE=y
- 
--# IEEE 802.11F/IAPP
--#CONFIG_IAPP=y
--
- # WPA2/IEEE 802.11i RSN pre-authentication
- #CONFIG_RSN_PREAUTH=y
- 
-diff --git a/hostapd/config_file.c b/hostapd/config_file.c
-index 680f17ee0..0d340d252 100644
---- a/hostapd/config_file.c
-+++ b/hostapd/config_file.c
-@@ -2712,8 +2712,7 @@ static int hostapd_config_fill(struct hostapd_config *conf,
- 		bss->eapol_key_index_workaround = atoi(pos);
- #ifdef CONFIG_IAPP
- 	} else if (os_strcmp(buf, "iapp_interface") == 0) {
--		bss->ieee802_11f = 1;
--		os_strlcpy(bss->iapp_iface, pos, sizeof(bss->iapp_iface));
-+		wpa_printf(MSG_INFO, "DEPRECATED: iapp_interface not used");
- #endif /* CONFIG_IAPP */
- 	} else if (os_strcmp(buf, "own_ip_addr") == 0) {
- 		if (hostapd_parse_ip_addr(pos, &bss->own_ip_addr)) {
-diff --git a/hostapd/defconfig b/hostapd/defconfig
-index b1fb56c3b..1a3d9f9ba 100644
---- a/hostapd/defconfig
-+++ b/hostapd/defconfig
-@@ -44,9 +44,6 @@ CONFIG_LIBNL32=y
- # Driver interface for no driver (e.g., RADIUS server only)
- #CONFIG_DRIVER_NONE=y
- 
--# IEEE 802.11F/IAPP
--CONFIG_IAPP=y
--
- # WPA2/IEEE 802.11i RSN pre-authentication
- CONFIG_RSN_PREAUTH=y
- 
-diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
-index 6c96a760a..a3c698480 100644
---- a/hostapd/hostapd.conf
-+++ b/hostapd/hostapd.conf
-@@ -41,7 +41,6 @@ interface=wlan0
- # bit 2 (4) = RADIUS
- # bit 3 (8) = WPA
- # bit 4 (16) = driver interface
--# bit 5 (32) = IAPP
- # bit 6 (64) = MLME
- #
- # Levels (minimum value for logged events):
-@@ -1243,11 +1242,6 @@ eap_server=0
- # Whether to enable ERP on the EAP server.
- #eap_server_erp=1
- 
--##### IEEE 802.11f - Inter-Access Point Protocol (IAPP) #######################
--
--# Interface to be used for IAPP broadcast packets
--#iapp_interface=eth0
--
- 
- ##### RADIUS client configuration #############################################
- # for IEEE 802.1X with external Authentication Server, IEEE 802.11
-diff --git a/hostapd/main.c b/hostapd/main.c
-index 08896ffe2..8bfe24281 100644
---- a/hostapd/main.c
-+++ b/hostapd/main.c
-@@ -81,9 +81,6 @@ static void hostapd_logger_cb(void *ctx, const u8 *addr, unsigned int module,
- 	case HOSTAPD_MODULE_DRIVER:
- 		module_str = "DRIVER";
- 		break;
--	case HOSTAPD_MODULE_IAPP:
--		module_str = "IAPP";
--		break;
- 	case HOSTAPD_MODULE_MLME:
- 		module_str = "MLME";
- 		break;
-diff --git a/src/ap/Makefile b/src/ap/Makefile
-index bd3f33b77..54e48a0dd 100644
---- a/src/ap/Makefile
-+++ b/src/ap/Makefile
-@@ -18,7 +18,6 @@ CFLAGS += -DCONFIG_IEEE80211R_AP
- CFLAGS += -DCONFIG_WPS
- CFLAGS += -DCONFIG_PROXYARP
- CFLAGS += -DCONFIG_IPV6
--CFLAGS += -DCONFIG_IAPP
- CFLAGS += -DCONFIG_AIRTIME_POLICY
- 
- LIB_OBJS= \
-@@ -41,7 +40,6 @@ LIB_OBJS= \
- 	hostapd.o \
- 	hs20.o \
- 	hw_features.o \
--	iapp.o \
- 	ieee802_11_auth.o \
- 	ieee802_11.o \
- 	ieee802_11_ht.o \
-diff --git a/src/ap/ap_config.h b/src/ap/ap_config.h
-index e219160b0..17eb0682b 100644
---- a/src/ap/ap_config.h
-+++ b/src/ap/ap_config.h
-@@ -325,10 +325,6 @@ struct hostapd_bss_config {
- 	int erp_send_reauth_start;
- 	char *erp_domain;
- 
--	int ieee802_11f; /* use IEEE 802.11f (IAPP) */
--	char iapp_iface[IFNAMSIZ + 1]; /* interface used with IAPP broadcast
--					* frames */
--
- 	enum macaddr_acl {
- 		ACCEPT_UNLESS_DENIED = 0,
- 		DENY_UNLESS_ACCEPTED = 1,
-diff --git a/src/ap/hostapd.c b/src/ap/hostapd.c
-index ef988b634..bf7b1f89e 100644
---- a/src/ap/hostapd.c
-+++ b/src/ap/hostapd.c
-@@ -28,7 +28,6 @@
- #include "accounting.h"
- #include "ap_list.h"
- #include "beacon.h"
--#include "iapp.h"
- #include "ieee802_1x.h"
- #include "ieee802_11_auth.h"
- #include "vlan_init.h"
-@@ -361,8 +360,6 @@ static void hostapd_free_hapd_data(struct hostapd_data *hapd)
- 	hapd->beacon_set_done = 0;
- 
- 	wpa_printf(MSG_DEBUG, "%s(%s)", __func__, hapd->conf->iface);
--	iapp_deinit(hapd->iapp);
--	hapd->iapp = NULL;
- 	accounting_deinit(hapd);
- 	hostapd_deinit_wpa(hapd);
- 	vlan_deinit(hapd);
-@@ -1296,13 +1293,6 @@ static int hostapd_setup_bss(struct hostapd_data *hapd, int first)
- 		return -1;
- 	}
- 
--	if (conf->ieee802_11f &&
--	    (hapd->iapp = iapp_init(hapd, conf->iapp_iface)) == NULL) {
--		wpa_printf(MSG_ERROR, "IEEE 802.11F (IAPP) initialization "
--			   "failed.");
--		return -1;
--	}
--
- #ifdef CONFIG_INTERWORKING
- 	if (gas_serv_init(hapd)) {
- 		wpa_printf(MSG_ERROR, "GAS server initialization failed");
-@@ -3056,10 +3046,6 @@ void hostapd_new_assoc_sta(struct hostapd_data *hapd, struct sta_info *sta,
- 	hostapd_prune_associations(hapd, sta->addr);
- 	ap_sta_clear_disconnect_timeouts(hapd, sta);
- 
--	/* IEEE 802.11F (IAPP) */
--	if (hapd->conf->ieee802_11f)
--		iapp_new_station(hapd->iapp, sta);
--
- #ifdef CONFIG_P2P
- 	if (sta->p2p_ie == NULL && !sta->no_p2p_set) {
- 		sta->no_p2p_set = 1;
-diff --git a/src/ap/hostapd.h b/src/ap/hostapd.h
-index 5b859b8a9..2358d1664 100644
---- a/src/ap/hostapd.h
-+++ b/src/ap/hostapd.h
-@@ -179,8 +179,6 @@ struct hostapd_data {
- 	u64 acct_session_id;
- 	struct radius_das_data *radius_das;
- 
--	struct iapp_data *iapp;
--
- 	struct hostapd_cached_radius_acl *acl_cache;
- 	struct hostapd_acl_query_data *acl_queries;
- 
-diff --git a/src/ap/iapp.c b/src/ap/iapp.c
-deleted file mode 100644
-index 2556da30c..000000000
---- a/src/ap/iapp.c
-+++ /dev/null
-@@ -1,542 +0,0 @@
--/*
-- * hostapd / IEEE 802.11F-2003 Inter-Access Point Protocol (IAPP)
-- * Copyright (c) 2002-2007, Jouni Malinen <j@w1.fi>
-- *
-- * This software may be distributed under the terms of the BSD license.
-- * See README for more details.
-- *
-- * Note: IEEE 802.11F-2003 was a experimental use specification. It has expired
-- * and IEEE has withdrawn it. In other words, it is likely better to look at
-- * using some other mechanism for AP-to-AP communication than extending the
-- * implementation here.
-- */
--
--/* TODO:
-- * Level 1: no administrative or security support
-- *	(e.g., static BSSID to IP address mapping in each AP)
-- * Level 2: support for dynamic mapping of BSSID to IP address
-- * Level 3: support for encryption and authentication of IAPP messages
-- * - add support for MOVE-notify and MOVE-response (this requires support for
-- *   finding out IP address for previous AP using RADIUS)
-- * - add support for Send- and ACK-Security-Block to speedup IEEE 802.1X during
-- *   reassociation to another AP
-- * - implement counters etc. for IAPP MIB
-- * - verify endianness of fields in IAPP messages; are they big-endian as
-- *   used here?
-- * - RADIUS connection for AP registration and BSSID to IP address mapping
-- * - TCP connection for IAPP MOVE, CACHE
-- * - broadcast ESP for IAPP ADD-notify
-- * - ESP for IAPP MOVE messages
-- * - security block sending/processing
-- * - IEEE 802.11 context transfer
-- */
--
--#include "utils/includes.h"
--#include <net/if.h>
--#include <sys/ioctl.h>
--#include <netpacket/packet.h>
--
--#include "utils/common.h"
--#include "utils/eloop.h"
--#include "common/ieee802_11_defs.h"
--#include "hostapd.h"
--#include "ap_config.h"
--#include "ieee802_11.h"
--#include "sta_info.h"
--#include "iapp.h"
--
--
--#define IAPP_MULTICAST "224.0.1.178"
--#define IAPP_UDP_PORT 3517
--#define IAPP_TCP_PORT 3517
--
--struct iapp_hdr {
--	u8 version;
--	u8 command;
--	be16 identifier;
--	be16 length;
--	/* followed by length-6 octets of data */
--} __attribute__ ((packed));
--
--#define IAPP_VERSION 0
--
--enum IAPP_COMMAND {
--	IAPP_CMD_ADD_notify = 0,
--	IAPP_CMD_MOVE_notify = 1,
--	IAPP_CMD_MOVE_response = 2,
--	IAPP_CMD_Send_Security_Block = 3,
--	IAPP_CMD_ACK_Security_Block = 4,
--	IAPP_CMD_CACHE_notify = 5,
--	IAPP_CMD_CACHE_response = 6,
--};
--
--
--/* ADD-notify - multicast UDP on the local LAN */
--struct iapp_add_notify {
--	u8 addr_len; /* ETH_ALEN */
--	u8 reserved;
--	u8 mac_addr[ETH_ALEN];
--	be16 seq_num;
--} __attribute__ ((packed));
--
--
--/* Layer 2 Update frame (802.2 Type 1 LLC XID Update response) */
--struct iapp_layer2_update {
--	u8 da[ETH_ALEN]; /* broadcast */
--	u8 sa[ETH_ALEN]; /* STA addr */
--	be16 len; /* 6 */
--	u8 dsap; /* null DSAP address */
--	u8 ssap; /* null SSAP address, CR=Response */
--	u8 control;
--	u8 xid_info[3];
--} __attribute__ ((packed));
--
--
--/* MOVE-notify - unicast TCP */
--struct iapp_move_notify {
--	u8 addr_len; /* ETH_ALEN */
--	u8 reserved;
--	u8 mac_addr[ETH_ALEN];
--	u16 seq_num;
--	u16 ctx_block_len;
--	/* followed by ctx_block_len bytes */
--} __attribute__ ((packed));
--
--
--/* MOVE-response - unicast TCP */
--struct iapp_move_response {
--	u8 addr_len; /* ETH_ALEN */
--	u8 status;
--	u8 mac_addr[ETH_ALEN];
--	u16 seq_num;
--	u16 ctx_block_len;
--	/* followed by ctx_block_len bytes */
--} __attribute__ ((packed));
--
--enum {
--	IAPP_MOVE_SUCCESSFUL = 0,
--	IAPP_MOVE_DENIED = 1,
--	IAPP_MOVE_STALE_MOVE = 2,
--};
--
--
--/* CACHE-notify */
--struct iapp_cache_notify {
--	u8 addr_len; /* ETH_ALEN */
--	u8 reserved;
--	u8 mac_addr[ETH_ALEN];
--	u16 seq_num;
--	u8 current_ap[ETH_ALEN];
--	u16 ctx_block_len;
--	/* ctx_block_len bytes of context block followed by 16-bit context
--	 * timeout */
--} __attribute__ ((packed));
--
--
--/* CACHE-response - unicast TCP */
--struct iapp_cache_response {
--	u8 addr_len; /* ETH_ALEN */
--	u8 status;
--	u8 mac_addr[ETH_ALEN];
--	u16 seq_num;
--} __attribute__ ((packed));
--
--enum {
--	IAPP_CACHE_SUCCESSFUL = 0,
--	IAPP_CACHE_STALE_CACHE = 1,
--};
--
--
--/* Send-Security-Block - unicast TCP */
--struct iapp_send_security_block {
--	u8 iv[8];
--	u16 sec_block_len;
--	/* followed by sec_block_len bytes of security block */
--} __attribute__ ((packed));
--
--
--/* ACK-Security-Block - unicast TCP */
--struct iapp_ack_security_block {
--	u8 iv[8];
--	u8 new_ap_ack_authenticator[48];
--} __attribute__ ((packed));
--
--
--struct iapp_data {
--	struct hostapd_data *hapd;
--	u16 identifier; /* next IAPP identifier */
--	struct in_addr own, multicast;
--	int udp_sock;
--	int packet_sock;
--};
--
--
--static void iapp_send_add(struct iapp_data *iapp, u8 *mac_addr, u16 seq_num)
--{
--	char buf[128];
--	struct iapp_hdr *hdr;
--	struct iapp_add_notify *add;
--	struct sockaddr_in addr;
--
--	/* Send IAPP ADD-notify to remove possible association from other APs
--	 */
--
--	hdr = (struct iapp_hdr *) buf;
--	hdr->version = IAPP_VERSION;
--	hdr->command = IAPP_CMD_ADD_notify;
--	hdr->identifier = host_to_be16(iapp->identifier++);
--	hdr->length = host_to_be16(sizeof(*hdr) + sizeof(*add));
--
--	add = (struct iapp_add_notify *) (hdr + 1);
--	add->addr_len = ETH_ALEN;
--	add->reserved = 0;
--	os_memcpy(add->mac_addr, mac_addr, ETH_ALEN);
--
--	add->seq_num = host_to_be16(seq_num);
--	
--	os_memset(&addr, 0, sizeof(addr));
--	addr.sin_family = AF_INET;
--	addr.sin_addr.s_addr = iapp->multicast.s_addr;
--	addr.sin_port = htons(IAPP_UDP_PORT);
--	if (sendto(iapp->udp_sock, buf, (char *) (add + 1) - buf, 0,
--		   (struct sockaddr *) &addr, sizeof(addr)) < 0)
--		wpa_printf(MSG_INFO, "sendto[IAPP-ADD]: %s", strerror(errno));
--}
--
--
--static void iapp_send_layer2_update(struct iapp_data *iapp, u8 *addr)
--{
--	struct iapp_layer2_update msg;
--
--	/* Send Level 2 Update Frame to update forwarding tables in layer 2
--	 * bridge devices */
--
--	/* 802.2 Type 1 Logical Link Control (LLC) Exchange Identifier (XID)
--	 * Update response frame; IEEE Std 802.2-1998, 5.4.1.2.1 */
--
--	os_memset(msg.da, 0xff, ETH_ALEN);
--	os_memcpy(msg.sa, addr, ETH_ALEN);
--	msg.len = host_to_be16(6);
--	msg.dsap = 0; /* NULL DSAP address */
--	msg.ssap = 0x01; /* NULL SSAP address, CR Bit: Response */
--	msg.control = 0xaf; /* XID response lsb.1111F101.
--			     * F=0 (no poll command; unsolicited frame) */
--	msg.xid_info[0] = 0x81; /* XID format identifier */
--	msg.xid_info[1] = 1; /* LLC types/classes: Type 1 LLC */
--	msg.xid_info[2] = 1 << 1; /* XID sender's receive window size (RW)
--				   * FIX: what is correct RW with 802.11? */
--
--	if (send(iapp->packet_sock, &msg, sizeof(msg), 0) < 0)
--		wpa_printf(MSG_INFO, "send[L2 Update]: %s", strerror(errno));
--}
--
--
--/**
-- * iapp_new_station - IAPP processing for a new STA
-- * @iapp: IAPP data
-- * @sta: The associated station
-- */
--void iapp_new_station(struct iapp_data *iapp, struct sta_info *sta)
--{
--	u16 seq = 0; /* TODO */
--
--	if (iapp == NULL)
--		return;
--
--	/* IAPP-ADD.request(MAC Address, Sequence Number, Timeout) */
--	hostapd_logger(iapp->hapd, sta->addr, HOSTAPD_MODULE_IAPP,
--		       HOSTAPD_LEVEL_DEBUG, "IAPP-ADD.request(seq=%d)", seq);
--	iapp_send_layer2_update(iapp, sta->addr);
--	iapp_send_add(iapp, sta->addr, seq);
--
--	/* TODO: If this was reassociation:
--	 * IAPP-MOVE.request(MAC Address, Sequence Number, Old AP,
--	 *                   Context Block, Timeout)
--	 * TODO: Send IAPP-MOVE to the old AP; Map Old AP BSSID to
--	 * IP address */
--}
--
--
--static void iapp_process_add_notify(struct iapp_data *iapp,
--				    struct sockaddr_in *from,
--				    struct iapp_hdr *hdr, int len)
--{
--	struct iapp_add_notify *add = (struct iapp_add_notify *) (hdr + 1);
--	struct sta_info *sta;
--
--	if (len != sizeof(*add)) {
--		wpa_printf(MSG_INFO, "Invalid IAPP-ADD packet length %d (expected %lu)",
--			   len, (unsigned long) sizeof(*add));
--		return;
--	}
--
--	sta = ap_get_sta(iapp->hapd, add->mac_addr);
--
--	/* IAPP-ADD.indication(MAC Address, Sequence Number) */
--	hostapd_logger(iapp->hapd, add->mac_addr, HOSTAPD_MODULE_IAPP,
--		       HOSTAPD_LEVEL_INFO,
--		       "Received IAPP ADD-notify (seq# %d) from %s:%d%s",
--		       be_to_host16(add->seq_num),
--		       inet_ntoa(from->sin_addr), ntohs(from->sin_port),
--		       sta ? "" : " (STA not found)");
--
--	if (!sta)
--		return;
--
--	/* TODO: could use seq_num to try to determine whether last association
--	 * to this AP is newer than the one advertised in IAPP-ADD. Although,
--	 * this is not really a reliable verification. */
--
--	hostapd_logger(iapp->hapd, add->mac_addr, HOSTAPD_MODULE_IAPP,
--		       HOSTAPD_LEVEL_DEBUG,
--		       "Removing STA due to IAPP ADD-notify");
--	ap_sta_disconnect(iapp->hapd, sta, NULL, 0);
--}
--
--
--/**
-- * iapp_receive_udp - Process IAPP UDP frames
-- * @sock: File descriptor for the socket
-- * @eloop_ctx: IAPP data (struct iapp_data *)
-- * @sock_ctx: Not used
-- */
--static void iapp_receive_udp(int sock, void *eloop_ctx, void *sock_ctx)
--{
--	struct iapp_data *iapp = eloop_ctx;
--	int len, hlen;
--	unsigned char buf[128];
--	struct sockaddr_in from;
--	socklen_t fromlen;
--	struct iapp_hdr *hdr;
--
--	/* Handle incoming IAPP frames (over UDP/IP) */
--
--	fromlen = sizeof(from);
--	len = recvfrom(iapp->udp_sock, buf, sizeof(buf), 0,
--		       (struct sockaddr *) &from, &fromlen);
--	if (len < 0) {
--		wpa_printf(MSG_INFO, "iapp_receive_udp - recvfrom: %s",
--			   strerror(errno));
--		return;
--	}
--
--	if (from.sin_addr.s_addr == iapp->own.s_addr)
--		return; /* ignore own IAPP messages */
--
--	hostapd_logger(iapp->hapd, NULL, HOSTAPD_MODULE_IAPP,
--		       HOSTAPD_LEVEL_DEBUG,
--		       "Received %d byte IAPP frame from %s%s\n",
--		       len, inet_ntoa(from.sin_addr),
--		       len < (int) sizeof(*hdr) ? " (too short)" : "");
--
--	if (len < (int) sizeof(*hdr))
--		return;
--
--	hdr = (struct iapp_hdr *) buf;
--	hlen = be_to_host16(hdr->length);
--	hostapd_logger(iapp->hapd, NULL, HOSTAPD_MODULE_IAPP,
--		       HOSTAPD_LEVEL_DEBUG,
--		       "RX: version=%d command=%d id=%d len=%d\n",
--		       hdr->version, hdr->command,
--		       be_to_host16(hdr->identifier), hlen);
--	if (hdr->version != IAPP_VERSION) {
--		wpa_printf(MSG_INFO, "Dropping IAPP frame with unknown version %d",
--			   hdr->version);
--		return;
--	}
--	if (hlen > len) {
--		wpa_printf(MSG_INFO, "Underflow IAPP frame (hlen=%d len=%d)",
--			   hlen, len);
--		return;
--	}
--	if (hlen < len) {
--		wpa_printf(MSG_INFO, "Ignoring %d extra bytes from IAPP frame",
--			   len - hlen);
--		len = hlen;
--	}
--
--	switch (hdr->command) {
--	case IAPP_CMD_ADD_notify:
--		iapp_process_add_notify(iapp, &from, hdr, len - sizeof(*hdr));
--		break;
--	case IAPP_CMD_MOVE_notify:
--		/* TODO: MOVE is using TCP; so move this to TCP handler once it
--		 * is implemented.. */
--		/* IAPP-MOVE.indication(MAC Address, New BSSID,
--		 * Sequence Number, AP Address, Context Block) */
--		/* TODO: process */
--		break;
--	default:
--		wpa_printf(MSG_INFO, "Unknown IAPP command %d", hdr->command);
--		break;
--	}
--}
--
--
--struct iapp_data * iapp_init(struct hostapd_data *hapd, const char *iface)
--{
--	struct ifreq ifr;
--	struct sockaddr_ll addr;
--	int ifindex;
--	struct sockaddr_in *paddr, uaddr;
--	struct iapp_data *iapp;
--	struct ip_mreqn mreq;
--	int reuseaddr = 1;
--
--	iapp = os_zalloc(sizeof(*iapp));
--	if (iapp == NULL)
--		return NULL;
--	iapp->hapd = hapd;
--	iapp->udp_sock = iapp->packet_sock = -1;
--
--	/* TODO:
--	 * open socket for sending and receiving IAPP frames over TCP
--	 */
--
--	iapp->udp_sock = socket(PF_INET, SOCK_DGRAM, 0);
--	if (iapp->udp_sock < 0) {
--		wpa_printf(MSG_INFO, "iapp_init - socket[PF_INET,SOCK_DGRAM]: %s",
--			   strerror(errno));
--		iapp_deinit(iapp);
--		return NULL;
--	}
--
--	os_memset(&ifr, 0, sizeof(ifr));
--	os_strlcpy(ifr.ifr_name, iface, sizeof(ifr.ifr_name));
--	if (ioctl(iapp->udp_sock, SIOCGIFINDEX, &ifr) != 0) {
--		wpa_printf(MSG_INFO, "iapp_init - ioctl(SIOCGIFINDEX): %s",
--			   strerror(errno));
--		iapp_deinit(iapp);
--		return NULL;
--	}
--	ifindex = ifr.ifr_ifindex;
--
--	if (ioctl(iapp->udp_sock, SIOCGIFADDR, &ifr) != 0) {
--		wpa_printf(MSG_INFO, "iapp_init - ioctl(SIOCGIFADDR): %s",
--			   strerror(errno));
--		iapp_deinit(iapp);
--		return NULL;
--	}
--	paddr = (struct sockaddr_in *) &ifr.ifr_addr;
--	if (paddr->sin_family != AF_INET) {
--		wpa_printf(MSG_INFO, "IAPP: Invalid address family %i (SIOCGIFADDR)",
--			   paddr->sin_family);
--		iapp_deinit(iapp);
--		return NULL;
--	}
--	iapp->own.s_addr = paddr->sin_addr.s_addr;
--
--	if (ioctl(iapp->udp_sock, SIOCGIFBRDADDR, &ifr) != 0) {
--		wpa_printf(MSG_INFO, "iapp_init - ioctl(SIOCGIFBRDADDR): %s",
--			   strerror(errno));
--		iapp_deinit(iapp);
--		return NULL;
--	}
--	paddr = (struct sockaddr_in *) &ifr.ifr_addr;
--	if (paddr->sin_family != AF_INET) {
--		wpa_printf(MSG_INFO, "Invalid address family %i (SIOCGIFBRDADDR)",
--			   paddr->sin_family);
--		iapp_deinit(iapp);
--		return NULL;
--	}
--	inet_aton(IAPP_MULTICAST, &iapp->multicast);
--
--	os_memset(&uaddr, 0, sizeof(uaddr));
--	uaddr.sin_family = AF_INET;
--	uaddr.sin_port = htons(IAPP_UDP_PORT);
--
--	if (setsockopt(iapp->udp_sock, SOL_SOCKET, SO_REUSEADDR, &reuseaddr,
--		       sizeof(reuseaddr)) < 0) {
--		wpa_printf(MSG_INFO,
--			   "iapp_init - setsockopt[UDP,SO_REUSEADDR]: %s",
--			   strerror(errno));
--		/*
--		 * Ignore this and try to continue. This is fine for single
--		 * BSS cases, but may fail if multiple BSSes enable IAPP.
--		 */
--	}
--
--	if (bind(iapp->udp_sock, (struct sockaddr *) &uaddr,
--		 sizeof(uaddr)) < 0) {
--		wpa_printf(MSG_INFO, "iapp_init - bind[UDP]: %s",
--			   strerror(errno));
--		iapp_deinit(iapp);
--		return NULL;
--	}
--
--	os_memset(&mreq, 0, sizeof(mreq));
--	mreq.imr_multiaddr = iapp->multicast;
--	mreq.imr_address.s_addr = INADDR_ANY;
--	mreq.imr_ifindex = 0;
--	if (setsockopt(iapp->udp_sock, SOL_IP, IP_ADD_MEMBERSHIP, &mreq,
--		       sizeof(mreq)) < 0) {
--		wpa_printf(MSG_INFO, "iapp_init - setsockopt[UDP,IP_ADD_MEMBERSHIP]: %s",
--			   strerror(errno));
--		iapp_deinit(iapp);
--		return NULL;
--	}
--
--	iapp->packet_sock = socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
--	if (iapp->packet_sock < 0) {
--		wpa_printf(MSG_INFO, "iapp_init - socket[PF_PACKET,SOCK_RAW]: %s",
--			   strerror(errno));
--		iapp_deinit(iapp);
--		return NULL;
--	}
--
--	os_memset(&addr, 0, sizeof(addr));
--	addr.sll_family = AF_PACKET;
--	addr.sll_ifindex = ifindex;
--	if (bind(iapp->packet_sock, (struct sockaddr *) &addr,
--		 sizeof(addr)) < 0) {
--		wpa_printf(MSG_INFO, "iapp_init - bind[PACKET]: %s",
--			   strerror(errno));
--		iapp_deinit(iapp);
--		return NULL;
--	}
--
--	if (eloop_register_read_sock(iapp->udp_sock, iapp_receive_udp,
--				     iapp, NULL)) {
--		wpa_printf(MSG_INFO, "Could not register read socket for IAPP");
--		iapp_deinit(iapp);
--		return NULL;
--	}
--
--	wpa_printf(MSG_INFO, "IEEE 802.11F (IAPP) using interface %s", iface);
--
--	/* TODO: For levels 2 and 3: send RADIUS Initiate-Request, receive
--	 * RADIUS Initiate-Accept or Initiate-Reject. IAPP port should actually
--	 * be openned only after receiving Initiate-Accept. If Initiate-Reject
--	 * is received, IAPP is not started. */
--
--	return iapp;
--}
--
--
--void iapp_deinit(struct iapp_data *iapp)
--{
--	struct ip_mreqn mreq;
--
--	if (iapp == NULL)
--		return;
--
--	if (iapp->udp_sock >= 0) {
--		os_memset(&mreq, 0, sizeof(mreq));
--		mreq.imr_multiaddr = iapp->multicast;
--		mreq.imr_address.s_addr = INADDR_ANY;
--		mreq.imr_ifindex = 0;
--		if (setsockopt(iapp->udp_sock, SOL_IP, IP_DROP_MEMBERSHIP,
--			       &mreq, sizeof(mreq)) < 0) {
--			wpa_printf(MSG_INFO, "iapp_deinit - setsockopt[UDP,IP_DEL_MEMBERSHIP]: %s",
--				   strerror(errno));
--		}
--
--		eloop_unregister_read_sock(iapp->udp_sock);
--		close(iapp->udp_sock);
--	}
--	if (iapp->packet_sock >= 0) {
--		eloop_unregister_read_sock(iapp->packet_sock);
--		close(iapp->packet_sock);
--	}
--	os_free(iapp);
--}
-diff --git a/src/ap/iapp.h b/src/ap/iapp.h
-deleted file mode 100644
-index c22118342..000000000
---- a/src/ap/iapp.h
-+++ /dev/null
-@@ -1,39 +0,0 @@
--/*
-- * hostapd / IEEE 802.11F-2003 Inter-Access Point Protocol (IAPP)
-- * Copyright (c) 2002-2005, Jouni Malinen <j@w1.fi>
-- *
-- * This software may be distributed under the terms of the BSD license.
-- * See README for more details.
-- */
--
--#ifndef IAPP_H
--#define IAPP_H
--
--struct iapp_data;
--
--#ifdef CONFIG_IAPP
--
--void iapp_new_station(struct iapp_data *iapp, struct sta_info *sta);
--struct iapp_data * iapp_init(struct hostapd_data *hapd, const char *iface);
--void iapp_deinit(struct iapp_data *iapp);
--
--#else /* CONFIG_IAPP */
--
--static inline void iapp_new_station(struct iapp_data *iapp,
--				    struct sta_info *sta)
--{
--}
--
--static inline struct iapp_data * iapp_init(struct hostapd_data *hapd,
--					   const char *iface)
--{
--	return NULL;
--}
--
--static inline void iapp_deinit(struct iapp_data *iapp)
--{
--}
--
--#endif /* CONFIG_IAPP */
--
--#endif /* IAPP_H */
-diff --git a/src/utils/wpa_debug.h b/src/utils/wpa_debug.h
-index 1fe0b7db7..c94c4391f 100644
---- a/src/utils/wpa_debug.h
-+++ b/src/utils/wpa_debug.h
-@@ -305,7 +305,6 @@ void hostapd_logger_register_cb(hostapd_logger_cb_func func);
- #define HOSTAPD_MODULE_RADIUS		0x00000004
- #define HOSTAPD_MODULE_WPA		0x00000008
- #define HOSTAPD_MODULE_DRIVER		0x00000010
--#define HOSTAPD_MODULE_IAPP		0x00000020
- #define HOSTAPD_MODULE_MLME		0x00000040
- 
- enum hostapd_logger_level {
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
deleted file mode 100644
index 54c405b53..000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-0326.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 947272febe24a8f0ea828b5b2f35f13c3821901e Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@codeaurora.org>
-Date: Mon, 9 Nov 2020 11:43:12 +0200
-Subject: [PATCH] P2P: Fix copying of secondary device types for P2P group
- client
-
-Parsing and copying of WPS secondary device types list was verifying
-that the contents is not too long for the internal maximum in the case
-of WPS messages, but similar validation was missing from the case of P2P
-group information which encodes this information in a different
-attribute. This could result in writing beyond the memory area assigned
-for these entries and corrupting memory within an instance of struct
-p2p_device. This could result in invalid operations and unexpected
-behavior when trying to free pointers from that corrupted memory.
-
-CVE: CVE-2021-0326
-
-Upstream-Status: Backport
-
-Credit to OSS-Fuzz: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=27269
-Fixes: e57ae6e19edf ("P2P: Keep track of secondary device types for peers")
-Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/p2p/p2p.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/p2p/p2p.c b/src/p2p/p2p.c
-index 74b7b52ae..5cbfc217f 100644
---- a/src/p2p/p2p.c
-+++ b/src/p2p/p2p.c
-@@ -453,6 +453,8 @@ static void p2p_copy_client_info(struct p2p_device *dev,
- 	dev->info.config_methods = cli->config_methods;
- 	os_memcpy(dev->info.pri_dev_type, cli->pri_dev_type, 8);
- 	dev->info.wps_sec_dev_type_list_len = 8 * cli->num_sec_dev_types;
-+	if (dev->info.wps_sec_dev_type_list_len > WPS_SEC_DEV_TYPE_MAX_LEN)
-+		dev->info.wps_sec_dev_type_list_len = WPS_SEC_DEV_TYPE_MAX_LEN;
- 	os_memcpy(dev->info.wps_sec_dev_type_list, cli->sec_dev_types,
- 		  dev->info.wps_sec_dev_type_list_len);
- }
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch
deleted file mode 100644
index fedff76b1..000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-27803.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 8460e3230988ef2ec13ce6b69b687e941f6cdb32 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <jouni@codeaurora.org>
-Date: Tue, 8 Dec 2020 23:52:50 +0200
-Subject: [PATCH] P2P: Fix a corner case in peer addition based on PD Request
-
-p2p_add_device() may remove the oldest entry if there is no room in the
-peer table for a new peer. This would result in any pointer to that
-removed entry becoming stale. A corner case with an invalid PD Request
-frame could result in such a case ending up using (read+write) freed
-memory. This could only by triggered when the peer table has reached its
-maximum size and the PD Request frame is received from the P2P Device
-Address of the oldest remaining entry and the frame has incorrect P2P
-Device Address in the payload.
-
-Fix this by fetching the dev pointer again after having called
-p2p_add_device() so that the stale pointer cannot be used.
-
-CVE: CVE-2021-27803
-
-Upstream-Status: Backport
-
-Fixes: 17bef1e97a50 ("P2P: Add peer entry based on Provision Discovery Request")
-Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
----
- src/p2p/p2p_pd.c | 12 +++++-------
- 1 file changed, 5 insertions(+), 7 deletions(-)
-
-diff --git a/src/p2p/p2p_pd.c b/src/p2p/p2p_pd.c
-index 3994ec03f..05fd59349 100644
---- a/src/p2p/p2p_pd.c
-+++ b/src/p2p/p2p_pd.c
-@@ -595,14 +595,12 @@ void p2p_process_prov_disc_req(struct p2p_data *p2p, const u8 *sa,
- 			goto out;
- 		}
- 
-+		dev = p2p_get_device(p2p, sa);
- 		if (!dev) {
--			dev = p2p_get_device(p2p, sa);
--			if (!dev) {
--				p2p_dbg(p2p,
--					"Provision Discovery device not found "
--					MACSTR, MAC2STR(sa));
--				goto out;
--			}
-+			p2p_dbg(p2p,
-+				"Provision Discovery device not found "
-+				MACSTR, MAC2STR(sa));
-+			goto out;
- 		}
- 	} else if (msg.wfd_subelems) {
- 		wpabuf_free(dev->info.wfd_subelems);
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
deleted file mode 100644
index e2540fc26..000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2021-30004.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From a0541334a6394f8237a4393b7372693cd7e96f15 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sat, 13 Mar 2021 18:19:31 +0200
-Subject: [PATCH] ASN.1: Validate DigestAlgorithmIdentifier parameters
-
-The supported hash algorithms do not use AlgorithmIdentifier parameters.
-However, there are implementations that include NULL parameters in
-addition to ones that omit the parameters. Previous implementation did
-not check the parameters value at all which supported both these cases,
-but did not reject any other unexpected information.
-
-Use strict validation of digest algorithm parameters and reject any
-unexpected value when validating a signature. This is needed to prevent
-potential forging attacks.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
-
-Upstream-Status: Backport
-CVE: CVE-2021-30004
-
-Reference to upstream patch:
-[https://w1.fi/cgit/hostap/commit/?id=a0541334a6394f8237a4393b7372693cd7e96f15]
-
-Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
----
- src/tls/pkcs1.c  | 21 +++++++++++++++++++++
- src/tls/x509v3.c | 20 ++++++++++++++++++++
- 2 files changed, 41 insertions(+)
-
-diff --git a/src/tls/pkcs1.c b/src/tls/pkcs1.c
-index 141ac50..e09db07 100644
---- a/src/tls/pkcs1.c
-+++ b/src/tls/pkcs1.c
-@@ -240,6 +240,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
- 		os_free(decrypted);
- 		return -1;
- 	}
-+	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestInfo",
-+		    hdr.payload, hdr.length);
- 
- 	pos = hdr.payload;
- 	end = pos + hdr.length;
-@@ -261,6 +263,8 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
- 		os_free(decrypted);
- 		return -1;
- 	}
-+	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: DigestAlgorithmIdentifier",
-+		    hdr.payload, hdr.length);
- 	da_end = hdr.payload + hdr.length;
- 
- 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
-@@ -269,6 +273,23 @@ int pkcs1_v15_sig_ver(struct crypto_public_key *pk,
- 		os_free(decrypted);
- 		return -1;
- 	}
-+	wpa_hexdump(MSG_MSGDUMP, "PKCS #1: Digest algorithm parameters",
-+		    next, da_end - next);
-+
-+	/*
-+	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
-+	 * omit the parameters, but there are implementation that encode these
-+	 * as a NULL element. Allow these two cases and reject anything else.
-+	 */
-+	if (da_end > next &&
-+	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
-+	     !asn1_is_null(&hdr) ||
-+	     hdr.payload + hdr.length != da_end)) {
-+		wpa_printf(MSG_DEBUG,
-+			   "PKCS #1: Unexpected digest algorithm parameters");
-+		os_free(decrypted);
-+		return -1;
-+	}
- 
- 	if (!asn1_oid_equal(&oid, hash_alg)) {
- 		char txt[100], txt2[100];
-diff --git a/src/tls/x509v3.c b/src/tls/x509v3.c
-index 1bd5aa0..bf2289f 100644
---- a/src/tls/x509v3.c
-+++ b/src/tls/x509v3.c
-@@ -1834,6 +1834,7 @@ int x509_check_signature(struct x509_certificate *issuer,
- 		os_free(data);
- 		return -1;
- 	}
-+	wpa_hexdump(MSG_MSGDUMP, "X509: DigestInfo", hdr.payload, hdr.length);
- 
- 	pos = hdr.payload;
- 	end = pos + hdr.length;
-@@ -1855,6 +1856,8 @@ int x509_check_signature(struct x509_certificate *issuer,
- 		os_free(data);
- 		return -1;
- 	}
-+	wpa_hexdump(MSG_MSGDUMP, "X509: DigestAlgorithmIdentifier",
-+		    hdr.payload, hdr.length);
- 	da_end = hdr.payload + hdr.length;
- 
- 	if (asn1_get_oid(hdr.payload, hdr.length, &oid, &next)) {
-@@ -1862,6 +1865,23 @@ int x509_check_signature(struct x509_certificate *issuer,
- 		os_free(data);
- 		return -1;
- 	}
-+	wpa_hexdump(MSG_MSGDUMP, "X509: Digest algorithm parameters",
-+		    next, da_end - next);
-+
-+	/*
-+	 * RFC 5754: The correct encoding for the SHA2 algorithms would be to
-+	 * omit the parameters, but there are implementation that encode these
-+	 * as a NULL element. Allow these two cases and reject anything else.
-+	 */
-+	if (da_end > next &&
-+	    (asn1_get_next(next, da_end - next, &hdr) < 0 ||
-+	     !asn1_is_null(&hdr) ||
-+	     hdr.payload + hdr.length != da_end)) {
-+		wpa_printf(MSG_DEBUG,
-+			   "X509: Unexpected digest algorithm parameters");
-+		os_free(data);
-+		return -1;
-+	}
- 
- 	if (x509_sha1_oid(&oid)) {
- 		if (signature->oid.oid[6] != 5 /* sha-1WithRSAEncryption */) {
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
similarity index 75%
rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
index 3356f45ca..dbdc5c1bd 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
@@ -2,7 +2,7 @@ SUMMARY = "User space daemon for extended IEEE 802.11 management"
 HOMEPAGE = "http://w1.fi/hostapd/"
 SECTION = "kernel/userland"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://hostapd/README;md5=1ec986bec88070e2a59c68c95d763f89"
+LIC_FILES_CHKSUM = "file://hostapd/README;md5=c905478466c90f1cefc0df987c40e172"
 
 DEPENDS = "libnl openssl"
 
@@ -11,16 +11,10 @@ SRC_URI = " \
     file://defconfig \
     file://init \
     file://hostapd.service \
-    file://0001-Prepare-for-CVE-2021-30004.patch.patch \
-    file://CVE-2019-16275.patch \
-    file://CVE-2019-5061.patch \
-    file://CVE-2021-0326.patch \
-    file://CVE-2021-27803.patch \
-    file://CVE-2021-30004.patch \
 "
 
-SRC_URI[md5sum] = "f188fc53a495fe7af3b6d77d3c31dee8"
-SRC_URI[sha256sum] = "881d7d6a90b2428479288d64233151448f8990ab4958e0ecaca7eeb3c9db2bd7"
+
+SRC_URI[sha256sum] = "206e7c799b678572c2e3d12030238784bc4a9f82323b0156b4c9466f1498915d"
 
 S = "${WORKDIR}/hostapd-${PV}"
 B = "${WORKDIR}/hostapd-${PV}/hostapd"
-- 
2.25.1


