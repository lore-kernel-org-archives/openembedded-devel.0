Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QSD2f-0007Ng-1s
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 20:54:49 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1385143bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 11:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=r3F1mdzmpccLxXX1NRxGQmlXA63P9QwehjGAlm7Qubc=;
	b=wGqhr33quwhi7Cpk/0fB6mZiqGKqvI+d3yu5/LNf/K8neF5NGOb60vIBjgKQ9eZ9bu
	FqTskSB2MHDQfD7G7dgMYGfYY021PF10UncWOVRrrJak3jA4jQn+6K0uWrRTMOc0Ofvw
	CKRV0wOniSj0gPQ3FLvtZwldzP9uQGvl8O0vE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=u3M3jf0z2y8I84aiCEG+V+DkIPtqCYDNx7xYVNBHmOGu10bjUE/9uKXPra1F2W5485
	VkVFr0+wh4r+u6a/67cbRKHxHwnKQEcMun/zTLslPa4dKSAYrBnLzOFVDxEm1gO8sgCy
	EbV+3CBF/QntntYfvZzzlOYlRv+gJ0YL7PuSQ=
Received: by 10.204.79.196 with SMTP id q4mr1049327bkk.107.1307040699421;
	Thu, 02 Jun 2011 11:51:39 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id k16sm690844bks.1.2011.06.02.11.51.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 11:51:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jun 2011 20:51:34 +0200
Message-Id: <1eefebc5e34260c875302a181cb80724bad4303d.1307040582.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <cover.1307040582.git.Martin.Jansa@gmail.com>
References: <cover.1307040582.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] gobject-introspection: add newer git version compatible with glib-2.0_git
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
X-List-Received-Date: Thu, 02 Jun 2011 18:54:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gobject-introspection_git.bb                   |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/gobject-introspection/gobject-introspection_git.bb

diff --git a/meta-oe/recipes-devtools/gobject-introspection/gobject-introspection_git.bb b/meta-oe/recipes-devtools/gobject-introspection/gobject-introspection_git.bb
new file mode 100644
index 0000000..2a7f30c
--- /dev/null
+++ b/meta-oe/recipes-devtools/gobject-introspection/gobject-introspection_git.bb
@@ -0,0 +1,33 @@
+# NOTE: WIP! This recipe does not cross-compile atm., only -native
+DEPENDS = "glib-2.0 libffi python-native gobject-introspection-native"
+DEPENDS_virtclass-native = "libffi-native python-native bison-native flex-native"
+BBCLASSEXTEND = "native"
+
+SRC_URI = "git://git.gnome.org/gobject-introspection;protocol=git \
+  file://use-usr-bin-env-for-python.patch \
+"
+
+LICENSE = "GPLv2+ & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING.tools;md5=94d55d512a9ba36caa9b7df079bae19f \
+		    file://COPYING.lib;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+SRCREV = "8d64bc23d2b837421ecf9c7b0e4b8d5d95ca0d21"
+PV = "1.29.0+gitr${SRCPV}"
+DEFAULT_PREFERENCE = "-1"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
+
+do_configure_prepend () {
+        echo "EXTRA_DIST = " > ${S}/gtk-doc.make
+}
+
+EXTRA_OECONF = "\
+  --disable-gtk-doc \
+  --disable-gtk-doc-html \
+  --disable-gtk-doc-pdf \
+  --disable-tests \
+"
-- 
1.7.5.3



