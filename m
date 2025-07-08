Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296F5C83F10
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:59 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.5759.1752004674679614697
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gGZCRkvG;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b584ac96so4667595e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004672; x=1752609472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQP9iOrdXEAPKkJhoH9KkkIiZFgjF7FuGzblMJG151o=;
        b=gGZCRkvGhvYUXhufXGJGjyJy+A9ibDxzxG7PuIVwtGv27C427bvj/xQdoABSItmxF5
         kBB4iuuN2tKmsh8ouN+x6P6QqKJWDePWmI3/S/ck2ROUi/Pqo331rkHLW99StbNIiuEG
         uI+9i2kC/6SKTj+5G5xSkUM1zvrP2Vb3tyDzuOMG+7jbZhiUAXmph9Deot/7s7f6Uvq4
         rwOdyDqkE69D7rcURxRBjHiz/TIcGS6BcR5f4Jrn0eTmYAs8M4jXTv32tBEvxqJnY6+l
         MGlIZY1+IRpEciGlLvd1DlhtKqySgO2e5G2hfoyyyyFi5Ti367VMqxqmd0OvQDSWjlrn
         ZPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004672; x=1752609472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQP9iOrdXEAPKkJhoH9KkkIiZFgjF7FuGzblMJG151o=;
        b=X2OTplOpGH+IMjKNGii6wzZukUOV40EvQlJc/vsAys9kS6Lurx+5rsfsm0G6v2v36R
         gwpLfTjbFQUqv7GK/u6aCLYIeTokPqXRXmcT5IlxU3w0Ghk2EFkBCehF5ih9hpRMs2N4
         OJrqrdAuPpql/Hl32of7oWxh0y0nxpOPiCF+ggVm6uqqz20VlshjeMipeSGNfQTI38hm
         PYdmngyQhBFeuP86M0TLkS23ldN6IaF5PaQUfMO4g2PQ+q/OF99pSF0XEc8Zw8YYrmEf
         3xuywaVUMs6kQWjVaGjAHd4XNabWqZONxagNZToyPXjvnXjVG+nzueoOkj5PpGqIvkit
         TzlA==
X-Gm-Message-State: AOJu0YzBWuvqNvRwK13qTSKba/n/CuM8Kh/ZuxmRPweKozMGCoTb0dv4
	lo3kwlHzhQD0XiklznBlki0GBUfE+X2at7IELWRRP4Ntd/OLJNMX/N2xutix6Q==
X-Gm-Gg: ASbGncs8As9+hFTBZ4tkmas4K1XIHQ3s5mjr57iL1Hb7WEI3fLiVasDWM0oRnWXuSFI
	3GFb83AdrkjyWyCvpW6/H2vMyb0JW5vWt6jT73x8OnFBb22DP9iS4jIObQgyxqzun2jEe14p0bj
	ihoicWFSIf9MHzCKeP/pgE2RISVWC9NP+UDD+R8vYUUkEyaPeEJUgg38rsb5Y26k+7qs0F7qc3D
	Yevf14C8VKDc/P1AsIvsLLiG7eUdQjtq1Z37oC3sJfijzi+2aDp1eCSnOVOXvCr23/J5YB4JmNS
	nGrenQi2Eyqa5/aUlOo2z7Txa1i2T85FTcGjvGbRLcSo7kfEzM1/ARflTgTWqMuQwY4LY6JEM6V
	6cDs=
X-Google-Smtp-Source: AGHT+IFx9R8CS/oboH/Xj5emN5w1CZUds7f3YK0u2PIDi5ntCeDmVKEkeLu/xc6EYkZ/cipNvhT+1A==
X-Received: by 2002:a05:6512:1194:b0:553:affd:948d with SMTP id 2adb3069b0e04-558fa87754bmr5245e87.12.1752004672197;
        Tue, 08 Jul 2025 12:57:52 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:51 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 20/20] gammu: Add patch for CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:36 +0300
Message-ID: <20250708195636.1678606-20-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118342

Fix:

| CMake Error at CMakeLists.txt:5 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../gammu/0001-allow-build-with-cmake-4.patch | 43 +++++++++++++++++++
 .../gammu/gammu_1.42.0.bb                     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/gammu/gammu/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-connectivity/gammu/gammu/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-connectivity/gammu/gammu/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..5ab63b809f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gammu/gammu/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,43 @@
+From ea068ac152b9b375be51611ca04d0f833e2f6856 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Tue, 8 Jul 2025 22:52:11 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:5 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Pending
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d0a79b3..23dba35 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ # Copyright (c) 2007 - 2018 Michal Cihar
+ # vim: expandtab sw=4 ts=4 sts=4:
+ 
+-cmake_minimum_required (VERSION 3.0)
++cmake_minimum_required (VERSION 3.5)
+ INCLUDE (CMakeForceCompiler)
+ 
+ project (Gammu C)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb b/meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb
index e6ec9c3573..353ee37f46 100644
--- a/meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb
+++ b/meta-oe/recipes-connectivity/gammu/gammu_1.42.0.bb
@@ -7,6 +7,7 @@ HOMEPAGE = "https://wammu.eu/"
 SRC_URI = "https://dl.cihar.com/${BPN}/releases/${BP}.tar.xz \
     file://gammurc \
     file://gammu-smsdrc \
+    file://0001-allow-build-with-cmake-4.patch \
 "
 
 SRC_URI[sha256sum] = "d8f152314d7e4d3d643610d742845e0a016ce97c234ad4b1151574e1b09651ee"
-- 
2.43.0


