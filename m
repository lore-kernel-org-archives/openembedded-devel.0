Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9BFC561E6
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 21:37:21 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6309.1785965836574090807
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 14:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AohuRFRs;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c998fd549a8so1166301a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 14:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785965836; x=1786570636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAnSIuF6PbdakwgCTzTcMBuLORa+n1bGMslJ+EeOoSI=;
        b=AohuRFRsuzIaK5dQPhow157l0ehAgdEqes6o0xl9Yg/bKRrceuXi0YSKPenSg0nH+6
         PvHlRXYrCsfUndzDcHN3Ys1iAfuRhE57yZGp6HyeyCUQPdWbvST1tx+sawnV0JIGTGzt
         ntVf1/+6stcFYFo39Cnvvt91NxB2tQr8WV3odiVsLm2Oyg0wtySA6jkkRuRe+NyExx7W
         ADxUx6IzP3zR5kxLVjtaCjxk6R8Ae3f6iXz5LOeqjLUApVdN/UZRRTsYN6XEsKbrt5/b
         jSKaoi8JLwlwU4v2Ja/tCNM4nosoAlHdr8SceUtuBUqKZBPWsNwz+JeVnC1nuoJqwGTc
         +GdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965836; x=1786570636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAnSIuF6PbdakwgCTzTcMBuLORa+n1bGMslJ+EeOoSI=;
        b=hf0RkTmjtbqZTWxmYnrt0MpFnBSClzRcBJHy0nwawubik7liv9m04pnCdFGQ6fHgOk
         K9KkaZCOltTbytdDUl1qBSOoHVSOL0T7U0WQ5tTStHRsQsY5SizGI2I4+P1I59xf6uYF
         Zf9Mq7XvEOVd5JQ7Ld4DeandZ3Zj8h+7FTOyWQdcy2Q6F5pVuvWeuP0Dh6sXEJfaS6I1
         VpWvrx2XL7LtGd37Q9atOxmYZstgqe9X2T1buVwXo/Zi8/L1b/UkH4jzh6Vq395J28B2
         +4Bqe1RCLT81F6afbjvXzmCOW9Re1mJ+K0y7zPLwpgPUBnJJ1nkawcnTupH0rKhP2w7S
         Sh+g==
X-Gm-Message-State: AOJu0Yw8QzMDJvZQyWV83qD3eWArg+alNcfXGE1QnYPMmbpmqIF4rBHT
	V5BHszyzF0qBNInCDk5ovqAE66uNp+Csry9lXHgCmFEEOx8eUtVbzfeIodm53w==
X-Gm-Gg: AR+sD110c/i9CMOkIcgapR6eFd52bUqfUQXVdinvctK5dyYmeeSuF2j9KyDAf1JjDoB
	6PZdSeib69qs98kaxYFWdnKDwr3+Cti6LBoeQDsphM+gMPz8id9kQza2gyQb+5+OO0ZUxgNw0wI
	R7ZP1hjvMdJB4zqpZLxXf9JN83tjNStTjdyJGvTUuD/+0adup9rgX853OhXeQjU1GvXisgvucgn
	M2njnPYAAjwUFyrW50ZxfIq7PXkJUxMrpZGoISfkmWspWxmhHVuESl3ZOvhrVrYtV1Bh2u/ICim
	niR0GuTAXvYfuAL5MGr9E4yxGi9j7xx2s8ocRDy9IYm3xUAzVBJ4v3HReMbRzI15rwwRciCqEhN
	6AyEmnwH0rAe/xc7gJnmq/RtHskrxbGezmUySGnCG8aZBqFOYkoS7nl1ealXmdZC00vM54psr7g
	i2CQV+4BuHTMd9tF+HD7VV+LLIM+wsRS3GUCHC7OG4ZW3FKTGf0hR4LIM4Ig1Tb+yoTVdb4FyHu
	g==
X-Received: by 2002:a05:6a21:329d:b0:3b2:8685:118b with SMTP id adf61e73a8af0-3cb85ea362fmr10126532637.20.1785965835856;
        Wed, 05 Aug 2026 14:37:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158644a195sm18339715eec.13.2026.08.05.14.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 14:37:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 5/5] python3-dateparser: upgrade 1.4.1 -> 1.4.2
Date: Thu,  6 Aug 2026 09:36:58 +1200
Message-ID: <20260805213658.2896903-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805213658.2896903-1-ankur.tyagi85@gmail.com>
References: <20260805213658.2896903-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 21:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128830

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/scrapinghub/dateparser/releases/tag/v1.4.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{python3-dateparser_1.4.1.bb => python3-dateparser_1.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.4.1.bb => python3-dateparser_1.4.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.4.1.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.4.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.4.2.bb
index 2602356207..6b52cec67c 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.4.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "f265df13c0380e2e07543ba74b67c0681aaa1096981ffcd35227e1aa0cb81c7c"
+SRC_URI[sha256sum] = "bed2a3fd9bad8f2fb2d72b57748bada260b3a9349a264c22ffc23c3249d7049a"
 
 inherit pypi python_setuptools_build_meta
 

