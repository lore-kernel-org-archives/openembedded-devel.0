Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ue17i-000064-Oc
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 12:45:55 +0200
Received: by mail-ee0-f42.google.com with SMTP id c50so3290211eek.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 03:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Pf6+40OkYzF5CwOO4GMO0TqoW2z2ln2vnkwkczjlJsU=;
	b=RV7NwVQtm+TWZoGL116jSXJ80ar5qtMKGYvXS4TGs92dkFPnuLdtZC8orfuMEZgCJe
	Yu1E69KhyIEVzEkmb97mzmQm3y+dveVFb6vMnUwQsMgnZylwSjWWBXoCJp1s/4MfrinN
	LynytAud4GO+Z0eRHoy2Fw1svzLoEQfeOlc+H+HgQVNilAUPV8UTpvVuk23zKUAeq2Lm
	oPKtW0F+fGJOMXv1F5BlH00sMQ1RJaAAB5eTcSU2MvKASDiHkdi7aDGr54+xldeGCQIo
	0GVB5DqmKT16dcNy86goOigiz04G+ODpKlh35A3yIsPVfnGhkipdEAvdLIPo+W7WGUch
	LDzg==
X-Received: by 10.15.63.66 with SMTP id l42mr15273317eex.6.1368959256494;
	Sun, 19 May 2013 03:27:36 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0719.dip0.t-ipconnect.de.
	[79.223.7.25])
	by mx.google.com with ESMTPSA id y10sm30762169eev.3.2013.05.19.03.27.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 03:27:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 May 2013 12:27:11 +0200
Message-Id: <1368959233-28288-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe++/master 09/11] gtkhtml2: fix build with glib 2.36
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
X-List-Received-Date: Sun, 19 May 2013 10:45:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...001-tests-main.c-fix-build-with-glib-2.36.patch |   32 ++++++++++++++++++++
 meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb     |    3 +-
 2 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-gnome/gtkhtml2/files/0001-tests-main.c-fix-build-with-glib-2.36.patch

diff --git a/meta-oe/recipes-gnome/gtkhtml2/files/0001-tests-main.c-fix-build-with-glib-2.36.patch b/meta-oe/recipes-gnome/gtkhtml2/files/0001-tests-main.c-fix-build-with-glib-2.36.patch
new file mode 100644
index 0000000..b3eb396
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtkhtml2/files/0001-tests-main.c-fix-build-with-glib-2.36.patch
@@ -0,0 +1,32 @@
+From 4b17eed4b8588569d11ec4bd2b6fa3c063830e6e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 16 May 2013 18:44:50 +0200
+Subject: [PATCH] tests/main.c: fix build with glib 2.36
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: project seems dead
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ tests/main.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/tests/main.c b/tests/main.c
+index 61cce82..18165ed 100644
+--- a/tests/main.c
++++ b/tests/main.c
+@@ -30,7 +30,9 @@ main (gint argc, gchar **argv)
+ {
+ 	GtkWidget *browser;
+ 
++#if !GLIB_CHECK_VERSION (2, 36, 0)
+ 	g_thread_init(NULL);
++#endif
+ 
+ 	gtk_init (&argc, &argv);
+ 
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
index 8e9df16..58d41ee 100644
--- a/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
+++ b/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 SRCREV = "1161"
 PV = "2.11.0+svnr${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "svn://svn.gnome.org/svn/gtkhtml2/;module=trunk;protocol=http \
            http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/css-stylesheet-user.patch;striplevel=0;name=patch2 \
@@ -14,6 +14,7 @@ SRC_URI = "svn://svn.gnome.org/svn/gtkhtml2/;module=trunk;protocol=http \
            http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/add-end-element-signal.patch;striplevel=0;name=patch4 \
            http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/add-dom-functions.patch;striplevel=0;name=patch5 \
            http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/iain-mem-leak.patch;striplevel=0;name=patch6 \
+           file://0001-tests-main.c-fix-build-with-glib-2.36.patch \
 "
 
 SRC_URI[patch2.md5sum] = "05fc3627ca364095702dc804f41c8391"
-- 
1.7.4.4



