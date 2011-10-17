Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFwp1-0007ET-Pr
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 01:42:20 +0200
Received: by bkat8 with SMTP id t8so85760bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 16:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+0/7D51CZXf2fQlR8LxNuNf9AsqaNXq0CgD1rd11osU=;
	b=tUaMZ3MiVPSbu1lzd8+musdGU6M5m/pNf+kX6UXSN2SfKEwc97iuVH8SSdijk4y02y
	4G/sRj4hOZQ3VI/sPtC6JEicrzp9zpcLEZBgAIjpfIEKt2OXv1PTT4mRv5u95p7P+VdD
	ivlxYNSoa8idENHjpNUP1UTEZA/CyVD/35MT4=
Received: by 10.223.63.130 with SMTP id b2mr28400095fai.35.1318894589656;
	Mon, 17 Oct 2011 16:36:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c1sm177487fab.15.2011.10.17.16.36.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 16:36:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 01:35:27 +0200
Message-Id: <6e5b1534132d8cd754623a830deff1ed55ecf447.1318894479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
References: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318894479.git.Martin.Jansa@gmail.com>
References: <cover.1318894479.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome 08/10] abiword: fix install, newer versions doesn't allow to overwrite just installed files
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
X-List-Received-Date: Mon, 17 Oct 2011 23:42:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword-2.5.inc   |    4 ++-
 .../abiword/abiword-2.5/fix.double.install.patch   |   34 ++++++++++++++++++++
 .../abiword/abiword-embedded_2.5.2.bb              |    4 +-
 meta-gnome/recipes-gnome/abiword/abiword_2.5.2.bb  |    4 +-
 4 files changed, 41 insertions(+), 5 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword-2.5/fix.double.install.patch

diff --git a/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc b/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
index c469369..67a5ef4 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
+++ b/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
@@ -7,7 +7,9 @@ DEPENDS     = "perl-native wv libgsf libglade libfribidi jpeg libpng libxml2"
 RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
                glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
 
-SRC_URI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz"
+SRC_URI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz \
+           file://fix.double.install.patch \
+"
 SRC_URI[md5sum] = "bbc9c124f8072875129bd67092f0fa0b"
 SRC_URI[sha256sum] = "db34eeb5457fb7572fc76ec2a73cdb4f7a67307e7468b6c4bde820b58c598b3f"
 
diff --git a/meta-gnome/recipes-gnome/abiword/abiword-2.5/fix.double.install.patch b/meta-gnome/recipes-gnome/abiword/abiword-2.5/fix.double.install.patch
new file mode 100644
index 0000000..67db139
--- /dev/null
+++ b/meta-gnome/recipes-gnome/abiword/abiword-2.5/fix.double.install.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Pending
+
+Without this patch it fails with:
+| make[6]: Entering directory `/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.5.2-r2/abiword-2.5.2/src/wp/ap/unix'
+| make[6]: Nothing to be done for `install-exec-am'.
+| test -z "/usr/share/abiword-2.5/glade" || /bin/mkdir -p "/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.5.2-r2/image/usr/share/abiword-2.5/glade"
+|  /usr/bin/install -c -m 644 ap_UnixDialog_Break.glade ap_UnixDialog_Field.glade ap_UnixDialog_FormatTOC.glade ap_UnixDialog_FormatFootnotes.glade ap_UnixDialog_FormatTable.glade ap_UnixDialog_FormatFrame.gla
+de ap_UnixDialog_Goto.glade ap_UnixDialog_InsertTable.glade ap_UnixDialog_Insert_DateTime.glade ap_UnixDialog_MailMerge.glade ap_UnixDialog_MetaData.glade ap_UnixDialog_Options.glade ap_UnixDialog_HdrFtr.glade
+ ap_UnixDialog_Options_ColorSel.glade ap_UnixDialog_PageNumbers.glade ap_UnixDialog_PageSetup.glade ap_UnixDialog_Replace.glade ap_UnixDialog_New.glade ap_UnixDialog_Styles.glade ap_UnixDialog_Stylist.glade ap
+ _UnixDialog_Stylist_modal.glade ap_UnixDialog_Tab.glade ap_UnixDialog_WordCount.glade ap_UnixDialog_Latex.glade ap_UnixDialog_Options.glade ap_UnixDialog_HdrFtr.glade '/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-
+ linux-gnueabi/abiword-2.5.2-r2/image/usr/share/abiword-2.5/glade'
+ | /usr/bin/install: will not overwrite just-created `/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.5.2-r2/image/usr/share/abiword-2.5/glade/ap_UnixDialog_Options.glade' with `ap_UnixDialog_O
+ ptions.glade'
+ | /usr/bin/install: will not overwrite just-created `/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.5.2-r2/image/usr/share/abiword-2.5/glade/ap_UnixDialog_HdrFtr.glade' with `ap_UnixDialog_Hd
+ rFtr.glade'
+ | make[6]: *** [install-gladeDATA] Error 1
+ | make[6]: Leaving directory `/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.5.2-r2/abiword-2.5.2/src/wp/ap/unix'
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff -uNr abiword-2.5.2.orig/src/wp/ap/unix/GNUmakefile.am abiword-2.5.2/src/wp/ap/unix/GNUmakefile.am
+--- abiword-2.5.2.orig/src/wp/ap/unix/GNUmakefile.am	2007-06-04 17:17:01.000000000 +0200
++++ abiword-2.5.2/src/wp/ap/unix/GNUmakefile.am	2011-10-18 00:48:05.247378444 +0200
+@@ -69,9 +69,7 @@
+ 	ap_UnixDialog_Stylist_modal.glade	\
+ 	ap_UnixDialog_Tab.glade	\
+ 	ap_UnixDialog_WordCount.glade \
+-	ap_UnixDialog_Latex.glade \
+-	ap_UnixDialog_Options.glade \
+-	ap_UnixDialog_HdrFtr.glade
++	ap_UnixDialog_Latex.glade
+ 
+ if ENABLE_SPELL
+ spellsrc=	ap_UnixDialog_Spell.cpp
diff --git a/meta-gnome/recipes-gnome/abiword/abiword-embedded_2.5.2.bb b/meta-gnome/recipes-gnome/abiword/abiword-embedded_2.5.2.bb
index 7ee0f86..edb55dd 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword-embedded_2.5.2.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword-embedded_2.5.2.bb
@@ -1,6 +1,6 @@
 require abiword-2.5.inc
-
-PR = "r1"
+FILESEXTRAPATHS_prepend := "${THISDIR}/abiword-${SHRT_VER}:"
+PR = "r2"
 
 EXTRA_OECONF += "--enable-embedded"
 
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.5.2.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.5.2.bb
index c10d761..91e05d3 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.5.2.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.5.2.bb
@@ -1,5 +1,5 @@
 require abiword-2.5.inc
-
-PR = "r2"
+FILESEXTRAPATHS_prepend := "${THISDIR}/abiword-${SHRT_VER}:"
+PR = "r3"
 
 RCONFLICTS_${PN} = "abiword-embedded"
-- 
1.7.7



