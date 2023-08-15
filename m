Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED0AC0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:17:33 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.138547.1692116252549196389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id 6684F376BF
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 18:17:30 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.225.50]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qVwjZ-4b6xxh0; Tue, 15 Aug 2023 18:17:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libcanberra: fix api-documentation build
Date: Tue, 15 Aug 2023 18:17:19 +0200
Message-ID: <20230815161719.2172170-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692116249-437FC2B7-483480C2/0/0 CLEAN NORMAL
X-TOI-MSGID: 02b99b7e-4c4b-44ae-a049-5140937cee37
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 16:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104359

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../files/0001-remove-dropped-templates.patch | 65 +++++++++++++++++++
 .../libcanberra/libcanberra_0.30.bb           |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcanberra/files/0001-remove=
-dropped-templates.patch

diff --git a/meta-oe/recipes-support/libcanberra/files/0001-remove-droppe=
d-templates.patch b/meta-oe/recipes-support/libcanberra/files/0001-remove=
-dropped-templates.patch
new file mode 100644
index 0000000000..57f5486084
--- /dev/null
+++ b/meta-oe/recipes-support/libcanberra/files/0001-remove-dropped-templ=
ates.patch
@@ -0,0 +1,65 @@
+From dfd3ef4caac300f517f8eeb378f0b0f9ba6a9b06 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 15 Aug 2023 15:41:03 +0200
+Subject: [PATCH] remove dropped gtkdoc templates
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Pending
+---
+--- a/gtkdoc/gtk-doc.make	2011-08-25 23:20:22.000000000 +0200
++++ b/gtkdoc/gtk-doc.make	2023-08-15 18:08:02.430729073 +0200
+@@ -33,9 +33,9 @@
+ 	$(HTML_IMAGES)			\
+ 	$(SETUP_FILES)
+=20
+-DOC_STAMPS=3Dsetup-build.stamp scan-build.stamp tmpl-build.stamp sgml-b=
uild.stamp \
++DOC_STAMPS=3Dsetup-build.stamp scan-build.stamp sgml-build.stamp \
+ 	html-build.stamp pdf-build.stamp \
+-	tmpl.stamp sgml.stamp html.stamp pdf.stamp
++	sgml.stamp html.stamp pdf.stamp
+=20
+ SCANOBJ_FILES =3D 		 \
+ 	$(DOC_MODULE).args 	 \
+@@ -120,27 +120,12 @@
+ $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DO=
C_MODULE)-overrides.txt: scan-build.stamp
+ 	@true
+=20
+-#### templates ####
+-
+-tmpl-build.stamp: setup-build.stamp $(DOC_MODULE)-decl.txt $(SCANOBJ_FI=
LES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt
+-	@echo '  DOC   Rebuilding template files'
+-	@gtkdoc-mktmpl --module=3D$(DOC_MODULE) $(MKTMPL_OPTIONS)
+-	@if test "$(abs_srcdir)" !=3D "$(abs_builddir)" ; then \
+-	  if test -w $(abs_srcdir) ; then \
+-	    cp -rp $(abs_builddir)/tmpl $(abs_srcdir)/; \
+-	  fi \
+-	fi
+-	@touch tmpl-build.stamp
+-
+-tmpl.stamp: tmpl-build.stamp
+-	@true
+-
+ $(srcdir)/tmpl/*.sgml:
+ 	@true
+=20
+ #### xml ####
+=20
+-sgml-build.stamp: tmpl.stamp $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/=
*.sgml $(expand_content_files)
++sgml-build.stamp: $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.sgml $(ex=
pand_content_files)
+ 	@echo '  DOC   Building XML'
+ 	@-chmod -R u+w $(srcdir)
+ 	@_source_dir=3D'' ; \
+ --- a/gtkdoc/Makefile.am	2009-01-21 21:52:46.000000000 +0100
++++ b/gtkdoc/Makefile.am	2023-08-15 17:41:59.002498772 +0200
+@@ -31,10 +31,6 @@
+ # e.g. MKDB_OPTIONS=3D--sgml-mode --output-format=3Dxml
+ MKDB_OPTIONS=3D--sgml-mode --output-format=3Dxml
+=20
+-# Extra options to supply to gtkdoc-mktmpl
+-# e.g. MKTMPL_OPTIONS=3D--only-section-tmpl
+-MKTMPL_OPTIONS=3D
+-
+ # Extra options to supply to gtkdoc-fixref. Not normally needed.
+ # e.g. FIXXREF_OPTIONS=3D--extra-dir=3D../gdk-pixbuf/html --extra-dir=3D=
../gdk/html
+ FIXXREF_OPTIONS=3D
diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb b/me=
ta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
index 20fe910ebe..95c9479588 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
@@ -12,6 +12,7 @@ SRC_URI =3D " \
     http://0pointer.de/lennart/projects/${BPN}/${BPN}-${PV}.tar.xz \
     file://0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch \
     file://0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.pat=
ch \
+    file://0001-remove-dropped-templates.patch \
 "
 SRC_URI[md5sum] =3D "34cb7e4430afaf6f447c4ebdb9b42072"
 SRC_URI[sha256sum] =3D "c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37=
004bf48c601afa72"
--=20
2.41.0


