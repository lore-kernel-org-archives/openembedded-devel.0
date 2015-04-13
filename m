Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0176AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 07:27:45 +0000 (UTC)
Received: by wgin8 with SMTP id n8so70874206wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 00:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/ZY0c+mIB2mZ4b4pIsuin+Xbejcs/pMe5+ghMGgxp6s=;
	b=M5ESdLvd7ADJUJbEJ96lctS1g2gpfsobZ0y/j4LB1e9830XAQL5whR7Lx6UE0NumMV
	ZHVNfN9+a5wbRnxqAUq0TkhTJXbkEx9KFqYfo526lrUC80+W0CqbRIec/MP+D5Icvyd6
	cqRl6jBPkfrLf6nB8irC/QTpvp4QYagzbyoJi5yZKkjyj8uPOBru7hViJQXsqs5kVObg
	aY+4+FfuO0Ie0YzurMCWj6xlAU3Qin3gYpOnyMhGsRdPf1005DOsL8W//K6zLt7VJ/Vo
	fToFy9Pl7veV0AsOxXogLnnAlp08jWZZDqYJCtnltZywK7SfwWw5A4o7pFnSttMalFv/
	0EnQ==
X-Received: by 10.194.71.208 with SMTP id x16mr24235478wju.129.1428910066518; 
	Mon, 13 Apr 2015 00:27:46 -0700 (PDT)
Received: from localhost.localdomain (pD9F9B569.dip0.t-ipconnect.de.
	[217.249.181.105]) by mx.google.com with ESMTPSA id
	i10sm10139643wja.40.2015.04.13.00.27.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Apr 2015 00:27:45 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Apr 2015 09:27:30 +0200
Message-Id: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.8.1.rc3
Subject: [meta-java][PATCH v2 0/7] Update OpenJDK7 to IcedTea 2.5.4 und OpenJDK 7u75b13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Apr 2015 07:27:46 -0000

There were some mistakes in my former recipes. This version fixes them.
OpenJDK-7 did not depend on krb5 but excluded it in OECONF. Now I changed to
depending on krb5 and not excluding it. I've tested building and running it
against dizzy and master branches of oe-core, bitbake and meta-openembedded.
Built with qemux86 and qemuarm. This release switches the HotSpot-Release to a
newer one because of a segfault bug in the ARM Thumb2 JIT.

