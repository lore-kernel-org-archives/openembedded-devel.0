Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9C6C3ABBB
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 06:21:55 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.44202.1746426106809253916
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 May 2025 23:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iLUMGddX;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22e16234307so18593925ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 May 2025 23:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746426106; x=1747030906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZMLlMVXDhLg1g8g+wp08eYB18LYRmZwOZAehW4vPK4=;
        b=iLUMGddXQUXuwW+kExeuICqCXx9H13yuG25z+FYq0SSW3K4EwUWOcpa9Ggp/uwtNsF
         nHJYt6Xqa3ej3rhre9VKy3fHib6VVWo7hnLlKhdlSI2ph9n4THbzO+waWwfCCdVNmEx0
         zW57mS3A5o9Q+yGZEHpo+eYvb4Uz32r9i98ceq0MwutWtvvhjLVr+60tmDPSBI/OJI5G
         z4+ljHydD2Ky91C3wc55FkcLPr/AKArQAubt27LvUz7gFax1CUjZFC493A7jOlV8/wgp
         wWeCO7w3O3SRLKoEZQ8nnK33eVEPpgDo3zN6fnQuPBkZAAz7P6t91BYkAYn/6Opd2gNz
         eUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746426106; x=1747030906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZMLlMVXDhLg1g8g+wp08eYB18LYRmZwOZAehW4vPK4=;
        b=tiDJWYDir7gGk/w9JDqfdOG6pMP+r8QL7xTQ+yHQMOo8/S5ftXcSqhMktK8SMU36bi
         pLILHNYyOhkWbY+jLirowcDDoBn9cR1xNZL5+3DYh5P2dUJgoOk50cS4IDvl5pLxEsF0
         1CEbYFETrZwkhg9fGALaUW0xYHTIFqTbCphs/xoQ35V5e+6AXUTfJSVvMPu7zj36ZbeP
         aucg8kmnEM9fUKPyTBgMqHsYumdyYnfmfPKNuHM8YHbSeLPVHDeBYz8tZZpWOHpUeJLh
         gHiXgbycP5QDcMrzsq14Ty4IUvSvYI3C5J0QjSQAMtmTbJ2zgrxT8W6dueJgJ9oKfD9z
         +yMQ==
X-Gm-Message-State: AOJu0YxDV9nG+ARov8aKMVjfLGjIxC4R280WWCRV2W0z7vsbmeqnivu7
	Qt4FX5/djwEoJEGe8X8Z92voIHC7G9qJnN7yUM3tWPHf0yqxfxV0xBIAda/r
X-Gm-Gg: ASbGnctBCZ00H5pP+OqaSnBHwUQTcyY853snWHmy5dAkZdJaDC8aB+MlCZ6kRNTNzXe
	Zjs4JMo9gdw9EpB+2zcAz/FuvY/2WdYvtOj8GfgaHqru5CdKm/+agEi1TDE3wjarqghALcEJQl9
	Dn3tZjMcznI6+o7NDK5EsntXBFFy1KnlacK8uxKgL8B3IlOpld54Vlg37/HT83WbcnbclEK5sAc
	ffNqLXCSr5TKx7GKqk8vHlTe9OiRM5hc87793ZIzTuGt9N/G7OVbQsrGl3dvrxHYl67kwEAYlXE
	pnankr3K5dXbI5gKQm5XVtKHt2vuXMGQ
X-Google-Smtp-Source: AGHT+IFZCiLB0k4LUfK0azQapbH8tPCWB767uxiE94fNo1mVvg1K7rWRBXPTl90dXfa+DdKC2r3UAw==
X-Received: by 2002:a17:902:e541:b0:21f:5063:d3ca with SMTP id d9443c01a7336-22e0863a1cbmr221206905ad.16.1746426105681;
        Sun, 04 May 2025 23:21:45 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7b1cdsm5952352b3a.25.2025.05.04.23.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 23:21:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/7] fluent-bit: Upgrade to 4.0.1 release
Date: Sun,  4 May 2025 23:21:37 -0700
Message-ID: <20250505062142.3478500-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505062142.3478500-1-raj.khem@gmail.com>
References: <20250505062142.3478500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 06:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117291

