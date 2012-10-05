Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1TKE35-0008CC-SA for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 21:59:03 +0200
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 95CA8E0249;
	Fri,  5 Oct 2012 19:46:00 +0000 (UTC)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id 07340703B8B; Fri,  5 Oct 2012 21:45:59 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Henning Heinold <heinold@inf.fu-berlin.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2012 21:45:54 +0200
Message-Id: <cover.1349466172.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-java 0/5] icedtea build fixes
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
X-List-Received-Date: Fri, 05 Oct 2012 19:59:04 -0000

Hi meta-jav maintainers,

this is a set of patches which make icedtea6-native-1.7.10 and
icedtea6-native-1.8.11 buildable for us.

The following changes since commit da13c12203a4ba9020d7083861c0038c8ee67c88:

  openjdk-6: update to version 1.11.4 (2012-09-10 20:43:55 +0200)

are available in the git repository at:

  git://github.com/sledz/meta-java pull-request-1
  https://github.com/sledz/meta-java/tree/pull-request-1

Steffen Sledz (5):
  icedtea6-native-1.7.10: add missing LIC_FILES_CHKSUM
  icedtea6-native-1.7.10: backport S7103224
  icedtea6-native: fix problem on build hosts with linux kernel 3.x
  icedtea6-native: fix compile error
  icedtea6-native: fix build problem

 .../glibc_name_collision.patch                     |  523 ++++++++++++++++++++
 .../icedtea-hotspot-dont-return-booleans.patch     |   12 +
 .../icedtea-hotspot-dont-return-booleans.patch     |   12 +
 recipes-core/icedtea/icedtea6-native.inc           |    8 +
 recipes-core/icedtea/icedtea6-native_1.7.10.bb     |    7 +-
 recipes-core/icedtea/icedtea6-native_1.8.11.bb     |    4 +-
 6 files changed, 564 insertions(+), 2 deletions(-)
 create mode 100644 recipes-core/icedtea/icedtea6-native-1.7.10/glibc_name_collision.patch
 create mode 100644 recipes-core/icedtea/icedtea6-native-1.7.10/icedtea-hotspot-dont-return-booleans.patch
 create mode 100644 recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-hotspot-dont-return-booleans.patch

-- 
1.7.10.4



