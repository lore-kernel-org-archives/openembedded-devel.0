Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1R136n-0007jG-Vr
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 23:23:06 +0200
Received: from mizar.localdomain (87.14.251.43) by smtp207.alice.it
	(8.5.124.08) id 4DFA189A072C634D; Tue, 6 Sep 2011 23:18:04 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue,  6 Sep 2011 23:17:49 +0200
Message-Id: <cover.1315343405.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe][PATCH 0/2] klibc fixes and updates
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
X-List-Received-Date: Tue, 06 Sep 2011 21:23:06 -0000

* Fixes packaging and updates to 1.5.25 in preparation for klibc-2.0.
* We discard two OE patches:
*   nostrip patch was necesssary only during development
*   socket.h patch went upstream

Andrea Adami (2):
  klibc_1.5.24: remove nostrip patch and fix packaging of klibc-utils
  klibc: upgrade 1.5.24 to 1.5.25

 .../recipes-devtools/klibc/klcc-cross_1.5.24.bb    |   33 -
 .../recipes-devtools/klibc/klcc-cross_1.5.25.bb    |   33 +
 .../klibc/klibc-1.5.24/dash_readopt.patch          |  111 --
 .../fstype-sane-vfat-and-jffs2-for-1.5.patch       |   74 -
 .../klibc/klibc-1.5.24/klcc_prefix.patch           |   24 -
 .../klibc/klibc-1.5.24/klibc-config-eabi.patch     |   14 -
 .../klibc/klibc-1.5.24/modprobe.patch              | 1984 --------------------
 .../klibc/klibc-1.5.24/no_strip.patch              |   36 -
 .../klibc/klibc-1.5.24/socket.h.patch              |   31 -
 .../klibc/klibc-1.5.24/staging.patch               |  153 --
 .../klibc/klibc-1.5.24/use-env-for-perl.patch      |   25 -
 .../recipes-devtools/klibc/klibc-1.5.24/wc.patch   |  245 ---
 .../klibc/klibc-1.5.25/dash_readopt.patch          |  111 ++
 .../fstype-sane-vfat-and-jffs2-for-1.5.patch       |   74 +
 .../klibc/klibc-1.5.25/klcc_prefix.patch           |   24 +
 .../klibc/klibc-1.5.25/klibc-config-eabi.patch     |   14 +
 .../klibc/klibc-1.5.25/modprobe.patch              | 1984 ++++++++++++++++++++
 .../klibc/klibc-1.5.25/staging.patch               |  153 ++
 .../klibc/klibc-1.5.25/use-env-for-perl.patch      |   25 +
 .../recipes-devtools/klibc/klibc-1.5.25/wc.patch   |  245 +++
 .../klibc/klibc-checksums_1.5.24.inc               |    2 -
 .../klibc/klibc-checksums_1.5.25.inc               |    2 +
 .../klibc/klibc-static-utils_1.5.24.bb             |   17 -
 .../klibc/klibc-static-utils_1.5.25.bb             |   17 +
 meta-oe/recipes-devtools/klibc/klibc-utils.inc     |   12 +-
 .../recipes-devtools/klibc/klibc-utils_1.5.25.bb   |   17 +
 meta-oe/recipes-devtools/klibc/klibc.inc           |    2 -
 meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb     |   40 -
 meta-oe/recipes-devtools/klibc/klibc_1.5.25.bb     |   35 +
 29 files changed, 2743 insertions(+), 2794 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/klibc/klcc-cross_1.5.24.bb
 create mode 100644 meta-oe/recipes-devtools/klibc/klcc-cross_1.5.25.bb
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/dash_readopt.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/fstype-sane-vfat-and-jffs2-for-1.5.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/klcc_prefix.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/klibc-config-eabi.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/modprobe.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/no_strip.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/socket.h.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/staging.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/use-env-for-perl.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.24/wc.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/dash_readopt.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/fstype-sane-vfat-and-jffs2-for-1.5.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/klcc_prefix.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/klibc-config-eabi.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/modprobe.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/staging.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/use-env-for-perl.patch
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-1.5.25/wc.patch
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-checksums_1.5.24.inc
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-checksums_1.5.25.inc
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc-static-utils_1.5.24.bb
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-static-utils_1.5.25.bb
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc-utils_1.5.25.bb
 delete mode 100644 meta-oe/recipes-devtools/klibc/klibc_1.5.24.bb
 create mode 100644 meta-oe/recipes-devtools/klibc/klibc_1.5.25.bb

-- 
1.7.3.4



