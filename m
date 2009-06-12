Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MFDDP-0003T2-PD
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Jun 2009 22:19:07 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KL500LF444ZUGC0@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	12 Jun 2009 14:15:05 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4BEC614AF5D; Fri,
	12 Jun 2009 15:14:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jun 2009 15:14:59 -0400
Message-id: <1244834099-25357-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
Subject: [PATCH] alsa-utils: fix linking against host libc.so/libm.so
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
X-List-Received-Date: Fri, 12 Jun 2009 20:19:08 -0000

Caused by expecting ncurses library in /usr/lib.

For some people it's just a warning:
ld: warning: library search path "/usr/lib" is unsafe for cross-compilation
ld: skipping incompatible /usr/lib/libm.so when searching for -lm

And for some people it breaks the build:
ld: warning: library search path "/usr/lib" is unsafe for cross-compilation
/usr/lib/libm.so: file not recognized: File format not recognized
---
 recipes/alsa/alsa-utils_1.0.18.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/alsa/alsa-utils_1.0.18.bb b/recipes/alsa/alsa-utils_1.0.18.bb
index 2931545..40718b5 100644
--- a/recipes/alsa/alsa-utils_1.0.18.bb
+++ b/recipes/alsa/alsa-utils_1.0.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "console/utils"
 LICENSE = "GPL"
 DEPENDS = "alsa-lib ncurses"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://alsa-utils-automake.patch;patch=1 \
@@ -20,6 +20,7 @@ inherit autotools
 do_configure_append() {
 	for i in $(find ${S} -name Makefile) ; do
 		sed -i -e s:/usr/include/ncurses:${STAGING_INCDIR}/ncurses:g $i
+		sed -i -e 's:-L/usr/lib -lncurses:-L${STAGING_LIBDIR} -lncurses:g' $i
 	done
 }
 
-- 
1.6.0.6



