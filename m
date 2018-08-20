Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com
	[209.85.161.50])
	by mail.openembedded.org (Postfix) with ESMTP id 02C13790A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 15:32:38 +0000 (UTC)
Received: by mail-yw1-f50.google.com with SMTP id l9-v6so6950901ywc.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 08:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1TJYhTDW7V8V2cHsuDOlElazcbNyEzrMpvqtu2jI2W0=;
	b=jNXnadafyUp9XRkBf60CwiKDIYNvHC/cPTxPlO0ubWRBa9wC4FNWdcdKjbC7wC35hI
	L2EVJXa8cpHxzrhjFol+Li1mnTCCQCL24d+XYP6Iki9e5V//NunCXbmfPidz+RcE9Z/L
	2lTZKYmz+ah6HPFaJvBCglUHZ+v4tdC9ftSIBFsoTr/RX/ySCNLV9tMK588eYuu4BWV9
	CIeZC2kQAUUrfSVM/Bxr+xgXMzTPou+/oPRw6MNW4E/upavUbhJijLAhbK155vXCII7b
	Clge1qcLK5fgmDvm+quiSZZ/ylKFDEC3lqn7dlAfIGiOcxDBWyMtwEEhrpaSyBWohrdG
	uV2A==
X-Gm-Message-State: AOUpUlF+Wc8SYpXvgo+nLlqivLt6JMUH8JlaVlZW98ZbEcsWRznDb4+v
	PXwxFMcp7sx/DRXIgYKnnk2ZUCBP
X-Google-Smtp-Source: AA+uWPyMs+QupGwfFt+3qbmEYQmlApO+XWFxqPrbiUbj/qURGw5LrB7jy83W8g9GEiNrrNigJB3SOA==
X-Received: by 2002:a81:2604:: with SMTP id
	m4-v6mr24730714ywm.21.1534779159077; 
	Mon, 20 Aug 2018 08:32:39 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z193-v6sm1496775ywd.90.2018.08.20.08.32.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 08:32:38 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2018 16:32:31 +0100
Message-Id: <20180820153234.10990-2-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820153234.10990-1-git@andred.net>
References: <20180820153234.10990-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH v2 2/5] openjdk-8: fix malformed patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2018 15:32:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andr√© Draszik <andre.draszik@jci.com>

git am complains:
  Warning: commit message did not conform to UTF-8.
  You may want to amend it after fixing the message, or set the config
  variable i18n.commitencoding to the encoding your project uses.

Not sure what happened there when they were applied to git, they
certainly weren't sent like that to the mailing list.

Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
---
 ...-hotspot-fix-compilation-with-security-flags-enabled.patch | 4 ++--
 .../0005-hotspot-use-correct-include-for-poll.patch           | 4 ++--
 .../0006-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch          | 4 ++--
 .../0007-jdk-use-correct-include-for-poll.patch               | 4 ++--
 .../0008-jdk-use-correct-include-for-signal.patch             | 4 ++--
 .../0009-jdk-disable-backtrace-musl-build-fix.patch           | 4 ++--
 ...0010-build-fix-build-on-as-needed-toolchains-generic.patch | 4 ++--
 .../musl-0001-hotspot-stop-using-obsolete-isnanf.patch        | 4 ++--
 ...sl-0002-jdk-give-a-much-bigger-buffer-to-getmntent_r.patch | 4 ++--
 ...0003-jdk-fix-libjvm-load-on-musl-set-LD_LIBRARY_PATH.patch | 4 ++--
 ...musl-0004-jdk-remove-sysctl.h-include-musl-build-fix.patch | 4 ++--
 .../musl-0005-hotspot-disable-agent-build.patch               | 4 ++--
 ...musl-0006-hotspot-os_linux-remove-glibc-dependencies.patch | 4 ++--
 ...hotspot-os_linux_x86-remove-glibc-dependencies-fpu_c.patch | 4 ++--
 ...jdk-musl-build-fix-use-SIGRTMAX-rather-than-__SIGRTM.patch | 4 ++--
 .../musl-0009-jdk-musl-has-gethostby_r.patch                  | 4 ++--
 16 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/recipes-core/openjdk/patches-openjdk-8/0002-hotspot-fix-compilation-with-security-flags-enabled.patch b/recipes-core/openjdk/patches-openjdk-8/0002-hotspot-fix-compilation-with-security-flags-enabled.patch
