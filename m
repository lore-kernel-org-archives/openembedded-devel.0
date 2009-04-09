Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1Lrwlq-0006E6-It
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Apr 2009 18:06:34 +0200
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.102]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1LrwiV-0001ve-H3
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Apr 2009 00:03:16 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 09 Apr 2009 10:02:53 -0600
Message-Id: <1239292973.4784.178.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 59.124.115.149
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] zenity: add a new package
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
X-List-Received-Date: Thu, 09 Apr 2009 16:06:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

From a1fee691b400a3bc6fd70b01c33802718bacf275 Mon Sep 17 00:00:00 2001     
From: Previdi Roberto <previdi.roberto@gmail.com>                          
Date: Thu, 9 Apr 2009 09:50:29 -0600                                       
Subject: [PATCH] zenity: add a new package                                 

Signed-off-by: Angus Ainslie <nytowl@openmoko.org>
---                                               
 recipes/zenity/files/makefile.patch |   13 +++++++++++++
 recipes/zenity/zenity_2.20.1.bb     |   10 ++++++++++   
 2 files changed, 23 insertions(+), 0 deletions(-)       
 create mode 100644 recipes/zenity/files/makefile.patch  
 create mode 100644 recipes/zenity/zenity_2.20.1.bb      

diff --git a/recipes/zenity/files/makefile.patch b/recipes/zenity/files/makefile.patch
new file mode 100644
index 0000000..9bdd5dd
--- /dev/null
+++ b/recipes/zenity/files/makefile.patch
@@ -0,0 +1,13 @@
+diff -c -r patcher_original/zenity-2.20.1/src/Makefile.am zenity-2.20.1/src/Makefile.am
+*** patcher_original/zenity-2.20.1/src/Makefile.am     Mon Nov 26 22:57:40 2007
+--- zenity-2.20.1/src/Makefile.am      Thu Apr  2 00:31:39 2009
+***************
+*** 21,27 ****
+       zenity.h
+
+  zenity_CPPFLAGS = \
+-      -I$(includedir)                                 \
+       -DGNOMELOCALEDIR=\""$(datadir)/locale"\"        \
+       -DZENITY_DATADIR=\""$(pkgdatadir)"\"            \
+       $(AM_CPPFLAGS)
+--- 21,26 ----
diff --git a/recipes/zenity/zenity_2.20.1.bb b/recipes/zenity/zenity_2.20.1.bb
new file mode 100644
index 0000000..7822ee7
--- /dev/null
+++ b/recipes/zenity/zenity_2.20.1.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "A tool to display dialogs from the command line and shell scripts."
+HOMEPAGE = "http://freshmeat.net/projects/zenity"
+LICENSE = "GPL"
+DEPENDS = "libgnomecanvas"
+SECTION = "console/utils"
+
+SRC_URI = "ftp://ftp.gnome.org/pub/gnome/sources/zenity/2.20/zenity-${PV}.tar.bz2 \
+           file://makefile.patch;patch=1"
+
+inherit autotools
--
1.5.6.3




