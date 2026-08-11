Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE956C5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 05:37:48 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48002.1786426658952699836
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 22:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W/9SvoR1;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso2528294b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 22:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786426658; x=1787031458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3zDtB3hQzhitCaJmC54Z9xH7Ij2ifzUvEhnHI6LSZGA=;
        b=W/9SvoR1G0fcY5CdFUTHmFVtoniljlKSg3n6jjN+tMuupBI4X18HUN0grNToVUEKUU
         a6P5mz6gtZ1XX74dk/SR/eyd8jaVrGftYRZrvjvFpjKG1vXTJO0muHWF952cE/cxMy3d
         wv1E95e/uQkjS9C71o6KcCd84oN638eUChpa4vq9j//CGiEJLB5cb8xc4u/3vWY3sHd/
         I2PoM/hKycz2XEafEgdyfgHEZSGGy52loAc/eH01XhAyC79mLNOfPwOpeFFyjdXUVAXP
         BkweMFmFUJTQ1mh5vxXph6bCieLXa6jJogUtKVn0YKSnLzvsNFDg3oesntjGAO3EyYRm
         sYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786426658; x=1787031458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3zDtB3hQzhitCaJmC54Z9xH7Ij2ifzUvEhnHI6LSZGA=;
        b=Hq+T7hpgcNlxH4cb29HvR/45Z0VweBBlmS1w6JiSC4ednTE/KoHvSax2do0vsyy0o8
         tphOrd8p6hTBt9U8OhQFFCY/nkedu0ROuHHbQfVqmudaGMWBE0WChZiHPRj7XVq04N9I
         Zrs37QMMoqCt/EqgEO9yeAP7QflS2ZPLJY8hKwsniXOHkB4ZDfDltCR1jkCmwThJKdI2
         RMNX5n5tdjURpNMl6moPy/Rp6mj9tSU1xT22vbpxbevyd5msllAe34JAxqVQl0BSLz3t
         LvZKGu5MJojO2LMNXaHtYfCMq0ltEQzwNbCvAfIwKh2xXD/p6/d1T20m9xB8OAkBiGfX
         DrNw==
X-Gm-Message-State: AOJu0YxsURqqOBMPLshUsCsHB0HJRUhi3pmzEASkWhID20OMFvQKtZcp
	rjH6+oXum05HDrrs7uCQECLSQA02tt7NFlkB6eOzETLEqfJfUGVo+TxWgMaLu5zE
X-Gm-Gg: AR+sD12a2uswzLMc5lvNkYf7REttXevS0s3elOh8IG8OWaWzW7jbNSDzn6qZQNdPmlx
	j6Whe2ke8QcBG4/8sUPQYS5xC1YXr/E0CGDtvA/Dr4PuJQTKKYCp8cffappiBbhPKFHsPu6mk/3
	UuNw3p+z516Pbv8YG6Eqh06WuGJlljBK2KTvqSYUdB9yTc/iK1cvSbMDdiJeYLiO9LI+KrorxxO
	5uVAj2NKLNvcffbfYkC35XfC/u9fe8d0geujLDpd/CfwYxp+Kabo+KAQlUemQ/l6yoQF5jKwK8d
	trEFOoH4PFKqyRaH23kVGbgfNQlu2FVRFeZEOn0W7YtK0mVDtSU22ozkbYeUYtpevMBv56vhm2S
	UiEl7Yz0UACCt8am3nXeu94GR5zUxy7455rmopPgC//xC1IJV+vBzgsxCwLImtWcqrvZjzefb8a
	icCa3AOfVBzviffz06h5UFf3w+8tGkcGtq+mInY2RZOfM0BQ/JcHC+j8WsEeQ5yoSmhx+PUhqyU
	Q==
X-Received: by 2002:a05:6a21:9092:b0:3c4:3b16:2979 with SMTP id adf61e73a8af0-3cc2bb0cec9mr1286920637.30.1786426658133;
        Mon, 10 Aug 2026 22:37:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c64237e9csm923812eec.18.2026.08.10.22.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:37:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/6] hostapd: upgrade 2.11 -> 2.12
Date: Tue, 11 Aug 2026 17:37:23 +1200
Message-ID: <20260811053728.4125303-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2026 05:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128909

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: Copyright updated to 2026[1].

