Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98D9C369A1
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 12:57:07 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.10216.1744462619212336169
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Apr 2025 05:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LpTSHicg;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2963dc379so470959566b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744462617; x=1745067417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8gM5+HKGQl3DKX/olb9TMjQ0VResTH2q24qfE8q+tM=;
        b=LpTSHicg0SK4NgoEl79DJe5Zpwc18tpFXKMb7KeErw4Q1Z0wup1ionv7yAmUv5qiuD
         /gp7I1QSNq4DGfgomhelCYgOJFExrcUJBzK7/c8/+qPVvoaGHQeVnn6DENB779gtVfD5
         pxGCcgx/pCYgYZnSptpjlppfMZmqG9NTlC/0u0S2/rW723Ve5fkONPFa5UkRjjua/Vwp
         4C0KoGUVbf5C0NeUXEuQtMwRfww9nx5SQnjIKIRSKoO8j2ngPI5Dw88EtpHht031xajB
         sh0ysx+WKsFm+tTfihgi/4kfdSfusdZ2x6jvmafgrPmWXdV5XESGzlYayHgHLiSxhH8I
         uRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744462617; x=1745067417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8gM5+HKGQl3DKX/olb9TMjQ0VResTH2q24qfE8q+tM=;
        b=TO5clF3I22f4dFEF7WEKhufrinOgsRFrtKPUS3OstLUQD1kFonGv5pwVaL6Tk1BVbr
         Due0uAkCjpEh/HRh3bdCIuhLgFt3+907sLYJukzGRpO8j/6bgQBbA5mjFQB8eZ5qQqt9
         wzIErKJoCZ1yJzoM7lX/vQDeVh3YEbGaXH4aDlf103SaUBJTbGa3r5WlRcj/uZ5IwZ6t
         8MHCofBE0nUyx0EUDiZP/x5RtWkNaiYTUK1j+54MsL6Fub1PJeVYVDZQkE5+7O9eaOZf
         ymo5QAdA8f6V6Int00K8NADpsYIStIR/PwAHY8BfYad5f2/Tpo2ParUOSmwMNHDgb2Gk
         hnyA==
X-Gm-Message-State: AOJu0Yz8Iv3FiM0kZro01FahXO5Ix7YI9/uzgJlX/3gE4b4k57o8XPrO
	p7D41dwitTy2eHMLcoxAyM4e2YRxrj+voaY/ug3uSrwrRhvFTj4dPKUl/Yiy
X-Gm-Gg: ASbGncs8eRAaz/PhOgTTU0lYke2beE+uuF37ctnqlphPqKxQZw9BYszPprwoR/6TDma
	EOxhfvh/jrjiw9f46j7ZPMYLEyslOiDWgiuCLsm23hTdszn5fYyooSxZRkyx2oqLR25KMSl2k4n
	0SemtzoCTgp4zNrM901F8MuuPY4HYCi5ZTjQ0LPfZp2ZzedZMYVFQiRMsITHu3KoKlF7DwKq4fR
	qHwfNZxZm548yCr2QaPpx8y4lm6sEejDNzNWDl6mXs5muN/30slGW26c8RJFLpufp0fbJkM+jTJ
	GnVmCHRnBVRcrTSMPLJa5T616HIMgG62F3JwDQlD76P+NIjxIRRPY9EVBm6gTTBnMq1EfZXI0Q=
	=
X-Google-Smtp-Source: AGHT+IEPW0bRa6RUO41Dh52aiH4gUKjgs/Ctj0Q9RkMVcgXjHjkMLE63ZkCZyBM/3tbWtgpegWU2Ag==
X-Received: by 2002:a17:906:f586:b0:ac3:8d34:1d73 with SMTP id a640c23a62f3a-acad343cademr427833466b.8.1744462617237;
        Sat, 12 Apr 2025 05:56:57 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acaa1bb3d9csm596485666b.25.2025.04.12.05.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 05:56:56 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][walnascar][PATCH] cmatrix: Improve reproducibility patch to handle libdir!=/usr/lib
Date: Sat, 12 Apr 2025 14:56:52 +0200
Message-ID: <20250412125652.75604-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 12:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116812

From: Yoann Congal <yoann.congal@smile.fr>

The upstream code basically hard-code libdir to /usr/lib. This was
hidden by the upstream non-reproducible path existence check.

Improve the reproducibility patch to use the cmake variables derived
from $libdir and $datadir :
CMAKE_INSTALL_LIBDIR and CMAKE_INSTALL_DATAROOTDIR.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reported-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
  

