Received: from [88.149.128.34] (helo=smtpi4.ngi.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1M4WCT-0005ad-LM
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 10:22:02 +0200
Received: from localhost.localdomain (81-174-25-145.dynamic.ngi.it
	[81.174.25.145]) by smtpi4.ngi.it (Postfix) with ESMTP id 44B6142093;
	Thu, 14 May 2009 10:15:08 +0200 (CEST)
From: Elena Grandi <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 May 2009 10:14:54 +0200
Message-Id: <1242288896-6347-2-git-send-email-elena.valhalla@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <1242288896-6347-1-git-send-email-elena.valhalla@gmail.com>
References: <1242288896-6347-1-git-send-email-elena.valhalla@gmail.com>
Subject: [PATCH] gtksourceview2 2.6.0: new recipe for the current stable version.
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
X-List-Received-Date: Thu, 14 May 2009 08:22:10 -0000

GtkSourceView is a portable C library that extends the standard GTK+
framework for multiline text editing.

Signed-off-by: Elena Grandi <elena.valhalla@gmail.com>
---
 recipes/gtksourceview/gtksourceview2_2.6.0.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gtksourceview/gtksourceview2_2.6.0.bb

diff --git a/recipes/gtksourceview/gtksourceview2_2.6.0.bb b/recipes/gtksourceview/gtksourceview2_2.6.0.bb
new file mode 100644
index 0000000..ee9f654
--- /dev/null
+++ b/recipes/gtksourceview/gtksourceview2_2.6.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Portable C library for multiline text editing"
+HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
+LICENSE = "LGPL"
+DEPENDS = "gtk+ libgnomeprint"
+PR = "r0"
+PNAME = "gtksourceview"
+
+S = "${WORKDIR}/${PNAME}-${PV}"
+
+inherit gnome pkgconfig
+
+# overrule SRC_URI from gnome.conf
+SRC_URI = "${GNOME_MIRROR}/${PNAME}/${@gnome_verdir("${PV}")}/${PNAME}-${PV}.tar.bz2"
+
+do_stage() {
+autotools_stage_all
+}
+
-- 
1.6.0.6



