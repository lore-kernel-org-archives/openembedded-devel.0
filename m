Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67774C2A086
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:49 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61171.1767607367452517343
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vzfyo8W7;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so90458095e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607366; x=1768212166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJ/ypXKF/D0APy1PuL+WlUF9igcUKoVOACpExBbT22A=;
        b=Vzfyo8W7UbE/DdHH7e2SBM7gO0K9KhS+1StSVk1jU0CL7Ehu2XclQf7MKqkpAzxWaM
         9CoPOQkhtsuBCU5dWubHvz15+f2DTtuOp38hq6fbPdNh1GhwUCAETXD6n1sgB/Bna4YG
         uwgfuBgUX+94OaMkx77mhGbrHrMA1fA4fEp02jhUl25gEWkQJjXO7EBbow23Xxu2nkIP
         Yh/JVSfluOe1F4iDahasenblsNjPyMXEEkKvhbNehrEUWgfw9xNIjU9DB9Op6r8e4Td+
         DAyBj/3XF/+B4HDRhPlHnRiMBGbSe49IgKJjJmpITC5pr6Zs0Gn90dPtRomHn6kHEnM/
         wr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607366; x=1768212166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gJ/ypXKF/D0APy1PuL+WlUF9igcUKoVOACpExBbT22A=;
        b=WA/VwLbhwrmiA9/EtmO4yDfwSmZ03jGq1ghBzXyvOU6qJPJZcTEV80tFvK7HuKRNUo
         vxjG4aev4duB1wST/uOLDQx1huc4+FbmT8nmuYdykVZNCTywSQcWTXrtr2ZbxOUdOb+W
         XyniBdRsp/bKedY0JltZyyNFO8f17y9hm6DiKtdAYOA4TP9p6ahP4CUdok24oKH9nXH6
         HrEE60BuVAGuUUk4gto1XHLoHzevBakBkAReesZ5aDdEanfFzA8ZIVRJB8/YF8q0sJ3e
         QkwzbJkChjOXAzYvZe34m4fZSDQb67SwhoNYY44lwiVCNiySOqB5SvxQgV4b6bgYKsCc
         nAkw==
X-Gm-Message-State: AOJu0YzkPkXNvSBO0l1tsj+fwB2r9/Etl7GzohTWuJFN+ryC5sQc8WoW
	EU+uRPDGOVtN1pNCMxrxwVVxU0sXHgf0+qRhMNVfK6/zcedkZ+faWWuwi6Smuw==
X-Gm-Gg: AY/fxX4G+HTH0gwkmUwYNOKiOcrwHXmbeYSuXZPr900rb1fd/kzYdmo5TpG96LAfEh5
	iBemFRBjc4AJhafdaJMzBPEO6X18txOjhC2SYHXjskWoa6NYRCwcGtQLfwD/emE6Yw4S35waD0Z
	adoD7Cu6bbFaS5PUrytkwXxbh76aNxdeSrEgi1wA8Ki8EcyYVkADkrpPIcJeTACu03VxibXVzIo
	v/kNsJZkVC4FVxGYyQQm3DFJZjElCz5wIPc0Zss7qPN5iULDpTPw9jYaLu74oGOCysU+uRqv3nW
	jBP9sN1t55kQgy0CqRaLGED91L46PhLsK7NcJ6+OMc2LJWrQsVMgja6iyfYjc68/mU294DhIu7k
	HnWtX/WaAHnfPgYOLRvcDQV/UGvovWrrEB/36mC3387S8xYPC+awfwZ5imtByRcSX3Zgg8SXFsN
	gCZT7TySRR
X-Google-Smtp-Source: AGHT+IEumNj1f/rCUDBoeL9tAYITz9BVfpRjRX3wlw/IeEL8HMVyr4D5XI+6yRNpXdSbepxgKKskgA==
X-Received: by 2002:a05:600c:5251:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-47d195a425bmr607536825e9.34.1767607365598;
        Mon, 05 Jan 2026 02:02:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 10/17] libwebsockets: fix CVE-2025-11677
