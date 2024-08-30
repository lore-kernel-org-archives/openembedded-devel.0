Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1FDCA0ED7
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 03:58:35 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.5219.1724990312040333132
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 20:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SUN9Ftxx;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-201d5af11a4so12871375ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 20:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724990311; x=1725595111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rWGhsOPbBdsYkXUYdBZrn189+6hXsLBVo7kfbJQAKPs=;
        b=SUN9Ftxxs459EmEaA+IHaOd1HpiGszaBzdu/LsNU4pfkybr4Sf5ivStly2lnUK35Vk
         ntS2O8Op1cEvHEgnuR+Kt9zGc8RlkHF2hM3SjsM6PyROA1brfanIuKgvDcHJUa5z8EQo
         jxrBKn/zkBafD9rg7BACJcVEsoDLthzKPI3YYfnW/kTc2yqzgPJ1whbIPmDUpm6VHXcX
         b2PeQ3H6OEoBJ6KIhq3bkkBNeZ6DLUmxFZg0Ajs9+M2WclBFxDKeMo3wTansMbncXCYX
         cmlnOKAQ/qeSul/cE17Abw/MbnUFUzWo+N8pt5wg7WgM8u5h3mYiyXzyt67wGo55PY7A
         qQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724990311; x=1725595111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWGhsOPbBdsYkXUYdBZrn189+6hXsLBVo7kfbJQAKPs=;
        b=CRLYIza6tVaRWCaGE/GXNouAfkkTjQX11g4OeU8aK3Xl3/sNkxYn/dQbi2W4WJm/tb
         MPp3wlFHZkkfe/nFhDkB9Y0gNeyO4MULcbzaTUgfSj8yK8zoyjWbKL7asQCQRmzlK2vL
         vc7XJTmAKAu/qm8sCUi/msH8AHc3gWIi9cQAxszb734gWUzGi8xRxv3lueUFFnVJsVIZ
         rpPt3E675xMWl1O+E/2Zmv10jusuobUTpvN2KNlvfGOzBdi0Ybsv5T6I+MCBT6ZzKcpi
         nDhDMe1B3tjTuFgNVvTcDDlvagFoDExFOe5tfcWwCf2F37FQ6yTi5HkBO+q4nS8UHk9N
         9tuA==
X-Gm-Message-State: AOJu0YwJif62j4zXcnyWfOBTwPKc7kHtvgLdEXgnFhN4k5ay8EQppHZD
	XGxJFrAERYW2UnYB6XGgsUWlB8BCqGYbgqpHAIwxDPehVKbBy2WminwuY/LL
X-Google-Smtp-Source: AGHT+IHupXAmCA3iwALdJaBgJEE7C7ktJTwuwDry5Q6B5Q2RBhjKVBt3plTOOUl2sU3LuECCiPUygA==
X-Received: by 2002:a17:903:1cd:b0:203:a279:a144 with SMTP id d9443c01a7336-2050c374301mr51697975ad.25.1724990310944;
        Thu, 29 Aug 2024 20:58:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2052919afb2sm2705035ad.3.2024.08.29.20.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 20:58:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 1/8] e2tools: Fix build with automake 1.17
Date: Thu, 29 Aug 2024 20:58:20 -0700
Message-ID: <20240830035827.406391-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 03:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112040

Replace the do_configure hack with aid to configure
detection logic via commandline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-utils/e2tools/e2tools_git.bb      | 44 ++++---------------
 ...Disable-portability-warning-as-error.patch | 34 ++++++++++++++
 2 files changed, 43 insertions(+), 35 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/e2tools/files/0001-Disable-portability-warning-as-error.patch

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
index a0d194cae0..459c7058e1 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
@@ -15,6 +15,7 @@ PV = "0.1.0+git"
 
 SRC_URI = " \
            git://github.com/e2tools/e2tools;protocol=https;branch=master \
+           file://0001-Disable-portability-warning-as-error.patch \
            file://run-ptest \
 "
 
