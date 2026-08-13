Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D29C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:20 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28147.1786651812990886813
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pBo5vFbr;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso120296a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651812; x=1787256612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6paNJ5pf7GvK6F/cT3WxxHz5aw/G2AJe4ONpkh2fRWU=;
        b=pBo5vFbrRMe78jwscU+k+ehpYlNh5bonaWTDqoCV+bTuGNZazZONSnZz2DRJVQMq1C
         CW9USebIfR52P2Bsjgz4m4V+IpN7eTQiwJIj3g/ApsU0sJIsDyAcEZ1BXuEF/hFfniQ/
         1PfDAm+2W8owWhn8vRCCYJcSNE0qnqzW8DoXtj7m6K/a+mcQEFd9i13sL4DgguSpUIEf
         R9APQoq0FM18yEF4PSSMmDrjBUk/dBE7MMB767NbPYqFVwAU9bsa+Dvx/C9yzlaZh9t6
         2Kus+SMzDdbyTH5OdzSV1qnyqmKUVJAm6rATNQ4JFxhXyWiwviFfI1lLyzwhdK+b1QZ2
         fzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651812; x=1787256612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6paNJ5pf7GvK6F/cT3WxxHz5aw/G2AJe4ONpkh2fRWU=;
        b=AtaLVQcLHzjEk+iAS6v5EP1inrMYobuCxyy+exbh+GxsVDkg6eX2aGAkYmlWA4Cyj7
         o3VOYSEyb5r6TM24Rl6lXEWKTRgF6f96qm4fzc4EuBS8dGyqj/KUoFby6RpDmHnKyJ5F
         wMUAhspV0ELJdrEcIAlDWe9q2m1aMxaVKRRlLf5t9UAxNBMvzb3238VzHNHcCS4BB1NO
         VnN2yVBcBUtQStarPixexi3zFGCJ4Fy2C7gyGrzt/fWMAl/NYlVF4uE8Reyt4/1Y6s4a
         o8AhoHhQfR6l5NK4fQ496HtrKVHpwKqG7E+0AF8YNiDVQ6vyOdOgbGOckQ7NO3+keXBn
         kQYQ==
X-Gm-Message-State: AOJu0YwlxvV37MFPDBhowesFXcSxy5YdnZv+lFSXQJOhU2cNqbOjt1qW
	KnVU88vfpA4SjreJegzydrWYhgsvixdCP9GBWssTg7eqfNKTQlbKbuF3di3f/Quw
X-Gm-Gg: AR+sD10fL2kZJbDedWY09RP4CkQNbQcjQ7F+77LG1lJVbBX5hCJK8DFgn2htoyWn6wO
	hwfsZ2HQTQ/QqnCC/I0sV24s8n1DzQdofYdEWRheA5HgTm0h56IcmJNJ7PWw1U+ks4ezkvBK0xe
	1PI+JTvNjIavnOutnFOBDeEoOuhrmY918dOrXw04/tLIcIHczZeXEsf7QsV5nBBsj31S+mCuQXc
	N2awVG9X02/Th7UxkkACnQd8oOglzaCv6gjw+cS7jS6rDXumKrlAT806vlcP5Dj/XHA63T3uQAD
	FxD62/NjWSxFDQPnDiLosFxXVYl/6bzqz8A+epB0Jl/mvgkzTIEc+aTe1IXZJciZA3be2nmKMnP
	zqBgzvPGte1S60YjANmhGXnZUMdMVlYSwaE3QDFusF+h4/utQH73NT3BoM1VR8DX7nXgXypetpy
	H9E8DNxd1BZyvj7ALWEPyNxu9gEgDNw/w1LuakahrKQ1xwYIAVNpX0ZTkCmxcev2Xl2mlqlMKN5
	k/V2kZDbEBxTwXfE7eUKV13Lwmvt6FRcPMzmfnB/u/T3RmI7e59+E5Y/D/SNANEwkhoWmZmNMUB
	Sfq83LAjcRqnYhIMJdWL+fks2lxCWOOF2b9BXr4TarWefwkH9Aq7XSqZu5iGgci6/2Pbv9CJtQu
	+iEBfbrgYw8JVxirbTlChZJqz/NK26B7sF6ZzXAcf5YXcCw==
X-Received: by 2002:a05:6a21:178a:b0:3bf:a489:1483 with SMTP id adf61e73a8af0-3cc71d55fa5mr329552637.33.1786651812283;
        Thu, 13 Aug 2026 13:10:12 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 52/80] python3-pycocotools: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:06 -0700
Message-ID: <20260813200834.1302829-52-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128996

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-pycocotools_2.0.8.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
index e298dbf574..c887514efc 100644
--- a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
@@ -9,5 +9,5 @@ SRC_URI += "file://0001-downgrade-numpy-version-to-1.26.4.patch"
 
 SRC_URI[sha256sum] = "8f2bcedb786ba26c367a3680f9c4eb5b2ad9dccb2b34eaeb205e0a021e1dfb8d"
 
-DEPENDS = "python3-numpy-native virtual/crypt"
+DEPENDS = "python3-numpy-native virtual/crypt python3-wheel-native"
 RDEPENDS:${PN} = "python3-matplotlib python3-pillow python3-profile"