Dropped patches that are part of the upstream version.

Changelog[2]:
* support RSN overriding (e.g., WPA3-Personal Compatibility Mode)
* EHT/IEEE 802.11be/Wi-Fi 7
  - more complete support
  - fix message validation issues that could enable DoS attacks
  - fix group key rekeying
* enable SAE group 20 by default if SAE-EXT-KEY is enabled
* reject unexpected SAE password identifier to avoid DoS attack against
  a specific STA
* mandate use of SAE H2E when using password identifiers
* assign VLAN when using SAE with PMKSA caching
* support SPP A-MSDU negotiation
* support IEEE 802.11bi functionality
  - changing SAE password identifiers
  - EPPKE
  - IEEE 802.1X/EAP in Authentication frames
  - Association frame encryption
  - PMKID privacy
* remove the driver interface for now obsolete Host AP driver
* remove the driver interface for now obsolete Atheros WEXT interface
* move supported, basic, and Beacon TX rate configuration to be at BSS
  level instead of per-radio for all BSSs
* fix various issues in Multiple-BSSID functionality
* support OpenSSL 3.0 API changes
* EAP-TEAP: protocol changes based on RFC 9930; this is not compatible
  with previous versions
* support Automated Frequency Coordination (AFC) on the 6 GHz band
* improve GAS/ANQP processing to support larger ANQP responses
* a large number of other fixes, cleanup, and extensions

[1] https://git.w1.fi/cgit/hostap/commit/README?h=hostap_2_12&id=e58715b1b7f8d53e493017f5ce4a3b45e53f3d23
[2] https://git.w1.fi/cgit/hostap/tree/hostapd/ChangeLog?h=hostap_2_12

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...e64-for-hostapd-CONFIG_SAE_PK-builds.patch | 40 ----------
 ...learing-up-settings-for-color-switch.patch | 34 --------
 .../hostapd/hostapd/CVE-2025-24912-01.patch   | 79 -------------------
 .../hostapd/hostapd/CVE-2025-24912-02.patch   | 70 ----------------
 .../{hostapd_2.11.bb => hostapd_2.12.bb}      |  8 +-
 5 files changed, 2 insertions(+), 229 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.patch
 delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.patch
 rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.11.bb => hostapd_2.12.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
