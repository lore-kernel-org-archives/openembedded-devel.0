Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Pitre-0004A5-3U
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 20:20:10 +0100
Received: from localhost.localdomain ([134.86.97.17])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p0SIqb1p024465
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 12:52:38 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Jan 2011 11:52:32 -0700
Message-Id: <1296240753-10120-5-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
Subject: [PATCH 4/5] autoconf: Add perl-native as a dep
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
X-List-Received-Date: Fri, 28 Jan 2011 19:20:10 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 recipes/autoconf/autoconf.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/autoconf/autoconf.inc b/recipes/autoconf/autoconf.inc
index 1815b5d..2f8c122 100644
--- a/recipes/autoconf/autoconf.inc
+++ b/recipes/autoconf/autoconf.inc
@@ -3,10 +3,10 @@ automatically configure sourcecode."
 LICENSE = "GPLv3+-with-Autoconf-Configure-Script-Exception-v3.0"
 HOMEPAGE = "http://www.gnu.org/software/autoconf/"
 SECTION = "devel"
-DEPENDS += "m4-native"
+DEPENDS += "m4-native perl-native"
 RDEPENDS_${PN} = "m4 perl gnu-config"
-DEPENDS_virtclass-native = "m4-native gnu-config-native"
-RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
+DEPENDS_virtclass-native = "m4-native gnu-config-native perl-native"
+RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native perl-native"
 
 INC_PR = "r13"
 
-- 
1.7.0.4



