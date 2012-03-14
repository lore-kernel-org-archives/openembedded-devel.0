Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1S7mbu-0002OP-VM
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 12:43:19 +0100
Received: by localhost (Postfix, from userid 1000)
	id 532BF44401F; Wed, 14 Mar 2012 12:34:32 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 14 Mar 2012 12:34:28 +0100
Message-Id: <b0604a10c618007c9c0e834dbfcd508cc1fe3c10.1331724547.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <036da2df4162966386581ee32c39236c4cdab1d7.1331724547.git.sledz@dresearch-fe.de>
References: <036da2df4162966386581ee32c39236c4cdab1d7.1331724547.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1331724547.git.sledz@dresearch-fe.de>
References: <cover.1331724547.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 6/7] liblockfile-1.06: Update URI to a functioning one
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
X-List-Received-Date: Wed, 14 Mar 2012 11:43:19 -0000

We have to use a specific date to the debian snapshot mirror to get this
version of the file.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/liblockfile/liblockfile_1.06.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/liblockfile/liblockfile_1.06.bb b/recipes/liblockfile/liblockfile_1.06.bb
index 0235dbd..cfac5b7 100644
--- a/recipes/liblockfile/liblockfile_1.06.bb
+++ b/recipes/liblockfile/liblockfile_1.06.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPL"
 PR ="r1"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_${PV}.tar.gz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/libl/liblockfile/liblockfile_${PV}.tar.gz \
 	   file://install.patch \
 	   file://configure.patch \
 	   file://ldflags.patch \
-- 
1.7.7



