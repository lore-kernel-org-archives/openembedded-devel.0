Received: from mrsl.grasp.upenn.edu ([158.130.53.11] helo=charon)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kartikmohta@charon.mrsl.grasp.upenn.edu>)
	id 1Q2BWe-0002If-SZ for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 01:02:13 +0100
Received: by charon (Postfix, from userid 1000)
	id 6652660A14; Tue, 22 Mar 2011 20:00:21 -0400 (EDT)
From: Kartik Mohta <kartikmohta@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 20:00:04 -0400
Message-Id: <1300838404-7296-1-git-send-email-kartikmohta@gmail.com>
X-Mailer: git-send-email 1.7.1
Cc: Kartik Mohta <kartikmohta@gmail.com>
Subject: [PATCH] cmake: Requires ncurses (for ccmake)
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
X-List-Received-Date: Wed, 23 Mar 2011 00:02:13 -0000

Signed-off-by: Kartik Mohta <kartikmohta@gmail.com>
---
 recipes/cmake/cmake_2.8.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/cmake/cmake_2.8.3.bb b/recipes/cmake/cmake_2.8.3.bb
index 0c8cb6d..d568d2b 100644
--- a/recipes/cmake/cmake_2.8.3.bb
+++ b/recipes/cmake/cmake_2.8.3.bb
@@ -4,7 +4,7 @@ PR = "${INC_PR}.1"
 
 inherit cmake
 
-DEPENDS += "curl expat zlib libarchive"
+DEPENDS += "curl expat zlib libarchive ncurses"
 
 SRC_URI[md5sum] = "a76a44b93acf5e3badda9de111385921"
 SRC_URI[sha256sum] = "689ed02786b5cefa5515c7716784ee82a82e8ece6be5a3d629ac3cc0c05fc288"
-- 
1.7.1



