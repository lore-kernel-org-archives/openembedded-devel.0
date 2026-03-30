Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC185FB3D0F
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:29 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48204.1774867165378069637
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZqRi9OP7;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso1322118a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867165; x=1775471965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8o25B4KGJVuedVe6NK9fYer7bMdKqqOk4Vti0dAhWg=;
        b=ZqRi9OP79HloyX3ez4r/G83WMJ9tg/dJZYi+8lHANg/pKybfcr+bN3IfwkR/GH4Juu
         SYyYw4cfG5Ih+M7gNrtdeMIlACD2QSz6InQgll+unOukrij37x6hss2D3Yr8NN5iE4wF
         YAE/P0CtD8k7QIKCBVGIjCIWLE5I4TxzVbWmIL8jUqNELuWngkJWyW8tVzUvTLgnoXzk
         36y9RynfU1IVWv1Fb8FB734Y3cte4wDOUkDMgxKMCGzvLLtkbYCPmFlYoHimMjZ7UlMw
         t6R+XOIZ/qe+bGN1BPQbhj74zW9rDxCJWlB5gvLbZI52LYTfRQGTEpZv1L/occKELfv4
         MQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867165; x=1775471965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L8o25B4KGJVuedVe6NK9fYer7bMdKqqOk4Vti0dAhWg=;
        b=W9uY5tFJerk94i0uzulh5V5c8LjnKTfg94v1k5/qLCanjUI914AFIhdPv4zkxsElcE
         tmrGTnopKXp2hjMenLxxB7G9OgMB/o7R9YpqT/tRdX46Tki64MAdKEw3VdbGq0qgNPhK
         AwDPOSXgYKqAqFQUzrwSGHXcuzDmj3gg2q980cZYbul2YjpXtamxTqVkNCe7F9kg8Uts
         sCFVwYqRdaj42MAinTBXCRdvptHGlZrpUvYUgSm8QMmWqtAgy/WMsA0fpl31RXIeAO/a
         enST79mz4QMii4ixdT0pL5MWwYRiOnnmMXKBIq4QzuiPPkEnuimIeJahUguhxoMezXYQ
         vGbA==
X-Gm-Message-State: AOJu0Yz9pqqTza6LQ3BjTKLrJATOFAT9PKwAyn5NWNxBmtnkVXn6OH/+
	KrcYFZgnGDRPu0L9LwTQw8xmdUYdc2VXIwwv87yOsSSzmqJXFs49XjLk9vzoNw==
X-Gm-Gg: ATEYQzxn7R555utS+O672SQvXN7vuTrkDx3sm+FJSAgVlEztAf2e7aXOdYUccmdCeIX
	9tURQw5jHmhVOxnmN8VpGjqqct86gLL9Risa51ZQIGax8uv+3r6bNEt4dW4K7LMhU6/egTxuL0U
	LhByvQ86paFf3X5aanVVtN692Bt3RM2MLR4oJ+oJ0sJmxFVNIn7Ih7vQ9hjCHl0mBESTkLhybdd
	oNTFftCxETMLhh8PzxVFRvIYHpq0bzEqkRIVg3/6wb6nGTQ6kJZTVM8MTKMjcBASFwBKengqgwv
	jlQlJqLGOJbhzpUruBQKiB6orrgL5TkVxOS9pJD+IrgsAsqBwemELP7cK/X5Xb6L7dXezs8onEK
	zZRGvB9knq4hBDRtbhNtD8rsugaSspDifYvLy+uLB7RhS40ouL7i0pjDcBZs4jl92KFK7svoM9J
	2bmW5Bkfmecw0+G2wlYs/R1lzHk49m5M3Vwk4=
X-Received: by 2002:a17:90b:1e53:b0:35c:8ac:ef74 with SMTP id 98e67ed59e1d1-35c2ffafe42mr11868678a91.6.1774867164547;
        Mon, 30 Mar 2026 03:39:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 8/19] nginx: upgrade 1.28.2 -> 1.28.3
Date: Mon, 30 Mar 2026 23:38:35 +1300
Message-ID: <20260330103846.3381644-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125851

From: Gyorgy Sarvari <skandigraun@gmail.com>

Changes:
*) Security: a buffer overflow might occur while handling a COPY or MOVE
   request in a location with "alias", allowing an attacker to modify
   the source or destination path outside of the document root
   (CVE-2026-27654).

*) Security: processing of a specially crafted mp4 file by the
   ngx_http_mp4_module on 32-bit platforms might cause a worker process
   crash, or might have potential other impact (CVE-2026-27784).

*) Security: processing of a specially crafted mp4 file by the
   ngx_http_mp4_module might cause a worker process crash, or might have
   potential other impact (CVE-2026-32647).

*) Security: a segmentation fault might occur in a worker process if the
   CRAM-MD5 or APOP authentication methods were used and authentication
   retry was enabled (CVE-2026-27651).

*) Security: an attacker might use PTR DNS records to inject data in
   auth_http requests, as well as in the XCLIENT command in the backend
   SMTP connection (CVE-2026-28753).

*) Security: SSL handshake might succeed despite OCSP rejecting a client
   certificate in the stream module (CVE-2026-28755).

*) Change: now nginx limits the size and rate of QUIC stateless reset
   packets.

*) Bugfix: receiving a QUIC packet by a wrong worker process could cause
   the connection to terminate.

*) Bugfix: in the ngx_http_mp4_module.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 34b3d0f4917169c5cd568cdb13796a2d75f1fbf1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.28.2.bb => nginx_1.28.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.28.2.bb => nginx_1.28.3.bb} (66%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.2.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
similarity index 66%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.28.2.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 9699b7189d..9872a6de3b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.2.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -2,6 +2,6 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
 
-SRC_URI[sha256sum] = "20e5e0f2c917acfb51120eec2fba9a4ba4e1e10fd28465067cc87a7d81a829a3"
+SRC_URI[sha256sum] = "2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918"
 
 CVE_STATUS[CVE-2025-53859] = "cpe-stable-backport: Fix is included in 1.28.1"

