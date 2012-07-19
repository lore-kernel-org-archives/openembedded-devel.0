Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Srua2-0002bG-F1
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 19:32:02 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id DC290EA04D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 19:24:33 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 6A09B6066A; Thu, 19 Jul 2012 19:20:40 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 19:20:31 +0200
Message-Id: <cover.1342677797.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [2011.03-maintenance][PATCH 0/9] Pull request 20120719
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
X-List-Received-Date: Thu, 19 Jul 2012 17:32:02 -0000

Hello,

The patches that come as a follow-up of this message fix issues found
while building muffinman-image on top of the 2011.03-maintenance
branch.
These modifications were tested by successfully building
muffinman-image from scratch on a Debian Squeeze host.
Please pull into 2011.03-maintenance branch.

The following changes since commit f9611c025109a3e0d6cebf12f49ae24c97759c09:

  psplash: convert from svn.o-hand.com to git.yoctoproject.org (2012-07-04 22:34:04 +0200)

are available in the git repository at:

  git://seketeli.net/~apelete/oe.git muffinman-image-fix

Apelete Seketeli (9):
  mirrors.bbclass: add new GNU_MIRROR
  mirrors.bbclass: add new KERNELORG_MIRROR
  libpng: update SRC_URI
  bluez4_4.84: update checksum values
  netsurf: update SRC_URI
  tzcode: update SRC_URI
  tzdata: update SRC_URI
  git: update SRC_URI
  opkg-utils: bump SRCREV to keep python2.6 compatibility

 classes/mirrors.bbclass                 |    2 ++
 recipes/bluez/bluez4_4.84.bb            |    4 ++--
 recipes/git/git.inc                     |    2 +-
 recipes/libpng/libpng.inc               |    2 +-
 recipes/netsurf/hubbub_0.0.2.bb         |    2 +-
 recipes/netsurf/libcss_0.0.2.bb         |    2 +-
 recipes/netsurf/libnsbmp_0.0.2.bb       |    2 +-
 recipes/netsurf/libnsgif_0.0.2.bb       |    2 +-
 recipes/netsurf/libparserutils_0.0.2.bb |    2 +-
 recipes/netsurf/libwapcaplet_0.0.2.bb   |    2 +-
 recipes/netsurf/netsurf_2.6.bb          |    2 +-
 recipes/opkg-utils/opkg-utils_git.bb    |    4 ++--
 recipes/tzcode/tzcode-native.inc        |    4 ++--
 recipes/tzdata/tzdata.inc               |    2 +-
 14 files changed, 18 insertions(+), 16 deletions(-)

-- 
1.7.10.4



