Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A902C98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 13:30:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6959.1790170232403275769
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 06:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2HMytdvR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A8E844E4103B;
	Wed, 23 Sep 2026 13:30:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7768B60580;
	Wed, 23 Sep 2026 13:30:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3384B10329163;
	Wed, 23 Sep 2026 15:30:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790170229; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gJypBRPdKFIKKFvqA9dfcpE5sOrhhYeuz1b6O8lY3mo=;
	b=2HMytdvRouUh9X2C1TaEvUIRz1tWIBzffTbd3G+IU2gLcysc1MyVf0Zu94MCJ0+l5X4h2m
	cvtYZCWM/q9r3Wl5brumOw/rI7KPyZWLiHQUjjuHtzTTtUsrJaXlO6IucHhlp8EarL5KAT
	H0E0uh9tYPOX/moflm7ox9xsKzbRDXrwYccilgnAVp0+brmvGZ/vLJGxZxTZ1c4hxHyzaY
	WC9E1Ejst+ANBjJH3S8kePdDUF7zMoWo68NLfYG3ljSamGZvhx8igNP3GVvvl5Fb0xMHTf
	KkAc8+55C6ZenghZLoLBR4B4+ew+Eq6ys2656EUgXJ4P2Gyg+6eeB/1zDN/wmQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 23 Sep 2026 15:30:24 +0200
Subject: [scarthgap][meta-oe][PATCH v2 1/2] libwebsockets: update to
 version 4.3.10
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-update-libwebsockets-fix-cve-2026-19773-v2-1-d20d96496e90@bootlin.com>
References: <20260923-update-libwebsockets-fix-cve-2026-19773-v2-0-d20d96496e90@bootlin.com>
In-Reply-To: <20260923-update-libwebsockets-fix-cve-2026-19773-v2-0-d20d96496e90@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 13:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130237

This version already include the fixes for CVE-2025-11677 and for
CVE-2025-11678. The LICENSE was slightly changed to clarify the license
summary.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../libwebsockets/CVE-2025-11677.patch             | 161 ---------------------
 .../libwebsockets/CVE-2025-11678.patch             | 128 ----------------
 ...websockets_4.3.3.bb => libwebsockets_4.3.10.bb} |   6 +-
 3 files changed, 2 insertions(+), 293 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.patch
