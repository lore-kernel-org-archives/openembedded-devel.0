Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01896C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 21:51:34 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.38132.1744408283249937559
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Apr 2025 14:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cuUaOpmi;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so24943045e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 14:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744408281; x=1745013081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tK+7478nvqvzj6IxpC4tKkO0uxOClf+fU9vfSdSRwDk=;
        b=cuUaOpmic+Pu1zKJCv4g1DGND77zvn6kr3lTilMXroyCiWH+HIq77kku1QWFK1sRm9
         vEenxOsRbEP3B1TfxiSACPfSJtTHilgfkXLoaLpU56xJmZ3SwEOQ2Kxmkf7tk+xMlEAA
         w8qPke8T/QpQGnEI38J7pLpGFPVSpttWhhuns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744408281; x=1745013081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tK+7478nvqvzj6IxpC4tKkO0uxOClf+fU9vfSdSRwDk=;
        b=G1PijxzvySYZjokGB7uty/Nj8GCMfYHSTerRm2/h+mLg9DgQf4UdCeIkuje6yxfb3P
         YQF/vcMNRpYtXLB94tCmxt7ZpvWpZBvVPoldSq9Tl+pycFUK7Dm5YrIGfS/IX2ihd7e+
         tzVAhohZazCWMuxRllgbGJ8PekbSIkdQYdROoPOdAL3vWitHMwN6Y59gEtsVLOfCabni
         D5UkV0edqcZrdYw5TMv98IUlhaj1cv9uKcPBMB0rbxtHPbCA7zV/NSKzXtTuZwJkPKtz
         /wADVpkmNmRYR6kdNLfFoiZHCnCJUUB1zCoZcMDiLMX/pSFt8vNq0BLNNrWW+3tyh/7n
         gF5w==
X-Gm-Message-State: AOJu0Yy7TG0rMwxFwK2rOKKEsMFsFeUdOhvWnbiVCHXlhstGIhYpMc4k
	tp3uxbkoeAV8b9gcZkGDN9n5ogMRv1YpY1AIXU+GRVfzFhCXFABQJwvbH/PqQkO1O5V4FsGYbLu
	EOCg=
X-Gm-Gg: ASbGncsCf1KsAt2pSMMAOVX1vNisFBx4jw3V6/1+GESZS9WbPS0C94xoirwabYratLw
	wSxvOGybzQV6cLsNcL5OtrcDAL5opRSXZMXrVGDCYBcXKAELBexJuv5glCOXwKdJY+9ZbuB7gEp
	eZFhaQiJH5YvIYNMFlJ5L32cs2JtmQmL6pXCPE4eowly3aYkcnf8E8eHFX5JeSGShE2tU3pbG4l
	DKk8OzUTH3aUPuhzaGB3ptjfLoNI2tfGcPfOqSG1MtnvcIUjxwF21rnFwdSdU7HJlYdg/Pznp7x
	AgrLb0qowWQW9aI3JdnfB3cV5hbvjMgDQ44Rw/LvFFVGfStQAX9IQGNGyQYjFeFQ5sS3lHwNxDY
	zO76+mZlmSJ1HLPlvq+fy4wwB0YjcJk2SzYJsD7z5j2/NH3k=
X-Google-Smtp-Source: AGHT+IGtod7XQx6WLhSlzOO0A68Mvmn+OhCCPDARzLAfl2sJghc5fOcp1AuVVktxJeqoWK/EilIceg==
X-Received: by 2002:a05:6000:4021:b0:391:98b:e5b3 with SMTP id ffacd0b85a97d-39e6e49f88emr4267811f8f.14.1744408280717;
        Fri, 11 Apr 2025 14:51:20 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb000deef000f69feea6ce10f21b.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:f69f:eea6:ce10:f21b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979835sm3254830f8f.57.2025.04.11.14.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 14:51:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] cmatrix: Improve reproducibility patch to handle libdir!=/usr/lib
Date: Fri, 11 Apr 2025 23:51:04 +0200
Message-Id: <20250411215104.2100375-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 21:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116799

From: Yoann Congal <yoann.congal@smile.fr>

The upstream code basically hard-code libdir to /usr/lib. This was
hidden by the upstream non-reproducible path existence check.

Improve the reproducibility patch to use the cmake variables derived
from $libdir and $datadir :
CMAKE_INSTALL_LIBDIR and CMAKE_INSTALL_DATAROOTDIR.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reported-by: Martin Jansa <martin.jansa@gmail.com>
---
Tested by building cmatrix/lib32-cmatrix where multilib lib32 uses /usr/lib32/
---
 ...oducibility-Prevent-configuration-from-reading-h.patch | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibility-Prevent-configuration-from-reading-h.patch b/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibility-Prevent-configuration-from-reading-h.patch
index 5f23252605..1353728dd5 100644
--- a/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibility-Prevent-configuration-from-reading-h.patch
+++ b/meta-oe/recipes-extended/cmatrix/cmatrix/0001-reproducibility-Prevent-configuration-from-reading-h.patch
@@ -1,4 +1,4 @@
-From f0a48c4e42819604063e6eacb7cdb4fa22331c77 Mon Sep 17 00:00:00 2001
+From 0a49ed8e949adda11c6268f36a10ac12074cd377 Mon Sep 17 00:00:00 2001
 From: Yoann Congal <yoann.congal@smile.fr>
 Date: Tue, 1 Apr 2025 23:42:39 +0200
 Subject: [PATCH] reproducibility: Prevent configuration from reading host
@@ -17,7 +17,7 @@ Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c5548b3..c9af31c 100644
+index c5548b3..a2f8b4d 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -7,8 +7,8 @@ set(VERSION "2.0")
@@ -26,8 +26,8 @@ index c5548b3..c9af31c 100644
  # which by default is "/usr/local"
 -set(CONSOLE_FONTS_DIRS "share/consolefonts" "lib/kbd/consolefonts")
 -set(X_FONTS_DIRS "lib/X11/fonts/misc" "X11R6/lib/X11/fonts/misc" "share/fonts/X11/misc")
-+set(CONSOLE_FONTS_DIRS "share/consolefonts")
-+set(X_FONTS_DIRS "lib/X11/fonts/misc" "share/fonts/X11/misc")
++set(CONSOLE_FONTS_DIRS "${CMAKE_INSTALL_DATAROOTDIR}/consolefonts")
++set(X_FONTS_DIRS "${CMAKE_INSTALL_LIBDIR}/X11/fonts/misc" "${CMAKE_INSTALL_DATAROOTDIR}/fonts/X11/misc")
  
  set(MKFONTDIR "/usr/bin/mkfontdir")
  

