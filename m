Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QJXZl-0006EY-9G
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 23:01:09 +0200
Received: (qmail invoked by alias); 09 May 2011 20:58:24 -0000
Received: from p5B0A19A9.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.25.169]
	by mail.gmx.net (mp065) with SMTP; 09 May 2011 22:58:24 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18WME1PD9AWfNcXb2PzZuS7BZrc0myyH77FK3A+nl
	9NNG2AYi3cu6vo
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 22:59:07 +0200
Message-Id: <1304974747-21466-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1304974747-21466-1-git-send-email-schnitzeltony@gmx.de>
References: <1304974747-21466-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [PATCH 2/2] overo: u-boot fix by moving to version 2011.03
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
X-List-Received-Date: Mon, 09 May 2011 21:01:09 -0000

The old git version did not start up from SDCard.

Tests:
* Set default variable environment
* Save variable environment
* Boot kernel from MMC and NAND

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/u-boot/u-boot_2011.03.bb |    1 +
 recipes/u-boot/u-boot_git.bb     |    5 -----
 2 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/recipes/u-boot/u-boot_2011.03.bb b/recipes/u-boot/u-boot_2011.03.bb
index 8ab385f..ac609cd 100644
--- a/recipes/u-boot/u-boot_2011.03.bb
+++ b/recipes/u-boot/u-boot_2011.03.bb
@@ -2,6 +2,7 @@ PR = "r0"
 require u-boot.inc
 
 DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_overo = "1"
 
 SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
 SRC_URI[md5sum] = "91d02124c94368557d0e9ac05fb8c33f"
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 2cf5b12..d7c4f6a 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -197,11 +197,6 @@ do_compile_omapzoom36x () {
         oe_runmake tools
 }
 
-SRC_URI_overo = "git://www.sakoman.com/git/u-boot.git;branch=omap4-exp;protocol=git \
-"
-SRCREV_overo = "261733408a27d14590cf3ec6b596461808050e32"
-PV_overo = "2010.12+${PR}+gitr${SRCREV}"
-
 SRC_URI_omap4430-panda = "git://www.sakoman.com/git/u-boot.git;branch=omap4-exp;protocol=git \
                           file://fix-break-caused-by-new-binutils.patch \
                          "
-- 
1.7.4.4



