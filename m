Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QzNAr-0008DA-5h
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Sep 2011 08:24:21 +0200
Received: (qmail invoked by alias); 02 Sep 2011 06:19:24 -0000
Received: from p5B0A1B3B.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.27.59]
	by mail.gmx.net (mp058) with SMTP; 02 Sep 2011 08:19:24 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18unRkGO30uPW6kL2gTmPW7w+6yjfpr0FxD+2I3Wu
	ZEzkLUy5p7eZAy
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Sep 2011 08:22:45 +0200
Message-Id: <1314944565-24545-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce] thunar-volman: Add udev to DEPENDS
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
X-List-Received-Date: Fri, 02 Sep 2011 06:24:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With fresh tmp-dir bitbake thunar-volman failed with

| checking for gudev-1.0 >= 145... not found
| *** The required package gudev-1.0 was not found on your system.
| *** Please install gudev-1.0 (atleast version 145) or adjust
| *** the PKG_CONFIG_PATH environment variable if you
| *** installed the package in a nonstandard prefix so that
| *** pkg-config is able to find it.
| + bbfatal 'oe_runconf failed'

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../thunar-volman/thunar-volman_0.6.0.bb           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
index 377561c..c581d78 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Automatic management of removable drives and media for thunar"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo gtk+ libxfce4ui libxfce4util xfconf libnotify"
+DEPENDS = "exo gtk+ libxfce4ui libxfce4util xfconf libnotify udev"
 
 inherit xfce
 
-- 
1.7.4.4