deleted file mode 100644
index bf11a893f875..000000000000
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-From c01cb06d99c08579ab33bef066fca8a5338b7c7b Mon Sep 17 00:00:00 2001
-From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
-Date: Tue, 18 Nov 2025 16:59:22 +0100
-Subject: [PATCH] NN-2025-0102: UAF depending on upgrade allowed
-
-This document contains sensitive information collected during our
-security research activities related with the Libwebsockets library
-maintained by Andy Green (warmcat).
-
-+-------------------------------------------------------------------------------------------------------+
-| Report information                                                                                    |
-+:===================================:+:===============================================================:+
-| Vendor                              | warmcat                                                         |
-+-------------------------------------+-----------------------------------------------------------------+
-| Vendor URL                          | https://libwebsockets.org/git/libwebsockets                     |
-+-------------------------------------+-----------------------------------------------------------------+
-| Affected component                  | libwebsockets                                                   |
-+-------------------------------------+-----------------------------------------------------------------+
-| Affected version                    | 4.4                                                             |
-+-------------------------------------+-----------------------------------------------------------------+
-| Vulnerability                       | CWE-416: Use After Free                                         |
-+-------------------------------------+-----------------------------------------------------------------+
-| Proposed CVSS v3.1 Base Score       | 6.0                                                             |
-+-------------------------------------+-----------------------------------------------------------------+
-| Proposed CVSS v3.1 Vector           | CVSS:4.0/AV:N/AC:L/AT:P/PR:N/UI:P/VC:N/VI:N/VA:H/SC:N/SI:N/SA:N |
-+-------------------------------------+-----------------------------------------------------------------+
-
-+-----------------------------------------------------------------------------+
-| Security Researcher(s)                                                      |
-+:===================================:+:=====================================:+
-| Name                                | **Email address**                     |
-+-------------------------------------+---------------------------------------+
-| Raffaele Bova                       | labs-advisory@nozominetworks.com      |
-+-------------------------------------+---------------------------------------+
-
-Libwebsockes is a C library that provides client and server
-implementation for various protocols (e.g., HTTP, websockets, MQTT) and
-more.
-
-Nozomi Networks Lab discovered a "CWE-416: Use After Free" in the latest
-software version of libwebsockets, specifically in the WebSocket server
-implementation.
-
-Depending on the use of the API, the vulnerability may allow an attacker
-to read or write data, that could cause a loss of integrity or
-availability.
-
-The issue is caused by the `lws_handshake_protocol` function, specifically
-when the upgrade header is not valid, the function calls
-`lws_http_transaction_completed`, which frees some of the data in the wsi
-structure, then it calls `user_callback_handle_rxflow` passing the up
-pointer and uses it on following strcasecmp calls.
-
-From our understanding, for this vulnerability to have a meaningful
-impact, a user that implements the Websocket server, must provide a user
-callback function which is going to handle
-`LWS_CALLBACK_HTTP_CONFIRM_UPGRADE`, while ignoring the length and doing
-operations on the up pointer.
-
-It is possible to compile the minimal websocket server using address
-sanitizer, to quickly verify the use after free.
-
-From our understanding of the code, if the upgrade header does not match
-the intended contents, then the code after the if statement when
-`lws_http_transaction_completed` is called, should not be executed, thus
-simply enclosing all that code in the else branch solves the issue.
-
-CVE: CVE-2025-11677
-Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit/2f082ec31261f556969160143ba94875d783971a]
-
-Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
----
- lib/roles/http/server/server.c | 58 +++++++++++++++++-----------------
- 1 file changed, 29 insertions(+), 29 deletions(-)
-
-diff --git a/lib/roles/http/server/server.c b/lib/roles/http/server/server.c
-index 6b132a42..e6d714e3 100644
---- a/lib/roles/http/server/server.c
-+++ b/lib/roles/http/server/server.c
-@@ -2375,49 +2375,49 @@ raw_transition:
- 						HTTP_STATUS_FORBIDDEN, NULL) ||
- 				    lws_http_transaction_completed(wsi))
- 					goto bail_nuke_ah;
--			}
--
--			n = user_callback_handle_rxflow(wsi->a.protocol->callback,
--					wsi, LWS_CALLBACK_HTTP_CONFIRM_UPGRADE,
--					wsi->user_space, (char *)up, 0);
-+			} else {
-+				n = user_callback_handle_rxflow(wsi->a.protocol->callback,
-+						wsi, LWS_CALLBACK_HTTP_CONFIRM_UPGRADE,
-+						wsi->user_space, (char *)up, 0);
- 
--			/* just hang up? */
-+				/* just hang up? */
- 
--			if (n < 0)
--				goto bail_nuke_ah;
-+				if (n < 0)
-+					goto bail_nuke_ah;
- 
--			/* callback returned headers already, do t_c? */
-+				/* callback returned headers already, do t_c? */
- 
--			if (n > 0) {
--				if (lws_http_transaction_completed(wsi))
-+				if (n > 0) {
-+				    if (lws_http_transaction_completed(wsi))
- 					goto bail_nuke_ah;
- 
--				/* continue on */
-+				    /* continue on */
- 
--				return 0;
--			}
-+				    return 0;
-+				}
- 
--			/* callback said 0, it was allowed */
-+				/* callback said 0, it was allowed */
- 
--			if (wsi->a.vhost->options &
--			    LWS_SERVER_OPTION_VHOST_UPG_STRICT_HOST_CHECK &&
--			    lws_confirm_host_header(wsi))
--				goto bail_nuke_ah;
-+				if (wsi->a.vhost->options &
-+					LWS_SERVER_OPTION_VHOST_UPG_STRICT_HOST_CHECK &&
-+					lws_confirm_host_header(wsi))
-+				    goto bail_nuke_ah;
- 
--			if (!strcasecmp(up, "websocket")) {
-+				if (!strcasecmp(up, "websocket")) {
- #if defined(LWS_ROLE_WS)
--				lws_metrics_tag_wsi_add(wsi, "upg", "ws");
--				lwsl_info("Upgrade to ws\n");
--				goto upgrade_ws;
-+					lws_metrics_tag_wsi_add(wsi, "upg", "ws");
-+					lwsl_info("Upgrade to ws\n");
-+					goto upgrade_ws;
- #endif
--			}
-+				}
- #if defined(LWS_WITH_HTTP2)
--			if (!strcasecmp(up, "h2c")) {
--				lws_metrics_tag_wsi_add(wsi, "upg", "h2c");
--				lwsl_info("Upgrade to h2c\n");
--				goto upgrade_h2c;
--			}
-+				if (!strcasecmp(up, "h2c")) {
-+				    lws_metrics_tag_wsi_add(wsi, "upg", "h2c");
-+				    lwsl_info("Upgrade to h2c\n");
-+				    goto upgrade_h2c;
-+				}
- #endif
-+			}
- 		}
- 
- 		/* no upgrade ack... he remained as HTTP */
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.patch
deleted file mode 100644
index 3489a7e6a13d..000000000000
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11678.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From e1d4c32bf773b8cf01eb5e368a4a21679e0b670a Mon Sep 17 00:00:00 2001
-From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
-Date: Tue, 18 Nov 2025 17:03:33 +0100
-Subject: [PATCH] NN-2025-0103: ADNS crafted response overflow
-
-This document contains sensitive information collected during our
-security research activities related with the Libwebsockets library made
-by Andy Green (warmcat).
-
-+-------------------------------------------------------------------------------------------------------+
-| Report information                                                                                    |
-+:===================================:+:===============================================================:+
-| Vendor                              | warmcat                                                         |
-+-------------------------------------+-----------------------------------------------------------------+
-| Vendor URL                          | https://libwebsockets.org/git/libwebsockets                     |
-+-------------------------------------+-----------------------------------------------------------------+
-| Affected component                  | Ecostruxure Automation Expert                                   |
-+-------------------------------------+-----------------------------------------------------------------+
-| Affected version                    | 4.4                                                             |
-+-------------------------------------+-----------------------------------------------------------------+
-| Vulnerability                       | CWE-121: Stack-based Buffer Overflow                            |
-+-------------------------------------+-----------------------------------------------------------------+
-| Proposed CVSS v3.1 Base Score       | 7.5                                                             |
-+-------------------------------------+-----------------------------------------------------------------+
-| Proposed CVSS v3.1 Vector           | CVSS:4.0/AV:A/AC:L/AT:P/PR:N/UI:P/VC:H/VI:H/VA:H/SC:N/SI:N/SA:N |
-+-------------------------------------+-----------------------------------------------------------------+
-
-+-----------------------------------------------------------------------------+
-| Security Researcher(s)                                                      |
-+:===================================:+:=====================================:+
-| Name                                | **Email address**                     |
-+-------------------------------------+---------------------------------------+
-| Raffaele Bova                       | labs-advisory@nozominetworks.com      |
-+-------------------------------------+---------------------------------------+
-
-**\**
-
-Libwebsockes is a C library that provides client and server
-implementation for various protocols (e.g., HTTP, websockets, MQTT) and
-more.
-
-Nozomi Networks Lab discovered a "CWE-121: Stack-based Buffer Overflow"
-in the latest software version of libwebsockets, specifically in the
-async-dns component.
-
-The vulnerability allows an attacker that can inspect DNS requests made
-by the victim (e.g. being in the same wireless network) to forge a DNS
-response packet that overflows the stack and may lead to arbitrary code
-execution (depending on the platform and compiler options).
-
-The issue resides in `lws_adns_parse_label` function in
-`lib/system/async-dns/async-dns-parse.c`; this function iteratively parses
-a label however it does not correctly check the number of bytes written
-in the destination buffer.
-
-Specifically, the size of the dest output buffer is specified in the `dl`
-argument, however during the read of each substring of the label only
-the length of the current substring of the label is accounted for not
-overflowing the destination buffer, but previous reads are not accounted
-for.
-
-This means that a label of arbitrary size and content can be supplied
-and is copied onto the stack, however it must be split into substrings
-of size less than `dl`.
-
-To trigger the vulnerability an attacker must be able to sniff the DNS
-request packet to send a response with a matching identifier, otherwise
-the implantation correctly ignores the response.
-
-We have provided a harness for testing, for ease of use copy the harness
-in a subdirectory, for example in minimal-examples-lowlevel/api-tests/,
-and build it
-
-```
-cmake -B build -DLWS_WITH_SYS_ASYNC_DNS=1 -DLWS_WITH_SSL=0
--DCMAKE_C_FLAGS="-fsanitize=address" . && make -C build lws-test-async-dns
-```
-
-Then it can be run `./build/bin/lws-test-async-dns < poc_stackbof`
-
-![Address sanitizer report of stack buffer overflow](./NN-2025-0103_image.png)
-
-We suggest keeping track of the number of bytes currently written on the
-dest buffer, this could be done by saving the original dest pointer,
-decrementing dl on each substring memcpy, or using an auxiliary
-variable.
-
-CVE: CVE-2025-11678
-Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit/2bb9598562b37c942ba5b04bcde3f7fdf66a9d3a]
-
-Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
----
- lib/system/async-dns/async-dns-parse.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/lib/system/async-dns/async-dns-parse.c b/lib/system/async-dns/async-dns-parse.c
-index bdfe2050..81743b3f 100644
---- a/lib/system/async-dns/async-dns-parse.c
-+++ b/lib/system/async-dns/async-dns-parse.c
-@@ -35,7 +35,7 @@ lws_adns_parse_label(const uint8_t *pkt, int len, const uint8_t *ls, int budget,
- 	const uint8_t *e = pkt + len, *ols = ls;
- 	char pointer = 0, first = 1;
- 	uint8_t ll;
--	int n;
-+	int n, readsize = 0;
- 
- 	if (budget < 1)
- 		return 0;
-@@ -88,7 +88,7 @@ again1:
- 		return -1;
- 	}
- 
--	if ((unsigned int)ll + 2 > dl) {
-+	if ((unsigned int)(ll + 2 + readsize) > dl) {
- 		lwsl_notice("%s: qname too large\n", __func__);
- 
- 		return -1;
-@@ -101,6 +101,7 @@ again1:
- 	(*dest)[ll + 1] = '\0';
- 	*dest += ll + 1;
- 	ls += ll;
-+	readsize += ll + 1;
- 
- 	if (pointer) {
- 		if (*ls)
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.10.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.10.bb
index ed2ac9df4aa5..559253c9613b 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.10.bb
@@ -1,16 +1,14 @@
 SUMMARY = "Canonical libwebsockets.org websocket library"
 HOMEPAGE = "https://libwebsockets.org/"
 LICENSE = "MIT & Zlib & BSD-3-Clause & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=382bfdf329e774859fd401eaf850d29b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f35efc0af624eea4864849b05ae9c7db"
 
 DEPENDS = "zlib"
 DEPENDS:append:class-native = " libcap-native"
 
 S = "${WORKDIR}/git"
-SRCREV = "4415e84c095857629863804e941b9e1c2e9347ef"
+SRCREV = "2288cf200bc1c28680765bd4f07e437356106c2d"
 SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.3-stable \
-          file://CVE-2025-11677.patch \
-          file://CVE-2025-11678.patch \
           file://CVE-2026-10650.patch \
           "
 

-- 
2.55.0


