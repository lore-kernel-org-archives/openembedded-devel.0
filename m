Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23A0E6918D
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 19:01:37 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.32259.1732302095982836685
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 11:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JC/CJdEx;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7f71f2b136eso2072800a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 11:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732302095; x=1732906895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oRGj40YwsAxu5pdjOWLjlzcrREoXDHvXUcpMip8Lnc=;
        b=JC/CJdExW9USy/++98fs1IcSwr2QO8bPUOCH7khCVqWAgLcWPD68bmZDdsT5MSwRQR
         BdIQ7ZJ7ueUjA6JiNzP8ZrLOXOblZxarueg1A5cQ33Jco6ajbOC4JvJy07v2ACgrdg/j
         5yswvbaqBZbnPFlvbiRRy6JUt2iFX+k4bLfACIW2KtuMMPuOzMFjRYTNhE3n9tE7zS/B
         Vh+Pq9c4PEYqJEPgLZDFnVWpH0yFANO21r++biTrKKk3HWsxjpsY/N9x5AILr9m04sXG
         PP9386c7Lmn9EnwQ6VKsKj//ZMpa7kiv7fv4HmnaKXc/oHVm3AteV50u43IgZo7BVzoq
         KCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732302095; x=1732906895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oRGj40YwsAxu5pdjOWLjlzcrREoXDHvXUcpMip8Lnc=;
        b=B4+DpfAXAwoGxKlOMsIAN7auGorVTa0881xlNO28v+a1YUj8OakncR/FT7FN0VFhfq
         2N29XtDEn/QHk0PCdX+ReZvae45X/T4MBxQT4Bts6Zg54H5RaO5bXzV7HZkfFDOF3D0z
         P5bLVfiXiQw/kWsIYa7ZVzg8WQ24LjMTEGYE0cmB3HCkTir44Yst6K35fr0v8Ty8TYd5
         xbfmxXwFAL9K/JGBta7WeHoHSmwJF7WFFcNyM78ncIPok80/1EzHRvqHIhyX0w5kzSw2
         UfeSIFZBuAPaP3locP99Is0tsTxF6IS4WWs9VyGMUW5IfFcjsl2Fpmo7JhG06xIm+XsY
         RPzg==
X-Gm-Message-State: AOJu0YzDRhhaL0qpuHZAt1b742f/6feoR0+lAzMbFGCU0TbaZtk8pVaC
	xNTQr1iRjsBiHKWryEGl+rLhXAS9l30sgzDMBzjK5lzbUJcIgvocz08aQw==
X-Gm-Gg: ASbGnctX0KxatL1SWz8+UwKcpGsBnJ5WExa6AvHCIfsfHE3LOuV/gHOz8Tn/bd5/Egi
	wqNvOsXJkjwZui0GX67YWw5X/BfeTW61jNv8+3dX1yWMEGsQ++78d85L2hYOaNAklvr0QL7owWU
	G0ELcLkBfr1vUZgyFxVuH2wPl3jrAaEjzs6lbP/Q84A78HGvFXUQQpBY+FqzFH8dgeIRasswmPZ
	N2Ue667DJkbE0ZbyymDqiFw0/9U67Qpl1xUQ5U6qWxfujZmEEU=
X-Google-Smtp-Source: AGHT+IH1GS9YeQrrhgg5+nv4gb5errcooDU4gPwElUqnk+m6SNHsytmDiJAwKHertVEL6g4KEkJxeg==
X-Received: by 2002:a17:90b:3502:b0:2ea:4578:46d5 with SMTP id 98e67ed59e1d1-2eb0e526edemr4239326a91.21.1732302094986;
        Fri, 22 Nov 2024 11:01:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead04d2cf6sm5500166a91.37.2024.11.22.11.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 11:01:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] taisei: Fix build with musl
Date: Fri, 22 Nov 2024 11:01:29 -0800
Message-ID: <20241122190131.2810521-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122190131.2810521-1-raj.khem@gmail.com>
References: <20241122190131.2810521-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 19:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114007

This patch fixed issue on glibc but regressed on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...armful-Use-overloadable-func-attribu.patch | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-util-consideredharmful-Use-overloadable-func-attribu.patch b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-util-consideredharmful-Use-overloadable-func-attribu.patch
index d1af07416d..09f4be300c 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-util-consideredharmful-Use-overloadable-func-attribu.patch
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-util-consideredharmful-Use-overloadable-func-attribu.patch
@@ -20,21 +20,39 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/util/consideredharmful.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/util/consideredharmful.h b/src/util/consideredharmful.h
-index 3fe1f047..c6771956 100644
 --- a/src/util/consideredharmful.h
 +++ b/src/util/consideredharmful.h
-@@ -30,11 +30,11 @@ FILE* fopen();
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ #include "taisei.h"
++#include "util/compat.h"
+ 
+ #include <stdio.h>
+ 
+@@ -24,17 +25,23 @@ PRAGMA(GCC diagnostic ignored "-Wstrict-
+ // clang generates lots of these warnings with _FORTIFY_SOURCE
+ PRAGMA(GCC diagnostic ignored "-Wignored-attributes")
+ 
++#ifdef __GLIBC__
++#define OVERLOADABLE __attribute__((overloadable))
++#else
++#define OVERLOADABLE
++#endif
++
+ #undef fopen
+ attr_deprecated("Use vfs_open or SDL_RWFromFile instead")
+ FILE* fopen();
  
  #undef strncat
  attr_deprecated("This function likely doesn't do what you expect, use strlcat")
 -char* strncat();
-+char* __attribute__((overloadable)) strncat();
++char* OVERLOADABLE strncat();
  
  #undef strncpy
  attr_deprecated("This function likely doesn't do what you expect, use strlcpy")
 -char* strncpy();
-+char* __attribute__((overloadable)) strncpy();
++char* OVERLOADABLE strncpy();
  
  #undef errx
  attr_deprecated("Use log_fatal instead")

