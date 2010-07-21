Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1Obaae-0006mx-RJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:48:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 33A564000786E;
	Wed, 21 Jul 2010 16:47:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 2AD2B4018C539;
	Wed, 21 Jul 2010 16:47:58 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJVT9SflZ1Fl; Wed, 21 Jul 2010 16:47:58 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 0ADDB4000786E;
	Wed, 21 Jul 2010 16:47:58 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObaaR-0001Do-HL; Wed, 21 Jul 2010 16:47:55 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:47:47 +0200
Message-Id: <1279723669-3239-1-git-send-email-heinold@inf.fu-berlin.de>
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
Subject: [PATCH 0/2] updated two patches for second round of openjdk stable transition
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
X-List-Received-Date: Wed, 21 Jul 2010 14:48:10 -0000

From: Henning Heinold <h.heinold@tarent.de>

Hi agian,

I made 2 mistakes in the patches.
So here they are updated.

Bye Henning

Henning Heinold (2):
  icedtea6-native: backported from openembedded-dev
  cacaoh-openjdk-native: backported from openembedded-dev

 conf/checksums.ini                                 |   12 +
 recipes/cacao/cacaoh-openjdk-native.inc            |   31 +
 recipes/cacao/cacaoh-openjdk-native_0.99.4.bb      |    8 +
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
 16 files changed, 2593 insertions(+), 0 deletions(-)
 create mode 100644 recipes/cacao/cacaoh-openjdk-native.inc
 create mode 100644 recipes/cacao/cacaoh-openjdk-native_0.99.4.bb
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



