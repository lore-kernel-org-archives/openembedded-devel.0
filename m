Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OPOch-0005Rg-JS
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 01:35:57 +0200
Received: (qmail invoked by alias); 17 Jun 2010 23:31:20 -0000
Received: from p508878A5.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.120.165]
	by mail.gmx.net (mp038) with SMTP; 18 Jun 2010 01:31:20 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19/pjkMx6p/ImpqV7zz1Tl6wMcZ5YNeJFKS5NQMkM
	g0MJOrJ8tBMDwg
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jun 2010 01:29:03 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
References: <20100615133736.310590@gmx.net>
In-Reply-To: <20100615133736.310590@gmx.net>
MIME-Version: 1.0
Message-Id: <201006180129.03630.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Fixes install error in xfwm4-themes_4.6.0
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
X-List-Received-Date: Thu, 17 Jun 2010 23:35:57 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=46rom c6fe3e0c5bee620b77871baef0b8cd4680fa2cbd Mon Sep 17 00:00:00 2001
=46rom: Andreas Mueller <schnitzeltony@gmx.de>
Date: Fri, 18 Jun 2010 01:21:16 +0200
Subject: [PATCH] Fixes install error in xfwm4-themes_4.6.0

=46ile 'maximize-inactive.xpm' was listed twice in Makefile.am

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
=2D--
 .../xfwm4-themes-4.6.0/remove-double-files.patch   |   10 ++++++++++
 recipes/xfce-base/xfwm4-themes_4.6.0.bb            |    6 +++++-
 2 files changed, 15 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xfce-base/xfwm4-themes-4.6.0/remove-double-file=
s.patch

diff --git a/recipes/xfce-base/xfwm4-themes-4.6.0/remove-double-files.patch=
 b/recipes/xfce-base/xfwm4-themes-4.6.0/remove-double-files.patch
new file mode 100644
index 0000000..14dbe4d
=2D-- /dev/null
+++ b/recipes/xfce-base/xfwm4-themes-4.6.0/remove-double-files.patch
@@ -0,0 +1,10 @@
+--- xfwm4-themes-4.6.0/themes/redmond/Makefile.am	2009-02-26 00:54:06.0000=
00000 +0100
++++ xfwm4-themes-4.6.0/themes/redmond/Makefile.am~	2010-06-14 11:10:00.000=
000000 +0200
+@@ -16,7 +16,6 @@
+ 	left-inactive.xpm \
+ 	maximize-active.xpm \
+ 	maximize-toggled-active.xpm \
+-	maximize-inactive.xpm \
+ 	maximize-toggled-inactive.xpm \
+ 	maximize-inactive.xpm \
+ 	maximize-pressed.xpm \
diff --git a/recipes/xfce-base/xfwm4-themes_4.6.0.bb b/recipes/xfce-base/xf=
wm4-themes_4.6.0.bb
index d71042b..93f8e92 100644
=2D-- a/recipes/xfce-base/xfwm4-themes_4.6.0.bb
+++ b/recipes/xfce-base/xfwm4-themes_4.6.0.bb
@@ -1,7 +1,7 @@
 # xfwm4-themes OE build file
=20
 SECTION =3D "x11/wm"
=2DPR =3D "r4"
+PR =3D "r5"
=20
 DEPENDS =3D "xfwm4 libglade libxml2"
 RDEPENDS_${PN} =3D "xfwm4 libglade libxml2"
@@ -10,6 +10,10 @@ inherit xfce46
=20
 SRC_URI =3D "http://mocha.xfce.org/archive/src/art/xfwm4-themes/4.6/xfwm4-=
themes-${PV}.tar.bz2"
=20
+SRC_URI +=3D " \
+    file://remove-double-files.patch \
+"
+
 PACKAGES_DYNAMIC =3D "xfwm4-theme-*"
=20
 python populate_packages_prepend () {
=2D-=20
1.5.3.4


