Received: from mrsl.grasp.upenn.edu ([158.130.53.11] helo=charon)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kartikmohta@charon.mrsl.grasp.upenn.edu>)
	id 1Q283T-0007Sb-Bj for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 21:19:52 +0100
Received: by charon (Postfix, from userid 1000)
	id EF0CA60A14; Tue, 22 Mar 2011 16:00:24 -0400 (EDT)
From: Kartik Mohta <kartikmohta@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 15:59:49 -0400
Message-Id: <1300823989-17204-1-git-send-email-kartikmohta@gmail.com>
X-Mailer: git-send-email 1.7.1
Cc: Kartik Mohta <kartikmohta@gmail.com>
Subject: [PATCH] libarchive: Requires libxml2
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
X-List-Received-Date: Tue, 22 Mar 2011 20:19:53 -0000

Signed-off-by: Kartik Mohta <kartikmohta@gmail.com>
---
 recipes/libarchive/libarchive_2.8.4.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/libarchive/libarchive_2.8.4.bb b/recipes/libarchive/libarchive_2.8.4.bb
index 551746b..1139416 100644
--- a/recipes/libarchive/libarchive_2.8.4.bb
+++ b/recipes/libarchive/libarchive_2.8.4.bb
@@ -4,6 +4,8 @@ SECTION = "devel"
 LICENSE = "BSD"
 PR = "r0"
 
+DEPENDS = "libxml2"
+
 SRC_URI = "http://libarchive.googlecode.com/files/${PN}-${PV}.tar.gz \
            file://0001-Patch-from-upstream-revision-1990.patch \
            file://0002-Patch-from-upstream-revision-1991.patch \
-- 
1.7.1



