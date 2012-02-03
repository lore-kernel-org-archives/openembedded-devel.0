Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RtI9y-0007JW-UV
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Feb 2012 13:22:36 +0100
Received: by localhost (Postfix, from userid 1000)
	id 9321A443CE1; Fri,  3 Feb 2012 13:14:36 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2012 13:14:34 +0100
Message-Id: <1328271274-6197-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH] liblockfile: fix SRC_URI for version 1.06
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
X-List-Received-Date: Fri, 03 Feb 2012 12:22:36 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/liblockfile/liblockfile_1.06.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/liblockfile/liblockfile_1.06.bb b/recipes/liblockfile/liblockfile_1.06.bb
index 0235dbd..5d540cb 100644
--- a/recipes/liblockfile/liblockfile_1.06.bb
+++ b/recipes/liblockfile/liblockfile_1.06.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPL"
 PR ="r1"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_${PV}.tar.gz \
+SRC_URI = "http://archive.debian.org/debian/pool/main/libl/liblockfile/liblockfile_${PV}.tar.gz \
 	   file://install.patch \
 	   file://configure.patch \
 	   file://ldflags.patch \
-- 
1.7.7



