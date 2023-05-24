Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26F7C7EE33
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.3702.1684914788700040543
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ca6fAc5K;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-96f53c06babso102337266b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914787; x=1687506787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=We+mFuwJZaslrs8yIwLB3+XjynQq8gx89uZxORZpuFQ=;
        b=ca6fAc5KjbUOBXgt3xApewteFtWfpFtjwwTzRHwU+j9tTojcJNpZRdNl3o9/PUAfLW
         9VG9oKahqoChkeGZNatj2DZUrAb8/zDpnEizo4evAXUrPlczhWubQtve3RMunOP6nt8I
         rqeYgjPabjbp98gc1y/RHn8RQ2EfIq0Jg/ii/ANsyzKMx210bj0ChlSPvGUZYdLGMzEB
         ORyVRTBvEuRRBpM3mtLiqPmCBKK8LI19JAvqVB2jbdO8bgTOZ+FQaxM9Ycfaz+7smPmS
         QICCQdhKxQY/s5Ojm22W4M/H1LXmc4kN4zHJlf7ohS8EjhnseZT2a9U2dEjJbuRym1y7
         OEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914787; x=1687506787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=We+mFuwJZaslrs8yIwLB3+XjynQq8gx89uZxORZpuFQ=;
        b=N8I+gZrrY+pb0BXIuEnqfZX5no7Jh0rqyc4ttbm9hurrinEr+34MGRh2WVZYfNXW9l
         uwIv1O18dEY6ykiatItx0uTsZqDWzP+12asaj+l5LKEIWgd+3e4s6+CBHIfhB9Y1rEdV
         LzpQDe20R5ElTzhWUZ6Ln7CGmVLp2cAdThMbvCQnmWwfY+UeKuSl40sV/J3sdOjanjrW
         7LQ15ITqJEOSyvIXyMVu8HmqGufqDGFPMAhtM57w0J1+CfgcTeebr6eT4v7VzKkxprn/
         DF+V09FVULJZ04XIndeckUyGIlOsFbriPMCTyPnvRk0XWo4UGBjuxAWxCpmRgqTq4wH1
         xMVA==
X-Gm-Message-State: AC+VfDxgcs9Y83yhdJtJ0pL3QOqNwXyerqm+G1trIgUVqfrAEwPqFiXt
	lZJy2uFNeWvjltBRC31pkHEO6xYtFYo=
X-Google-Smtp-Source: ACHHUZ46rN3CQQCThLBXbmqVPZUL5rLWdJCPohcUZsZwTAPyrkSwL3NCPHv+G0Tr47uSQHxfgOgyEA==
X-Received: by 2002:a17:906:9b8b:b0:961:be96:b0e6 with SMTP id dd11-20020a1709069b8b00b00961be96b0e6mr17068525ejc.68.1684914787164;
        Wed, 24 May 2023 00:53:07 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z14-20020a170906240e00b00966056bd4f4sm5388744eja.28.2023.05.24.00.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/20] soci: remove unused soci_libdir.patch
Date: Wed, 24 May 2023 09:52:42 +0200
Message-Id: <20230524075253.1033593-9-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102763

* it was removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=01cd7fcae16edde709d24f905a222dcaea8fb0a1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-dbs/soci/soci/soci_libdir.patch   | 28 -------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/soci/soci/soci_libdir.patch

diff --git a/meta-oe/recipes-dbs/soci/soci/soci_libdir.patch b/meta-oe/recipes-dbs/soci/soci/soci_libdir.patch
deleted file mode 100644
index 00a1a5c862..0000000000
--- a/meta-oe/recipes-dbs/soci/soci/soci_libdir.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Define SOCI_LIBDIR only if its not passed via environemnt. In OE we
-want to set it per our choice since we use 'lib' for 64bit unless we
-are using multilib
-
--Khem
-
-Index: soci-3.2.2/CMakeLists.txt
-===================================================================
---- soci-3.2.2.orig/CMakeLists.txt
-+++ soci-3.2.2/CMakeLists.txt
-@@ -69,11 +69,12 @@ include(SociDependencies)
- ###############################################################################
- # Installation
- ###############################################################################
--
--if(APPLE OR CMAKE_SIZEOF_VOID_P EQUAL 4)
--  set(SOCI_LIBDIR "lib")
--else()
--  set(SOCI_LIBDIR "lib64")
-+if(NOT DEFINED SOCI_LIBDIR)
-+  if(APPLE OR CMAKE_SIZEOF_VOID_P EQUAL 4)
-+    set(SOCI_LIBDIR "lib")
-+  else()
-+    set(SOCI_LIBDIR "lib")
-+  endif()
- endif()
- 
- set(BINDIR "bin" CACHE PATH "The directory to install binaries into.")
-- 
2.40.1


