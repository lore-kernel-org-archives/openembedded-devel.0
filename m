Return-Path: <Yao.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 83642609C0;
	Mon, 11 Aug 2014 13:57:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7BDvkgc019280
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Aug 2014 06:57:47 -0700 (PDT)
Received: from [128.224.140.163] (128.224.140.163) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 11 Aug 2014 06:57:46 -0700
Message-ID: <53E8CBB3.1080207@windriver.com>
Date: Mon, 11 Aug 2014 09:57:07 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>,
	<openembedded-commits@lists.openembedded.org>
References: <20140810141713.D71AD5030F@opal.openembedded.org>
In-Reply-To: <20140810141713.D71AD5030F@opal.openembedded.org>
X-Originating-IP: [128.224.140.163]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [oe-commits] Martin Jansa : Revert "add support for opendataplane"
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
X-List-Received-Date: Mon, 11 Aug 2014 13:57:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I had noticed this problem so I sent an email before to hold on merging 
this recipe.
Please ignore it until I fix it.

thanks,
yao

------------------------------------------------------------------------

*From:* git@opal.openembedded.org
*Sent:* Sunday, August 10, 2014 10:17AM
*To:* openembedded-commits@lists.openembedded.org
*Subject:* [oe-commits] Martin Jansa : Revert "add support for 
opendataplane"

Module: meta-openembedded.git
Branch: master-next
Commit: 638603cd28bf2fb95278e1239c9e0ca1c73fbc92
URL:    http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=638603cd28bf2fb95278e1239c9e0ca1c73fbc92

Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Fri Aug  8 15:59:02 2014 +0200

Revert "add support for opendataplane"

doesn't build for qemuarm

