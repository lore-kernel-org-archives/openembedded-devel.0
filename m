Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SmqCK-0003ax-MZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 19:50:36 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 81409EA042
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2012 19:45:13 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 147B1604BD; Thu,  5 Jul 2012 19:39:33 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 19:39:18 +0200
Message-Id: <cover.1341438914.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10
Subject: [PATCH 00/14][2011.03-maintenance] Pull request 20120705
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
X-List-Received-Date: Thu, 05 Jul 2012 17:50:36 -0000

Hello,

The patches that come as a follow-up of this message fix build issues
for the muffinman-image recipe. This is the result of rebasing them
from master and testing that the recipes still build.
Please pull this commit into 2011.03-maintenance branch.

The following changes since commit 19af5b608b3c69dcd73501402fdba3ca2d16e7b2:

  classes/mirrors.bbclass: update debian snapshot mirror url (2012-06-19 07:52:20 -0700)

are available in the git repository at:

  git://seketeli.net/~apelete/oe.git muffinman-image-fix

Apelete Seketeli (14):
  opkg-utils: rebase on oe-core recipe
  util-linux-ng: update SRC_URI to kernel.org valid URI
  libecj-bootstrap_3.6.1: Update SRC_URI to archive.eclipse.org
  udev/acl_2.2.49: update recipe SRC_URI
  udev/attr_2.4.44: update recipe SRC_URI
  udev: update SRC_URI of multiple recipes
  task-muffinman: remove phoneme-advanced-foundation
  bluez4_4.42: update checksum values
  gtk+: Rebase gtk+-2.20.1/no-demos.patch
  gtk+: Add no-test-inline-pixbufs.patch to gtk+-2.20.1
  openssl_1.0.0e: fix build issue for hosts without ipv6
  xcursor-transparent-theme_0.1.1: update SRC_URI
  echinus_0.4.3.2: update SRC_URI
  psplash: convert from svn.o-hand.com to git.yoctoproject.org

 recipes/bluez/bluez4_4.42.bb                       |    4 +-
 recipes/echinus/echinus_0.4.3.2.bb                 |    2 +-
 recipes/ecj/libecj-bootstrap_3.6.1.bb              |    2 +-
 recipes/gtk+/gtk+-2.20.1/no-demos.patch            |    7 +--
 .../gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch  |   22 ++++++++
 recipes/gtk+/gtk+_2.20.1.bb                        |    1 +
 recipes/openssl/openssl.inc                        |    5 +-
 .../opkg-utils/index-ignore-filenotfound.patch     |   54 --------------------
 recipes/opkg-utils/opkg-utils/mtime-int.patch      |   27 ----------
 .../{opkg-utils_svn.bb => opkg-utils_git.bb}       |   19 +++----
 ...ash-angstrom_svn.bb => psplash-angstrom_git.bb} |    5 +-
 ...plash-kaeilos_svn.bb => psplash-kaeilos_git.bb} |    6 +--
 ...3pandora_svn.bb => psplash-omap3pandora_git.bb} |    5 +-
 .../{psplash-ti_svn.bb => psplash-ti_git.bb}       |    5 +-
 recipes/psplash/psplash.inc                        |    8 +--
 recipes/psplash/{psplash_svn.bb => psplash_git.bb} |    5 +-
 recipes/tasks/task-muffinman.bb                    |    2 +-
 recipes/udev/acl_2.2.49.bb                         |    2 +-
 recipes/udev/attr_2.4.44.bb                        |    2 +-
 recipes/udev/udev_151.bb                           |    2 +-
 recipes/udev/udev_154.bb                           |    2 +-
 recipes/udev/udev_162.bb                           |    2 +-
 recipes/udev/udev_165.bb                           |    2 +-
 recipes/util-linux-ng/util-linux-ng.inc            |    2 +-
 .../xcursor-transparent-theme_0.1.1.bb             |    2 +-
 25 files changed, 68 insertions(+), 127 deletions(-)
 create mode 100644 recipes/gtk+/gtk+-2.20.1/no-test-inline-pixbufs.patch
 delete mode 100644 recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
 delete mode 100644 recipes/opkg-utils/opkg-utils/mtime-int.patch
 rename recipes/opkg-utils/{opkg-utils_svn.bb => opkg-utils_git.bb} (44%)
 rename recipes/psplash/{psplash-angstrom_svn.bb => psplash-angstrom_git.bb} (85%)
 rename recipes/psplash/{psplash-kaeilos_svn.bb => psplash-kaeilos_git.bb} (77%)
 rename recipes/psplash/{psplash-omap3pandora_svn.bb => psplash-omap3pandora_git.bb} (85%)
 rename recipes/psplash/{psplash-ti_svn.bb => psplash-ti_git.bb} (86%)
 rename recipes/psplash/{psplash_svn.bb => psplash_git.bb} (84%)

-- 
1.7.10



