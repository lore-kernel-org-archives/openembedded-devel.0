Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UWAE3-0004Yi-9P
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 20:52:02 +0200
Received: by mail-ee0-f52.google.com with SMTP id d41so1981939eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2013 11:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=dHE36BCpk4HeFDdG6y2uiKa/wfn9OdmhPicD8xcPXDs=;
	b=DkWe+EaxnalZPr1Vy/BOmJ6EG/viCg2MXtt3rnRls81RDiRFiyJzo0D/qPprUmrMz0
	sgsqk8fxgxC5TbHxaEOOceNtwDU++j12Sti75DVj4lIWXnybRuG3zPywJ9gIQy2aygLU
	/YXtugDvxb0zl/d7A+quPhJJowjXjmeJJ53J+nkvWmfAciBhoR4QzOdzDR5fMciePHeU
	AtpiV0j5LndxZIeV5FPqGIERmVVoJ9UUIS1xJPcA0pI4qeaGTtrfJ+yRoHReuo+b7ppW
	zIY6egfprAyT0NZ8+o2myiSzg6D+3eHbw7nE9rNnECr2EzE/tU8E/poVLWbKex6Gy5+Z
	2eiQ==
X-Received: by 10.14.39.5 with SMTP id c5mr102866071eeb.27.1367087652958;
	Sat, 27 Apr 2013 11:34:12 -0700 (PDT)
Received: from localhost.localdomain (p5B0A212D.dip0.t-ipconnect.de.
	[91.10.33.45])
	by mx.google.com with ESMTPSA id f9sm23175879eeu.11.2013.04.27.11.34.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 11:34:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Apr 2013 20:33:59 +0200
