Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZxO-0006V7-9X
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:07:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 9885740148CAC;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 8EA4540148CAA;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wK15iPUajMzJ; Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 428B740064C01;
	Wed, 21 Jul 2010 16:07:22 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZx9-0006TE-W1; Wed, 21 Jul 2010 16:07:20 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:06:51 +0200
Message-Id: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 00/21] second round of patches needed for openjdk for oe-stable
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
X-List-Received-Date: Wed, 21 Jul 2010 14:08:01 -0000
X-List-Received-Date: Wed, 21 Jul 2010 14:08:01 -0000
X-List-Received-Date: Wed, 21 Jul 2010 14:08:01 -0000

From: Henning Heinold <h.heinold@tarent.de>

Hi,

sorry for the spam bu this is the second round of patches which are needed to get openjdk
into openembedded-stable.

Bye Henning

Henning Heinold (21):
  ant: backport from openembedded-dev
  bcel: backport from openembedded-dev
  rhino: backpoprt from openembedded-dev
  jacl: backport from openembedded-dev
  jlex: backport from openembedded-stable
  cup: backport from openembedded-dev
  classpathx: backport from openembedded-dev
  jakarta-commons: backport from openembedded-dev
  jakarta-libs: backport from openembedded-dev
  xml-commons: backport from openembedded-dev
  jcraft: backport from openembedded-dev
  xerces-j: backport from openembedded-dev
  xalan-j: backport from openembedded-dev
  jdepend: backport from openembedded-dev
  junit: backport from openembedded-dev
  fastjar: backport 0.98 version from openembedded-dev
  giflib: provide native recipe
  jamvm: backport version 1.5.3 from openembedded-dev
  inetlib: backport from openembedded-dev
  icedtea6-native: backported from openembedded-dev
  cacaoh-openjdk-native: backported from openembedded-dev

 conf/checksums.ini                                 |   27 +
 recipes/ant/ant-native_1.7.1.bb                    |   64 ++
 recipes/ant/files/ant                              |   10 +
 recipes/bcel/bcel-native_5.2.bb                    |    6 +
 recipes/bcel/bcel_5.2.bb                           |   19 +
 recipes/cacao/cacaoh-openjdk-native.inc            |   31 +
 recipes/cacao/cacaoh-openjdk-native_0.99.4.bb      |    8 +
 recipes/classpath/files/toolwrapper-exithook.patch |   46 +
 recipes/classpath/inetlib-1.1.1/datadir_java.patch |   23 +
 recipes/classpath/inetlib-native_1.1.1.bb          |    3 +
 recipes/classpath/inetlib_1.1.1.bb                 |   30 +
 recipes/classpathx/gnujaf-1.1.1/datadir_java.patch |   23 +
 recipes/classpathx/gnujaf-native_1.1.1.bb          |    3 +
 recipes/classpathx/gnujaf_1.1.1.bb                 |   35 +
 .../classpathx/gnumail-1.1.2/datadir_java.patch    |   25 +
 recipes/classpathx/gnumail-native_1.1.2.bb         |   10 +
 recipes/classpathx/gnumail_1.1.2.bb                |   42 +
 recipes/cup/cup-native_0.10k.bb                    |   24 +
 recipes/cup/cup_0.10k.bb                           |   39 +
 recipes/cup/files/cup                              |    5 +
 recipes/fastjar/fastjar-native.inc                 |   18 +
 recipes/fastjar/fastjar-native_0.98.bb             |    4 +
 recipes/fastjar/fastjar.inc                        |   18 +
 recipes/fastjar/fastjar_0.98.bb                    |    1 +
 recipes/fastjar/files/jartool.patch                |  112 ++
 recipes/giflib/giflib-native_4.1.6.bb              |    3 +
 .../icedtea6-native-1.7.3/build-hacks-native.patch |   15 +
 .../disable-library-checks.patch                   |  141 +++
 .../icedtea-ecj-disable-compilation.patch          |  513 +++++++++
 .../icedtea-ecj-disable-sanitychecks.patch         |   76 ++
 .../icedtea-ecj-fix-freetype.patch                 |   13 +
 .../icedtea-ecj-fix-zlib.patch                     |   61 ++
 .../icedtea-fix-jar-command.patch                  |   27 +
 .../icedtea-hotspot-make-arch-sane-for-x86.patch   | 1130 ++++++++++++++++++++
 .../icedtea6-native-1.7.3/icedtea-javac-in.patch   |   28 +
 .../icedtea-jdk-sane-x86-arch.patch                |  240 +++++
 .../icedtea-sane-x86-arch-name.patch               |   47 +
 .../icedtea-unbreak-float.patch                    |   18 +
 recipes/icedtea/icedtea6-native_1.7.3.bb           |  233 ++++
 recipes/jacl/jacl-native_1.4.1.bb                  |    4 +
 recipes/jacl/jacl_1.4.1.bb                         |   20 +
 recipes/jakarta-commons/commons-beanutils_1.8.0.bb |   10 +
 recipes/jakarta-commons/commons-cli_1.1.bb         |    7 +
 recipes/jakarta-commons/commons-codec_1.3.bb       |    7 +
 .../jakarta-commons/commons-collections3_3.2.1.bb  |    8 +
 .../jakarta-commons/commons-collections_2.1.1.bb   |    6 +
 .../jakarta-commons/commons-configuration_1.5.bb   |   19 +
 recipes/jakarta-commons/commons-digester_1.8.bb    |   12 +
 recipes/jakarta-commons/commons-discovery_0.4.bb   |   10 +
 recipes/jakarta-commons/commons-el_1.0.bb          |   14 +
 .../jakarta-commons/commons-fileupload_1.2.1.bb    |   14 +
 recipes/jakarta-commons/commons-httpclient_3.1.bb  |   13 +
 recipes/jakarta-commons/commons-io_1.4.bb          |    5 +
 recipes/jakarta-commons/commons-jxpath_1.3.bb      |   10 +
 recipes/jakarta-commons/commons-lang_2.4.bb        |    6 +
 .../commons-logging-native_1.1.1.bb                |    6 +
 recipes/jakarta-commons/commons-logging_1.1.1.bb   |   12 +
 .../jakarta-commons/commons-net-native_1.4.1.bb    |    7 +
 recipes/jakarta-commons/commons-net_1.4.1.bb       |   14 +
 recipes/jakarta-commons/commons-pool_1.4.bb        |    5 +
 recipes/jakarta-commons/jakarta-commons.inc        |   62 ++
 .../avalon-framework-api-native_4.3.bb             |    4 +
 recipes/jakarta-libs/avalon-framework-api_4.3.bb   |   28 +
 recipes/jakarta-libs/bsf-native_2.4.0.bb           |    8 +
 recipes/jakarta-libs/bsf_2.4.0.bb                  |   24 +
 recipes/jakarta-libs/log4j1.2-native_1.2.15.bb     |    6 +
 recipes/jakarta-libs/log4j1.2_1.2.15.bb            |   27 +
 recipes/jakarta-libs/logkit-native_1.2.2.bb        |    6 +
 recipes/jakarta-libs/logkit_1.2.2.bb               |   25 +
 recipes/jakarta-libs/oro-native_2.0.8.bb           |    4 +
 recipes/jakarta-libs/oro_2.0.8.bb                  |   19 +
 recipes/jakarta-libs/poi_3.0.bb                    |   24 +
 recipes/jakarta-libs/regexp-native_1.5.bb          |    4 +
 recipes/jakarta-libs/regexp_1.5.bb                 |   19 +
 recipes/jamvm/files/jamvm-1.5.3-jni_h-noinst.patch |   13 +
 recipes/jamvm/jamvm-native.inc                     |   10 +-
 recipes/jamvm/jamvm-native_1.5.3.bb                |    8 +
 recipes/jcraft/jsch-native_0.1.40.bb               |    8 +
 recipes/jcraft/jsch_0.1.40.bb                      |   21 +
 recipes/jcraft/jzlib-native_1.0.7.bb               |    6 +
 recipes/jcraft/jzlib_1.0.7.bb                      |   18 +
 recipes/jdepend/jdepend-native_2.9.bb              |    4 +
 recipes/jdepend/jdepend_2.9.bb                     |   20 +
 recipes/jlex/files/jlex                            |    5 +
 recipes/jlex/jlex-native_1.2.6.bb                  |   23 +
 recipes/jlex/jlex_1.2.6.bb                         |   39 +
 recipes/junit/junit-native_3.8.2.bb                |    4 +
 recipes/junit/junit4-native_4.3.1.bb               |    4 +
 recipes/junit/junit4_4.3.1.bb                      |   23 +
 recipes/junit/junit_3.8.2.bb                       |   34 +
 recipes/mozilla/rhino-native_1.7r1.bb              |    5 +
 recipes/mozilla/rhino/rhino                        |    8 +
 recipes/mozilla/rhino/rhino-jsc                    |    8 +
 recipes/mozilla/rhino_1.7r1.bb                     |   42 +
 recipes/xalan-j/xalan-j-native_2.7.1.bb            |   14 +
 recipes/xalan-j/xalan-j_2.7.1.bb                   |   57 +
 recipes/xerces-j/xerces-j-native_2.9.1.bb          |    8 +
 recipes/xerces-j/xerces-j_2.9.1.bb                 |   45 +
 recipes/xml-commons/jaxp1.3-native_1.3.04.bb       |    4 +
 recipes/xml-commons/jaxp1.3_1.3.04.bb              |   24 +
 .../xml-commons-resolver1.1-native_1.2.bb          |    6 +
 recipes/xml-commons/xml-commons-resolver1.1_1.2.bb |   35 +
 102 files changed, 4133 insertions(+), 3 deletions(-)
 create mode 100644 recipes/ant/ant-native_1.7.1.bb
 create mode 100755 recipes/ant/files/ant
 create mode 100644 recipes/bcel/bcel-native_5.2.bb
 create mode 100644 recipes/bcel/bcel_5.2.bb
 create mode 100644 recipes/cacao/cacaoh-openjdk-native.inc
 create mode 100644 recipes/cacao/cacaoh-openjdk-native_0.99.4.bb
 create mode 100644 recipes/classpath/files/toolwrapper-exithook.patch
 create mode 100644 recipes/classpath/inetlib-1.1.1/datadir_java.patch
 create mode 100644 recipes/classpath/inetlib-native_1.1.1.bb
 create mode 100644 recipes/classpath/inetlib_1.1.1.bb
 create mode 100644 recipes/classpathx/gnujaf-1.1.1/datadir_java.patch
 create mode 100644 recipes/classpathx/gnujaf-native_1.1.1.bb
 create mode 100644 recipes/classpathx/gnujaf_1.1.1.bb
 create mode 100644 recipes/classpathx/gnumail-1.1.2/datadir_java.patch
 create mode 100644 recipes/classpathx/gnumail-native_1.1.2.bb
 create mode 100644 recipes/classpathx/gnumail_1.1.2.bb
 create mode 100644 recipes/cup/cup-native_0.10k.bb
 create mode 100644 recipes/cup/cup_0.10k.bb
 create mode 100755 recipes/cup/files/cup
 create mode 100644 recipes/fastjar/fastjar-native.inc
 create mode 100644 recipes/fastjar/fastjar-native_0.98.bb
 create mode 100644 recipes/fastjar/fastjar.inc
 create mode 100644 recipes/fastjar/fastjar_0.98.bb
 create mode 100644 recipes/fastjar/files/jartool.patch
 create mode 100644 recipes/giflib/giflib-native_4.1.6.bb
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/build-hacks-native.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/disable-library-checks.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-disable-compilation.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-disable-sanitychecks.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-fix-freetype.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-ecj-fix-zlib.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-fix-jar-command.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-hotspot-make-arch-sane-for-x86.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-javac-in.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-jdk-sane-x86-arch.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-sane-x86-arch-name.patch
 create mode 100644 recipes/icedtea/icedtea6-native-1.7.3/icedtea-unbreak-float.patch
 create mode 100644 recipes/icedtea/icedtea6-native_1.7.3.bb
 create mode 100644 recipes/jacl/jacl-native_1.4.1.bb
 create mode 100644 recipes/jacl/jacl_1.4.1.bb
 create mode 100644 recipes/jakarta-commons/commons-beanutils_1.8.0.bb
 create mode 100644 recipes/jakarta-commons/commons-cli_1.1.bb
 create mode 100644 recipes/jakarta-commons/commons-codec_1.3.bb
 create mode 100644 recipes/jakarta-commons/commons-collections3_3.2.1.bb
 create mode 100644 recipes/jakarta-commons/commons-collections_2.1.1.bb
 create mode 100644 recipes/jakarta-commons/commons-configuration_1.5.bb
 create mode 100644 recipes/jakarta-commons/commons-digester_1.8.bb
 create mode 100644 recipes/jakarta-commons/commons-discovery_0.4.bb
 create mode 100644 recipes/jakarta-commons/commons-el_1.0.bb
 create mode 100644 recipes/jakarta-commons/commons-fileupload_1.2.1.bb
 create mode 100644 recipes/jakarta-commons/commons-httpclient_3.1.bb
 create mode 100644 recipes/jakarta-commons/commons-io_1.4.bb
 create mode 100644 recipes/jakarta-commons/commons-jxpath_1.3.bb
 create mode 100644 recipes/jakarta-commons/commons-lang_2.4.bb
 create mode 100644 recipes/jakarta-commons/commons-logging-native_1.1.1.bb
 create mode 100644 recipes/jakarta-commons/commons-logging_1.1.1.bb
 create mode 100644 recipes/jakarta-commons/commons-net-native_1.4.1.bb
 create mode 100644 recipes/jakarta-commons/commons-net_1.4.1.bb
 create mode 100644 recipes/jakarta-commons/commons-pool_1.4.bb
 create mode 100644 recipes/jakarta-commons/jakarta-commons.inc
 create mode 100644 recipes/jakarta-libs/avalon-framework-api-native_4.3.bb
 create mode 100644 recipes/jakarta-libs/avalon-framework-api_4.3.bb
 create mode 100644 recipes/jakarta-libs/bsf-native_2.4.0.bb
 create mode 100644 recipes/jakarta-libs/bsf_2.4.0.bb
 create mode 100644 recipes/jakarta-libs/log4j1.2-native_1.2.15.bb
 create mode 100644 recipes/jakarta-libs/log4j1.2_1.2.15.bb
 create mode 100644 recipes/jakarta-libs/logkit-native_1.2.2.bb
 create mode 100644 recipes/jakarta-libs/logkit_1.2.2.bb
 create mode 100644 recipes/jakarta-libs/oro-native_2.0.8.bb
 create mode 100644 recipes/jakarta-libs/oro_2.0.8.bb
 create mode 100644 recipes/jakarta-libs/poi_3.0.bb
 create mode 100644 recipes/jakarta-libs/regexp-native_1.5.bb
 create mode 100644 recipes/jakarta-libs/regexp_1.5.bb
 create mode 100644 recipes/jamvm/files/jamvm-1.5.3-jni_h-noinst.patch
 create mode 100644 recipes/jamvm/jamvm-native_1.5.3.bb
 create mode 100644 recipes/jcraft/jsch-native_0.1.40.bb
 create mode 100644 recipes/jcraft/jsch_0.1.40.bb
 create mode 100644 recipes/jcraft/jzlib-native_1.0.7.bb
 create mode 100644 recipes/jcraft/jzlib_1.0.7.bb
 create mode 100644 recipes/jdepend/jdepend-native_2.9.bb
 create mode 100644 recipes/jdepend/jdepend_2.9.bb
 create mode 100755 recipes/jlex/files/jlex
 create mode 100644 recipes/jlex/jlex-native_1.2.6.bb
 create mode 100644 recipes/jlex/jlex_1.2.6.bb
 create mode 100644 recipes/junit/junit-native_3.8.2.bb
 create mode 100644 recipes/junit/junit4-native_4.3.1.bb
 create mode 100644 recipes/junit/junit4_4.3.1.bb
 create mode 100644 recipes/junit/junit_3.8.2.bb
 create mode 100644 recipes/mozilla/rhino-native_1.7r1.bb
 create mode 100644 recipes/mozilla/rhino/rhino
 create mode 100644 recipes/mozilla/rhino/rhino-jsc
 create mode 100644 recipes/mozilla/rhino_1.7r1.bb
 create mode 100644 recipes/xalan-j/xalan-j-native_2.7.1.bb
 create mode 100644 recipes/xalan-j/xalan-j_2.7.1.bb
 create mode 100644 recipes/xerces-j/xerces-j-native_2.9.1.bb
 create mode 100644 recipes/xerces-j/xerces-j_2.9.1.bb
 create mode 100644 recipes/xml-commons/jaxp1.3-native_1.3.04.bb
 create mode 100644 recipes/xml-commons/jaxp1.3_1.3.04.bb
 create mode 100644 recipes/xml-commons/xml-commons-resolver1.1-native_1.2.bb
 create mode 100644 recipes/xml-commons/xml-commons-resolver1.1_1.2.bb



