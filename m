Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1Odfr5-0000YI-0W
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 10:49:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 380FC4000C4A9;
	Tue, 27 Jul 2010 10:49:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 309AE4000EC3C;
	Tue, 27 Jul 2010 10:49:26 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXj-gBufudt8; Tue, 27 Jul 2010 10:49:26 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id E61264000C4A9;
	Tue, 27 Jul 2010 10:49:25 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1Odfqa-00007i-5E; Tue, 27 Jul 2010 10:49:12 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jul 2010 10:49:07 +0200
Message-Id: <1280220549-447-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 0/2] last 2 patches to get openjdk build with oe-stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Jul 2010 08:49:46 -0000

From: Henning Heinold <h.heinold@tarent.de>

Hi,

this are the last 2 patches needed to get openjdk build
with oe-stable.

Bye Henning

Henning Heinold (2):
  llvm: backport llvm2.7 from openembedded-dev
  openjdk: backport from openembedded-dev

 conf/checksums.ini                                 |   24 +
 recipes/llvm/llvm-common-native.bb                 |   12 +
 recipes/llvm/llvm-common.bb                        |   14 +
 recipes/llvm/llvm-common/llvm-config               |   10 +
 recipes/llvm/llvm-native.inc                       |   29 +
 recipes/llvm/llvm.inc                              |  134 +-
 recipes/llvm/llvm2.7-native_2.7.bb                 |   12 +
 recipes/llvm/llvm2.7/BX_to_BLX.patch               |   13 +
 recipes/llvm/llvm2.7/arm_ppc.patch                 |  172 +
 recipes/llvm/llvm2.7/r104558-VFPmisc.patch         |   58 +
 recipes/llvm/llvm2.7/r104587-MOVimm32.patch        |  190 +
 .../llvm2.7/r104652-VFPLoadStoreMultiple.patch     |   47 +
 recipes/llvm/llvm2.7/r104653-BFC-BFI.patch         |   31 +
 recipes/llvm/llvm2.7/r97745-llvmPR6480.patch       |   75 +
 recipes/llvm/llvm2.7/rawMOVLRPC.patch              |   61 +
 recipes/llvm/llvm2.7_2.7.bb                        |   47 +
 recipes/openjdk/files/jvm.cfg                      |   41 +
 .../openjdk/openjdk-6-6b18-1.8/build-hacks.patch   |   31 +
 .../cacao-disable-stackbase-check.patch            |   12 +
 .../openjdk-6-6b18-1.8/cacao-vfp-compat.patch      |   37 +
 .../openjdk/openjdk-6-6b18-1.8/fix-llvm-libs.patch |   13 +
 .../fix_hotspot_crosscompile.patch                 |   94 +
 .../icedtea-crosscompile-fix.patch                 |  214 +
 .../icedtea-fix-jar-command.patch                  |   27 +
 .../openjdk-6-6b18-1.8/icedtea-hostbuildcc.patch   |   12 +
 .../icedtea-hotspot-glibc-version.patch            |   23 +
 .../icedtea-hotspot-isfinte.patch                  |   15 +
 .../icedtea-hotspot-isnanf.patch                   |   21 +
 .../icedtea-hotspot-loadavg.patch                  |   28 +
 .../icedtea-jdk-RTLD_NOLOAD.patch                  |   13 +
 .../icedtea-jdk-iconv-uclibc.patch                 |   39 +
 .../icedtea-jdk-remove-unused-backtrace.patch      |   51 +
 .../icedtea-jdk-unpack-uclibc.patch                |   12 +
 .../icedtea-launcher-stdc++.patch                  |   13 +
 .../icedtea-libnet-renaming.patch                  |  148 +
 .../openjdk-6-6b18-1.8/icedtea-remove_werror.patch |   14 +
 .../openjdk-6-6b18-1.8/icedtea-unbreak-float.patch |   18 +
 .../icedtea1.8-pre1.8.1-releasebranch-fixes.patch  | 4784 ++++++++++++++++++++
 .../openjdk-6-6b18-1.8/mkbc_returncode.patch       |   11 +
 .../shark-arm-linux-cpu-detection.patch            |  112 +
 .../shark-build-openjdkdir.patch                   |   13 +
 .../openjdk-6-6b18-1.8/zero-cmpswap-long.patch     |   20 +
 recipes/openjdk/openjdk-6-common.inc               |  530 +++
 recipes/openjdk/openjdk-6-release-6b18.inc         |  104 +
 recipes/openjdk/openjdk-6_6b18-1.8.bb              |    3 +
 45 files changed, 7375 insertions(+), 7 deletions(-)
 create mode 100644 recipes/llvm/llvm-common-native.bb
 create mode 100644 recipes/llvm/llvm-common.bb
 create mode 100644 recipes/llvm/llvm-common/llvm-config
 create mode 100644 recipes/llvm/llvm-native.inc
 create mode 100644 recipes/llvm/llvm2.7-native_2.7.bb
 create mode 100644 recipes/llvm/llvm2.7/BX_to_BLX.patch
 create mode 100644 recipes/llvm/llvm2.7/arm_ppc.patch
 create mode 100644 recipes/llvm/llvm2.7/r104558-VFPmisc.patch
 create mode 100644 recipes/llvm/llvm2.7/r104587-MOVimm32.patch
 create mode 100644 recipes/llvm/llvm2.7/r104652-VFPLoadStoreMultiple.patch
 create mode 100644 recipes/llvm/llvm2.7/r104653-BFC-BFI.patch
 create mode 100644 recipes/llvm/llvm2.7/r97745-llvmPR6480.patch
 create mode 100644 recipes/llvm/llvm2.7/rawMOVLRPC.patch
 create mode 100644 recipes/llvm/llvm2.7_2.7.bb
 create mode 100644 recipes/openjdk/files/jvm.cfg
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/build-hacks.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/cacao-disable-stackbase-check.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/cacao-vfp-compat.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/fix-llvm-libs.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/fix_hotspot_crosscompile.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-crosscompile-fix.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-fix-jar-command.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hostbuildcc.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-glibc-version.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-isfinte.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-isnanf.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-hotspot-loadavg.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-RTLD_NOLOAD.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-iconv-uclibc.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-remove-unused-backtrace.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-jdk-unpack-uclibc.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-launcher-stdc++.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-libnet-renaming.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-remove_werror.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea-unbreak-float.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/icedtea1.8-pre1.8.1-releasebranch-fixes.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/mkbc_returncode.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/shark-arm-linux-cpu-detection.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/shark-build-openjdkdir.patch
 create mode 100644 recipes/openjdk/openjdk-6-6b18-1.8/zero-cmpswap-long.patch
 create mode 100644 recipes/openjdk/openjdk-6-common.inc
 create mode 100644 recipes/openjdk/openjdk-6-release-6b18.inc
 create mode 100644 recipes/openjdk/openjdk-6_6b18-1.8.bb



