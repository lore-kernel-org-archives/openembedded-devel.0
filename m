Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F3BC64EC3
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 01:52:10 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.2806.1675129925554630094
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jan 2023 17:52:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hmb7pn+A;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id b5so6335764plz.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 17:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNlyTgkXOTyOHNaNDiRIaQsnpuM6WdXqqyCyWZp3wtQ=;
        b=Hmb7pn+AgOxOmrolRe+YURQntFtQRwQx1GQWGuimJn0U/BmjinGPtQEk66Xw1WJW8O
         bTXHfzAvOGvk8R5i0/cyOssmI6H5nIQ4JS3ZJjhxP0hVZ6zwiG9F5wXPoRd68JH+Zz8v
         W7/aZfngzZzSHUtOdPSgp1UWnzy0qhuIpSj0/udJENCMSKLYwgwWHTPkkV6+zq9SUQRe
         TQ/r0dz5jraCihHsNM21k8cm3ydms1+yu0/woqkVmPkL1lqnZcWp4UNd9eSpHYrR3E4Z
         zt1fsLRhf+zzq7JBFLkJ63rhq7zBOeOIUPFE2BBkcqWPC+T44BnUNfZZpGm6jVEmAbxi
         cUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNlyTgkXOTyOHNaNDiRIaQsnpuM6WdXqqyCyWZp3wtQ=;
        b=358C8OzMJ+r33WhvOPm++RLa4yQyQnogy6Su7TY1oQsXYGBm55PRNqCECH9ZP1kBoJ
         HgNQDoaIUDe5HSXmXqeMhQGQOeYy1jytfj75ppQgGdRx0wSayMno2ezQjWV71Fdgrzrr
         +MRhkfmFIIXUUhRgON/cpZ91nme0Qj1KTWziEabVLPIy3TBli8uVR8zC6SC+o4E+3tCL
         qNahizr4912N7BT5IBBks8XrhfPfiOSR79kupRdieCE972ZElBGsRvJiquZ2mNGXR0K2
         9tmDuUXKAfPWekdCXBdVOVrio/MM8O++ZqpT0GNuzPJasxqOxe6F7xp5q1RlRD0xbm2M
         HCDg==
X-Gm-Message-State: AO0yUKVEy1Cr6xvkam8/+IUNTooOYwC4GfS94oLHROuAEteewQTiCey5
	UgC3ocxTVLFa5k0R5jgRJcSu5GZ+GSGmJA==
X-Google-Smtp-Source: AK7set9wgD+aOKtcVc7oeZGAG2Kq1sk6Y+k9N8+AY5Uq7I96Q8pVarEBTcXC6QyGDFAk/rQOv27RoQ==
X-Received: by 2002:a17:90b:384a:b0:22c:198:6d73 with SMTP id nl10-20020a17090b384a00b0022c01986d73mr24711547pjb.8.1675129924688;
        Mon, 30 Jan 2023 17:52:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id mj8-20020a17090b368800b0021900ba8eeesm10096859pjb.2.2023.01.30.17.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 17:52:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/8] perfetto: Upgrade to 31.0 release
Date: Mon, 30 Jan 2023 17:51:55 -0800
Message-Id: <20230131015200.3862532-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131015200.3862532-1-raj.khem@gmail.com>
References: <20230131015200.3862532-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 01:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100864

Forward port pc file patch to 0.31 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-meson-add-pc-file-for-lib_perfetto.patch | 25 ++++++++-----------
 .../recipes-devtools/perfetto/perfetto.inc    |  4 +--
 2 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
index 70de44173d..21033eaaa8 100644
--- a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
+++ b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-lib_perfetto.patch
@@ -7,17 +7,15 @@ Subject: [PATCH] meson: add PC file for lib_perfetto
  meson.build | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)
 
-diff --git a/meson.build b/meson.build
-index 06015141c..752b4d928 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -19,9 +19,12 @@
  project(
      'perfetto',
-     ['c','cpp'],
--    default_options: ['c_std=c99', 'cpp_std=c++11']
-+    default_options: ['c_std=c99', 'cpp_std=c++11'],
-+    version: '27.1'
+     ['cpp'],
+-    default_options: ['cpp_std=c++17']
++    default_options: ['cpp_std=c++17'],
++    version: '31.0'
  )
  
 +soversion = meson.project_version()
@@ -25,20 +23,20 @@ index 06015141c..752b4d928 100644
  fs = import('fs')
  
  if not fs.is_dir('sdk')
-@@ -30,8 +33,9 @@ endif
- 
- dep_threads = dependency('threads')
+@@ -36,8 +39,9 @@ if host_machine.system() == 'android'
+   deps_perfetto += cpp.find_library('log')
+ endif
  
 -lib_perfetto = static_library(
 +lib_perfetto = shared_library(
      'perfetto',
 +    version: soversion,
      sources: 'sdk/perfetto.cc',
-     dependencies: dep_threads,
+     dependencies: deps_perfetto,
      install: true,
-@@ -39,6 +43,10 @@ lib_perfetto = static_library(
+@@ -50,6 +54,10 @@ dir_perfetto_trace = join_paths(meson.cu
  
- inc_perfetto = include_directories('sdk')
+ install_data(dir_perfetto_trace / 'perfetto_trace.proto')
  
 +install_headers('sdk/perfetto.h')
 +pkg = import('pkgconfig')
@@ -47,6 +45,3 @@ index 06015141c..752b4d928 100644
  dep_perfetto = declare_dependency(
      link_with: lib_perfetto,
      include_directories: inc_perfetto,
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/recipes-devtools/perfetto/perfetto.inc
index 5cb6f8bb34..de871d4f3d 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.inc
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/google/perfetto"
 
 SRC_URI = "git://github.com/google/perfetto.git;protocol=https;name=perfetto;nobranch=1"
 
-SRCREV_perfetto = "1c52b5e132312aeb007ed180d4ba1d8d66227923"
-PV = "27.1"
+SRCREV_perfetto = "b8da07095979310818f0efde2ef3c69ea70d62c5"
+PV = "31.0"
 
 S = "${WORKDIR}/git"
-- 
2.39.1


