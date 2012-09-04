Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T91hi-0004XX-Lh
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 00:34:42 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so4917933wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2012 15:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Vsv7F6xzd1LO129liAm53zG6Hz4P0OLzZidjKrLWmDU=;
	b=CESQhts5wahKoHQOj8s44U4LtO5dbVfK6FacXzLteyGXCC68VkFQHRn5N+vABQYLTd
	IuR+nocjNWKYnZgNdoxImB0Ff3XrzNdmCmChuYaMU+hkX1rv7WUuaRZAVlZ4pXFgTGdl
	b1unR7PlBix+hp4WiddPG9NfNoigQ4JdQoOzZMY652RNmx6ihF8gr179tXq2uK49VQJQ
	+bw5I1lL6ExHkmkvmu4qdGOWuCImgcIx/UB31d7I59EMHvHhNpvRhNiRKsk4zsAExjgi
	5q0yageK4zvJqoEO5dqpVbaUYTkm8p9PBT+iyTQXcrST2PhHQlm4i3FVVR1biq/9UCRY
	4MIQ==
Received: by 10.216.241.198 with SMTP id g48mr5740961wer.192.1346797342527;
	Tue, 04 Sep 2012 15:22:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm26250447wib.5.2012.09.04.15.22.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 15:22:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 00:22:14 +0200
Message-Id: <63186927dc4dd8e52456b5ddd65ec4f2d81a0245.1346790372.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 02/10] terminology: add version 0.1.0, negative D_P to svn and bump PE
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
X-List-Received-Date: Tue, 04 Sep 2012 22:34:42 -0000

* PE bump is needed for upgrade path from svn recipe to 0.1.0 release

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../conf/distro/include/efl-from-svn-recipes.inc   |  2 ++
 meta-efl/recipes-efl/e17/terminology.inc           | 23 ++++++++++++++++++++++
 meta-efl/recipes-efl/e17/terminology_0.1.0.bb      | 10 ++++++++++
 meta-efl/recipes-efl/e17/terminology_svn.bb        | 22 +++------------------
 4 files changed, 38 insertions(+), 19 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/terminology.inc
 create mode 100644 meta-efl/recipes-efl/e17/terminology_0.1.0.bb

diff --git a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
index b017645..c28e281 100644
--- a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
+++ b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
@@ -37,3 +37,5 @@ PREFERRED_VERSION_python-edbus ?= "${EFL_PYTHON_PREFERRED_VERSION}"
 PREFERRED_VERSION_python-edje ?= "${EFL_PYTHON_PREFERRED_VERSION}"
 PREFERRED_VERSION_python-emotion ?= "${EFL_PYTHON_PREFERRED_VERSION}"
 PREFERRED_VERSION_python-evas ?= "${EFL_PYTHON_PREFERRED_VERSION}"
+
+PREFERRED_VERSION_terminology ?= "0.1.0+svn%"
diff --git a/meta-efl/recipes-efl/e17/terminology.inc b/meta-efl/recipes-efl/e17/terminology.inc
new file mode 100644
index 0000000..15af6ea
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/terminology.inc
@@ -0,0 +1,23 @@
+DESCRIPTION = "Enlightenment Terminal Emulator"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=03f6c2cf2bef233fadf7d0769f5bfda7"
+DEPENDS = "evas ecore edje elementary eina eet emotion"
+
+inherit e gettext
+INC_PR = "r2"
+
+# Because latest release we have is 0.1.0 which sorts lower then 0.1.0+svnr${SRCPV} already in feeds
+PE = "2"
+
+EXTRA_OECONF = "\
+  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
+"
+
+FILES_${PN} += "\
+        ${datadir}/icons/terminology.png \
+"
+
+# doesn't start without own theme
+# ERR<770>:terminology utils.c:26 theme_apply() Could not load any theme for group=terminology/background: No Error
+# CRI<770>:terminology main.c:448 elm_main() Couldn't find terminology theme! Forgot 'make install'?
+RDEPENDS_${PN} += "${PN}-themes"
diff --git a/meta-efl/recipes-efl/e17/terminology_0.1.0.bb b/meta-efl/recipes-efl/e17/terminology_0.1.0.bb
new file mode 100644
index 0000000..7a04069
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/terminology_0.1.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "30867692e44799cd9bbe6562d69ae62d"
+SRC_URI[sha256sum] = "87f32089b2731c3e9a72b5bde92695eb91097fa79dbb70388774c9dcb5442ebb"
diff --git a/meta-efl/recipes-efl/e17/terminology_svn.bb b/meta-efl/recipes-efl/e17/terminology_svn.bb
index 48d229b..9fa1304 100644
--- a/meta-efl/recipes-efl/e17/terminology_svn.bb
+++ b/meta-efl/recipes-efl/e17/terminology_svn.bb
@@ -1,25 +1,9 @@
-DESCRIPTION = "Enlightenment Terminal Emulator"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=03f6c2cf2bef233fadf7d0769f5bfda7"
-DEPENDS = "evas ecore edje elementary eina eet emotion"
+require ${BPN}.inc
 
+DEFAULT_PREFERENCE = "-1"
 PV = "0.1.0+svnr${SRCPV}"
-PR = "r1"
+PR = "${INC_PR}.0"
 SRCREV = "${EFL_SRCREV}"
 
-inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
-
-EXTRA_OECONF = "\
-  --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
-"
-
-FILES_${PN} += "\
-        ${datadir}/icons/terminology.png \
-"
-
-# doesn't start without own theme
-# ERR<770>:terminology utils.c:26 theme_apply() Could not load any theme for group=terminology/background: No Error
-# CRI<770>:terminology main.c:448 elm_main() Couldn't find terminology theme! Forgot 'make install'?
-RDEPENDS_${PN} += "${PN}-themes"
-- 
1.7.12



