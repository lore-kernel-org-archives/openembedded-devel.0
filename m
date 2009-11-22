Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <bernhard.kaindl@gmx.net>) id 1NCBQu-0000ci-60
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2009 13:20:51 +0100
Received: (qmail invoked by alias); 22 Nov 2009 12:19:20 -0000
Received: from 93-82-10-50.adsl.highway.telekom.at (EHLO
	localhost.localdomain) [93.82.10.50]
	by mail.gmx.net (mp048) with SMTP; 22 Nov 2009 13:19:20 +0100
X-Authenticated: #154622
X-Provags-ID: V01U2FsdGVkX18tSFNhx1YtEMCdsdft97rOZnLUveygfhmccUvt58
	4SPsQouQHlgT9G
From: Bernhard Kaindl <bernhard.kaindl@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Nov 2009 13:19:14 +0100
Message-Id: <1258892354-24039-1-git-send-email-bernhard.kaindl@gmx.net>
X-Mailer: git-send-email 1.6.5.2
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.58
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: bernhard.kaindl@gmx.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fix setscene of binutils-cross-sdk_2.17: Switch binutils_2.17.bb to INC_PR
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
X-List-Received-Date: Sun, 22 Nov 2009 12:20:51 -0000

binutils_2.17.bb and binutils-cross-sdk_2.17.bb:
 * All of the binutils-cross-sdk_*.bb recipes rely on their binutils_*.bb
   recipe to define INC_PR, but binutils_2.17.bb does not define it, so
   setscene of binutils-cross-sdk_2.17 fails because it does a mkdir of
   work/.../binutils-cross-sdk-2.17-\$\{INC_PR\}.1/ which causes an abort
   when trying to find the setscene scripts later.
   Fix this by switching binutils_2.17.bb to INC_PR like silbings have done.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@gmx.net>

 binutils_2.17.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes/binutils/binutils_2.17.bb b/recipes/binutils/binutils_2.17.bb
index fdee8a5..ceea7c6 100644
--- a/recipes/binutils/binutils_2.17.bb
+++ b/recipes/binutils/binutils_2.17.bb
@@ -1,7 +1,8 @@
 require binutils.inc
 require binutils-avr32.inc
 
-PR = "r7"
+INC_PR = "r7"
+PR = "${INC_PR}.1"
 
 SRC_URI = \
     "http://ftp.gnu.org/gnu/binutils/binutils-${PV}.tar.bz2 \