Message-Id: <1367087640-4264-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-xfce 3/4] gdm: cosmetics
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
X-List-Received-Date: Sat, 27 Apr 2013 18:52:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/gdm/gdm-2.32.2/gdm-nodocs.patch  |   12 --------
 .../gdm/{gdm-2.32.2 => gdm}/%gconf-tree.xml        |    0
 .../0001-Remove-user-switch-applet.patch           |    0
 .../recipes-gnome/gdm/{gdm-2.32.2 => gdm}/Default  |    0
 .../gdm/{gdm-2.32.2 => gdm}/cross-xdetection.diff  |    0
 .../recipes-gnome/gdm/{gdm-2.32.2 => gdm}/gdm      |    0
 .../recipes-gnome/gdm/{gdm-2.32.2 => gdm}/gdm-pam  |    0
 .../recipes-gnome/gdm/{gdm-2.32.2 => gdm}/gdm.conf |    0
 .../{gdm-2.32.2 => gdm}/sysrooted-pkg-config.patch |    0
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |   30 ++++++++++---------
 10 files changed, 16 insertions(+), 26 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm-2.32.2/gdm-nodocs.patch
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/%gconf-tree.xml (100%)
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/0001-Remove-user-switch-applet.patch (100%)
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/Default (100%)
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/cross-xdetection.diff (100%)
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/gdm (100%)
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/gdm-pam (100%)
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/gdm.conf (100%)
 rename meta-gnome/recipes-gnome/gdm/{gdm-2.32.2 => gdm}/sysrooted-pkg-config.patch (100%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/gdm-nodocs.patch b/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/gdm-nodocs.patch
deleted file mode 100644
index 395fa62..0000000
--- a/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/gdm-nodocs.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- /tmp/Makefile.am	2006-07-26 11:37:52.000000000 +0200
-+++ gdm-2.14.9/Makefile.am	2006-07-26 11:38:01.734411000 +0200
-@@ -5,8 +5,7 @@
- 	vicious-extensions \
- 	daemon \
- 	gui \
--	utils \
--	docs
-+	utils 
- 
- # add these when help gets added back
- # docs omf-install
diff --git a/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/%gconf-tree.xml b/meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml
similarity index 100%
rename from meta-gnome/recipes-gnome/gdm/gdm-2.32.2/%gconf-tree.xml
rename to meta-gnome/recipes-gnome/gdm/gdm/%gconf-tree.xml
diff --git a/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/0001-Remove-user-switch-applet.patch b/meta-gnome/recipes-gnome/gdm/gdm/0001-Remove-user-switch-applet.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/gdm/gdm-2.32.2/0001-Remove-user-switch-applet.patch
rename to meta-gnome/recipes-gnome/gdm/gdm/0001-Remove-user-switch-applet.patch
diff --git a/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/Default b/meta-gnome/recipes-gnome/gdm/gdm/Default
similarity index 100%
rename from meta-gnome/recipes-gnome/gdm/gdm-2.32.2/Default
rename to meta-gnome/recipes-gnome/gdm/gdm/Default
diff --git a/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/cross-xdetection.diff b/meta-gnome/recipes-gnome/gdm/gdm/cross-xdetection.diff
similarity index 100%
rename from meta-gnome/recipes-gnome/gdm/gdm-2.32.2/cross-xdetection.diff
rename to meta-gnome/recipes-gnome/gdm/gdm/cross-xdetection.diff
diff --git a/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/gdm b/meta-gnome/recipes-gnome/gdm/gdm/gdm
similarity index 100%
rename from meta-gnome/recipes-gnome/gdm/gdm-2.32.2/gdm
rename to meta-gnome/recipes-gnome/gdm/gdm/gdm
diff --git a/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/gdm-pam b/meta-gnome/recipes-gnome/gdm/gdm/gdm-pam
similarity index 100%
rename from meta-gnome/recipes-gnome/gdm/gdm-2.32.2/gdm-pam
rename to meta-gnome/recipes-gnome/gdm/gdm/gdm-pam
diff --git a/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/gdm.conf b/meta-gnome/recipes-gnome/gdm/gdm/gdm.conf
similarity index 100%
rename from meta-gnome/recipes-gnome/gdm/gdm-2.32.2/gdm.conf
rename to meta-gnome/recipes-gnome/gdm/gdm/gdm.conf
diff --git a/meta-gnome/recipes-gnome/gdm/gdm-2.32.2/sysrooted-pkg-config.patch b/meta-gnome/recipes-gnome/gdm/gdm/sysrooted-pkg-config.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/gdm/gdm-2.32.2/sysrooted-pkg-config.patch
rename to meta-gnome/recipes-gnome/gdm/gdm/sysrooted-pkg-config.patch
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 09a6f93..da12ab8 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -9,25 +9,27 @@ PR = "r17"
 inherit gnome update-rc.d systemd useradd
 
 SRC_URI += " \
-            file://cross-xdetection.diff \
-            file://0001-Remove-user-switch-applet.patch \
-            file://0002-gdm-user-manager.c-avoid-displaying-system-users-in-.patch \
-            file://sysrooted-pkg-config.patch \
-            file://%gconf-tree.xml \
-            file://gdm \
-            file://gdm.conf \
-            file://gdm-pam \
-            file://Default \
-            file://gdm.service.in \
+    file://cross-xdetection.diff \
+    file://0001-Remove-user-switch-applet.patch \
+    file://0002-gdm-user-manager.c-avoid-displaying-system-users-in-.patch \
+    file://sysrooted-pkg-config.patch \
+    file://%gconf-tree.xml \
+    file://gdm \
+    file://gdm.conf \
+    file://gdm-pam \
+    file://Default \
+    file://gdm.service.in \
 "
 
 SRC_URI[archive.md5sum] = "dbe5187a2e17881cc454e313e0ae8d1e"
 SRC_URI[archive.sha256sum] = "034d23af0ea18d86e5543e707212d9297ec7d83f221808968af266dbebc0e703"
 
-EXTRA_OECONF = " --enable-authentication-scheme=shadow \
-                 --enable-debug=yes \
-                 --with-console-kit \
-                 --disable-scrollkeeper"
+EXTRA_OECONF = " \
+    --enable-authentication-scheme=shadow \
+    --enable-debug=yes \
+    --with-console-kit \
+    --disable-scrollkeeper \
+"
 
 do_configure_prepend() {
     sed -i -e "s:\bdocs::g" ${S}/Makefile.am
-- 
1.7.4.4



