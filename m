Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B313C27C4F
	for <webhook@archiver.kernel.org>; Sat, 29 Jun 2024 14:24:10 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.6875.1719671032141904497
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jun 2024 07:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KUcoPt8P;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57d457357easo1898438a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Jun 2024 07:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719671030; x=1720275830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAb2UwKAOpHg/nfmDZ7rFXDTdEklkAQldNr2mcdGrHw=;
        b=KUcoPt8Phk7+wjX7UYON8W4fEgNOdUcv9sOU/VnJCBUuKYM/5Efm1cEf8tPSss1ZDY
         UKewjbs8BwSK1LJZ0bhy6lfWmyg+mmoxM2EusOPY5/uyKXBni8T99IStcxO6pMaQ1bqE
         uUvQgULwpkSwy393/kuXITnuLdlILOqBLkTax0Pf18xkrGGjxqghOOqHsvlHFLWxjePk
         NqLcBeY7nUxTlRim0+bY15t48WPWVsbXQV7lSR65dcByTnQn80dYV47gqzVVVm+FlGy4
         wNGZE2OmRLsluL/6egLrziK0AW/ffVAFat9euWTdMaAmLhN5BnEaMRix1odKas8qTmlu
         dmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719671030; x=1720275830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAb2UwKAOpHg/nfmDZ7rFXDTdEklkAQldNr2mcdGrHw=;
        b=EJCTDZcphkl1ed0x8aCjkvl8bvvlNPXtB0J13Yy+Bon+uytbe5n3K6l/C/k7q2V/yC
         /tm9SGOvHrgV8Tpzax4q0FhhLyykOUfXTl5jlbzIyRObXEkeLSYtn2IlBh+psCh7tZxo
         jFoNu/Ong8oEZuCF/M7hq3VdFfQEC6mKpzRjJENzLlSd93Q53slv+kRZ34+XVqsSx9nR
         FDyHHhoLMnP8X1haL1wRjwswV41lN0LZp1TkTZzlNy9ma+Q4XyfWlXG4AUxi5MZO4tji
         wOw+MOhPMUMnPjWN54B999udCTANTFX6lRFny0O+bXjilbFxe37sNgiaY1s0IMNZcI6B
         sQLg==
X-Gm-Message-State: AOJu0YzBynOPwT68itMz2lGMyFuYB+k+BxkQu+7nGbsU3SuGMumjbHPE
	RvP+DhWf2YQ1URepMvAoAo+NBlWF8o7Z1VpWMXWa72ajyzGx+4hWlC3/8A==
X-Google-Smtp-Source: AGHT+IGEsfbI4cx3u3ZHfE1nsZnAuLr4UQQ2EN0HAWcUcJXFaC5ZTXiKYiwwpwQmq39Qd+3VOPg84w==
X-Received: by 2002:a05:6402:13c5:b0:57c:c171:2fb4 with SMTP id 4fb4d7f45d1cf-587a0635d6cmr866845a12.30.1719671028875;
        Sat, 29 Jun 2024 07:23:48 -0700 (PDT)
Received: from control-center.home (164-12-20-31.ftth.glasoperator.nl. [31.20.12.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58613816614sm2275376a12.54.2024.06.29.07.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 07:23:48 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/2]  python3-bleak 0.21.1 -> 0.22.2
Date: Sat, 29 Jun 2024 14:23:06 +0000
Message-Id: <20240629142304.873527-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240629142304.873527-1-t.f.g.geelen@gmail.com>
References: <20240629142304.873527-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jun 2024 14:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111162

 Changes to the build:
- Drop python3-async-timeout which is only required for Python 3.10 and older.

Changelogs:
* https://github.com/hbldh/bleak/releases/tag/v0.22.2
* https://github.com/hbldh/bleak/releases/tag/v0.22.1
* https://github.com/hbldh/bleak/releases/tag/v0.22.0

Based on commit of Guðni Már Gilbert.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../{python3-bleak_0.21.1.bb => python3-bleak_0.22.2.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bleak_0.21.1.bb => python3-bleak_0.22.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb b/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
rename to meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
index 96f3fcbcf..bb1d7c2b1 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_0.22.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "054b092e19c7a45d5ea07d8948022f54117fe5e8"
+SRCREV = "c746071a3fcc3b5e69db6d6b23445ec3505d7730"
 PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop"
 
 inherit pypi python_poetry_core ptest
@@ -26,8 +26,7 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += " \
-	python3-core (>3.7) \
-	python3-async-timeout \
+	python3-core (>3.8) \
 	python3-dbus-fast \
 	python3-xml \
 "
-- 
2.34.1