Refresh and forward port patches
Add -std=gnu17 to fix build with GCC-15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rivate-makefile-targets-in-CMakelist.patch | 16 ++++---------
 ...-not-hardcode-compilation-directorie.patch |  2 --
 ...ts.txt-Revise-init-manager-deduction.patch | 18 +++++++--------
 ...{fluentbit_3.2.8.bb => fluentbit_4.0.1.bb} | 23 +++++++++++--------
 4 files changed, 26 insertions(+), 33 deletions(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_3.2.8.bb => fluentbit_4.0.1.bb} (90%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
index fae98f1f5d..32f4fdec51 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
@@ -28,8 +28,6 @@ Upstream-Status: Submitted [https://github.com/fluent/fluent-bit/pull/9450]
  lib/monkey/CMakeLists.txt   | 4 +---
  4 files changed, 7 insertions(+), 21 deletions(-)
 
-diff --git a/lib/cfl/CMakeLists.txt b/lib/cfl/CMakeLists.txt
-index 2193cb29c..e2a5cba37 100644
 --- a/lib/cfl/CMakeLists.txt
 +++ b/lib/cfl/CMakeLists.txt
 @@ -40,12 +40,8 @@ if(NOT MSVC)
@@ -47,8 +45,6 @@ index 2193cb29c..e2a5cba37 100644
  
  
  
-diff --git a/lib/cmetrics/CMakeLists.txt b/lib/cmetrics/CMakeLists.txt
-index 18582997d..8f7176dd6 100644
 --- a/lib/cmetrics/CMakeLists.txt
 +++ b/lib/cmetrics/CMakeLists.txt
 @@ -60,12 +60,8 @@ if(NOT MSVC)
@@ -66,12 +62,10 @@ index 18582997d..8f7176dd6 100644
  
  # Configuration options
  option(CMT_DEV                       "Enable development mode"                   No)
-diff --git a/lib/ctraces/CMakeLists.txt b/lib/ctraces/CMakeLists.txt
-index e47ba022d..0ddfd5f97 100644
 --- a/lib/ctraces/CMakeLists.txt
 +++ b/lib/ctraces/CMakeLists.txt
 @@ -30,12 +30,8 @@ set(CTR_VERSION_MINOR  6)
- set(CTR_VERSION_PATCH  0)
+ set(CTR_VERSION_PATCH  4)
  set(CTR_VERSION_STR "${CTR_VERSION_MAJOR}.${CTR_VERSION_MINOR}.${CTR_VERSION_PATCH}")
  
 -# Define __FILENAME__ consistently across Operating Systems
@@ -85,8 +79,6 @@ index e47ba022d..0ddfd5f97 100644
  
  # Configuration options
  option(CTR_DEV             "Enable development mode"                   No)
-diff --git a/lib/monkey/CMakeLists.txt b/lib/monkey/CMakeLists.txt
-index 028240bcc..b386cb726 100644
 --- a/lib/monkey/CMakeLists.txt
 +++ b/lib/monkey/CMakeLists.txt
 @@ -15,10 +15,8 @@ include(GNUInstallDirs)
@@ -95,9 +87,9 @@ index 028240bcc..b386cb726 100644
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=gnu99 -Wall -Wextra")
 -set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__='\"$$(subst ${CMAKE_SOURCE_DIR}/,,$$(abspath \$$<))\"'")
 -else()
-+endif()
- set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
--endif()
+-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
+ endif()
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
  
  # Monkey Version
  set(MK_VERSION_MAJOR  1)
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
index 01a11e3be7..025f8729ea 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
@@ -13,8 +13,6 @@ Upstream-Status: Pending
  include/fluent-bit/flb_info.h.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/include/fluent-bit/flb_info.h.in b/include/fluent-bit/flb_info.h.in
-index 3a08f8051..aa6a48f29 100644
 --- a/include/fluent-bit/flb_info.h.in
 +++ b/include/fluent-bit/flb_info.h.in
 @@ -23,7 +23,7 @@
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch
index 8dd4da47ec..909d1be28d 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-CMakeLists.txt-Revise-init-manager-deduction.patch
@@ -14,23 +14,21 @@ Upstream-Status: Inappropriate [configuration]
  src/CMakeLists.txt | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 8404b65c1..0c7876058 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -546,7 +546,7 @@ if(FLB_BINARY)
+@@ -569,7 +569,7 @@ if(FLB_BINARY)
      set(SYSTEMD_UNITDIR  /lib/systemd/system)
    endif()
  
 -  if(SYSTEMD_UNITDIR)
 +  if(@INIT_MANAGER_IS_SYSTEMD@)
-     set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.service")
-     configure_file(
-       "${PROJECT_SOURCE_DIR}/init/systemd.in"
-@@ -554,7 +554,7 @@ if(FLB_BINARY)
-       )
-     install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION ${SYSTEMD_UNITDIR})
-     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR} COMPONENT binary)
+     if (FLB_AMAZON_LINUX2)
+       set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.service")
+       configure_file(
+@@ -594,7 +594,7 @@ if(FLB_BINARY)
+       install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION ${SYSTEMD_UNITDIR})
+       install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR} COMPONENT binary)
+     endif()
 -  elseif(IS_DIRECTORY /usr/share/upstart)
 +  elseif(@INIT_MANAGER_IS_UPSTART@)
      set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
