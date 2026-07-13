Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0586AC44509
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 00:45:16 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1185.1783903508093677183
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2026 17:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pzcD6A5O;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca12086c06eso2145068a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2026 17:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783903507; x=1784508307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nslYEwzNh5KewciUEN44V+FyFLclHiTs+fKcPtrqIWk=;
        b=pzcD6A5OEYbaD4t2z0r2ijpCgX94LSb4hTnxAecJq0t3bvRdBmSh1Lcnfa7Z21b6+a
         N9cKzYIxMepG/X1+p8VXQLKIfolpQXzBg0oj7xC7p3A1jHP1F0+d+rM0aUyCk7NKgAm5
         C6ZxYBAxGbscqwf+95vD/vDGZItmTquQpu/0jIlVOVmI7aO/Zg1ywKNvD88GcOLVnVTq
         bkJlE3yP0MpmBzYsQ7Yr99CWku0UwHAhBR5UHgLfi28IT3uO3SAK710Hj47aFEDsn1mL
         ral+WPaw9EXDUVnVoWvky5JQ6jkKUSjC2H3PZOkvkiGZkv7Em5a2t0mUiAy26o+jOZj/
         XNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783903507; x=1784508307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nslYEwzNh5KewciUEN44V+FyFLclHiTs+fKcPtrqIWk=;
        b=AIc2vERZZrnuZCh3yLIbrH3AOya9NCWwPrRT7MMQycMo3bKUlS47956mgpF0hqmA7c
         ++mrDvXMUnwyKx8r3HMfDOR+jzIHCmBnJcoiG2bGPL3GB7HZYVeJUpAQ5eVrmk06oafx
         kRYxW5FUhV7PN7PvDCknimZPQVPBu2MctxMKF8wai/ZCDkhVZX2/Bsa0tGN8z+S6erHn
         vxAGVnQpWZvAbO99eSTfKBnjq5beBkfHj+DUwvE962c+OdTP27iadtqpNd6iAl+oSu9R
         gTqIpSwIdT3WtPU1q1FQf/schr8iktqK3aPZb7+xH6o98IXoRE/nNT0b5OxxgfFSe5Jv
         D8Qw==
X-Gm-Message-State: AOJu0Yzmu7hco+i6Tt1x0JE1RTFm743TZ8ufFvaPjk9VfSB26oKcz5Y8
	aDHonJFt19YsKnIA74N3oukGZSD/m1RxPUErtYBLtW+38GxnPInCeSUm8LIhVFQ2PI0=
X-Gm-Gg: AfdE7clxSFIEk89r6+xYVL2MFcUiBy7SZFiOIq7MPKnphbRnp/niGE2ajuKrnPxiyDc
	dYJva1KrH3ylp5ijIw3wGeEIN1iQIfWazpobPFO65Uz4HvxDHgWVx78tD25B5bzEJtX41TrJoon
	K0qmJwYl8G8MkJw+fpPsW1UMQlkX5BKB2VrTDvM1oAAtwdiBiWQ7qgoqsOJ8EsQ13Qe2k3ZN/X0
	nf6ooAElN30szY3gR7Sv9Y5CICjVxfYLhgqbgwFX3fAwBAIQPXU24ifWBW3JZyyk4tj1whN47UY
	EuGta9XokI2BUNrGMb/9o5g2AopGdf6umfwNqJUx9oqnxMy+mZNbjbVpnLCpnuP5FtDTooC/ATA
	GlG9YHDhytYeSTfLt8sNW5aePHbhDwOTDYWW1cbOYo1AI1lkbjLd7L8fQXznec4foymVvoI6xwb
	i8qoIOwyR2n7rrOhGohX0FW+3ERobtVJNVlDSZ4NGQtETlrzT1FBu27cTS1mTBBtpKucxGVL3bY
	x2TpKlhmvwJM8ZNGqsKLTBLiBmY6fahvKIiKxE31GwiAowvNQNx3gvVMy699kOuzMRxtYK62lnq
	N2dTgx7h/xivTp1np5yjG8dq4cwOXg==
X-Received: by 2002:a05:6a21:7d02:b0:3c0:e552:f2d with SMTP id adf61e73a8af0-3c1104eb7d8mr7203682637.34.1783903507379;
        Sun, 12 Jul 2026 17:45:07 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm71206990c88.7.2026.07.12.17.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:45:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/8] sysdig: Fix intermittent missing libsinsp/libscap headers on rebuild
