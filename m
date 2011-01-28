Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Pitrd-0004A5-E7
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 20:20:09 +0100
Received: from localhost.localdomain ([134.86.97.17])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p0SIqb1o024465
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 12:52:38 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jan 2011 11:52:31 -0700
Message-Id: <1296240753-10120-4-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
Subject: [PATCH 3/5] automake: Add perl-native as a dep rather than perl-runtime-native
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
X-List-Received-Date: Fri, 28 Jan 2011 19:20:09 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/automake/automake.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/automake/automake.inc b/recipes/automake/automake.inc
index e378c04..1eae3c0 100644
--- a/recipes/automake/automake.inc
+++ b/recipes/automake/automake.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "A tool for automatically generating Makefiles."
 LICENSE = "GPL"
 HOMEPAGE = "http://www.gnu.org/software/automake/"
 SECTION = "devel"
-DEPENDS_virtclass-native = "autoconf-native"
-RDEPENDS_automake-native = "autoconf-native perl-native-runtime"
+DEPENDS_virtclass-native = "autoconf-native perl-native"
+RDEPENDS_automake-native = "autoconf-native perl-native"
 RDEPENDS_automake += "\
     autoconf \
     perl \
-- 
1.7.0.4