similarity index 90%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
index 59e23567b1..4d82abc783 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.8.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
@@ -17,9 +17,9 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "d13e8e4ab2029fa92600b7d1d0da28f8dcc350eb"
+SRCREV = "b12e507090273576d1156342780c7c6d358fa579"
 SRC_URI = "\
-    git://github.com/fluent/fluent-bit.git;branch=3.2;protocol=https \
+    git://github.com/fluent/fluent-bit.git;branch=master;protocol=https \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
     file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch \
     file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
@@ -109,8 +109,8 @@ PACKAGECONFIG[windows-defaults] = "-DFLB_WINDOWS_DEFAULTS=Yes,-DFLB_WINDOWS_DEFA
 # individual plugins then to enable (e.g. using EXTRA_OECMAKE:append = " -DFLB_FOOBAR=ON")
 PACKAGECONFIG[minimal] = "-DFLB_MINIMAL=Yes,-DFLB_MINIMAL=No"
 
-PACKAGECONFIG[in-kafka] = "-DFLB_IN_KAFKA=ON,-DFLB_IN_KAFKA=OFF,librdkafka curl"
-PACKAGECONFIG[out-kafka] = "-DFLB_OUT_KAFKA=ON,-DFLB_OUT_KAFKA=OFF,librdkafka curl"
+PACKAGECONFIG[in-kafka] = "-DFLB_KAFKA=ON -DFLB_IN_KAFKA=ON,-DFLB_KAFKA=OFF -DFLB_IN_KAFKA=OFF,librdkafka curl"
+PACKAGECONFIG[out-kafka] = "-DFLB_KAFKA=ON -DFLB_OUT_KAFKA=ON,-DFLB_KAFKA=OFF -DFLB_OUT_KAFKA=OFF,librdkafka curl"
 
 SYSTEMD_SERVICE:${PN} = "fluent-bit.service"
 
@@ -124,13 +124,18 @@ FULL_OPTIMIZATION:remove = "${@'-O2' if bb.data.inherits_class('clang', d) else
 TARGET_CC_ARCH += "${SELECTED_OPTIMIZATION}"
 TARGET_CC_ARCH:remove = "-D_FORTIFY_SOURCE=2"
 EXTRA_OECMAKE += "-DCMAKE_DEBUG_SRCDIR=${TARGET_DBGSRC_DIR}/"
-EXTRA_OECMAKE:append:mips = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
-EXTRA_OECMAKE:append:powerpc = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
-EXTRA_OECMAKE:append:riscv32 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
-EXTRA_OECMAKE:append:riscv64 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
-EXTRA_OECMAKE:append:x86 = " -DCMAKE_C_STANDARD_LIBRARIES=-latomic"
+
 SECURITY_STRINGFORMAT:remove = "${@bb.utils.contains('PACKAGECONFIG', 'aws-error-reporter', '-Werror=format-security', '', d)}"
 
+# GCC-15 uses C23 std and it does not yet compile with C23
+CFLAGS += "-std=gnu17"
+# 64bit atomics builtins do not exist in compiler on these arches
+LDFLAGS:append:mips = " -latomic"
+LDFLAGS:append:powerpc = " -latomic"
+LDFLAGS:append:riscv32 = " -latomic"
+LDFLAGS:append:riscv64 = " -latomic"
+LDFLAGS:append:x86 = " -latomic"
+
 do_configure:prepend() {
     sed -i \
         -e 's#@INIT_MANAGER_IS_SYSTEMD@#'${@'TRUE' if d.getVar('INIT_MANAGER') == 'systemd' else 'FALSE'}'#' \

