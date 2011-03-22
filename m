Received: from vps.igeek.in ([98.143.145.58])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kartikmohta@vps.igeek.in>) id 1Q2AZR-0000la-1o
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 00:01:01 +0100
Received: by vps.igeek.in (Postfix, from userid 1000)
	id 48AB41404E5; Wed, 23 Mar 2011 04:01:51 +0530 (IST)
From: Kartik Mohta <kartikmohta@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2011 04:01:45 +0530
Message-Id: <1300833106-28370-1-git-send-email-kartikmohta@gmail.com>
X-Mailer: git-send-email 1.7.4.1
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
X-List-Received-Date: Tue, 22 Mar 2011 23:01:01 -0000

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



