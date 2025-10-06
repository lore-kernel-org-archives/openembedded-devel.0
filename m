Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B1CCCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 20:18:48 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.2378.1759781918440770214
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 13:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=afbTS7KO;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso11939080a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 13:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759781917; x=1760386717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCAR4D6aK0DrtoxJmraRvbzYA2tVavFpTS9w/axtNVI=;
        b=afbTS7KOWwwlcvWiMDJqGm7eEw5Bq5JZhwhh6TeEY+OdWXDDiWuzK1gMepN8M0RX/K
         XIGW57o0WHHmqnBHOQ8Ax+1k6wqdgVF/kNgoUaTmps/EPGFmy+6v4ejo5CaDEOKe5pvR
         XLpdwoIyFTpKOXZZnKcNwy5QDuhdLgHNi3nvP6pr/qxFmV2zJV/FBaL/6YzgcE1lEcZp
         DLyURovXUrQt3r4acsEmJ/iq706YAAahBqV189kH6Ga8LOqknxvdRx1HlPQi0l/6c9rq
         50eIld1wAVE45u5a8jvZ9eggYnzVA897ctiUTz16ndRHnEONPhCAmS2A5f0LTs/GZMto
         NCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759781917; x=1760386717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yCAR4D6aK0DrtoxJmraRvbzYA2tVavFpTS9w/axtNVI=;
        b=vVhillXLcOaZ0gCGcBXQ0FkfkfNE7dFCF3Vv/lbDUUKDBgqxj+n1bPls3yhx4dc1+L
         5Vnit7tslMW9jGKv2BJebbbmAYxEB8mPjsCnr34E2T2LUSHUEXaSXQ1+TqMvWCuVOaYh
         0hE78afEA4P/sp364nLQPJt4Br8UcAMx3vVe+ScCD2P7BtWcinvuRMUTVzGqHTIkmYLM
         jGj8uHZM40vMV/Xd6cHyNeeJIp+1mSLhMKYBiW5boHivKQSorwcrvwFBP5gh6SLaN8Zq
         UpPKWn7++fHjHKJMX5RVp33vr8TSH2pbbUA+8cq4jA+dxS84VL2D2KdYSqRbHksbsSPC
         4ngQ==
X-Gm-Message-State: AOJu0YzEHlqPjLQfj0rATSF9lQqcdDgm795fltEtLIgNN9k+F0XdBnXS
	TKgJD3It7eRQ0kDgPIHkEhmdzhMubZQKu1xZPgL9PHmAkUtwu1MHX7jxV33Pag==
X-Gm-Gg: ASbGncvObx/JisP+gyV6GGPUhwqljUhGWRYfe9yZxhyxVCczdj7uVhWiYRhdcVzyAlO
	7N7lvAq/v8XIOrdqw+GuC3Lw0sR9CL22kyjbnswZbq+N+PtfVnTbYOf7NZxHUnZ5S3AuL5gGgQL
	XJu11fjIiZRoQdht2/ub2EdYFAhS883o/4qVp0w+p5mvLLKXBE41V3Nu9j4nr+E/y6VOvC4LfsZ
	U7P5B4t0LLfd2OPONDsCytiSNO8gKRznZ/9ubGBEWSx1HTISZbUYsdXdRMD1lQRz+UQtV+axVo2
	FkXcuO91w5H0VfMN1Q+nk0EOhbhNbBUOu9xrJuM0GIvLB/IgS0ZIQMJIrL7khrv8nT4wD81P1cH
	m+qkGTIdfjhIzzvb+ENxwy5uR8Q4ig9xzQCDFHnQ6kvLgaYCRIURgJgE=
X-Google-Smtp-Source: AGHT+IGLSzsCXTjMQMR95gpT6oWiixM56BAIblmssHej+KWE7c75M2VQFKQ4kgTpaT868W/R5/SNFA==
X-Received: by 2002:a05:6402:3548:b0:631:e73a:e9e9 with SMTP id 4fb4d7f45d1cf-63939c29df2mr16018250a12.35.1759781916365;
        Mon, 06 Oct 2025 13:18:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788100129sm10916410a12.24.2025.10.06.13.18.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 13:18:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] tinyproxy: upgrade 1.11.1 -> 1.11.2
Date: Mon,  6 Oct 2025 22:18:35 +0200
Message-ID: <20251006201835.2015012-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 20:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120314

This upgrade contains fixes for CVE-2023-49606 and CVE-2022-40468.

Changelog:
https://github.com/tinyproxy/tinyproxy/compare/1.11.1...1.11.2

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2022-40468.patch  | 33 -------------------
 ...inyproxy_1.11.1.bb => tinyproxy_1.11.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
 rename meta-networking/recipes-support/tinyproxy/{tinyproxy_1.11.1.bb => tinyproxy_1.11.2.bb} (90%)

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
deleted file mode 100644
index 4e2157ca75..0000000000
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 3764b8551463b900b5b4e3ec0cd9bb9182191cb7 Mon Sep 17 00:00:00 2001
-From: rofl0r <rofl0r@users.noreply.github.com>
-Date: Thu, 8 Sep 2022 15:18:04 +0000
-Subject: [PATCH] prevent junk from showing up in error page in invalid
- requests
-
-fixes #457
-
-https://github.com/tinyproxy/tinyproxy/commit/3764b8551463b900b5b4e3ec0cd9bb9182191cb7
-Upstream-Status: Backport
-CVE: CVE-2022-40468
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- src/reqs.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/reqs.c b/src/reqs.c
-index bce69819..45db118d 100644
---- a/src/reqs.c
-+++ b/src/reqs.c
-@@ -343,8 +343,12 @@ static struct request_s *process_request (struct conn_s *connptr,
-                 goto fail;
-         }
- 
-+        /* zero-terminate the strings so they don't contain junk in error page */
-+        request->method[0] = url[0] = request->protocol[0] = 0;
-+
-         ret = sscanf (connptr->request_line, "%[^ ] %[^ ] %[^ ]",
-                       request->method, url, request->protocol);
-+
-         if (ret == 2 && !strcasecmp (request->method, "GET")) {
-                 request->protocol[0] = 0;
- 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
similarity index 90%
rename from meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
rename to meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
index 4f52ee2ba6..5b8e9dcd7a 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.2.bb
@@ -7,10 +7,9 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://disable-documentation.patch \
            file://tinyproxy.service \
            file://tinyproxy.conf \
-           file://CVE-2022-40468.patch \
            "
 
-SRC_URI[sha256sum] = "1574acf7ba83c703a89e98bb2758a4ed9fda456f092624b33cfcf0ce2d3b2047"
+SRC_URI[sha256sum] = "2c8fe5496f2c642bfd189020504ab98d74b9edbafcdb94d9f108e157b5bdf96d"
 
 UPSTREAM_CHECK_URI = "https://github.com/tinyproxy/tinyproxy/releases"
 

