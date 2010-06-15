Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Schnitzeltony@gmx.de>) id 1OOWP1-0004ca-Ai
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 15:42:11 +0200
Received: (qmail 3333 invoked by uid 0); 15 Jun 2010 13:37:39 -0000
Received: from 62.225.102.139 by www044.gmx.net with HTTP;
	Tue, 15 Jun 2010 15:37:36 +0200 (CEST)
Date: Tue, 15 Jun 2010 15:37:36 +0200
From: =?iso-8859-1?Q?=22Andreas_M=FCller=22?= <Schnitzeltony@gmx.de>
Message-ID: <20100615133736.310590@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #62780362
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX1/SHIhGf6jSQB4FC1EvBQ0CPH4udOA0wbLwXD0eTG
	LUVmmT1Nc/cyBydThBVH8zpimXSy2e+h4RNA== 
X-GMX-UID: Qetif2dMODB6RaCSzmdMQCA9Ji9SWlLU
X-FuHaFi: 0.47999999999999998
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: Schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: xfwm4-themes-4.6.0 suggested patch
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
X-List-Received-Date: Tue, 15 Jun 2010 13:42:11 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The following patch fixes the typo (maximize-inactive.xpm listed twice) in xfwm4-themes-4.6.0/themes/redmond/Makefile.am. On my machine this bug causes installation of xfwm4-themes to fail. Could someone agree and add this to oe? By the way: What is the correct way to post patches?

diff --git a/recipes/xfce-base/xfwm4-themes-4.6.0/remove-double-files.patch b/recipes/xfce-base/xfwm4-themes-4.6.0/remove-double-files.patch
new file mode 100644
index 0000000..14dbe4d
--- /dev/null
+++ b/recipes/xfce-base/xfwm4-themes-4.6.0/remove-double-files.patch
@@ -0,0 +1,10 @@
+--- xfwm4-themes-4.6.0/themes/redmond/Makefile.am	2009-02-26 00:54:06.000000000 +0100
++++ xfwm4-themes-4.6.0/themes/redmond/Makefile.am~	2010-06-14 11:10:00.000000000 +0200
+@@ -16,7 +16,6 @@
+ 	left-inactive.xpm \
+ 	maximize-active.xpm \
+ 	maximize-toggled-active.xpm \
+-	maximize-inactive.xpm \
+ 	maximize-toggled-inactive.xpm \
+ 	maximize-inactive.xpm \
+ 	maximize-pressed.xpm \
diff --git a/recipes/xfce-base/xfwm4-themes_4.6.0.bb b/recipes/xfce-base/xfwm4-themes_4.6.0.bb
index b37ba1b..82771d9 100644
--- a/recipes/xfce-base/xfwm4-themes_4.6.0.bb
+++ b/recipes/xfce-base/xfwm4-themes_4.6.0.bb
@@ -1,7 +1,7 @@
 # xfwm4-themes OE build file
 
 SECTION = "x11/wm"
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "xfwm4 libglade libxml2"
 RDEPENDS_${PN} = "xfwm4 libglade libxml2"
@@ -10,6 +10,10 @@ inherit xfce46
 
 SRC_URI = "http://mocha.xfce.org/archive/src/art/xfwm4-themes/4.6/xfwm4-themes-${PV}.tar.bz2"
 
+SRC_URI += " \
+    file://remove-double-files.patch \
+"
+
 PACKAGES_DYNAMIC = "xfwm4-theme-*"
 
 python populate_packages_prepend () {
-- 
GRATIS für alle GMX-Mitglieder: Die maxdome Movie-FLAT!
Jetzt freischalten unter http://portal.gmx.net/de/go/maxdome01


