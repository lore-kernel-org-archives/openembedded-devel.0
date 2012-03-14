Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1S7mbu-0002OQ-VQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Mar 2012 12:43:19 +0100
Received: by localhost (Postfix, from userid 1000)
	id 6F658444021; Wed, 14 Mar 2012 12:34:32 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed, 14 Mar 2012 12:34:29 +0100
Message-Id: <8d2c8f49312f6a0318dc82b6ce85e50bc08dfcb2.1331724547.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <036da2df4162966386581ee32c39236c4cdab1d7.1331724547.git.sledz@dresearch-fe.de>
References: <036da2df4162966386581ee32c39236c4cdab1d7.1331724547.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1331724547.git.sledz@dresearch-fe.de>
References: <cover.1331724547.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 7/7] ltrace-0.5.3: Update URI to a functioning one
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
 recipes/ltrace/ltrace_0.5.3.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ltrace/ltrace_0.5.3.bb b/recipes/ltrace/ltrace_0.5.3.bb
index 53f4892..2fb7767 100644
--- a/recipes/ltrace/ltrace_0.5.3.bb
+++ b/recipes/ltrace/ltrace_0.5.3.bb
@@ -10,8 +10,8 @@ PR = "r3"
 COMPATIBLE_TARGET_SYS = (?!sh[34])
 
 SRC_URI = "\
-  ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz;name=archive \
-  ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.diff.gz;name=patch \
+  http://snapshot.debian.org/archive/debian/20090801T192339Z/pool/main/l/ltrace/ltrace_${PV}.orig.tar.gz;name=archive \
+  http://snapshot.debian.org/archive/debian/20090801T192339Z/pool/main/l/ltrace/ltrace_${PV}-2.diff.gz;name=patch \
   file://add-sysdep.patch \
   file://ltrace-compile.patch \
   file://ltrace-mips-remove-CP.patch \
-- 
1.7.7



