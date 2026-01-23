Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6035AD72365
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 09:42:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64437.1769161330312267305
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 01:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=htOvY8ox;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee0291921so16655455e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 01:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769161328; x=1769766128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yu0je6BgQkKW3eWJF8S3cbtnexfNgr24ySgcYbTA54E=;
        b=htOvY8oxe/OLPsZq9qJptr3vlgfBWbPBzzb8YDivJIoe7Ub60weJVmUD6CDf1sNxNo
         HSHd0YDlyqjEa+0I7hgJ8zQl3IC5pJg/31c2H0LQHttGQckHotoiyuyIheAsu0OQorOz
         KR4tj+VxrbPUkoRwZXg3J71gQmpZYEJkw7u58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161328; x=1769766128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yu0je6BgQkKW3eWJF8S3cbtnexfNgr24ySgcYbTA54E=;
        b=WO6jLVxhaU9mDw/LJiwJXGV1bfARtrJpYuLwuj0vsAO+7lveVpBvujlBMEcRnUg94b
         3I0cT5b1+91fkLf7Xk0Sr3Qxgx2m0FJjKovY4dqJKWpXimzWWpEBcPC+3qj5s8wR7+mD
         UvRLo4ZwJ/Yn6kSnzC0zGX5zwtrT3GoV9DbJIwn+x/OyeEp04gj8CFSjwmKFFhefVbyf
         thG97wGbq9aSVECfXpOkDIdo6O4j182q519FHZgpguXqj91c/Z327SGlG453OfTOXy9+
         XHAGKKw36vPGf0tTHZgFztlJJJK2FWz+BRJ1m5INtpVVy2JjEEjjzTziboQfqR+i6kWo
         Phvw==
X-Gm-Message-State: AOJu0Yy1GQzLv8cF+zUUfvGoT5yrgr6caxxysAattLhctBB9Ndg5Qhmn
	SEUJPXlNyCIAzKWxiZIPz5qdi2WTL339brh8JxJ1/L28Gt2Llk3CrqxJiBU58DkDJKKOHd93/uG
	q3Mgf
X-Gm-Gg: AZuq6aIOnpe/pv6pzKVZ+xoOS4vzzNvETcJTZ2PrBKX0im0CV1sUJki9XAq5txRhCjn
	DTmdt/2e7o1FiBWIzELQMDxCBeeqG9F/FMUZTzQXG/XM0GSj1/XKQ/PoA8vE7WHiJ6Awr3viGXh
	oRNrNGAnHTY4f9Ks+GxvEwazZpWINsJD6Q1jbb70Avkx2YNQ1nXRR5jma+Derxli2zjhiiOolEB
	PSvmM0IHQ2+vL+ZlpBPJT2yOHJ7PeVC35iUjey4W2nMsApTU+Zm3RB7jGx5p2g9ivF5fF9tEGnW
	5CHnodqj53OdDHfrn18wjJt6+eMJDxBMNq5HvjBUKgV8APC7PM10iIGDUOfTdiX+mlomQQkZytp
	+9Vc5y89iOjvF0tDq9kJ75AQ8OJ9rNjeNDu34hB4lrLMOfHPp22jC8AUvgXKUq41FmAG7Yh3ajc
	/CUDibktePPAERaQzeh5zI5rwh
X-Received: by 2002:a05:600c:620f:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-4804c8e4e59mr36614975e9.0.1769161328393;
        Fri, 23 Jan 2026 01:42:08 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbc9d0esm16135575e9.16.2026.01.23.01.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:42:07 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-reportlab: Upgrade 4.4.5 -> 4.4.9
Date: Fri, 23 Jan 2026 11:42:03 +0200
Message-ID: <20260123094205.3303453-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123776

Upgrade to release 4.4.9:

- Remove unwanted debug

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-reportlab_4.4.5.bb => python3-reportlab_4.4.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-reportlab_4.4.5.bb => python3-reportlab_4.4.9.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb b/meta-python/recipes-devtools/python/python3-reportlab_4.4.9.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb
rename to meta-python/recipes-devtools/python/python3-reportlab_4.4.9.bb
index 6386f5c3b1..bd8f33dd0a 100644
--- a/meta-python/recipes-devtools/python/python3-reportlab_4.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-reportlab_4.4.9.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "An Open Source Python library for generating PDFs and graphics."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf24392f451ff6710fca1e96cefa0424"
 
-SRC_URI[sha256sum] = "0457d642aa76df7b36b0235349904c58d8f9c606a872456ed04436aafadc1510"
+SRC_URI[sha256sum] = "7cf487764294ee791a4781f5a157bebce262a666ae4bbb87786760a9676c9378"
 
 CVE_PRODUCT = "reportlab"
 CVE_STATUS[CVE-2020-28463] = "fixed-version: has been fixed since 3.5.55"
-- 
2.47.3


