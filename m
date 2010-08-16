Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ol1e7-000690-IC
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 17:30:47 +0200
Received: by fxm6 with SMTP id 6so3101110fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=lZz0Rx4/z1Vu2B8K6yljokHTkzqwbqv1DrNguhvUZH4=;
	b=oC08+zKuQJJ47E1xTJdg4vWQzXXQ0NKoe7vD4j9NSCGgVbfe9C5PPT+tti3WAzbYHx
	5MC6XYN2+u2O9SvH+iHF8fnO56EY0veIUTmDioJpKZKdGiEPAsLe79dtlO6YZZ8yNZ0N
	s2f7VXgb8HcF3pPDw+Exh7CwFy7LzFIQkTPIE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hGZqf7rOCcniMGUWzblWgmiSZ4XP/PZnl4e036YCEfV/xo0oHXU60NY/32gPqIrnAS
	IIaOVF1qzxAcWjPJsm7Nw5oIu6h9zqWiomwyBteBeHR0AoaXq0iNWZb7nqCq+mGjR6HG
	Idi5bppLfxth/TlXHH8XkyjFRKYH3+WD2Nv90=
Received: by 10.223.104.136 with SMTP id p8mr5262073fao.105.1281972626523;
	Mon, 16 Aug 2010 08:30:26 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm1379123fav.26.2010.08.16.08.30.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 08:30:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 17:30:15 +0200
Message-Id: <1281972620-7317-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
References: <1281972620-7317-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/9] xorg-doc: move older not pinned versions to obsolete dir
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
X-List-Received-Date: Mon, 16 Aug 2010 15:30:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/obsolete/xorg/xorg-doc/xorg-docs_1.0.1.bb  |   11 +++++++++++
 recipes/obsolete/xorg/xorg-doc/xorg-docs_1.2.bb    |   11 +++++++++++
 recipes/obsolete/xorg/xorg-doc/xorg-docs_1.4.bb    |   13 +++++++++++++
 .../xorg/xorg-doc/xorg-sgml-doctools_1.1.1.bb      |    8 ++++++++
 .../xorg/xorg-doc/xorg-sgml-doctools_1.2.bb        |    8 ++++++++
 .../xorg/xorg-doc/xorg-sgml-doctools_1.4.bb        |    8 ++++++++
 recipes/xorg-doc/xorg-docs_1.0.1.bb                |   11 -----------
 recipes/xorg-doc/xorg-docs_1.2.bb                  |   11 -----------
 recipes/xorg-doc/xorg-docs_1.4.bb                  |   13 -------------
 recipes/xorg-doc/xorg-sgml-doctools_1.1.1.bb       |    8 --------
 recipes/xorg-doc/xorg-sgml-doctools_1.2.bb         |    8 --------
 recipes/xorg-doc/xorg-sgml-doctools_1.4.bb         |    8 --------
 12 files changed, 59 insertions(+), 59 deletions(-)
 create mode 100644 recipes/obsolete/xorg/xorg-doc/xorg-docs_1.0.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-doc/xorg-docs_1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-doc/xorg-docs_1.4.bb
 create mode 100644 recipes/obsolete/xorg/xorg-doc/xorg-sgml-doctools_1.1.1.bb
 create mode 100644 recipes/obsolete/xorg/xorg-doc/xorg-sgml-doctools_1.2.bb
 create mode 100644 recipes/obsolete/xorg/xorg-doc/xorg-sgml-doctools_1.4.bb
 delete mode 100644 recipes/xorg-doc/xorg-docs_1.0.1.bb
 delete mode 100644 recipes/xorg-doc/xorg-docs_1.2.bb
 delete mode 100644 recipes/xorg-doc/xorg-docs_1.4.bb
 delete mode 100644 recipes/xorg-doc/xorg-sgml-doctools_1.1.1.bb
 delete mode 100644 recipes/xorg-doc/xorg-sgml-doctools_1.2.bb
 delete mode 100644 recipes/xorg-doc/xorg-sgml-doctools_1.4.bb

