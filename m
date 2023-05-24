Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AD6C7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.3580.1684914792489919726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=pJYik2dO;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51408729f43so1403104a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914791; x=1687506791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v22ldQ3uisABuUSXIdPzmfzdWoRsqdqUvLS/dRyjBHo=;
        b=pJYik2dOS+ZlOn5BrhKlPFObiDiuKMbuHIXACzrMRJKd+igz1ZE9eYcDQW0GjpPSOr
         0PCE7eynIqkS4PSIsfpGYKFkQcjir09hJT7m2xwCUuA7GYFQEqILsr0U28/fJ3GaNtRB
         Sc3Zdhd0oYNuv/daeSfvB+gJESd3gMqziEthYPt2E0cKRxdOhoV8m24PvjwYXC9pQsaA
         2wUiBOwu+K/ODv0e1nAduHZeA4E2l8EPIP9agdLJF0ripURDlROidG3KiyVXUfU2+fZI
         RM92miDgzcWEtbNQiX0E8hwi4A8jF4ovRmUThz5m0jrpW7yVavO5CRZo9FSl9UIoI3xu
         s0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914791; x=1687506791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v22ldQ3uisABuUSXIdPzmfzdWoRsqdqUvLS/dRyjBHo=;
        b=h2FO7XfSRbetv4SV6L4qtrSd32cTs33IouoCWnpN/+v3x5jlQQdZ8rnYPi66WQbl9N
         +6e7/yF9dRNpoGHPoRWL4zj/9xXj5GJA/zfpwdpS1Aw4u/KB5jhV8EsGxVaZrH1QSAMR
         yWs8zTRgEV3Icm8JPT+olFSwGJUNaARBJh9s7b+9ChvNtIZTGqdcn/JffAwBo02hnv3g
         aSsCxG1nwOWAoXekEC4yPLxLV/fkirnIZeo+f0VCLIzlStAnN52ngYTDK9cSsC9NuprM
         gAVX5eHLNLOLowFhM0v8W4VnT2mKHFn0a81iThvV586nFPOLSYLIWJeva6D6eJqd1Mcv
         nw+A==
X-Gm-Message-State: AC+VfDw/yWzRIzTLF0eo7oMAIWzinCEynFwSsxXK65y+I4piWyXJ81L2
	1KGzHCCnaNz3zmji1SfmGD7ZG98xH6Y=
X-Google-Smtp-Source: ACHHUZ4ypgcgb8ojf8Tz/QK/695GFlsV2wnDhlJzFT7+TMruDP7zQiLDMHx+IkZBwbw74DwtV6oXrg==
X-Received: by 2002:a05:6402:1e88:b0:506:bbf8:5152 with SMTP id f8-20020a0564021e8800b00506bbf85152mr1657409edf.9.1684914790817;
        Wed, 24 May 2023 00:53:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s19-20020a056402015300b0050bc5acfcc0sm4714408edu.24.2023.05.24.00.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 14/20] libiio: remove unused patch file
Date: Wed, 24 May 2023 09:52:47 +0200
Message-Id: <20230524075253.1033593-14-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102768

* it was removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=998219d2e8179c8ca758da822b8dc17a1e3533b8

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...de-CheckCSourceCompiles-before-its-m.patch | 38 -------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libiio/libiio/0001-CMake-Move-include-CheckCSourceCompiles-before-its-m.patch

diff --git a/meta-oe/recipes-support/libiio/libiio/0001-CMake-Move-include-CheckCSourceCompiles-before-its-m.patch b/meta-oe/recipes-support/libiio/libiio/0001-CMake-Move-include-CheckCSourceCompiles-before-its-m.patch
deleted file mode 100644
index a2cfd47f18..0000000000
--- a/meta-oe/recipes-support/libiio/libiio/0001-CMake-Move-include-CheckCSourceCompiles-before-its-m.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 758ba58c81273d9075a539216f8a322935c2e434 Mon Sep 17 00:00:00 2001
-From: Paul Cercueil <paul@crapouillou.net>
-Date: Fri, 12 Nov 2021 16:49:21 +0000
-Subject: [PATCH] CMake: Move include(CheckCSourceCompiles) before its macros
- are used
-
-Move include(CheckCSourceCompiles) before any of the
-check_c_source_compiles() macros is called.
-
-This fixes a CMake error when compiling with WITH_NETWORK_GET_BUFFER
-disabled.
-
-Upstream-Status: Accepted [https://github.com/analogdevicesinc/libiio/commit/758ba58c81273d9075a539216f8a322935c2e434]
-
-Signed-off-by: Paul Cercueil <paul@crapouillou.net>
----
- CMakeLists.txt | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7437136c8210..05b4feff233b 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -296,9 +296,10 @@ if(WITH_NETWORK_BACKEND)
- 	endif()
- 
- 	if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
-+		include(CheckCSourceCompiles)
-+
- 		option(WITH_NETWORK_GET_BUFFER "Enable experimental zero-copy transfers" OFF)
- 		if (WITH_NETWORK_GET_BUFFER)
--			include(CheckCSourceCompiles)
- 			check_c_source_compiles("#define _GNU_SOURCE=1\n#include <fcntl.h>\nint main(void) { return O_TMPFILE; }"
- 				HAS_O_TMPFILE)
- 
--- 
-2.34.1
-
-- 
2.40.1


