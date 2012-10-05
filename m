Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1TKE3H-0008Cg-6i for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 21:59:15 +0200
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id D58A3E02A9;
	Fri,  5 Oct 2012 19:46:14 +0000 (UTC)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id C6BE9703B8B; Fri,  5 Oct 2012 21:46:14 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Henning Heinold <heinold@inf.fu-berlin.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2012 21:46:05 +0200
Message-Id: <14deaef2a90d4c286f9fa46532965f9b96f13fab.1349466172.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <366eb039e4231b2285f46a74effced4b4f919d51.1349466172.git.sledz@dresearch-fe.de>
References: <366eb039e4231b2285f46a74effced4b4f919d51.1349466172.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1349466172.git.sledz@dresearch-fe.de>
References: <cover.1349466172.git.sledz@dresearch-fe.de>
Subject: [meta-java 5/5] icedtea6-native: fix build problem
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
X-List-Received-Date: Fri, 05 Oct 2012 19:59:16 -0000

Fix problem with unknown gcc command line option '-mimpure-text'
which is an Solaris 2 only option (according to the man page).

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes-core/icedtea/icedtea6-native.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/icedtea/icedtea6-native.inc b/recipes-core/icedtea/icedtea6-native.inc
index 4a613ff..13e9d27 100644
--- a/recipes-core/icedtea/icedtea6-native.inc
+++ b/recipes-core/icedtea/icedtea6-native.inc
@@ -97,6 +97,7 @@ do_configure_append() {
 			-e"s|\$(COMPILER_PATH)gcc\$(GCC_SUFFIX)|${CC}|" \
 			-e"s|\$(COMPILER_PATH)gcc\$(GCC_SUFFIX) -E|${CPP}|" \
 			-e"s|\$(COMPILER_PATH)g++\$(GCC_SUFFIX)|${CXX}|" \
+			-e"s|-mimpure-text||" \
 			$F
 	done
 
-- 
1.7.10.4



