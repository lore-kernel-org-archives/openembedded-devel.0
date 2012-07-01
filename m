Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SlPUY-0004wo-5k
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Jul 2012 21:07:30 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 59507EA040;
	Sun,  1 Jul 2012 21:02:37 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id DEC5B62B3A; Sun,  1 Jul 2012 20:56:23 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Jul 2012 20:56:22 +0200
Message-Id: <1341168983-10756-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][PATCH 0/1] psplash: convert from svn.o-hand.com to git.yoctoproject.org
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
X-List-Received-Date: Sun, 01 Jul 2012 19:07:30 -0000

Hello,

The psplash recipes found in oe-classic were still relying on the
svn.o-hand.com repository. I converted them to use the
git.yoctoproject.org repository instead.

Please note that I chose do that conversion instead of simply rebasing
on the psplash_git.bb recipe found in oe-core because the oe-core
recipe was written to work with newer versions of bitbake that are not
compatible with oe-classic (versions beyond 1.12.0).

The patch that comes as a follow-up of this message is what it's all
about.

Apelete Seketeli (1):
  psplash: convert from svn.o-hand.com to git.yoctoproject.org

 recipes/psplash/psplash-angstrom_git.bb     |   21 +++++++++++++++++++++
 recipes/psplash/psplash-angstrom_svn.bb     |   21 ---------------------
 recipes/psplash/psplash-kaeilos_git.bb      |   18 ++++++++++++++++++
 recipes/psplash/psplash-kaeilos_svn.bb      |   18 ------------------
 recipes/psplash/psplash-omap3pandora_git.bb |   21 +++++++++++++++++++++
 recipes/psplash/psplash-omap3pandora_svn.bb |   21 ---------------------
 recipes/psplash/psplash-ti_git.bb           |   22 ++++++++++++++++++++++
 recipes/psplash/psplash-ti_svn.bb           |   22 ----------------------
 recipes/psplash/psplash.inc                 |    8 ++++----
 recipes/psplash/psplash_git.bb              |   20 ++++++++++++++++++++
 recipes/psplash/psplash_svn.bb              |   19 -------------------
 11 files changed, 106 insertions(+), 105 deletions(-)
 create mode 100644 recipes/psplash/psplash-angstrom_git.bb
 delete mode 100644 recipes/psplash/psplash-angstrom_svn.bb
 create mode 100644 recipes/psplash/psplash-kaeilos_git.bb
 delete mode 100644 recipes/psplash/psplash-kaeilos_svn.bb
 create mode 100644 recipes/psplash/psplash-omap3pandora_git.bb
 delete mode 100644 recipes/psplash/psplash-omap3pandora_svn.bb
 create mode 100644 recipes/psplash/psplash-ti_git.bb
 delete mode 100644 recipes/psplash/psplash-ti_svn.bb
 create mode 100644 recipes/psplash/psplash_git.bb
 delete mode 100644 recipes/psplash/psplash_svn.bb

-- 
1.7.10