Date: Mon,  5 Jan 2026 11:02:30 +0100
Message-ID: <20260105100237.3081345-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123141

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Backport a fix from Debian:
https://sources.debian.org/patches/libwebsockets/4.3.5-1+deb13u1/CVE-2025-11677.patch
Upstream commit:
https://github.com/warmcat/libwebsockets/commit/2f082ec31261f556969160143ba94875d783971a

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit da04d7003e65af77667e2c18fa988f0ada62f744)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libwebsockets/CVE-2025-11677.patch        | 161 ++++++++++++++++++
 .../libwebsockets/libwebsockets_4.3.5.bb      |   1 +
 2 files changed, 162 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.patch
new file mode 100644
index 0000000000..bf11a893f8
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-11677.patch
@@ -0,0 +1,161 @@
+From c01cb06d99c08579ab33bef066fca8a5338b7c7b Mon Sep 17 00:00:00 2001
+From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+Date: Tue, 18 Nov 2025 16:59:22 +0100
+Subject: [PATCH] NN-2025-0102: UAF depending on upgrade allowed
+
+This document contains sensitive information collected during our
+security research activities related with the Libwebsockets library
+maintained by Andy Green (warmcat).
+
++-------------------------------------------------------------------------------------------------------+
+| Report information                                                                                    |
++:===================================:+:===============================================================:+
+| Vendor                              | warmcat                                                         |
++-------------------------------------+-----------------------------------------------------------------+
+| Vendor URL                          | https://libwebsockets.org/git/libwebsockets                     |
++-------------------------------------+-----------------------------------------------------------------+
+| Affected component                  | libwebsockets                                                   |
++-------------------------------------+-----------------------------------------------------------------+
+| Affected version                    | 4.4                                                             |
++-------------------------------------+-----------------------------------------------------------------+
+| Vulnerability                       | CWE-416: Use After Free                                         |
++-------------------------------------+-----------------------------------------------------------------+
+| Proposed CVSS v3.1 Base Score       | 6.0                                                             |
++-------------------------------------+-----------------------------------------------------------------+
+| Proposed CVSS v3.1 Vector           | CVSS:4.0/AV:N/AC:L/AT:P/PR:N/UI:P/VC:N/VI:N/VA:H/SC:N/SI:N/SA:N |
++-------------------------------------+-----------------------------------------------------------------+
+
++-----------------------------------------------------------------------------+
+| Security Researcher(s)                                                      |
++:===================================:+:=====================================:+
+| Name                                | **Email address**                     |
++-------------------------------------+---------------------------------------+
+| Raffaele Bova                       | labs-advisory@nozominetworks.com      |
++-------------------------------------+---------------------------------------+
+
+Libwebsockes is a C library that provides client and server
+implementation for various protocols (e.g., HTTP, websockets, MQTT) and
+more.
+
+Nozomi Networks Lab discovered a "CWE-416: Use After Free" in the latest
+software version of libwebsockets, specifically in the WebSocket server
+implementation.
+
+Depending on the use of the API, the vulnerability may allow an attacker
+to read or write data, that could cause a loss of integrity or
+availability.
+
+The issue is caused by the `lws_handshake_protocol` function, specifically
+when the upgrade header is not valid, the function calls
+`lws_http_transaction_completed`, which frees some of the data in the wsi
+structure, then it calls `user_callback_handle_rxflow` passing the up
+pointer and uses it on following strcasecmp calls.
+
+From our understanding, for this vulnerability to have a meaningful
+impact, a user that implements the Websocket server, must provide a user
+callback function which is going to handle
+`LWS_CALLBACK_HTTP_CONFIRM_UPGRADE`, while ignoring the length and doing
+operations on the up pointer.
+
+It is possible to compile the minimal websocket server using address
+sanitizer, to quickly verify the use after free.
+
+From our understanding of the code, if the upgrade header does not match
+the intended contents, then the code after the if statement when
+`lws_http_transaction_completed` is called, should not be executed, thus
+simply enclosing all that code in the else branch solves the issue.
+
+CVE: CVE-2025-11677
+Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit/2f082ec31261f556969160143ba94875d783971a]
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/roles/http/server/server.c | 58 +++++++++++++++++-----------------
+ 1 file changed, 29 insertions(+), 29 deletions(-)
+
+diff --git a/lib/roles/http/server/server.c b/lib/roles/http/server/server.c
+index 6b132a42..e6d714e3 100644
+--- a/lib/roles/http/server/server.c
++++ b/lib/roles/http/server/server.c
+@@ -2375,49 +2375,49 @@ raw_transition:
+ 						HTTP_STATUS_FORBIDDEN, NULL) ||
+ 				    lws_http_transaction_completed(wsi))
+ 					goto bail_nuke_ah;
+-			}
+-
+-			n = user_callback_handle_rxflow(wsi->a.protocol->callback,
+-					wsi, LWS_CALLBACK_HTTP_CONFIRM_UPGRADE,
+-					wsi->user_space, (char *)up, 0);
++			} else {
++				n = user_callback_handle_rxflow(wsi->a.protocol->callback,
++						wsi, LWS_CALLBACK_HTTP_CONFIRM_UPGRADE,
++						wsi->user_space, (char *)up, 0);
+ 
+-			/* just hang up? */
++				/* just hang up? */
+ 
+-			if (n < 0)
+-				goto bail_nuke_ah;
++				if (n < 0)
++					goto bail_nuke_ah;
+ 
+-			/* callback returned headers already, do t_c? */
++				/* callback returned headers already, do t_c? */
+ 
+-			if (n > 0) {
+-				if (lws_http_transaction_completed(wsi))
++				if (n > 0) {
++				    if (lws_http_transaction_completed(wsi))
+ 					goto bail_nuke_ah;
+ 
+-				/* continue on */
++				    /* continue on */
+ 
+-				return 0;
+-			}
++				    return 0;
++				}
+ 
+-			/* callback said 0, it was allowed */
++				/* callback said 0, it was allowed */
+ 
+-			if (wsi->a.vhost->options &
+-			    LWS_SERVER_OPTION_VHOST_UPG_STRICT_HOST_CHECK &&
+-			    lws_confirm_host_header(wsi))
+-				goto bail_nuke_ah;
++				if (wsi->a.vhost->options &
++					LWS_SERVER_OPTION_VHOST_UPG_STRICT_HOST_CHECK &&
++					lws_confirm_host_header(wsi))
++				    goto bail_nuke_ah;
+ 
+-			if (!strcasecmp(up, "websocket")) {
++				if (!strcasecmp(up, "websocket")) {
+ #if defined(LWS_ROLE_WS)
+-				lws_metrics_tag_wsi_add(wsi, "upg", "ws");
+-				lwsl_info("Upgrade to ws\n");
+-				goto upgrade_ws;
++					lws_metrics_tag_wsi_add(wsi, "upg", "ws");
++					lwsl_info("Upgrade to ws\n");
++					goto upgrade_ws;
+ #endif
+-			}
++				}
+ #if defined(LWS_WITH_HTTP2)
+-			if (!strcasecmp(up, "h2c")) {
+-				lws_metrics_tag_wsi_add(wsi, "upg", "h2c");
+-				lwsl_info("Upgrade to h2c\n");
+-				goto upgrade_h2c;
+-			}
++				if (!strcasecmp(up, "h2c")) {
++				    lws_metrics_tag_wsi_add(wsi, "upg", "h2c");
++				    lwsl_info("Upgrade to h2c\n");
++				    goto upgrade_h2c;
++				}
+ #endif
++			}
+ 		}
+ 
+ 		/* no upgrade ack... he remained as HTTP */
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
index afe2124f65..0b74adf990 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.5.bb
@@ -10,6 +10,7 @@ SRCREV = "ab9df9cfc39de7a49967f18387b6b76310947442"
 SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.3-stable \
            file://0001-sll_protocol-may-be-be16.patch \
            file://0002-allow-build-with-cmake-4.patch \
+           file://CVE-2025-11677.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"