@@ -24,41 +25,14 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig ptest
 
-do_configure:prepend() {
-    git -C "${WORKDIR}/git" reset --hard HEAD
-
-    # To install ptest for this package, special configuration needs to be
-    # done before do_configure(). So, do_configure_ptest() which is scheduled
-    # after do_configure() cannot be used.
-
-    # We only do special configuration if we are installing ptest for this
-    # package.
-    if [ "${@d.getVar('PTEST_ENABLED')}" -eq "1" ]; then
-        # Since we guarantee run-time dependency when installing the ptest for
-        # this package, we do not need the check macros under section "checks
-        # for programs" in "configure.ac". Plus, these check macros set the
-        # ouput variables to incorrect values as these checks are performed on
-        # the host environment. Still, we need these variables outputted from
-        # these check macros. So, we insert the following lines to manually
-        # set these output variables to the correct value in "configure.ac".
-
-        # Note that HAVE_DD_COMMAND and HAVE_MKE2FS_COMMAND are only ever used
-        # in tests/Makefile-files which determines whether to include the test
-        # cases. As for output variables CHMOD, DD, and MKE2FS, they only
-        # point to the programs which test cases need to run. Since these
-        # commands are guaranteed to be present due to RDEPENDS and are
-        # guaranteed to be accessible under PATH environment variable on the
-        # target, we only need to specify the name of these programs.
-
-        perl -i -0777 -pe 's/(^dnl\s*=+\s*^dnl\s*Checks for compiler flags\s*^dnl\s*=+)/
-AC_SUBST([CHMOD], 'chmod')
-AC_SUBST([DD], 'dd')
-AC_SUBST([MKE2FS], 'mke2fs')
-AM_CONDITIONAL([HAVE_DD_COMMAND], [true])
-AM_CONDITIONAL([HAVE_MKE2FS_COMMAND], [true])
-\1/ms' "${WORKDIR}/git/configure.ac"
-    fi
-}
+# Otherwise these tools will be detected from build host and
+# assumptions will go wrong, Fun of cross compiling
+EXTRA_OECONF += "\
+                ac_cv_path_MKE2FS=${base_sbindir}/mke2fs \
+                ac_cv_path_CHMOD=${base_bindir}/chmod \
+                ac_cv_path_DD=${base_bindir}/dd \
+                ac_cv_path_GREP=${base_bindir}/grep \
+                "
 
 do_install_ptest() {
     rm -rf "${D}${PTEST_PATH}/*"
diff --git a/meta-filesystems/recipes-utils/e2tools/files/0001-Disable-portability-warning-as-error.patch b/meta-filesystems/recipes-utils/e2tools/files/0001-Disable-portability-warning-as-error.patch
new file mode 100644
index 0000000000..dec793f373
--- /dev/null
+++ b/meta-filesystems/recipes-utils/e2tools/files/0001-Disable-portability-warning-as-error.patch
@@ -0,0 +1,34 @@
+From e0aaedea30483bf5b9bb085e12fff79144fa1174 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Aug 2024 11:12:57 -0700
+Subject: [PATCH] Disable portability warning as error
+
+With latest automake 1.17 its warning about escape hash
+mark [1] and since configure.ac uses -werror to call automake
+this becomes an error and reconfigure fails.
+
+escape hash mark is non-portable as discussed here [2]
+
+Fow now let it be a warning, it should be fixed in a portable way
+
+[1] https://debbugs.gnu.org/cgi/bugreport.cgi?bug=7610
+[2] https://lists.gnu.org/archive/html/automake/2011-08/msg00023.html
+
+Upstream-Status: Submitted [https://github.com/e2tools/e2tools/pull/31]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index dd32c4d..9f37591 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -14,6 +14,7 @@ AC_CONFIG_MACRO_DIR([m4])
+ AM_INIT_AUTOMAKE([
+ -Wall
+ -Werror
++-Wno-portability
+ 1.9.6
+ foreign
+ subdir-objects

