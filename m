Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UOGRK-0001Bb-SP
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 01:53:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Apr 2013 16:34:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,418,1363158000"; d="scan'208";a="313153702"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.194])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2013 16:35:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 00:35:39 +0100
Message-Id: <cover.1365204818.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 0/4] Clean up recipes
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
X-List-Received-Date: Fri, 05 Apr 2013 23:53:04 -0000

Drop some items that should no longer be in meta-oe.


The following changes since commit cbe69cab46335b48de85001f7dd07da765ba8b7b:

  packagegroup-xfce-extended: add xfce4-closebutton-plugin (2013-04-04 08:14:22 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib paule/cleanup6
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/cleanup6

Paul Eggleton (4):
  libmad: remove
  icon-naming-utils: remove
  packagegroup-qte-toolchain-target: remove bbappend
  qt4: remove bbappends

 .../icon-naming-utils/icon-naming-utils_0.8.90.bb  |   23 -
 .../libmad/files/add-pkgconfig.patch               |   68 -
 .../files/libmad-0.15.1b-avr32-optimization.patch  | 2922 --------------------
 .../libmad/files/mad-mips-h-constraint.patch       |   70 -
 meta-oe/recipes-multimedia/libmad/files/mad.diff   |   24 -
 .../libmad-0.15.1b/obsolete_automake_macros.patch  |   14 -
 .../recipes-multimedia/libmad/libmad_0.15.1b.bb    |   38 -
 .../packagegroup-qte-toolchain-target.bbappend     |    6 -
 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend |    6 -
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend |    6 -
 10 files changed, 3177 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
 delete mode 100644 meta-oe/recipes-multimedia/libmad/files/add-pkgconfig.patch
 delete mode 100644 meta-oe/recipes-multimedia/libmad/files/libmad-0.15.1b-avr32-optimization.patch
 delete mode 100644 meta-oe/recipes-multimedia/libmad/files/mad-mips-h-constraint.patch
 delete mode 100644 meta-oe/recipes-multimedia/libmad/files/mad.diff
 delete mode 100644 meta-oe/recipes-multimedia/libmad/libmad-0.15.1b/obsolete_automake_macros.patch
 delete mode 100644 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
 delete mode 100644 meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend

-- 
1.7.10.4