| arm-oe-linux-gnueabi-libtool: compile:  arm-oe-linux-gnueabi-gcc -march=armv5te -marm -mthumb-interwork
--sysroot=/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -pthread -DODP_DEBUG_PRINT=1 -W -Wall -Werror -Wstrict-prototypes
-Wmissing-prototypes -Wmissing-declarations -Wold-style-definition -Wpointer-arith -Wcast-align -Wnested-externs -Wcast-qual -Wformat-nonliteral
-Wformat-security -Wundef -Wwrite-strings
-I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/opendataplane/0.2+gitAUTOINC+68a45b11e5-r0/git/platform/linux-generic/include
-I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/opendataplane/0.2+gitAUTOINC+68a45b11e5-r0/git/platform/linux-generic/include/api
-I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/opendataplane/0.2+gitAUTOINC+68a45b11e5-r0/git/include -O2 -pipe -g
-feliminate-unused-debug-types -c
/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/opendataplane/0.2+gitAUTOINC+68a45b11e5-r0/git/platform/linux-generic/odp_packet.c -o
odp_packet.o
| {standard input}: Assembler messages:
| {standard input}:40: Error: selected processor does not support ARM mode `dmb st'
| {standard input}:72: Error: selected processor does not support ARM mode `dmb st'
| make[2]: *** [odp_barrier.lo] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory
`/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/opendataplane/0.2+gitAUTOINC+68a45b11e5-r0/build/platform/linux-generic'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/opendataplane/0.2+gitAUTOINC+68a45b11e5-r0/build/platform'
| make: *** [all-recursive] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/opendataplane/0.2+gitAUTOINC+68a45b11e5-r0/temp/log.do_compile.12211)
NOTE: recipe opendataplane-0.2+gitAUTOINC+68a45b11e5-r0: task do_compile: Failed
ERROR: Task 12545 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-networking/recipes-support/opendataplane/opendataplane_git.bb, do_compile) failed
with exit code '1'

This reverts commit e30d6d13f8108a1e3b9bcd8e39b87526e1097f06.

---

  ...inux-dpdk-remove-unnecessary-include-path.patch | 29 ----------------------
  .../opendataplane/opendataplane.inc                | 21 ----------------
  .../opendataplane/opendataplane_0.2.bb             | 25 -------------------
  .../opendataplane/opendataplane_git.bb             | 14 -----------
  4 files changed, 89 deletions(-)

diff --git a/meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk-remove-unnecessary-include-path.patch b/meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk-remove-unnecessary-include-path.patch
deleted file mode 100644
index a0ef7ce..0000000
--- a/meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk-remove-unnecessary-include-path.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 72b8eacc2985f054cadc5d0b48351a658998b8d6 Mon Sep 17 00:00:00 2001
-From: Yao Zhao <yao.zhao@windriver.com>
-Date: Wed, 30 Jul 2014 16:02:14 -0400
-Subject: [PATCH] linux-dpdk: remove unnecessary include path
-
-for dpdk include/arch and include/exec-env is only included
-by generic rte_xxx.h header, can't be included directly.
-
-Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
----
- platform/linux-dpdk/Makefile.am | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/platform/linux-dpdk/Makefile.am b/platform/linux-dpdk/Makefile.am
-index 4aa568f..dfcaadb 100644
---- a/platform/linux-dpdk/Makefile.am
-+++ b/platform/linux-dpdk/Makefile.am
-@@ -12,8 +12,6 @@ PLAT_CFLAGS  = -msse4.2
- if SDK_INSTALL_PATH_
- PLAT_CFLAGS += -include $(SDK_INSTALL_PATH)/include/rte_config.h
- PLAT_CFLAGS += -I$(SDK_INSTALL_PATH)/include
--PLAT_CFLAGS += -I$(SDK_INSTALL_PATH)/include/arch
--PLAT_CFLAGS += -I$(SDK_INSTALL_PATH)/include/exec-env
-
- AM_LDFLAGS  += -L$(SDK_INSTALL_PATH)/lib
- endif
---
-1.9.1
-
diff --git a/meta-networking/recipes-support/opendataplane/opendataplane.inc b/meta-networking/recipes-support/opendataplane/opendataplane.inc
deleted file mode 100644
index c4b184e..0000000
--- a/meta-networking/recipes-support/opendataplane/opendataplane.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Cross platform OpenDataPlane application APIs"
-
-DESCRIPTION = "The OpenDataPlane project has been established to \
-produce an open-source, cross-platform set of application \
-programming interfaces (APIs) for the networking data plane."
-
-HOMEPAGE = "http://www.opendataplane.org"
-SECTION = "networking"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4ccfa994aa96974cfcd39a59faee20a2"
-
-SRC_URI = "git://git.linaro.org/lng/odp.git"
-
-COMPATIBLE_HOST = "^((?!mips).*)$"
-
-PACKAGECONFIG ??= "platform_linux_generic"
-PACKAGECONFIG[netmap] = "--enable-netmap,,,"
-PACKAGECONFIG[platform_linux_generic] = "--with-platform=linux-generic,,,"
-
-S = "${WORKDIR}/git"
-
diff --git a/meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb b/meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb
deleted file mode 100644
index 6f7f601..0000000
--- a/meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require ${BPN}.inc
-
-#odp-0.2 tag
-SRCREV  = "6007d8833a6880abedf98f792586c0cfb9f10de0"
-PV = "0.2"
-
-#0.2 still using pure Makefile
-
-#override the Makefile DESTDIR
-export DESTDIR="${D}${exec_prefix}"
-
-do_install () {
-    oe_runmake install
-
-    #move DESTDIR/share/odp/odp_x usr/bin
-    install -d ${D}${bindir}
-    for i in ${DESTDIR}/share/odp/*; do
-        filename=`basename $i`
-        mv ${DESTDIR}/share/odp/${filename} ${D}${bindir}/${filename}
-    done
-    rm -rf ${DESTDIR}/share
-}
-
-#non standard doc install location
-FILES_${PN}-doc += "${exec_prefix}/doc/*"
diff --git a/meta-networking/recipes-support/opendataplane/opendataplane_git.bb b/meta-networking/recipes-support/opendataplane/opendataplane_git.bb
deleted file mode 100644
index e569daa..0000000
--- a/meta-networking/recipes-support/opendataplane/opendataplane_git.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI += "file://0001-linux-dpdk-remove-unnecessary-include-path.patch"
-
-SRCREV  = "68a45b11e52dbf835a7087c15d503c6b0e5d91ed"
-#8f4f080625e2db810da3f13770ba418c72b08ede will support --with-sdk-install-path
-PV = "0.2+git${SRCPV}"
-
-PACKAGECONFIG[platform_linux_generic] = "--with-platform=linux-generic,,openssl,libcrypto"
-#need meta-intel layer's common/recipes-extended/dpdk/dpdk recipe
-PACKAGECONFIG[platform_linux_dpdk] = '--with-platform=linux-dpdk --with-sdk-install-path="${STAGING_EXECPREFIXDIR}",,dpdk,'
-PACKAGECONFIG[platform_linux_keystone2] = "--with-platform=linux-keystone2,,,"
-
-inherit autotools




