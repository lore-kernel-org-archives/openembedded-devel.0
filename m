Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1S7mbt-0002OH-08
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 12:43:17 +0100
Received: by localhost (Postfix, from userid 1000)
	id 0728444401E; Wed, 14 Mar 2012 12:34:31 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 14 Mar 2012 12:34:24 +0100
Message-Id: <a3c6f6ca349727996d058881bbad58599edb9cf0.1331724547.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <036da2df4162966386581ee32c39236c4cdab1d7.1331724547.git.sledz@dresearch-fe.de>
References: <036da2df4162966386581ee32c39236c4cdab1d7.1331724547.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1331724547.git.sledz@dresearch-fe.de>
References: <cover.1331724547.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 2/7] fakeroot-1.9.6: Update URI to a functioning one
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
X-List-Received-Date: Wed, 14 Mar 2012 11:43:17 -0000

We have to use a specific date to the debian snapshot mirror to get this
version of the file.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/fakeroot/fakeroot_1.9.6.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/fakeroot/fakeroot_1.9.6.bb b/recipes/fakeroot/fakeroot_1.9.6.bb
index 0a3ea93..0666910 100644
--- a/recipes/fakeroot/fakeroot_1.9.6.bb
+++ b/recipes/fakeroot/fakeroot_1.9.6.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL"
 RDEPENDS_${PN} = "util-linux"
 PR = "r3"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.tar.gz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20080803T000000Z/pool/main/f/fakeroot/fakeroot_${PV}.tar.gz \
            file://configure-libtool.patch"
 	    
 inherit autotools
-- 
1.7.7