deleted file mode 100644
index e790e8e0f2..0000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 430bc89b9a29537d9d22bb42406f3d14072a01d4 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sun, 22 Dec 2024 18:53:12 +0200
-Subject: [PATCH] Include base64 for hostapd CONFIG_SAE_PK builds
-
-CONFIG_SAE_PK=y needs base64 functionality, so set NEED_BASE64
-automatically for it.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
-Upstream-Status: Backport [https://git.w1.fi/cgit/hostap/commit/?id=430bc89b9a29537d9d22bb42406f3d14072a01d4]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- hostapd/Android.mk | 1 +
- hostapd/Makefile   | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/hostapd/Android.mk b/hostapd/Android.mk
-index e6c2fbf18..6e0d77d28 100644
---- a/hostapd/Android.mk
-+++ b/hostapd/Android.mk
-@@ -260,6 +260,7 @@ OBJS += src/common/sae.c
- ifdef CONFIG_SAE_PK
- L_CFLAGS += -DCONFIG_SAE_PK
- NEED_AES_SIV=y
-+NEED_BASE64=y
- OBJS += src/common/sae_pk.c
- endif
- NEED_ECC=y
-diff --git a/hostapd/Makefile b/hostapd/Makefile
-index fa0d366a8..c3419c10e 100644
---- a/hostapd/Makefile
-+++ b/hostapd/Makefile
-@@ -299,6 +299,7 @@ OBJS += ../src/common/sae.o
- ifdef CONFIG_SAE_PK
- CFLAGS += -DCONFIG_SAE_PK
- NEED_AES_SIV=y
-+NEED_BASE64=y
- OBJS += ../src/common/sae_pk.o
- endif
- NEED_ECC=y
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch
deleted file mode 100644
index 5d6cce3f14..0000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 161327f91d956771996c96ea1b6e4e1cb8dc074c Mon Sep 17 00:00:00 2001
-From: Stone Zhang <quic_stonez@quicinc.com>
-Date: Mon, 14 Oct 2024 18:47:32 +0800
-Subject: [PATCH] hostapd: Fix clearing up settings for color switch
-
-Settings for color switch (struct cca_settings settings)
-is used without zero clearing, which causes the member
-settings->ubpr->unsol_bcast_probe_resp_intervalettings
-to be a random value. It is againsts the NLA policy of
-NL80211_UNSOL_BCAST_PROBE_RESP_ATTR_INT and causes
-BSS color switch failure.
-
-Fixes: 654d2395dddf ("BSS coloring: Handling of collision events and triggering CCA")
-Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
-Upstream-Status: Backport [https://w1.fi/cgit/hostap.git/commit/?id=161327f91d956771996c96ea1b6e4e1cb8dc074c]
----
- src/ap/hostapd.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ap/hostapd.c b/src/ap/hostapd.c
-index 5ba2cab2c..90e93b6dc 100644
---- a/src/ap/hostapd.c
-+++ b/src/ap/hostapd.c
-@@ -4768,6 +4768,7 @@ static void hostapd_switch_color_timeout_handler(void *eloop_data,
- 		struct cca_settings settings;
- 		int ret;
- 
-+		os_memset(&settings, 0, sizeof(settings));
- 		hostapd_cleanup_cca_params(bss);
- 		bss->cca_color = r;
- 		bss->cca_count = 10;
--- 
-2.45.2
-
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.patch
deleted file mode 100644
index 36660b5880..0000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 726432d7622cc0088ac353d073b59628b590ea44 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <j@w1.fi>
-Date: Sat, 25 Jan 2025 11:21:16 +0200
-Subject: [PATCH] RADIUS: Drop pending request only when accepting the response
-
-The case of an invalid authenticator in a RADIUS response could imply
-that the response is not from the correct RADIUS server and as such,
-such a response should be discarded without changing internal state for
-the pending request. The case of an unknown response (RADIUS_RX_UNKNOWN)
-is somewhat more complex since it could have been indicated before
-validating the authenticator. In any case, it seems better to change the
-state for the pending request only when we have fully accepted the
-response.
-
-Allowing the internal state of pending RADIUS request to change based on
-responses that are not fully validation could have allow at least a
-theoretical DoS attack if an attacker were to have means for injecting
-RADIUS messages to the network using the IP address of the real RADIUS
-server and being able to do so more quickly than the real server and
-with the matching identifier from the request header (i.e., either by
-flooding 256 responses quickly or by having means to capture the RADIUS
-request). These should not really be realistic options in a properly
-protected deployment, but nevertheless it is good to be more careful in
-processing RADIUS responses.
-
-Remove a pending RADIUS request from the internal list only when having
-fully accepted a matching RADIUS response, i.e., after one of the
-registered handlers has confirmed that the authenticator is valid and
-processing of the response has succeeded.
-
-Signed-off-by: Jouni Malinen <j@w1.fi>
-
-CVE: CVE-2025-24912
-Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=726432d7622cc0088ac353d073b59628b590ea44]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/radius/radius_client.c | 15 +++++++--------
- 1 file changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
-index 2a7f36170..7909b29a7 100644
---- a/src/radius/radius_client.c
-+++ b/src/radius/radius_client.c
-@@ -1259,13 +1259,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		       roundtrip / 100, roundtrip % 100);
- 	rconf->round_trip_time = roundtrip;
- 
--	/* Remove ACKed RADIUS packet from retransmit list */
--	if (prev_req)
--		prev_req->next = req->next;
--	else
--		radius->msgs = req->next;
--	radius->num_msgs--;
--
- 	for (i = 0; i < num_handlers; i++) {
- 		RadiusRxResult res;
- 		res = handlers[i].handler(msg, req->msg, req->shared_secret,
-@@ -1276,6 +1269,13 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 			radius_msg_free(msg);
- 			/* fall through */
- 		case RADIUS_RX_QUEUED:
-+			/* Remove ACKed RADIUS packet from retransmit list */
-+			if (prev_req)
-+				prev_req->next = req->next;
-+			else
-+				radius->msgs = req->next;
-+			radius->num_msgs--;
-+
- 			radius_client_msg_free(req);
- 			return;
- 		case RADIUS_RX_INVALID_AUTHENTICATOR:
-@@ -1297,7 +1297,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		       msg_type, hdr->code, hdr->identifier,
- 		       invalid_authenticator ? " [INVALID AUTHENTICATOR]" :
- 		       "");
--	radius_client_msg_free(req);
- 
-  fail:
- 	radius_msg_free(msg);
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.patch
deleted file mode 100644
index add2e47048..0000000000
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 339a334551ca911187cc870f4f97ef08e11db109 Mon Sep 17 00:00:00 2001
-From: Jouni Malinen <quic_jouni@quicinc.com>
-Date: Wed, 5 Feb 2025 19:23:39 +0200
-Subject: [PATCH] RADIUS: Fix pending request dropping
-
-A recent change to this moved the place where the processed RADIUS
-request was removed from the pending list to happen after the message
-handler had been called. This did not take into account possibility of
-the handler adding a new pending request in the list and the prev_req
-pointer not necessarily pointing to the correct entry anymore. As such,
-some of the pending requests could have been lost and that would result
-in not being able to process responses to those requests and also, to a
-memory leak.
-
-Fix this by determining prev_req at the point when the pending request
-is being removed, i.e., after the handler function has already added a
-new entry.
-
-Fixes: 726432d7622c ("RADIUS: Drop pending request only when accepting the response")
-Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
-
-CVE: CVE-2025-24912
-Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=339a334551ca911187cc870f4f97ef08e11db109]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/radius/radius_client.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
-index 7909b29a7..d4faa7936 100644
---- a/src/radius/radius_client.c
-+++ b/src/radius/radius_client.c
-@@ -1099,7 +1099,7 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 	struct radius_hdr *hdr;
- 	struct radius_rx_handler *handlers;
- 	size_t num_handlers, i;
--	struct radius_msg_list *req, *prev_req;
-+	struct radius_msg_list *req, *prev_req, *r;
- 	struct os_reltime now;
- 	struct hostapd_radius_server *rconf;
- 	int invalid_authenticator = 0;
-@@ -1224,7 +1224,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		break;
- 	}
- 
--	prev_req = NULL;
- 	req = radius->msgs;
- 	while (req) {
- 		/* TODO: also match by src addr:port of the packet when using
-@@ -1236,7 +1235,6 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 		    hdr->identifier)
- 			break;
- 
--		prev_req = req;
- 		req = req->next;
- 	}
- 
-@@ -1270,6 +1268,12 @@ static void radius_client_receive(int sock, void *eloop_ctx, void *sock_ctx)
- 			/* fall through */
- 		case RADIUS_RX_QUEUED:
- 			/* Remove ACKed RADIUS packet from retransmit list */
-+			prev_req = NULL;
-+			for (r = radius->msgs; r; r = r->next) {
-+				if (r == req)
-+					break;
-+				prev_req = r;
-+			}
- 			if (prev_req)
- 				prev_req->next = req->next;
- 			else
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.12.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.12.bb
index ce1c145fd7..7673ce0d38 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.12.bb
@@ -2,23 +2,19 @@ SUMMARY = "User space daemon for extended IEEE 802.11 management"
 HOMEPAGE = "http://w1.fi/hostapd/"
 SECTION = "kernel/userland"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://hostapd/README;beginline=5;endline=47;md5=8e2c69e491b28390f9de0df1f64ebd6d"
+LIC_FILES_CHKSUM = "file://hostapd/README;beginline=5;endline=47;md5=4d666937756a064d6d90d128a32c3571"
 
 DEPENDS = "libnl openssl"
 
 SRC_URI = " \
     http://w1.fi/releases/hostapd-${PV}.tar.gz \
-    file://0001-Include-base64-for-hostapd-CONFIG_SAE_PK-builds.patch \
-    file://0002-hostapd-Fix-clearing-up-settings-for-color-switch.patch \
     file://defconfig \
     file://init \
     file://hostapd.service \
-    file://CVE-2025-24912-01.patch \
-    file://CVE-2025-24912-02.patch \
 "
 
 
-SRC_URI[sha256sum] = "2b3facb632fd4f65e32f4bf82a76b4b72c501f995a4f62e330219fe7aed1747a"
+SRC_URI[sha256sum] = "f43502561c28ba47ab77e18e1a973d07361c68cc8b14178e619bd5796b70eabd"
 
 inherit update-rc.d systemd pkgconfig features_check
 

