Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEAAC55ABF
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 21:37:21 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6411.1785965832379499137
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 14:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XJz9EUaT;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d0407aedd6so17793365ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 14:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785965832; x=1786570632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0do0mSECBcJOA9Ei1PDgRbEF+QceOl+jQyqdpx0K9Q=;
        b=XJz9EUaTFcYS8V3AwAckhYtvX96yM3ng9ZOaPwgFVE6seplhCz8kH4Wh+UFuz6MO8w
         55Q57C6VYS+mb7UqXa4ZORSrT0CgHmJz7xUHjQlueoTiup1jvmSWh/F67eyFnglHs40x
         es63IVtzIVppCKpvD3NXQxw/EXLhw0JFbDq5cobcEyi8AnrPulULvVDWQrsYiPwpwEBk
         nJg2QzCOM8iNO75Mz+woxwU121w12FcluVwfXDscQpeNoL645PZe/h3MBbMcOjFnu9Tw
         Vi5ULRIRXrJZhzp0oQOth4jvt0wDEQem8D62My0YYHJuVPBjjZ1LnjbneTKtwTpWPar5
         /f3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965832; x=1786570632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P0do0mSECBcJOA9Ei1PDgRbEF+QceOl+jQyqdpx0K9Q=;
        b=epBxyvFRWZT/ER5wk310XRRgKKNMEBt2/iDVsYn6o+N5OfU7AezQZdZzxQhebocOiE
         B68MZT89tWixGyrt/GwPn4NCamhUD3ClhOEvgRkwXSvXUkiXB6v1ZHR1gRPzKzti4YMu
         mxg1/Effj0fOvBZIKqUAmRHoVtELff3IzwHqU8e2a4xns5HpyYVhRB1JzZcsfA46IvtP
         jQk+JP7RhNMHazDNeJ9/h8IeXRZXNjw/s7n7fASCUlQXlaV9RsxC2dvJPGCeVl3j2ScD
         McXQmmI82fzEaoxAYPeKD2qcjnocJlx5Uy8htR/P+wiT93fLmcDdH1VxG7PvyZPAQWSE
         u5sA==
X-Gm-Message-State: AOJu0YyE1/4vK+ajOMAfnuwaMOUjHqWrmezqmo9KfCDIzoT/Ji+IM8dk
	Ox5xHcH5WyjVN2Wt1taKG/mbt/Mi8MMdXKmZHRCiVG6gDs1Qi4laCgJBRAsxVA==
X-Gm-Gg: AR+sD12QFiuYx9GNeLdGltErleC0LLzlGSZCnfpR+FEC+vstMk1/qdnq+t4YKR/3/D6
	riURg9/Nv+W/XbPVo2WzKmqaqAy0PH0wJ1WxBg7IPtSnGZFKnKzMg2iZB2Y81LOltC69+FudZ7D
	DwoTF1AZJW4RjAWdqbQwLIiMWFPMohfd599gRbx488bTT4BbJDsCE/QfGIgyp0pRMUOJn8JDFWP
	vpBdfeLZIcWL5iGKn/TkcDLOagwoIX7XWOgTsXGAekHG9zlhWe8koIPZZMlJ4gRfg7pWvIbIzd6
	igubsUJx/o6xQVsB0fx/Dwq+bwX4RGLalb8E9yGIIst12aPHlY/nZwbr9xyn96JpaxERFkgG7PD
	kFeirv4XTGHrpiMhkd22A+FTmsUq71ZPibc54FatWTu34K78zEtx5nDfnjYtBMgTIs54B+jS6og
	b4+LZjnRLeFNBGl6f1/2+ImzOIw0ThE29u+HEi49wZEFB0TpRHlkim+dM8dgoL7D8r04GuEd75V
	fIUZWVPPsxV
X-Received: by 2002:a17:903:3848:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d0ca70da11mr120445285ad.8.1785965831708;
        Wed, 05 Aug 2026 14:37:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158644a195sm18339715eec.13.2026.08.05.14.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 14:37:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 3/5] python3-h2: upgrade 4.4.0 -> 4.4.1
Date: Thu,  6 Aug 2026 09:36:56 +1200
Message-ID: <20260805213658.2896903-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805213658.2896903-1-ankur.tyagi85@gmail.com>
References: <20260805213658.2896903-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 21:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128828

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/python-hyper/h2/blob/v4.4.1/CHANGELOG.rst

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python-h2/{python3-h2_4.4.0.bb => python3-h2_4.4.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python-h2/{python3-h2_4.4.0.bb => python3-h2_4.4.1.bb} (87%)

diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_4.4.0.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_4.4.1.bb
similarity index 87%
rename from meta-python/recipes-connectivity/python-h2/python3-h2_4.4.0.bb
rename to meta-python/recipes-connectivity/python-h2/python3-h2_4.4.1.bb
index 8766e2d558..0ae7e1a102 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_4.4.0.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_4.4.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aa3b9b4395563dd427be5f022ec321c1"
 
-SRC_URI[sha256sum] = "46b551bdcdc7e83cf5c04d0bf93badb8a939bd2287d9fee1abb23a445b9e0580"
+SRC_URI[sha256sum] = "4e866ffb1a869ae14dd9b5e6beb5c24a13da0495ad72b65925ded182521c1516"
 
 inherit ptest-python-pytest pypi python_setuptools_build_meta
 

