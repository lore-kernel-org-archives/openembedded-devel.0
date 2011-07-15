Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhlWr-0004eG-Pl
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 18:46:18 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Jul 2011 09:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,209,1309762800"; d="scan'208";a="27701900"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.182])
	by azsmga001.ch.intel.com with ESMTP; 15 Jul 2011 09:42:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2011 17:42:02 +0100
Message-Id: <cover.1310748001.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe] [PATCH 0/5] More meta-oe tidying
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
X-List-Received-Date: Fri, 15 Jul 2011 16:46:18 -0000

The following changes since commit 040f75eca217c79fed7b881589d9bb36358cffe1:

  Drop PRIORITY variable (2011-07-14 16:49:27 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib paule/cleanup2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/cleanup2

Paul Eggleton (5):
  classes/kernel.bbclass: sync up with oe-core
  Remove meta-oe/patches/
  libgcrypt: turn into a bbappend
  atk: switch over to a bbappend
  libgpg-error: switch over to a bbappend

 meta-oe/classes/kernel.bbclass                     |   15 ++--
 ...ass-merge-in-OE-improvements-for-mkimage-.patch |  109 --------------------
 meta-oe/patches/kernel-temp                        |   33 ------
 meta-oe/recipes-support/atk/atk.inc                |   10 --
 meta-oe/recipes-support/atk/atk_1.30.0.bb          |   19 ----
 meta-oe/recipes-support/atk/atk_1.32.0.bbappend    |    2 +
 meta-oe/recipes-support/libgcrypt/libgcrypt.inc    |   32 ------
 .../libgcrypt/add-pkgconfig-support.patch          |   49 ---------
 .../recipes-support/libgcrypt/libgcrypt_1.4.6.bb   |    3 -
 .../libgcrypt/libgcrypt_1.4.6.bbappend             |    2 +
 .../libgpg-error/libgpg-error-1.8/pkgconfig.patch  |   53 ----------
 .../libgpg-error/libgpg-error_1.10.bbappend        |    2 +
 .../libgpg-error/libgpg-error_1.8.bb               |   26 -----
 13 files changed, 13 insertions(+), 342 deletions(-)
 delete mode 100644 meta-oe/patches/0001-kernel-bbclass-merge-in-OE-improvements-for-mkimage-.patch
 delete mode 100644 meta-oe/patches/kernel-temp
 delete mode 100644 meta-oe/recipes-support/atk/atk.inc
 delete mode 100644 meta-oe/recipes-support/atk/atk_1.30.0.bb
 create mode 100644 meta-oe/recipes-support/atk/atk_1.32.0.bbappend
 delete mode 100644 meta-oe/recipes-support/libgcrypt/libgcrypt.inc
 delete mode 100644 meta-oe/recipes-support/libgcrypt/libgcrypt/add-pkgconfig-support.patch
 delete mode 100644 meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bb
 create mode 100644 meta-oe/recipes-support/libgcrypt/libgcrypt_1.4.6.bbappend
 delete mode 100644 meta-oe/recipes-support/libgpg-error/libgpg-error-1.8/pkgconfig.patch
 create mode 100644 meta-oe/recipes-support/libgpg-error/libgpg-error_1.10.bbappend
 delete mode 100644 meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb

-- 
1.7.4.1



