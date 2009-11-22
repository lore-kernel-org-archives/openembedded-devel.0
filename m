Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <bernhard.kaindl@gmx.net>) id 1NCAY0-000650-9A
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2009 12:24:07 +0100
Received: (qmail invoked by alias); 22 Nov 2009 11:22:37 -0000
Received: from 93-82-10-50.adsl.highway.telekom.at (EHLO
	localhost.localdomain) [93.82.10.50]
	by mail.gmx.net (mp071) with SMTP; 22 Nov 2009 12:22:37 +0100
X-Authenticated: #154622
X-Provags-ID: V01U2FsdGVkX1/BXBVwwNzBCKU5A00USJWclcdzJaMfbR9ugE1qsw
	B554nYGV0aj49x
From: Bernhard Kaindl <bernhard.kaindl@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Nov 2009 12:22:28 +0100
Message-Id: <1258888948-28141-1-git-send-email-bernhard.kaindl@gmx.net>
X-Mailer: git-send-email 1.6.5.2
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.53
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: bernhard.kaindl@gmx.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fix htop do_configure: use DEPENDS="ncurses", not RDEPENDS="ncurses"
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
X-List-Received-Date: Sun, 22 Nov 2009 11:24:07 -0000

htop: Fix htop do_configure: Ensure that ncurses is staged

* htop's do_configure needs ncurses, but htop did only have an RDEPENDS
  on ncurses which only triggers a build of of ncurses after or in parallel
  to htop's do_configure, which is too late. Fix this:
  Since htop is dynamically linked against ncurces, OE detects the REDEPENDS
  to ncurses automatically and we can simply change the RDEPENDS to DEPENDS.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@gmx.net>

 htop_0.7.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes/htop/htop_0.7.bb b/recipes/htop/htop_0.7.bb
index 4a614bd..f3b3c96 100644
--- a/recipes/htop/htop_0.7.bb
+++ b/recipes/htop/htop_0.7.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
 
-RDEPENDS = "ncurses"
+DEPENDS = "ncurses"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/htop/htop-${PV}.tar.gz \
            file://remove-proc-test.patch;patch=1"


