Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DCE10A1E70
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:03:51 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44807.1774523020945282332
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gLeBlR/h;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c742b9b7727so282856a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523020; x=1775127820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FF9gW54F+4TvjZtkYmDNwtIPYwvA5EIJsAzDMmCQ3hQ=;
        b=gLeBlR/hqFuJiw0neHekCmbg92hn6/mn9sK1pfhYDsvxlWHqjGn+xbOxbYhTACZXtn
         1PdpXMNniKrpW/Kfg44au8XnUcDJEMOXGw3KDQUqvsDA9CzgJpix6vwq02KruUbom15g
         YeTO6Ci+HMBhi4ILW9Xnu0op7dSJwjwhZim40DHvahrklf7tpxaI/dT4IcCc7LCw/ShC
         1VZPp1jUlpbidVNJLS1RreUBrPJh170S09lewisueNBJBr35vloRrCwfRCz989I9dumr
         ZuJzhjsAdPUXK00CzDbD6nBy0sU46M/eUhSftbWLwdEfsQLevToEQjtDmvNS/VanKNl7
         yVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523020; x=1775127820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FF9gW54F+4TvjZtkYmDNwtIPYwvA5EIJsAzDMmCQ3hQ=;
        b=o+74OXeuAFuWxuapUsHnKrzPq80+ZgN9BGJRw9bTexuL3uaPhpD5vjZH4l9x+JAStV
         R7rhUfQkx1/BICQBO4PoWQPAnrPDlkgvd+p0GAiG+7TMENzK8jW2h1QVgHiSNQv08f56
         ptknzG7bkUdBEz4uTw8vJ71L1q9iX9EbavD8ndzMbhBfLpcvhbyabHdoIdnC7Wzfmm/2
         2xQOOJavfE/xhBxoOCPdv/zBQvsbqRg1WyKWRSHAEWGvHW68icgAYZe5ELiVR3pEr+ZZ
         DhKhTINn0X4gxkugpVjSwbaC56zuhAu11XUCWgfjvCeeH8ZHN5Xx8Hqu/pLqk3ZfjR3L
         oDig==
X-Gm-Message-State: AOJu0Yw1fvX0iAbTJKEYVquZkwDRE+Og6PIZcXc39qf3KYAlhg7dTI8z
	p2Hr3KmRFW1v41PKD5Q8otjAfJzMR1KOPDl3iQnf+Pmd1Z+wvK7XshaQRTgNEuJy
X-Gm-Gg: ATEYQzys30Y+oHojjVUCMceJxw0Rr/MC7AOoS88hGsMMu9iteNT6gFu3M/V7OK8b/lb
	m1CWqMcnysbiiFrXsynigcHRdwUYuKi9yEL00HjDN+rhRdLOd5h/hZNdCt9Bl1UfzZV/Fu8vsl9
	zdiMWmxzWGEj581G/ivWgTpQ0fpHetYit98Rd/wZsEDQL2qAkkC+pGbJvNsCdHqIJXr5PU0AJC8
	pAYvKBz867OxBXIW9URhRKRSbZywAUJCaxYASODBGWNhIKiz2D1yuVxrVKOancViFJ9Uy8ttLPx
	qElKrHZNMEVTYJdVT1/7bznp+yRuKFTZ97bxDEU3Sm/W8GQnDrang63MTBWVO6j/VhvfeU4fYNb
	vUlC2RHtz4+HNxRL64n7WydfRT7jP59WDKRRalkSESiGd45pjN/lF3p3qJW5044NeZznAAWK9It
	H6HB3vXyCSoqHSkhziggN0D8s+f43DDpV0u4WvEuxUmLJl2Q==
X-Received: by 2002:a05:6a00:8c4:b0:829:8083:472b with SMTP id d2e1a72fcca58-82c864599f8mr1093598b3a.4.1774523020093;
        Thu, 26 Mar 2026 04:03:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d2113absm2265885b3a.20.2026.03.26.04.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:03:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 7/13] fatcat: include tag in SRC_URI
Date: Fri, 27 Mar 2026 00:03:04 +1300
Message-ID: <20260326110310.1809866-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
References: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125648

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
index 876e8618eb..47bb8650a6 100644
--- a/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
+++ b/meta-filesystems/recipes-utils/fatcat/fatcat_1.1.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/Gregwar/fatcat"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=57fbbfebd0dd1d6ff21b8cecb552a03f"
 
-SRC_URI = "git://github.com/Gregwar/fatcat.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/Gregwar/fatcat.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Use-unistd.h-not-argp.h-for-all-POSIX-systems.patch \
            file://0002-Enable-64bit-off_t.patch \
            file://0001-Replace-std-ptr_fun-for-c-17.patch \

