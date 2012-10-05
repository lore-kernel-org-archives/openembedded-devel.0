Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1TKE3G-0008Cg-7Z for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 21:59:14 +0200
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id CB33CE02A9;
	Fri,  5 Oct 2012 19:46:11 +0000 (UTC)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id BEF14703B8B; Fri,  5 Oct 2012 21:46:11 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Henning Heinold <heinold@inf.fu-berlin.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2012 21:46:03 +0200
Message-Id: <6725efa7f4c769340e8e0d3ef5691bf3e94fcfc7.1349466172.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <366eb039e4231b2285f46a74effced4b4f919d51.1349466172.git.sledz@dresearch-fe.de>
References: <366eb039e4231b2285f46a74effced4b4f919d51.1349466172.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1349466172.git.sledz@dresearch-fe.de>
References: <cover.1349466172.git.sledz@dresearch-fe.de>
Subject: [meta-java 3/5] icedtea6-native: fix problem on build hosts with linux kernel 3.x
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
X-List-Received-Date: Fri, 05 Oct 2012 19:59:14 -0000

see http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=7072341

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes-core/icedtea/icedtea6-native.inc |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-core/icedtea/icedtea6-native.inc b/recipes-core/icedtea/icedtea6-native.inc
index 1414ac3..4a613ff 100644
--- a/recipes-core/icedtea/icedtea6-native.inc
+++ b/recipes-core/icedtea/icedtea6-native.inc
@@ -107,6 +107,13 @@ do_configure_append() {
 			-e"s|g++\$(GCC_SUFFIX)|${CXX}|" \
 			$F
 	done
+
+	for F in openjdk/hotspot/make/linux/Makefile openjdk-ecj/hotspot/make/linux/Makefile ;
+	do
+		sed -i \
+			-e"s|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 2.7%|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3%|" \
+			$F
+	done
 }
 
 EXTRA_OEMAKE = ' \
-- 
1.7.10.4