Sven Ebenfeld (7):
  icedtea7-native: Add missing dependencies
  icedtea7-native: fix build with gcc 4.9
  icedtea7-native: Remove unused patch
  openjdk-7: Add Version 75b13 with IcedTea 2.5.4
  openjdk-7: Remove OpenJDK 25b30 and IcedTea 2.3.12
  java-test-image: Add openjdk-7 ZeroVM and remove busybox-hwclock
  Update README to new OpenJDK-7

 README                                             |   2 +-
 recipes-core/icedtea/icedtea7-native.inc           |   4 +-
 .../icedtea-change-to-gdb-debug-format.patch       |  29 ++
 .../icedtea-disable-desktop-dirs.patch             |  91 ------
 recipes-core/icedtea/openjdk-7-release-03b147.inc  |   2 +
 .../openjdk/openjdk-7-25b30/build-hacks.patch      |  60 ----
 .../openjdk-7-25b30/cacao-arm-ucontext.patch       |  24 --
 .../openjdk/openjdk-7-25b30/cacao-libtoolize.patch |  12 -
 .../openjdk-7-25b30/cacao-loadavg-makefile.patch   |  13 -
 .../openjdk/openjdk-7-25b30/cacao-loadavg.patch    |  27 --
 .../openjdk/openjdk-7-25b30/cacao-update.patch     |  63 ----
 .../openjdk/openjdk-7-25b30/fix-checksums.patch    |  13 -
 .../openjdk-7-25b30/fix_hotspot_crosscompile.patch |  51 ---
 ...cedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch |  19 --
 .../icedtea-corba-parallel-make.patch              |  31 --
 .../openjdk-7-25b30/icedtea-crosscompile-fix.patch | 363 ---------------------
 .../openjdk-7-25b30/icedtea-fix-xrender.patch      |  13 -
 .../icedtea-hotspot-dlvsym-uclibc.patch            |  16 -
 .../icedtea-hotspot-glibc-version.patch            |  23 --
 .../openjdk-7-25b30/icedtea-hotspot-isfinte.patch  |  15 -
 .../openjdk-7-25b30/icedtea-hotspot-isnanf.patch   |  13 -
 .../openjdk-7-25b30/icedtea-hotspot-loadavg.patch  |  28 --
 .../openjdk-7-25b30/icedtea-jdk-iconv-uclibc.patch |  39 ---
 .../icedtea-jdk-nio-use-host-cc.patch              |  73 -----
 .../icedtea-jdk-powerpc-atomic64.patch             |  65 ----
 .../icedtea-jdk-ppc64-jvm-cfg.patch                |  41 ---
 .../icedtea-jdk-remove-unused-backtrace.patch      |  41 ---
 .../icedtea-jdk-unpack-uclibc.patch                |  10 -
 .../openjdk-7-25b30/icedtea-launcher-stdc++.patch  |  13 -
 .../openjdk-7-25b30/icedtea-libnet-renaming.patch  | 188 -----------
 ...njdk-remove-currency-data-generation-expi.patch |  25 --
 .../openjdk-7-25b30/icedtea-remove_werror.patch    |  16 -
 .../icedtea-shark-arm-linux-cpu-detection.patch    | 113 -------
 .../openjdk-7-25b30/icedtea-unbreak-float.patch    |  18 -
 ...edtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch |  13 -
 .../openjdk-7-25b30/icedtea-zero-hotspotfix.patch  |  37 ---
 recipes-core/openjdk/openjdk-7-25b30/jvm.cfg       |  43 ---
 .../remove-sun.misc.Perf-debug-code.patch          |  47 ---
 .../openjdk/openjdk-7-75b13/build-hacks.patch      |  71 ++++
 .../openjdk-7-75b13/cacao-arm-ucontext.patch       |  24 ++
 .../openjdk/openjdk-7-75b13/cacao-libtoolize.patch |  12 +
 .../openjdk-7-75b13/cacao-loadavg-makefile.patch   |  13 +
 .../openjdk/openjdk-7-75b13/cacao-loadavg.patch    |  27 ++
 .../openjdk/openjdk-7-75b13/fix-checksums.patch    |  28 ++
 .../openjdk-7-75b13/fix_hotspot_crosscompile.patch |  52 +++
 ...cedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch |  19 ++
 .../openjdk-7-75b13/icedtea-crosscompile-fix.patch | 355 ++++++++++++++++++++
 .../icedtea-jdk-nio-use-host-cc.patch              |  74 +++++
 .../icedtea-jdk-rmi-crosscompile.patch             |  13 +
 .../openjdk-7-75b13/icedtea-libnet-renaming.patch  | 236 ++++++++++++++
 ...njdk-remove-currency-data-generation-expi.patch |  25 ++
 .../openjdk-7-75b13/icedtea-remove_werror.patch    |  16 +
 .../icedtea-shark-arm-linux-cpu-detection.patch    | 113 +++++++
 .../openjdk-7-75b13/icedtea-unbreak-float.patch    |  18 +
 ...edtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch |  13 +
 .../openjdk-7-75b13/icedtea-zero-hotspotfix.patch  |  36 ++
 recipes-core/openjdk/openjdk-7-75b13/jvm.cfg       |  43 +++
 .../remove-sun.misc.Perf-debug-code.patch          |  47 +++
 recipes-core/openjdk/openjdk-7-common.inc          |   9 +-
 recipes-core/openjdk/openjdk-7-release-25b30.inc   | 137 --------
 recipes-core/openjdk/openjdk-7-release-75b13.inc   | 102 ++++++
 recipes-core/openjdk/openjdk-7_25b30-2.3.12.bb     |  36 --
 recipes-core/openjdk/openjdk-7_75b13-2.5.4.bb      |  36 ++
 recipes-images/images/java-test-image.bb           |   4 +-
 64 files changed, 1414 insertions(+), 1839 deletions(-)
 create mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-change-to-gdb-debug-format.patch
 delete mode 100644 recipes-core/icedtea/openjdk-7-03b147/icedtea-disable-desktop-dirs.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/build-hacks.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-arm-ucontext.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-libtoolize.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-loadavg-makefile.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-loadavg.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/cacao-update.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/fix-checksums.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/fix_hotspot_crosscompile.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-corba-parallel-make.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-crosscompile-fix.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-fix-xrender.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-dlvsym-uclibc.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-glibc-version.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-isfinte.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-isnanf.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-hotspot-loadavg.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-iconv-uclibc.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-nio-use-host-cc.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-powerpc-atomic64.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-ppc64-jvm-cfg.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-remove-unused-backtrace.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-jdk-unpack-uclibc.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-launcher-stdc++.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-libnet-renaming.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-openjdk-remove-currency-data-generation-expi.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-remove_werror.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-shark-arm-linux-cpu-detection.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-unbreak-float.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/icedtea-zero-hotspotfix.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/jvm.cfg
 delete mode 100644 recipes-core/openjdk/openjdk-7-25b30/remove-sun.misc.Perf-debug-code.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/build-hacks.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-arm-ucontext.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-libtoolize.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg-makefile.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/fix-checksums.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/fix_hotspot_crosscompile.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-nio-use-host-cc.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-rmi-crosscompile.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-libnet-renaming.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-openjdk-remove-currency-data-generation-expi.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-remove_werror.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-shark-arm-linux-cpu-detection.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-unbreak-float.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-zero-hotspotfix.patch
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/jvm.cfg
 create mode 100644 recipes-core/openjdk/openjdk-7-75b13/remove-sun.misc.Perf-debug-code.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-release-25b30.inc
 create mode 100644 recipes-core/openjdk/openjdk-7-release-75b13.inc
 delete mode 100644 recipes-core/openjdk/openjdk-7_25b30-2.3.12.bb
 create mode 100644 recipes-core/openjdk/openjdk-7_75b13-2.5.4.bb

-- 
1.8.1.rc3


