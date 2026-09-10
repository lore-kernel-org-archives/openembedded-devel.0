Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD278C88E45
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:57 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27785.1789081853787502642
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LnMmxTYV;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so2692135ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081853; x=1789686653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmf6kn/dh/xIaEcQJ9E3foESLqAmsxuGTMN6jm2PH3w=;
        b=LnMmxTYV+OUbGeO7b/Nu4mYLSqSE3FMB6jXuyJWhpGRJDVSjddb6rpHObdIGi9NwFU
         U/zohbKKPy08YwDO2Q7hROV5p4HsIlJoVD5ulTdnyzXu9q0F11r+ZwTINyj0FVstgaW5
         y+4VbwUCTiVsoHk0sWslLzks8TScB9l/VTXjppGQUUtTbb/PW81tWo7iErz1XfXdmtAd
         1VEQT7te2PmXrHEhsk08apx0a9Idp5HWK6lsRUPYNKxXjNdPd8bZ2DOfEc381I5JsJly
         NHk2u/LrE5caGwlp1ipt2NP9CYXYJe2kH9PMrX3dl4oI7VJsJ5Hmmx1vFIl4zndu2Wx0
         cWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081853; x=1789686653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hmf6kn/dh/xIaEcQJ9E3foESLqAmsxuGTMN6jm2PH3w=;
        b=Yk/vtfLVIoPfu9IpTgAY7vVRooJZ6InAZRV5bBmD169j0BHmbrfiuvOpBMl4GiCEAj
         owEpl8Z5FQLON5dFYOpyZz0JQWum7RDnfBbvIGzX18D1bOEToFy9p+BS4pGfCZPK51xo
         ksbWzVC+aa1gKlYJiM03dOIyKIE12nGGLGeNWmiDJlvd1Dvpnw9FaL/tAgsll+1/UTZv
         /NJWR0YoDAt2Qt0rGYGtqJk4/PzkLLxpR9+BdZ9ceHB458yhwIVhi1pOHH6XsnKO5bqM
         +n4h9f5eAceFeRYB8VYUbyEDVbz9RMO3grGR/T+CFiMkP/sRkmqCczn5a9W2iyC4ggLZ
         kZzA==
X-Gm-Message-State: AFuF++lIlvve1yPCkLmBxqAxcWjqpsnMlJ6nrH6lAoPtPyb6FT2kdjBF
	38rzqyXOtg/I9Ap+hgYu0LA2F/nhGpgMnqNeeHjEXu2IDP2YdWWETa9xlZuVYQ==
X-Gm-Gg: AYBFou05qlRaeUa9k9Pl3gLY6yAJT107HuBVSpxeDI+4dtuMFDSXraFB0D27l+7yPNg
	zf+qQlDZX1OfQqqYwV1DwMOVXZ+CJhAoZTYNZdb5n+2XOTXq3mQhQvvZ1f9wcuTDnfJwLd0Z0ya
	OexYMGuS5FZFiW8kQDgR/0Ag3Dbl+wT+9SVCFPZk5snpL5d4mbd5MfcLqbUWzQm1mbitlD0uWdC
	xTKvX5VFvDKJ06c39LFdAewaDfXwK6ode30jeWEybF83zT/0ox3LPBd8WXY7Li6rzmGkryyJmx2
	7v0JFkXyx7HVlb41ElSBXdkMU33iha+CLWFSTdQ9ZR+G+6OCP6Euok5WoLV2h4LObU83dR5N7QQ
	/hG0UpXLOv0sk69uiBG+td8tYeYkcSiGFCcYJTi0r4YYJne83JJkUBrJnoZNe1QBPVHrNZ58lg4
	yOy/SHnsy+ahNUiVcIMjDkwd68d0nOGZE1n4NqThBFm2amh9J5Few3cpG3JYd74UvhPTa5f6VVm
	J93Nx8Sl88pKd3bxIXWZnqtbg==
X-Received: by 2002:a17:90b:5246:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39d9bc67660mr1895524a91.1.1789081853138;
        Thu, 10 Sep 2026 16:10:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 25/32] unbound: patch CVE-2026-54478
Date: Fri, 11 Sep 2026 11:09:24 +1200
Message-ID: <20260910230932.173913-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129943

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-54478

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-54478.patch      | 38 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-54478.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-54478.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-54478.patch
new file mode 100644
index 0000000000..3580815477
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-54478.patch
@@ -0,0 +1,38 @@
+From 44af1c8b392afb7d14ae0814fb9c6c037a5bf18a Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:16:42 +0200
+Subject: [PATCH] - Fix CVE-2026-54478, DNS Cookie bypass when combined with  
+ proxy-protocol use. Thanks to Qifan Zhang, Palo Alto Networks,   for the
+ report.
+
+(cherry picked from commit 8a15ffee620bce05fbfd2c69b0d4c31c10a02431)
+
+CVE: CVE-2026-54478
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/8a15ffee620bce05fbfd2c69b0d4c31c10a02431]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ util/data/msgparse.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/util/data/msgparse.c b/util/data/msgparse.c
+index 169709b7e..3dc2e1264 100644
+--- a/util/data/msgparse.c
++++ b/util/data/msgparse.c
+@@ -1068,13 +1068,13 @@ parse_edns_options_from_query(uint8_t* rdata_ptr, size_t rdata_len,
+ 			 * purposes. It will be overwritten if (re)creation
+ 			 * is needed.
+ 			 */
+-			if(repinfo->remote_addr.ss_family == AF_INET) {
++			if(repinfo->client_addr.ss_family == AF_INET) {
+ 				memcpy(server_cookie + 16,
+-					&((struct sockaddr_in*)&repinfo->remote_addr)->sin_addr, 4);
++					&((struct sockaddr_in*)&repinfo->client_addr)->sin_addr, 4);
+ 			} else {
+ 				cookie_is_v4 = 0;
+ 				memcpy(server_cookie + 16,
+-					&((struct sockaddr_in6*)&repinfo->remote_addr)->sin6_addr, 16);
++					&((struct sockaddr_in6*)&repinfo->client_addr)->sin6_addr, 16);
+ 			}
+ 
+ 			if(cfg->cookie_secret_file &&
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index a03dcf4193..1e3bd6f5c6 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-50251.patch \
            file://CVE-2026-50252.patch \
            file://CVE-2026-52863.patch \
+           file://CVE-2026-54478.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