index dcadea1..a94e90f 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0002-hotspot-fix-compilation-with-security-flags-enabled.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0002-hotspot-fix-compilation-with-security-flags-enabled.patch
@@ -1,5 +1,5 @@
 From bdea8cf299313388ec41ea20281deca6dc4f764d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 14:41:06 +0000
 Subject: [PATCH 2/9] hotspot: fix compilation with security flags enabled
 MIME-Version: 1.0
@@ -18,7 +18,7 @@ Content-Transfer-Encoding: 8bit
 Backport a patch to fix this.
 
 Upstream-Status: Backport [http://hg.openjdk.java.net/jdk10/jdk10/hotspot/rev/eb11b3f0ae65]
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  hotspot/src/share/vm/code/dependencies.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/recipes-core/openjdk/patches-openjdk-8/0005-hotspot-use-correct-include-for-poll.patch b/recipes-core/openjdk/patches-openjdk-8/0005-hotspot-use-correct-include-for-poll.patch
index 8b3420e..45573e4 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0005-hotspot-use-correct-include-for-poll.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0005-hotspot-use-correct-include-for-poll.patch
@@ -1,5 +1,5 @@
 From 79e35bd203b40979e1d241a04d6d9df373327bef Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 09:28:06 +0000
 Subject: [PATCH 5/9] hotspot: use correct include for poll
 MIME-Version: 1.0
@@ -20,7 +20,7 @@ the following command:
     done
 
 Upstream-Status: Pending
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  hotspot/src/os/aix/vm/os_aix.inline.hpp         | 2 +-
  hotspot/src/os/bsd/vm/os_bsd.inline.hpp         | 2 +-
diff --git a/recipes-core/openjdk/patches-openjdk-8/0006-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch b/recipes-core/openjdk/patches-openjdk-8/0006-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
index 81dbebd..f6af83e 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0006-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0006-hotspot-don-t-rely-on-old-SysV-SIGCLD.patch
@@ -1,5 +1,5 @@
 From 4ed4b58270dcd3d897adef605893c104944c4f3a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 15:00:55 +0000
 Subject: [PATCH 6/9] hotspot: don't rely on old SysV SIGCLD
 MIME-Version: 1.0
@@ -17,7 +17,7 @@ leads to the following compilation error:
 Just make it conditional, so the code compiles everywhere.
 
 Upstream-Status: Pending
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  hotspot/src/os/linux/vm/jvm_linux.cpp | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/recipes-core/openjdk/patches-openjdk-8/0007-jdk-use-correct-include-for-poll.patch b/recipes-core/openjdk/patches-openjdk-8/0007-jdk-use-correct-include-for-poll.patch
index af4dde9..2efdbf5 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0007-jdk-use-correct-include-for-poll.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0007-jdk-use-correct-include-for-poll.patch
@@ -1,5 +1,5 @@
 From df9c5738c4a8a00ba65948503ff0c0cfa2f17e95 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 09:28:06 +0000
 Subject: [PATCH 7/9] jdk: use correct include for poll
 MIME-Version: 1.0
@@ -23,7 +23,7 @@ the following command:
     done
 
 Upstream-Status: Pending
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  jdk/src/aix/native/java/net/aix_close.c                 | 2 +-
  jdk/src/aix/native/sun/nio/ch/AixPollPort.c             | 2 +-
diff --git a/recipes-core/openjdk/patches-openjdk-8/0008-jdk-use-correct-include-for-signal.patch b/recipes-core/openjdk/patches-openjdk-8/0008-jdk-use-correct-include-for-signal.patch
index 406de52..05f9558 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0008-jdk-use-correct-include-for-signal.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0008-jdk-use-correct-include-for-signal.patch
@@ -1,5 +1,5 @@
 From a063ee68bc0dd7dbf9737df4ee191e98796f2f6a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 09:28:06 +0000
 Subject: [PATCH 8/9] jdk: use correct include for signal
 MIME-Version: 1.0
@@ -24,7 +24,7 @@ the following command:
     done
 
 Upstream-Status: Pending
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  jdk/src/aix/native/sun/nio/ch/AixNativeThread.c  | 2 +-
  jdk/src/macosx/javavm/export/jvm_md.h            | 2 +-
diff --git a/recipes-core/openjdk/patches-openjdk-8/0009-jdk-disable-backtrace-musl-build-fix.patch b/recipes-core/openjdk/patches-openjdk-8/0009-jdk-disable-backtrace-musl-build-fix.patch
index 68f3d7a..43130b5 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0009-jdk-disable-backtrace-musl-build-fix.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0009-jdk-disable-backtrace-musl-build-fix.patch
@@ -1,5 +1,5 @@
 From 8ef989f82b29655e8d4532f14d5aa12a2999d850 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Fri, 2 Mar 2018 13:58:07 +0000
 Subject: [PATCH 10/10] jdk: disable backtrace() (musl build fix)
 MIME-Version: 1.0
@@ -13,7 +13,7 @@ Use appropriate #ifdef to disable their use on musl and thus
 to fix the build on musl.
 
 Upstream-Status: Pending
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  jdk/src/solaris/native/sun/xawt/XToolkit.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/recipes-core/openjdk/patches-openjdk-8/0010-build-fix-build-on-as-needed-toolchains-generic.patch b/recipes-core/openjdk/patches-openjdk-8/0010-build-fix-build-on-as-needed-toolchains-generic.patch
index 7decd5e..2d02b7c 100644
--- a/recipes-core/openjdk/patches-openjdk-8/0010-build-fix-build-on-as-needed-toolchains-generic.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/0010-build-fix-build-on-as-needed-toolchains-generic.patch
@@ -1,5 +1,5 @@
 From 84bcdb9cdab0e0be9cdfededfb518d3cea9009e3 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 12 Mar 2018 15:40:58 +0000
 Subject: [PATCH] build: fix build on --as-needed toolchains (generic)
 MIME-Version: 1.0
@@ -64,7 +64,7 @@ place the $EXPECTED_OBJS early in the command line, before
 any additional libraries, so as to fix this once and for
 all.
 
-Signed-off-by: Andr√© Draszik <andre.draszik at jci.com>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
 Upstream-Status: Pending
  make/common/NativeCompilation.gmk | 5 ++---
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0001-hotspot-stop-using-obsolete-isnanf.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0001-hotspot-stop-using-obsolete-isnanf.patch
index e165170..ebe6547 100644
--- a/recipes-core/openjdk/patches-openjdk-8/musl-0001-hotspot-stop-using-obsolete-isnanf.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0001-hotspot-stop-using-obsolete-isnanf.patch
@@ -1,5 +1,5 @@
 From 1624e2dd3739fe208efa13b31abf4bc53ae2e5c1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 11:24:44 +0000
 Subject: [PATCH 1/9] hotspot: stop using obsolete isnanf()
 MIME-Version: 1.0
@@ -19,7 +19,7 @@ replacing isnanf(), even on glibc.
 Do so.
 
 Upstream-Status: Pending
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  hotspot/src/share/vm/utilities/globalDefinitions_gcc.hpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0002-jdk-give-a-much-bigger-buffer-to-getmntent_r.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0002-jdk-give-a-much-bigger-buffer-to-getmntent_r.patch
index 1874f87..06cdcaf 100644
--- a/recipes-core/openjdk/patches-openjdk-8/musl-0002-jdk-give-a-much-bigger-buffer-to-getmntent_r.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0002-jdk-give-a-much-bigger-buffer-to-getmntent_r.patch
@@ -1,5 +1,5 @@
 From 2ba0f3fae90f2d2c310663e4b39e90f969116241 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 15:59:09 +0000
 Subject: [PATCH 2/9] jdk: give a much bigger buffer to getmntent_r()
 MIME-Version: 1.0
@@ -9,7 +9,7 @@ Content-Transfer-Encoding: 8bit
 https://bugs.alpinelinux.org/issues/7093
 
 Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  .../native/sun/nio/fs/LinuxNativeDispatcher.c      | 29 +++++++++++++++-------
  1 file changed, 20 insertions(+), 9 deletions(-)
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0003-jdk-fix-libjvm-load-on-musl-set-LD_LIBRARY_PATH.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0003-jdk-fix-libjvm-load-on-musl-set-LD_LIBRARY_PATH.patch
index 8ad000d..6990d55 100644
--- a/recipes-core/openjdk/patches-openjdk-8/musl-0003-jdk-fix-libjvm-load-on-musl-set-LD_LIBRARY_PATH.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0003-jdk-fix-libjvm-load-on-musl-set-LD_LIBRARY_PATH.patch
@@ -1,5 +1,5 @@
 From 4429d73853b3938a53a6058cc0dcaac08d191995 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 16:01:54 +0000
 Subject: [PATCH 3/9] jdk: fix libjvm load on musl (set LD_LIBRARY_PATH)
 MIME-Version: 1.0
@@ -14,7 +14,7 @@ Patch taken from Alpine Linux:
     https://git.alpinelinux.org/cgit/aports/tree/community/openjdk8/icedtea-jdk-fix-libjvm-load.patch?id=4d34f29dddd3934358df7a9607706d09ae0433c3
 
 Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  jdk/src/solaris/bin/java_md_solinux.c | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0004-jdk-remove-sysctl.h-include-musl-build-fix.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0004-jdk-remove-sysctl.h-include-musl-build-fix.patch
index 086f669..0c20627 100644
--- a/recipes-core/openjdk/patches-openjdk-8/musl-0004-jdk-remove-sysctl.h-include-musl-build-fix.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0004-jdk-remove-sysctl.h-include-musl-build-fix.patch
@@ -1,5 +1,5 @@
 From 86945e6df4dc15d5c2402a656d1d9d1b25945fb2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 09:28:06 +0000
 Subject: [PATCH 4/9] jdk: remove sysctl.h include (musl build fix)
 MIME-Version: 1.0
@@ -16,7 +16,7 @@ etc.
 Remove it, at things seem to work without as well.
 
 Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  jdk/src/solaris/native/java/net/PlainDatagramSocketImpl.c   | 1 -
  jdk/src/solaris/native/java/net/PlainSocketImpl.c           | 1 -
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build.patch
index 913b318..24342b5 100644
--- a/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0005-hotspot-disable-agent-build.patch
@@ -1,5 +1,5 @@
 From 19b1d6b4dc64a1c44a8f90776a489eee5c76463d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Tue, 27 Feb 2018 15:12:08 +0000
 Subject: [PATCH 5/9] hotspot: disable agent build
 MIME-Version: 1.0
@@ -9,7 +9,7 @@ Content-Transfer-Encoding: 8bit
 the agent needs thread_db, which doesn't exist in musl
 
 Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  common/autoconf/jdk-options.m4           | 2 +-
  hotspot/make/linux/makefiles/defs.make   | 4 ++++
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies.patch
index f0696fc..4abd558 100644
--- a/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0006-hotspot-os_linux-remove-glibc-dependencies.patch
@@ -1,5 +1,5 @@
 From a02a9fbc3f1fed181504bdb5b0a16863247f92fc Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Fri, 2 Mar 2018 10:11:51 +0000
 Subject: [PATCH 6/9] hotspot: os_linux: remove glibc dependencies
 MIME-Version: 1.0
@@ -21,7 +21,7 @@ Content-Transfer-Encoding: 8bit
     |              dlsym
 
 Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  hotspot/src/os/linux/vm/os_linux.cpp | 12 +++++++++++-
  1 file changed, 11 insertions(+), 1 deletion(-)
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0007-hotspot-os_linux_x86-remove-glibc-dependencies-fpu_c.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0007-hotspot-os_linux_x86-remove-glibc-dependencies-fpu_c.patch
index 7dcb889..3328d25 100644
--- a/recipes-core/openjdk/patches-openjdk-8/musl-0007-hotspot-os_linux_x86-remove-glibc-dependencies-fpu_c.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0007-hotspot-os_linux_x86-remove-glibc-dependencies-fpu_c.patch
@@ -1,5 +1,5 @@
 From dc0217d20e3c96203c81acda1c02652755bfcefb Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Fri, 2 Mar 2018 10:24:11 +0000
 Subject: [PATCH 7/9] hotspot: os_linux_x86: remove glibc dependencies
  (fpu_control.h)
@@ -14,7 +14,7 @@ Patch adopted from Alpine linux:
     https://git.alpinelinux.org/cgit/aports/tree/community/openjdk8/icedtea-hotspot-musl.patch?id=4d34f29dddd3934358df7a9607706d09ae0433c3
 
 Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  hotspot/src/os_cpu/linux_x86/vm/os_linux_x86.cpp | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0008-jdk-musl-build-fix-use-SIGRTMAX-rather-than-__SIGRTM.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0008-jdk-musl-build-fix-use-SIGRTMAX-rather-than-__SIGRTM.patch
index c15895f..1e4e500 100644
--- a/recipes-core/openjdk/patches-openjdk-8/musl-0008-jdk-musl-build-fix-use-SIGRTMAX-rather-than-__SIGRTM.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0008-jdk-musl-build-fix-use-SIGRTMAX-rather-than-__SIGRTM.patch
@@ -1,5 +1,5 @@
 From ec37e9e5663611e49c7c976d34450ea6b90d0f24 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Fri, 2 Mar 2018 13:37:20 +0000
 Subject: [PATCH 8/9] jdk: musl build fix (use SIGRTMAX rather than __SIGRTMAX)
 MIME-Version: 1.0
@@ -24,7 +24,7 @@ Patch taken from Alpine Linux:
     https://git.alpinelinux.org/cgit/aports/tree/community/openjdk8/icedtea-jdk-musl.patch?id=4d34f29dddd3934358df7a9607706d09ae0433c3
 
 Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  jdk/src/solaris/native/java/net/linux_close.c    | 3 ++-
  jdk/src/solaris/native/sun/nio/ch/NativeThread.c | 2 +-
diff --git a/recipes-core/openjdk/patches-openjdk-8/musl-0009-jdk-musl-has-gethostby_r.patch b/recipes-core/openjdk/patches-openjdk-8/musl-0009-jdk-musl-has-gethostby_r.patch
index c033b77..3f3387b 100644
--- a/recipes-core/openjdk/patches-openjdk-8/musl-0009-jdk-musl-has-gethostby_r.patch
+++ b/recipes-core/openjdk/patches-openjdk-8/musl-0009-jdk-musl-has-gethostby_r.patch
@@ -1,5 +1,5 @@
 From 276fb5b2d57cf0257dc82e84d80213fe3eec6e34 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Fri, 2 Mar 2018 13:57:22 +0000
 Subject: [PATCH 9/9] jdk: musl has gethostby_r()
 MIME-Version: 1.0
@@ -12,7 +12,7 @@ Patch taken from Alpine Linux:
     https://git.alpinelinux.org/cgit/aports/tree/community/openjdk8/icedtea-jdk-musl.patch?id=4d34f29dddd3934358df7a9607706d09ae0433c3
 
 Upstream-Status: Inappropriate [musl specific]
-Signed-off-by: AndrÈ Draszik <andre.draszik at jci.com <https://lists.yoctoproject.org/listinfo/yocto>>
+Signed-off-by: Andr√© Draszik <andre.draszik@jci.com>
 ---
  jdk/src/solaris/native/java/net/Inet4AddressImpl.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
2.18.0


