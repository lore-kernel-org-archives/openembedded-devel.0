Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rik@mate.hex>) id 1PY4Bx-0006uI-Pg
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Dec 2010 23:08:21 +0100
Received: by mate.hex (Postfix, from userid 1000)
	id 67FAB205D3; Thu, 30 Dec 2010 01:08:00 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Dec 2010 01:07:58 +0300
Message-Id: <1293660478-3080-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1293660478-3080-1-git-send-email-khimov@altell.ru>
References: <201012292340.40618.roman@khimov.ru>
	<1293660478-3080-1-git-send-email-khimov@altell.ru>
Subject: [PATCH 2/2] classes/cpan: fix bin/script/man1/man3 installation dirs
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
X-List-Received-Date: Wed, 29 Dec 2010 22:08:21 -0000

Strange that it wasn't done before, but if some perl module wants to install
man pages or some binaries or scripts they all were installed with wrong prefix.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 classes/cpan.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/classes/cpan.bbclass b/classes/cpan.bbclass
index b81ae9a..c21130f 100644
--- a/classes/cpan.bbclass
+++ b/classes/cpan.bbclass
@@ -13,6 +13,10 @@ cpan_do_configure () {
 			-e "s:\(SITEARCHEXP = \).*:\1${sitearchexp}:" \
 			-e "s:\(INSTALLVENDORLIB = \).*:\1${D}${datadir}/perl5:" \
 			-e "s:\(INSTALLVENDORARCH = \).*:\1${D}${libdir}/perl5:" \
+			-e "s:\(INSTALLVENDORMAN1DIR = \).*:\1${D}${man1dir}:" \
+			-e "s:\(INSTALLVENDORMAN3DIR = \).*:\1${D}${man1dir}:" \
+			-e "s:\(INSTALLVENDORBIN = \).*:\1${D}${bindir}:" \
+			-e "s:\(INSTALLVENDORSCRIPT = \).*:\1${D}${bindir}:" \
 			-e "s:\(LDDLFLAGS.*\)${STAGING_LIBDIR_NATIVE}:\1${STAGING_LIBDIR}:" \
 			Makefile
 	fi
-- 
1.6.4.2