diff --git a/recipes/obsolete/xorg/xorg-doc/xorg-docs_1.0.1.bb b/recipes/obsolete/xorg/xorg-doc/xorg-docs_1.0.1.bb
new file mode 100644
index 0000000..5b2a1ce
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-doc/xorg-docs_1.0.1.bb
@@ -0,0 +1,11 @@
+require xorg-doc-common.inc
+DESCRIPTION = "The documentation in this package is from xc/doc in the monolithic \
+source tree."
+DEPENDS += " intltool"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "78fd95f6d5ea69d91723dcc16280c664"
+SRC_URI[archive.sha256sum] = "b7b8593b055e29dedc0631e1db9781583038afc67bce0f715fdf3201570d1e4e"
+
+FILES_${PN} += " /usr/share/X11/doc"
diff --git a/recipes/obsolete/xorg/xorg-doc/xorg-docs_1.2.bb b/recipes/obsolete/xorg/xorg-doc/xorg-docs_1.2.bb
new file mode 100644
index 0000000..b7a33c9
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-doc/xorg-docs_1.2.bb
@@ -0,0 +1,11 @@
+require xorg-doc-common.inc
+DESCRIPTION = "The documentation in this package is from xc/doc in the monolithic \
+source tree."
+DEPENDS += " intltool"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f817c5df43817846c1b27bac83da74d7"
+SRC_URI[archive.sha256sum] = "23648ac11d5cc57f3e1e747a73bd1c4f83c42a657969814af0d399fdd3d7beec"
+
+FILES_${PN} += " /usr/share/X11/doc"
diff --git a/recipes/obsolete/xorg/xorg-doc/xorg-docs_1.4.bb b/recipes/obsolete/xorg/xorg-doc/xorg-docs_1.4.bb
new file mode 100644
index 0000000..12d671d
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-doc/xorg-docs_1.4.bb
@@ -0,0 +1,13 @@
+require xorg-doc-common.inc
+DESCRIPTION = "The documentation in this package is from xc/doc in the monolithic \
+source tree."
+DEPENDS += " intltool"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4f2005bdd430a98c262901383459009e"
+SRC_URI[archive.sha256sum] = "fffc67e50ce396e6ddd95e842fa8351954b8f09cb729a9a062e0496a8bda4925"
+
+EXTRA_OECONF += " ac_cv_file__usr_share_sgml_X11_defs_ent=no "
+
+FILES_${PN} += " /usr/share/X11/doc"
diff --git a/recipes/obsolete/xorg/xorg-doc/xorg-sgml-doctools_1.1.1.bb b/recipes/obsolete/xorg/xorg-doc/xorg-sgml-doctools_1.1.1.bb
new file mode 100644
index 0000000..8d6a17b
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-doc/xorg-sgml-doctools_1.1.1.bb
@@ -0,0 +1,8 @@
+require xorg-doc-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ae3d4f73c42953b0a5513bb2967ab913"
+SRC_URI[archive.sha256sum] = "be1fbd7646a55eb9a9ad161f9b83034ba88a82c780e29d4a7888db2495947f25"
+
+FILES_${PN} += " /usr/share/sgml/X11"
diff --git a/recipes/obsolete/xorg/xorg-doc/xorg-sgml-doctools_1.2.bb b/recipes/obsolete/xorg/xorg-doc/xorg-sgml-doctools_1.2.bb
new file mode 100644
index 0000000..9a4fb30
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-doc/xorg-sgml-doctools_1.2.bb
@@ -0,0 +1,8 @@
+require xorg-doc-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "f930e5be117922f0841614c8d43f1ae8"
+SRC_URI[archive.sha256sum] = "4def78f2e0e002f5693b61b53ab4325fbc150d3614fe53818e8df9b365a4dbea"
+
+FILES_${PN} += " /usr/share/sgml/X11"
diff --git a/recipes/obsolete/xorg/xorg-doc/xorg-sgml-doctools_1.4.bb b/recipes/obsolete/xorg/xorg-doc/xorg-sgml-doctools_1.4.bb
new file mode 100644
index 0000000..bfcf483
--- /dev/null
+++ b/recipes/obsolete/xorg/xorg-doc/xorg-sgml-doctools_1.4.bb
@@ -0,0 +1,8 @@
+require xorg-doc-common.inc
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "20484c9d97800530616742cb14989ac2"
+SRC_URI[archive.sha256sum] = "e49b069c03cdc9d7a8aa23054431660fc2360213768a3defe61f8f9ee0af4d6f"
+
+FILES_${PN} += " /usr/share/sgml/X11"
diff --git a/recipes/xorg-doc/xorg-docs_1.0.1.bb b/recipes/xorg-doc/xorg-docs_1.0.1.bb
deleted file mode 100644
index 5b2a1ce..0000000
--- a/recipes/xorg-doc/xorg-docs_1.0.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-doc-common.inc
-DESCRIPTION = "The documentation in this package is from xc/doc in the monolithic \
-source tree."
-DEPENDS += " intltool"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "78fd95f6d5ea69d91723dcc16280c664"
-SRC_URI[archive.sha256sum] = "b7b8593b055e29dedc0631e1db9781583038afc67bce0f715fdf3201570d1e4e"
-
-FILES_${PN} += " /usr/share/X11/doc"
diff --git a/recipes/xorg-doc/xorg-docs_1.2.bb b/recipes/xorg-doc/xorg-docs_1.2.bb
deleted file mode 100644
index b7a33c9..0000000
--- a/recipes/xorg-doc/xorg-docs_1.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-doc-common.inc
-DESCRIPTION = "The documentation in this package is from xc/doc in the monolithic \
-source tree."
-DEPENDS += " intltool"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f817c5df43817846c1b27bac83da74d7"
-SRC_URI[archive.sha256sum] = "23648ac11d5cc57f3e1e747a73bd1c4f83c42a657969814af0d399fdd3d7beec"
-
-FILES_${PN} += " /usr/share/X11/doc"
diff --git a/recipes/xorg-doc/xorg-docs_1.4.bb b/recipes/xorg-doc/xorg-docs_1.4.bb
deleted file mode 100644
index 12d671d..0000000
--- a/recipes/xorg-doc/xorg-docs_1.4.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-doc-common.inc
-DESCRIPTION = "The documentation in this package is from xc/doc in the monolithic \
-source tree."
-DEPENDS += " intltool"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4f2005bdd430a98c262901383459009e"
-SRC_URI[archive.sha256sum] = "fffc67e50ce396e6ddd95e842fa8351954b8f09cb729a9a062e0496a8bda4925"
-
-EXTRA_OECONF += " ac_cv_file__usr_share_sgml_X11_defs_ent=no "
-
-FILES_${PN} += " /usr/share/X11/doc"
diff --git a/recipes/xorg-doc/xorg-sgml-doctools_1.1.1.bb b/recipes/xorg-doc/xorg-sgml-doctools_1.1.1.bb
deleted file mode 100644
index 8d6a17b..0000000
--- a/recipes/xorg-doc/xorg-sgml-doctools_1.1.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-doc-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ae3d4f73c42953b0a5513bb2967ab913"
-SRC_URI[archive.sha256sum] = "be1fbd7646a55eb9a9ad161f9b83034ba88a82c780e29d4a7888db2495947f25"
-
-FILES_${PN} += " /usr/share/sgml/X11"
diff --git a/recipes/xorg-doc/xorg-sgml-doctools_1.2.bb b/recipes/xorg-doc/xorg-sgml-doctools_1.2.bb
deleted file mode 100644
index 9a4fb30..0000000
--- a/recipes/xorg-doc/xorg-sgml-doctools_1.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-doc-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "f930e5be117922f0841614c8d43f1ae8"
-SRC_URI[archive.sha256sum] = "4def78f2e0e002f5693b61b53ab4325fbc150d3614fe53818e8df9b365a4dbea"
-
-FILES_${PN} += " /usr/share/sgml/X11"
diff --git a/recipes/xorg-doc/xorg-sgml-doctools_1.4.bb b/recipes/xorg-doc/xorg-sgml-doctools_1.4.bb
deleted file mode 100644
index bfcf483..0000000
--- a/recipes/xorg-doc/xorg-sgml-doctools_1.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-doc-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "20484c9d97800530616742cb14989ac2"
-SRC_URI[archive.sha256sum] = "e49b069c03cdc9d7a8aa23054431660fc2360213768a3defe61f8f9ee0af4d6f"
-
-FILES_${PN} += " /usr/share/sgml/X11"
-- 
1.7.2



