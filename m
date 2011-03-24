Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Q2mC2-0007Lo-C1
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:11:52 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Q2mAC-0002Q5-Jn by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:09:31 +0100
Received: from stefan by excalibur.local with local (Exim 4.74)
	(envelope-from <stefan@excalibur.local>) id 1Q2mAA-0008JI-Pp
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 16:09:26 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 16:09:26 +0100
Message-Id: <cover.1300979039.git.stefan@buglabs.net>
X-Mailer: git-send-email 1.7.4.1
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: [PATCH 2011.03-maintenance 0/7] Pull request for openjdk-6 and bug20 changes
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
X-List-Received-Date: Thu, 24 Mar 2011 15:11:56 -0000

From: Stefan Schmidt <stefan@buglabs.net>

Hello.

Tom, please pull these openjdk-6 changes originally done by Henning and one
bug20 update from Denis. I tested them in my private build for Buglabs and
especially the openjdk changes are fixing a lot of problems for me.

Pull URL: git://github.com/Stefan-Schmidt/openembedded
  Branch: for-2011.03
  Browse: https://github.com/Stefan-Schmidt/openembedded/commit/for-2011.03

Thanks,
    Stefan Schmidt <stefan@buglabs.net>
---


Denis 'GNUtoo' Carikli (1):
  bug20: add wifi and bluetooth to MACHINE_FEATURES

Henning Heinold (6):
  openjdk: use qemu now for the awt sizer binary too
  cacao-hg: update to latest revision
  icedtea6-native: update to 1.7.10 version
  cacao-native: bumpg PR as sugessted by khem
  angstrom-jalimo: use cacao-native hg version for javac-native
  sane-toolchain-java: switch to cacao-native here too

 conf/distro/include/angstrom-jalimo.conf           |    7 ++--
 conf/distro/include/sane-toolchain-java.inc        |    4 +-
 conf/machine/bug20.conf                            |    2 +-
 recipes/cacao/cacao-native_hg.bb                   |    4 +-
 .../build-hacks-native.patch                       |    0
 .../disable-library-checks.patch                   |    0
 .../icedtea-ecj-disable-compilation.patch          |    0
 .../icedtea-ecj-fix-freetype.patch                 |    0
 .../icedtea-ecj-fix-zlib.patch                     |    0
 .../icedtea-fix-jar-path.patch                     |    0
 .../icedtea-hotspot-make-arch-sane-for-x86.patch   |    0
 .../icedtea-javac-in.patch                         |    0
 .../icedtea-jdk-sane-x86-arch.patch                |    0
 .../icedtea-sane-x86-arch-name.patch               |    0
 .../icedtea-unbreak-float.patch                    |    0
 .../icedtea-jdk-build-sizer-32-on-amd64.patch      |   36 --------------------
 ...6-native_1.7.6.bb => icedtea6-native_1.7.10.bb} |    5 +--
 .../icedtea-crosscompile-fix.patch                 |   24 +++++++------
 recipes/openjdk/openjdk-6-common.inc               |    8 +----
 19 files changed, 24 insertions(+), 66 deletions(-)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/build-hacks-native.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/disable-library-checks.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-ecj-disable-compilation.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-ecj-fix-freetype.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-ecj-fix-zlib.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-fix-jar-path.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-hotspot-make-arch-sane-for-x86.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-javac-in.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-jdk-sane-x86-arch.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-sane-x86-arch-name.patch (100%)
 rename recipes/icedtea/{icedtea6-native-1.7.6 => icedtea6-native-1.7.10}/icedtea-unbreak-float.patch (100%)
 delete mode 100644 recipes/icedtea/icedtea6-native-1.7.6/icedtea-jdk-build-sizer-32-on-amd64.patch
 rename recipes/icedtea/{icedtea6-native_1.7.6.bb => icedtea6-native_1.7.10.bb} (86%)

-- 
1.7.4.1



