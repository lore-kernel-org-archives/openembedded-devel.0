Return-Path: <ashcharles@gmail.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 May 2014 16:00:22 UTC
Received: from mail-pb0-f46.google.com (unknown [209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9F74B65D0E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 16:00:22 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so7813955pbb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 09:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yyNV+HAGKbFJi5cvTWQW9Ayn8HR/0GWfn88oZZv8OvU=;
	b=nWWqFPA/V3V2dH2vURKzEcB1v7OQKdBKYBm3BmBl3ND9e+HPFB0o4TFzKyOWwpyKRe
	olf40AS8X4DmtrxsSPQwULgTDTSFXLtrUpVQHHo6hhku5BzPJsg51Hzu24mjkZFR5EWq
	iMnF5eCHgM/+Q0Y94FKaOa7hS3i3sgkPAPaSP97nmVJEGuMvMQ6qpA8tuv0ExxcC7R2t
	/A87dIBaou6SXZ9jYA08NUXSE/QlAnqb6Ldcg2Omh0AwWh1jnPn/HtAkMbxSyZrq3W7q
	cS8vrLEvlyFIQhY152Ij2Lw3r4GdoO25CrgeoQgpYtwqhHn/jvweKm0Qc+bxRULcpnFS
	I1IQ==
X-Received: by 10.68.197.39 with SMTP id ir7mr29387671pbc.78.1401119594421;
	Mon, 26 May 2014 08:53:14 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18])
	by mx.google.com with ESMTPSA id gj9sm18932748pbc.7.2014.05.26.08.53.13
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 May 2014 08:53:13 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 08:52:51 -0700
Message-Id: <1401119571-16597-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Cc: Ash Charles <ash@gumstix.com>
Subject: [meta-xfce][PATCH] xfce4-dev-tools: Allow out of tree builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 May 2014 16:00:27 -0000

From: Ash Charles <ash@gumstix.com>

The xdt-autogen target in the generated scripts/Makefile refers to
a $(srcdir)/xdt-autogen.in file.  For an out-of-tree build, this file
is actually located in $(builddir)/xdt-autogen.in. See [1]

Upstream-Status: Submitted

[1] https://bugzilla.xfce.org/show_bug.cgi?id=10899

Signed-off-by: Ash Charles <ash@gumstix.com>
---
 .../xfce4-dev-tools-4.11.0/xdt-autogen_dependency.patch     | 13 +++++++++++++
 .../recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb  |  7 +++++--
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools-4.11.0/xdt-autogen_dependency.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools-4.11.0/xdt-autogen_dependency.patch b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools-4.11.0/xdt-autogen_dependency.patch
new file mode 100644
index 0000000..8e6bd35
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools-4.11.0/xdt-autogen_dependency.patch
@@ -0,0 +1,13 @@
+diff --git a/scripts/Makefile.am b/scripts/Makefile.am
+index f2f0600..8e677dc 100644
+--- a/scripts/Makefile.am
++++ b/scripts/Makefile.am
+@@ -10,7 +10,7 @@ bin_SCRIPTS =								\
+	xdt-autogen							\
+	xdt-commit
+
+-xdt-autogen: Makefile $(srcdir)/xdt-autogen.in
++xdt-autogen: Makefile xdt-autogen.in
+	rm -f xdt-autogen xdt-autogen.gen
+	sed -e 's,\@DATADIR\@,$(datadir),g' \
+		xdt-autogen.in \
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
index 3312fbd..ad3140e 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
@@ -9,13 +9,16 @@ inherit autotools
 
 BBCLASSEXTEND = "native"
 
-SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2"
+SRC_URI = " \
+    http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2 \
+    file://xdt-autogen_dependency.patch \
+"
 SRC_URI[md5sum] = "36112d0256092c30bd1b47105c547edf"
 SRC_URI[sha256sum] = "2dccdd4935716a97db28464ba2403572ce03134fd7adf294e1a59eaf297e6555"
 
 do_install_append() {
     install -d ${D}${datadir}/aclocal
-    install -m 644 m4macros/*.m4 ${D}${datadir}/aclocal/
+    install -m 644 ${S}/m4macros/*.m4 ${D}${datadir}/aclocal/
 }
 
 FILES_${PN} += "${datadir}/xfce4/dev-tools/m4macros/*.m4"
-- 
1.8.3.2


