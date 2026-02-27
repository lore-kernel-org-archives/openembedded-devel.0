Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8BCFEFB6B
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 15:43:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.99119.1772207029493949910
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 07:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ig+wzhW2;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so25338095e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 07:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1772207027; x=1772811827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kb8NFqMT5CO9gdSIU3tBhJoDkkarENbah/JhtMJuBG4=;
        b=ig+wzhW2sZiAi+bHsAfFvbj0FUqdcIezJUxLyJKySncGpPRCJjHjQqHcAzQ8mb9T2w
         /iEeyrudP67gxGCZ3f+uqPpqhR0fkbhiZwK5qZs9RkOE9gqLYqXWn9bJD5Jd5OsNaCzZ
         86yzuE8BsUpDpOyTa7dZapl2jxUkd33Vsm9b8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207027; x=1772811827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kb8NFqMT5CO9gdSIU3tBhJoDkkarENbah/JhtMJuBG4=;
        b=HrH1No4OGCpu5ZY799qp/x6tEFXiTnqGHRoeP1beu153Co23ILIeHWIB4kt7RHvyqP
         5Ft1SfEVymWhD6KZ70FMU7aFuLjs6Dok0g0bMWZ6KvsCVp85+O9bjbFEyJWRTD/yBWD8
         jfdXJRoI9NRNjMcDV1vTcUOPdMJMhmaPiuRTUY7JJuqm/kwlHYe7T7RLyqBeg0NTqkt8
         e4dCER+4ttqRPlgAvsh8tW90mCU/zGX1Ua2ts2NlBWMvNprrxQ12zqIBKS6uRo1vSL2D
         E1Ztr0TdnZUcmugMtOhE6eq6TvKhcZ5isXBDqLYgqqfAjiHsBKJhDWnurnbY0boUL4vs
         LFUQ==
X-Gm-Message-State: AOJu0YzW8q17mzHBSmLNwDyDA5n85EOFmmJtiDhvDAQg/2S3r0ratHvs
	0iHIFso2KAHHON8RQoBX0BcV6gIWPg8ZFTIWBbSkmNIznPlmW9h9zHYbYuS+Jwn1ZPtEALaJeSA
	9ekzH
X-Gm-Gg: ATEYQzz6XSzbE8ZoolBiFCjQJ3tfsfUALkNQFIjwhpvi1ji2OUJmnt6tZznN64T4YgC
	Z8Rcs7LNJFDvGuX02Uz1RSdQBG4Lin4jYvyvKzzhKj5qSI+4+gbhGPC675Gr2ZWSMnG5fbGvc/I
	kwvXtCMLvyaAXVehjwgUPxYX/CUGrOUGROqfIoSN4vt/t/sq3T+lTrMwVIccRhSYWsNZPZH6ddt
	4jU1pUkU84L+4r47yGfspNJqXP0BvUU6tcWPYPCvvv9P2K6j4EczP5wc0bHXtWBOTiriEcZjR11
	b1XxLMr88P4tnk/XyteovJj8tnXwi4v4beatXaAVo3QOCYMc3TByi/WEXTQ1KiOnZEnkimQFOyX
	6eaGmCqURcgHhdlI6yQ6TqebuDLY+2pY4MCXaRkku5bvxogxp1Nwnstn6mKB4WZs4VD66dvcA7A
	yBmcXyDfPtZamHRI0D6B1j8GbqybQqwwEYV/7u
X-Received: by 2002:a05:600c:1f83:b0:483:8062:b43 with SMTP id 5b1f17b1804b1-483c9c031e6mr58325245e9.19.1772207027354;
        Fri, 27 Feb 2026 07:43:47 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm245845115e9.13.2026.02.27.07.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:43:46 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-typer: Upgrade 0.21.1 -> 0.24.1
Date: Fri, 27 Feb 2026 17:43:40 +0200
Message-ID: <20260227154343.3923152-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227154343.3923152-1-leon.anavi@konsulko.com>
References: <20260227154343.3923152-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 15:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124763

Upgrade to release 0.24.1:

- Fix CI, do not attempt to build typer-slim, nor typer-cli
- Drop support for typer-slim and typer-cli, no more versions will
  be released, use only typer.
- Upgrade types for Python 3.10.
- Add internal scripts to migrate docs from Python 3.9 to 3.10.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-typer_0.21.1.bb => python3-typer_0.24.1.bb}       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.21.1.bb => python3-typer_0.24.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.21.1.bb b/meta-python/recipes-devtools/python/python3-typer_0.24.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-typer_0.21.1.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.24.1.bb
index 0bf2c0ec4f..e312c63e6c 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.24.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "ea835607cd752343b6b2b7ce676893e5a0324082268b48f27aa058bdb7d2145d"
+SRC_URI[sha256sum] = "e39b4732d65fbdcde189ae76cf7cd48aeae72919dea1fdfc16593be016256b45"
 
 inherit pypi python_pdm ptest
 
@@ -20,6 +20,7 @@ PYPI_PACKAGE = "typer"
 RDEPENDS:${PN} += "\
     python3-click \
     python3-typing-extensions \
+    python3-annotated-doc \
 "
 # python3-misc for webbrowser module
 RDEPENDS:${PN}-ptest += "\
-- 
2.47.3


