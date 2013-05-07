Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqrn-0003bl-Dr
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:17 +0200
Received: by mail-ea0-f171.google.com with SMTP id b10so582369eae.30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=RcfDL4OQVJ72G7vohcRUuK1kxHf4u6I6zup/wYkmHGM=;
	b=eghBEaX6sHuMRPNGj1nS1/4iQls6OwOky3RXGBIc2CVXWNi2Y5N/sebPPa81u95Exk
	Ut2JEEKAGk/xR2U19Lqt3n1girUcAkiWA8A+Pyf359Wsba6muJHNhbiZHxYYSjXWaF+p
	7LpMTf/9YrOzafG0BBNYh+jLCCxD0I1yMj/vCWsuyaXZFovhKEOCPZJ6hmdxH2DGsm0P
	FZINgR9Z8hQ5OhYdzs8nvW2+4jbH/rB7rFQjhdqkUsgHGh/eXtqZfp/Vt63ckEQXEsqX
	fyJkh6/ZNkE68eisPHtModd75yk6I+zUaNSawsQQyS8IiSv7SHzcNHLNt6XOcEl0/Txj
	+v+g==
X-Received: by 10.14.179.133 with SMTP id h5mr10039078eem.34.1367966534263;
	Tue, 07 May 2013 15:42:14 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:43 +0200
Message-Id: <1367966513-12566-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 05/15] gnome-terminal: update to 2.30.2
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
X-List-Received-Date: Tue, 07 May 2013 23:00:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

this is the last version with GPL V2

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0001-Makefile.am-do-not-build-help.patch       |   28 ++++++++++++++++++++
 .../30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch |   20 --------------
 .../recipes-gnome/gnome/gnome-terminal_2.26.3.bb   |   19 -------------
 .../recipes-gnome/gnome/gnome-terminal_2.30.2.bb   |   15 ++++++++++
 4 files changed, 43 insertions(+), 39 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome/gnome-terminal/0001-Makefile.am-do-not-build-help.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb

diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal/0001-Makefile.am-do-not-build-help.patch b/meta-gnome/recipes-gnome/gnome/gnome-terminal/0001-Makefile.am-do-not-build-help.patch
new file mode 100644
index 0000000..d7874e4
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/gnome-terminal/0001-Makefile.am-do-not-build-help.patch
@@ -0,0 +1,28 @@
+From d2549d3ef08536be6d141524e3382fef07fea8bf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Tue, 30 Apr 2013 19:48:27 +0200
+Subject: [PATCH] Makefile.am: do not build help
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ Makefile.am |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 89f7ee4..31e11ab 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,4 +1,4 @@
+-SUBDIRS = src po help
++SUBDIRS = src po
+ 
+ NULL =
+ 
+-- 
+1.7.6.5
+
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch b/meta-gnome/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
deleted file mode 100644
index 0358ed8..0000000
--- a/meta-gnome/recipes-gnome/gnome/gnome-terminal/30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From 30f29e7d8e1b67c40cd18a7155ba30c4382692d5 Mon Sep 17 00:00:00 2001
-From: Seán de Búrca <leftmostcat@gmail.com>
-Date: Fri, 07 Aug 2009 00:38:52 +0000
-Subject: Remove useless Plural-Forms line which breaks build with gnome-doc-utils master
-
----
-diff --git a/help/el/el.po b/help/el/el.po
-index ab77264..635b68f 100644
---- a/help/el/el.po
-+++ b/help/el/el.po
-@@ -10,7 +10,6 @@ msgstr ""
- "MIME-Version: 1.0\n"
- "Content-Type: text/plain; charset=UTF-8\n"
- "Content-Transfer-Encoding: 8bit\n"
--"Plural-Forms: 2\n"
- "X-Poedit-Language: Greek\n"
- "X-Poedit-Country: GREECE\n"
- "X-Generator: Lokalize 0.2\n"
---
-cgit v0.8.3.1
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
deleted file mode 100644
index 9bf6b6d..0000000
--- a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "GNOME Terminal"
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5b51eba4ba4cafe64073227530c061ed"
-DEPENDS = "gtk+ glib-2.0 startup-notification dbus-glib vte"
-PR = "r2"
-
-inherit gnome
-
-SRC_URI += "file://30f29e7d8e1b67c40cd18a7155ba30c4382692d5.patch;patch=1"
-
-EXTRA_OECONF += "--disable-scrollkeeper"
-
-# Remove an autogenerated file that needs to be rebuilt
-do_configure_prepend () {
-    rm -f ${S}/src/terminal-type-builtins.c
-}
-
-SRC_URI[archive.md5sum] = "0395af0d444ed4fbfabf65d3583119c8"
-SRC_URI[archive.sha256sum] = "ecddbf523700820524b2646451c307c5b55078b9cebe5fa464ef626b4b4cbda2"
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
new file mode 100644
index 0000000..1afd334
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "GNOME Terminal"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b51eba4ba4cafe64073227530c061ed"
+DEPENDS = "gtk+ glib-2.0 startup-notification dbus-glib vte gnome-doc-utils"
+
+inherit gnome
+
+SRC_URI += " \
+    file://0001-Makefile.am-do-not-build-help.patch \
+"
+
+EXTRA_OECONF += "--disable-scrollkeeper"
+
+SRC_URI[archive.md5sum] = "74c4528f00067072c2bd867d1f8fe844"
+SRC_URI[archive.sha256sum] = "2c7af2250698b9f9f53c6eaa93211c1118cf2c7e29cbbacfd1e8a6a10069e07a"
-- 
1.7.4.4



