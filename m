Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QpS7e-0001MM-SV
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 23:40:03 +0200
Received: from mizar.localdomain (87.2.250.64) by smtp208.alice.it (8.5.124.08)
	id 4DE64DF10634C653; Fri, 5 Aug 2011 23:30:22 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri,  5 Aug 2011 23:30:13 +0200
Message-Id: <cover.1312578809.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/2] [meta-oe] add klibc infrastructure for crosscompiling
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
X-List-Received-Date: Fri, 05 Aug 2011 21:40:03 -0000

* We don't consider the case of an SDK yet.
*
* from org.openembedded.dev
* reworked in meta-smartphones/meta-zaurus
*
* Klibc builds against kernel headers thuus is machine-specific.
* The crosscompiler, though, is just a perl wrapper around gcc-cross
* so can have the very same arch.
*
* Initial commit for meta-oe
* Some minor packaging issues (klibc-static-utils-dev.ipk and 
* klibc-static-utils-dbg.ipk are empty and should not be packaged)

Andrea Adami (2):
  klibc: initial commit
  klibc.bbclass: shared include for building against klibc

 meta-oe/classes/klibc.bbclass                      |    9 +
 .../recipes-devtools/klibc/klcc-cross_1.5.24.bb    |   33 +
 .../klibc/klibc-1.5.24/dash_readopt.patch          |  111 ++
 .../fstype-sane-vfat-and-jffs2-for-1.5.patch       |   74 +
 .../klibc/klibc-1.5.24/klcc_prefix.patch           |   24 +
 .../klibc/klibc-1.5.24/klibc-config-eabi.patch     |   14 +
 .../klibc/klibc-1.5.24/modprobe.patch              | 1984 ++++++++++++++++++++
 .../klibc/klibc-1.5.24/no_strip.patch              |   36 +
 .../klibc/klibc-1.5.24/socket.h.patch              |   31 +
 .../klibc/klibc-1.5.24/staging.patch               |  153 ++
 .../klibc/klibc-1.5.24/use-env-for-perl.patch      |   25 +
 .../recipes-devtools/klibc/klibc-1.5.24/wc.patch   |  245 +++
 .../klibc/klibc-checksums_1.5.24.inc               |    2 +
 .../klibc/klibc-static-utils_1.5.24.bb             |   17 +
 meta-oe/recipes-devtools/klibc/klibc-utils.inc     |   64 +
 meta-oe/recipes-devtools/klibc/klibc.inc           |   50 +
 meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb     |   40 +
 17 files changed, 2912 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/classes/klibc.bbclass
 create mode 100644 meta-oe/recipes-devtools/klibc/klcc-cross_1.5.24.bb
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/dash_readopt.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/fstype-sane-vfat-and-jffs2-for-1.5.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/klcc_prefix.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/klibc-config-eabi.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/modprobe.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/no_strip.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/socket.h.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/staging.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/use-env-for-perl.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/wc.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-checksums_1.5.24.inc
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-static-utils_1.5.24.bb
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-utils.inc
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc.inc
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb

-- 
1.7.3.4