Date: Sun, 12 Jul 2026 17:44:56 -0700
Message-ID: <20260713004502.716970-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
References: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 00:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128144

do_compile could fail with many:

  fatal error: 'libsinsp/sinsp.h' file not found
  fatal error: 'sinsp.h' file not found
  fatal error: 'libscap/strl.h' file not found

across all userspace/sysdig objects, even though the headers exist in
the fetched falcosecurity-libs source.

The add_library de-duplication patch guarded the libscap/libsinsp
modules with a HAVE_LIBSCAP/HAVE_LIBSINSP flag set as CACHE INTERNAL.
Because that value persists in CMakeCache, ninja's build-time
regeneration rule (cmake --regenerate-during-build, which fires whenever
a CMake input's timestamp changes between do_configure and do_compile)
re-runs cmake with the flag already true. The libscap/libsinsp
add_subdirectory() is then skipped, dropping the scap/sinsp targets and
their PUBLIC include directories, so target_link_libraries(sysdig sinsp)
degrades to a bare -lsinsp with no header propagation.

Guard on target existence (if(NOT TARGET scap|sinsp)) instead. Target
existence is global within a single cmake run -- so it still prevents
the duplicate add_library -- but is not persisted across runs, so the
modules are correctly re-processed on every regeneration.

Verified: a build-time cmake regeneration now keeps the libsinsp/libscap
object rules and falcosecurity-libs include paths in build.ninja, and a
full clean build plus a post-touch recompile both succeed.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-duplicate-operations-of-add_library.patch | 34 +++++++++++++------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-operations-of-add_library.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-operations-of-add_library.patch
index b8ca7dd38b..ec9ca46269 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-operations-of-add_library.patch
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-operations-of-add_library.patch
@@ -9,36 +9,48 @@ To fix following configure error
 |   add_library cannot create target "scap_error" because another target with
 |   the same name already exists.  The existing target is a static library

+Guard the libscap/libsinsp modules on the existence of the "scap"/"sinsp"
+targets rather than on a cached HAVE_LIBSCAP/HAVE_LIBSINSP flag. A cached
+flag persists into the CMakeCache, so when Ninja re-runs CMake during the
+build (the "cmake --regenerate-during-build" RERUN rule fires whenever a
+CMake input's timestamp changes) the guard is already true and the
+add_subdirectory() for libscap/libsinsp is skipped. That drops the scap/
+sinsp targets and their PUBLIC include directories, and the userspace/
+sysdig targets then fail to compile with "'libsinsp/sinsp.h' file not
+found". Target existence is global within a single CMake run (so it still
+prevents the duplicate add_library) but is not persisted across runs, so
+the modules are re-processed on every regeneration.
+
 Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
- cmake/modules/libscap.cmake  | 2 +-
- cmake/modules/libsinsp.cmake | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ cmake/modules/libscap.cmake  | 3 +--
+ cmake/modules/libsinsp.cmake | 3 +--
+ 2 files changed, 2 insertions(+), 4 deletions(-)

 diff --git a/cmake/modules/libscap.cmake b/cmake/modules/libscap.cmake
-index b41b12ff3..1753598e9 100644
 --- a/cmake/modules/libscap.cmake
 +++ b/cmake/modules/libscap.cmake
-@@ -14,7 +14,7 @@
+@@ -13,8 +13,7 @@
+ # the License.
  #

- if(NOT HAVE_LIBSCAP)
+-if(NOT HAVE_LIBSCAP)
 -	set(HAVE_LIBSCAP On)
-+        set(HAVE_LIBSCAP On CACHE INTERNAL "Flag to indicate libscap has been processed")
++if(NOT TARGET scap)

  	if(NOT LIBS_DIR)
  		get_filename_component(LIBS_DIR ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)
 diff --git a/cmake/modules/libsinsp.cmake b/cmake/modules/libsinsp.cmake
-index ff336e27f..0fdd2d4a9 100644
 --- a/cmake/modules/libsinsp.cmake
 +++ b/cmake/modules/libsinsp.cmake
-@@ -14,7 +14,7 @@
+@@ -13,8 +13,7 @@
+ # the License.
  #

- if(NOT HAVE_LIBSINSP)
+-if(NOT HAVE_LIBSINSP)
 -	set(HAVE_LIBSINSP On)
-+        set(HAVE_LIBSINSP On CACHE INTERNAL "Flag to indicate libsinsp has been processed")
++if(NOT TARGET sinsp)

  	if(NOT LIBS_DIR)
  		get_filename_component(LIBS_DIR ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)

