Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzpjD-00038v-5t
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 15:58:15 +0200
Received: by wgbdr1 with SMTP id dr1so1221100wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=D8wwnC/0iijhOqZM9+EjNboBPlNiPP9ucvtlhJlhxtA=;
	b=YGx2ElhW1O1ghyoktRlZelocpJMLiV9IUPiGqjaWe4K3YbLN92ledxGmqpR9Mr2ZZp
	rfrsZUw/st8aU1b7vR1iSRrotsQcxBRPwPcSR6JLZCqoIUAuMXFBXdoBGaePdPWoCW4J
	gEnLxgIo/GoOiWAgoX/iDCsqwTQ+rwzxRKRuzvU/Wz/zwcO6zjPliPff5xhhGi82NkfP
	7Cqulh+ji6QfdPrxmSHE+LPBU6CE+/nAXcLLGoMa2ceklLAODzF1gG7MLo+u9/ORKnM1
	V8cMuYMn1494SEdxJV2dzxTJLhdu/fOfy3eR5beQTOdE5MSRWmxhqpvmZ6Y45tD8Vf5s
	7s4w==
Received: by 10.180.81.133 with SMTP id a5mr6219127wiy.17.1344606385654;
	Fri, 10 Aug 2012 06:46:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dc3sm7834742wib.7.2012.08.10.06.46.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:46:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:16 +0200
Message-Id: <2b0147dc53c2effc2831c5be1afd0cb033ab394a.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 21/46] meta-efl: evas-generic-loaders: add new recipes to cope with missing SVG support in newer evas
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
X-List-Received-Date: Fri, 10 Aug 2012 13:58:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../conf/distro/include/efl-from-svn-recipes.inc   |    1 +
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc  |   33 ++++++++++++++++++++
 .../recipes-efl/efl/evas-generic-loaders_1.2.0.bb  |   10 ++++++
 .../recipes-efl/efl/evas-generic-loaders_svn.bb    |   11 ++++++
 4 files changed, 55 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders.inc
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.2.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb

diff --git a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
index 9af3b6d..38c2dd3 100644
--- a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
+++ b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
@@ -18,6 +18,7 @@ PREFERRED_VERSION_eina-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_embryo ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_embryo-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_evas ?= "${EFL_PREFERRED_VERSION}"
+PREFERRED_VERSION_evas-generic-loaders ?= "1.2.0+svn%"
 PREFERRED_VERSION_evas-native ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_expedite ?= "${EFL_PREFERRED_VERSION}"
 PREFERRED_VERSION_expedite-native ?= "${EFL_PREFERRED_VERSION}"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
new file mode 100644
index 0000000..7556eb2
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
@@ -0,0 +1,33 @@
+DESCRIPTION = "Evas generic loaders"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=06568fc31423f3c8ad84f375e061c342"
+DEPENDS = "eina poppler librsvg cairo"
+
+inherit efl
+
+INC_PR = "r0"
+
+SRCNAME = "evas_generic_loaders"
+
+EXTRA_OECONF = " \
+  --enable-poppler \
+  --enable-svg \
+  --disable-gstreamer \
+  --disable-libraw \
+  --disable-spectre \
+"
+
+python populate_packages_prepend () {
+    bb.note( "splitting packages for evas generic loaders" )
+    basedir = bb.data.expand( '${libdir}/evas/utils', d )
+
+    do_split_packages(d, basedir, '^evas_image_loader\.(.*)$',
+    output_pattern = "evas-generic-loader-%s",
+    description = 'Evas generic loaders - module %s',
+    allow_dirs=True, recursive=False, extra_depends="" )
+}
+
+FILES_evas-generic-loader-xcf += "${libdir}/evas/utils/*.xcf.gz"
+FILES_${PN}-dbg += "${libdir}/evas/utils/.debug"
+
+PACKAGES_DYNAMIC = "evas-generic-loader-*"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.2.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.2.0.bb
new file mode 100644
index 0000000..de0ce1c
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.2.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "340a8c2f42c82ecd10f0204cdb291a70"
+SRC_URI[sha256sum] = "9a3aad43269f34513765b04ed3e8db5a18d3545da010b2f6066aeaf90bf442d4"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
new file mode 100644
index 0000000..594de4a
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
@@ -0,0 +1,11 @@
+require ${BPN}.inc
+
+SRCREV = "${EFL_SRCREV}"
+PV = "1.2.0+svnr${SRCPV}"
+PR = "${INC_PR}.0"
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "\
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+"
+S = "${WORKDIR}/${SRCNAME}"
-- 
1.7.8.6



