Return-Path: <prvs=6640da761=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 3277665CBC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 07:33:14 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqUEAEyN0VWsEApK/2dsb2JhbABdg29pBr9chX2BdgEBAQEBAYELhHUBLSiBFg6IOL81AY9WAQEIIpBbhDMFhyGNfIUEiTKHOYh3iC2EJW8BgUeBBAEBAQ
X-IPAS-Result: AqUEAEyN0VWsEApK/2dsb2JhbABdg29pBr9chX2BdgEBAQEBAYELhHUBLSiBFg6IOL81AY9WAQEIIpBbhDMFhyGNfIUEiTKHOYh3iC2EJW8BgUeBBAEBAQ
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Aug 2015 09:32:22 +0200
Message-ID: <1439796744-6382-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Cc: otavio.salvador@ossystems.com.br
Subject: [meta-java][PATCH 0/2] openjdk-7: switch to IcedTea 2.6.1, 7u85b01
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
X-List-Received-Date: Mon, 17 Aug 2015 07:33:15 -0000
Content-Type: text/plain

This patch series changes the PREFERRED_VERSION to the new OpenJDK 7u85b01 and
removes the old 7u75b13 version.

Richard Leitner (2):
  README: Update PREFERRED_VERSION to new openjdk-7 85b01-2.6.1
  openjdk-7: remove IcedTea 2.5.4, OpenJDK 7u75b13

 README                                             |   2 +-
 .../openjdk/openjdk-7-75b13/build-hacks.patch      |  71 -----
 .../openjdk-7-75b13/cacao-arm-ucontext.patch       |  24 --
 .../openjdk/openjdk-7-75b13/cacao-libtoolize.patch |  12 -
 .../openjdk-7-75b13/cacao-loadavg-makefile.patch   |  13 -
 .../openjdk/openjdk-7-75b13/cacao-loadavg.patch    |  27 --
 .../openjdk/openjdk-7-75b13/fix-checksums.patch    |  28 --
 .../openjdk-7-75b13/fix_hotspot_crosscompile.patch |  52 ---
 ...cedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch |  19 --
 .../openjdk-7-75b13/icedtea-crosscompile-fix.patch | 355 ---------------------
 .../icedtea-jdk-nio-use-host-cc.patch              |  74 -----
 .../icedtea-jdk-rmi-crosscompile.patch             |  13 -
 .../openjdk-7-75b13/icedtea-libnet-renaming.patch  | 236 --------------
 ...njdk-remove-currency-data-generation-expi.patch |  25 --
 .../openjdk-7-75b13/icedtea-remove_werror.patch    |  16 -
 .../icedtea-shark-arm-linux-cpu-detection.patch    | 113 -------
 .../openjdk-7-75b13/icedtea-unbreak-float.patch    |  18 --
 ...edtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch |  13 -
 .../openjdk-7-75b13/icedtea-zero-hotspotfix.patch  |  36 ---
 recipes-core/openjdk/openjdk-7-75b13/jvm.cfg       |  43 ---
 .../remove-sun.misc.Perf-debug-code.patch          |  47 ---
 recipes-core/openjdk/openjdk-7-release-75b13.inc   | 104 ------
 recipes-core/openjdk/openjdk-7_75b13-2.5.4.bb      |  36 ---
 23 files changed, 1 insertion(+), 1376 deletions(-)
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/build-hacks.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-arm-ucontext.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-libtoolize.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg-makefile.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/cacao-loadavg.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/fix-checksums.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/fix_hotspot_crosscompile.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-add-usr-lib-jni-to-DEFAULT_LIBPATH.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-crosscompile-fix.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-nio-use-host-cc.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-jdk-rmi-crosscompile.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-libnet-renaming.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-openjdk-remove-currency-data-generation-expi.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-remove_werror.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-shark-arm-linux-cpu-detection.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-unbreak-float.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-unset-NIO_PLATFORM_CLASSES_ROOT_DIR.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/icedtea-zero-hotspotfix.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/jvm.cfg
 delete mode 100644 recipes-core/openjdk/openjdk-7-75b13/remove-sun.misc.Perf-debug-code.patch
 delete mode 100644 recipes-core/openjdk/openjdk-7-release-75b13.inc
 delete mode 100644 recipes-core/openjdk/openjdk-7_75b13-2.5.4.bb

-- 
2.1.4


