Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA10310BA438
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 07:30:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6939.1774683024778836366
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Mar 2026 00:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jz3tb7uG;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4870206f73bso16621315e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 00:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774683023; x=1775287823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DrWnjhZmO+UrdnOw5wOM1O/FxvN1jKNnNyyhAKxp5So=;
        b=Jz3tb7uGXchkO1XFITPK2Waob3PL/rEunFM5LlsQss3iTW5dqUyT7+5RKUzRwG648w
         mmGOyXzew86rUBlTDR0YHdmfUudik41wxr3PQQxZYLHNPjWMDaccmzCKzRua2VOkAiQ/
         Nf6nweBU3rtg9Yw4irUnaFo/7BKbwnRzpsl1xMKJPmjCDJ8Ni0FF9dRh5KQsp5sRC6XQ
         LrSYC1mFLeomOv6id4txS4367axxXzAdEw0Ug5A63bnWZwQ0aDav06djgFhd8F0E/1nR
         JWcKtQqvbdPcG6s7ROKyU9pZJtt6xETJuPfuhy+NZdWV2p0h0LgWcWrUc3jTeU2Bfnd4
         xBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774683023; x=1775287823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrWnjhZmO+UrdnOw5wOM1O/FxvN1jKNnNyyhAKxp5So=;
        b=bKNZg0ohGBb8FmV9ocsCzWd1q49VIX4nnB8/zPkPbF7MXUMKSLm2zo75VH2WmrWMAV
         ihAOg4IjYJ+0IfsylK9FxIDC65BE9iSwmpd9q6JllcDNqM9SWEWcFs+HvV0l9hOlULks
         iRMMLK10l33Mp9ZmP+kYroIQoFz9y/rA/tiYPxj1JPqdEprnX0z9vtJnLRqljpA9zAf7
         eBOQ2lCC0OoDaYPJX9Ecgsi4JV4+zEumNw/p5bLVEXswJMjqzNFeaxmk3dO35TAyznz+
         8vXm/WgsOpvqpxsYvu0hIQMfFABLQHgTrvaHxEXRHAbIryppRrU5Kg2pfEiXcPE9Gfhx
         Lo5Q==
X-Gm-Message-State: AOJu0YzyX+4k0Ab0VkZSZibVZGzT6knGPXhYKVSqqpPXckg4eQoIfVh7
	fNM2aFXof+6mT6xUdyYuVawTreFZoJgalVkcH5RWLBLUK/3dAMIkeIxAkCuWUw==
X-Gm-Gg: ATEYQzxA1C+kr5Xw3e4+W/M2SkWd5P/EUmkjSlnR4q9YQyvI45Sq+W1KfWUH1+cZhcK
	LtuZ5xQz39rpGWh1AYBHxbG6NTOpIgVdXATI2pJGWRXQTBF1k3Jdjgj7sY1iXxMij9/DkpoLWYX
	L9vd1fMjz4mldEAnpwjEvmm1AA2kmrgwgJZZA43EVJsSGUgDIavh+5p2YVXr2lWHAp9zchqzphc
	K2Z1Yglm2jpHI57sMwh5DLFEZkU5A5KzWKW4alNiZ8tR9v2Qs4nNd2ZCmYgssj43K7EPpppu61L
	FVAnvGNQ4VPjoI7L97n+UpCsQt3RbpkOGuSQVtNufLfN9Vxw2IaB7UD/hSwpsa6yn3bwFsb4gtD
	rj3G12qBGWrQRDlpC73Q3XTe3PQfvC6hWQlQwG8Facx5UHCTBLvwt6jK62niUtP87gnNHH7nczj
	uquCPEWq/eJhmLdNCPTmBk
X-Received: by 2002:a05:600c:8b4b:b0:485:3fe6:21f5 with SMTP id 5b1f17b1804b1-48727f0e5f8mr81421055e9.10.1774683022776;
        Sat, 28 Mar 2026 00:30:22 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24707f2sm3458347f8f.26.2026.03.28.00.30.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 00:30:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH 1/2] nginx: upgrade 1.28.2 -> 1.28.3
Date: Sat, 28 Mar 2026 08:30:20 +0100
Message-ID: <20260328073021.1895690-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 07:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125799

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

