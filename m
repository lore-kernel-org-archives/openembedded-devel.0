Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8dMI-0005wh-9Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 22:34:58 +0200
Received: by wibhq4 with SMTP id hq4so3756832wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Sep 2012 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Vsv7F6xzd1LO129liAm53zG6Hz4P0OLzZidjKrLWmDU=;
	b=q1xbi9pLd739sL5WqksQWPyd8qLmyjyINxDWjxDFUYxctWqnSEyYAf0+M5ZLMDAXHl
	JTgUoilg0cdM7OitNmtSG4DFD1uqVm7YjaxH8rYUEunqaRkF2CYqr6TAGj+OHgVVUKE9
	nPreQXWW/+a2n9/szSYfvrceyc6P6KPQUzDo8qlLAO6P1hEdrAqxWtXu0YCZbWoUbxqA
	UVvjGLRuuilPia9jkAplOOFvOkycchBVQwAwvN7LSFlxEv4qAWkXn4NWXqOcHYYgdNS9
	2ot6qnhz0uMLhyBF9McTpjDaQIy+nAXgg0+B823IGrtAROEHDtIL5DlUKxkUjMes9SkZ
	RFAQ==
Received: by 10.180.107.163 with SMTP id hd3mr25568718wib.19.1346703757634;
	Mon, 03 Sep 2012 13:22:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr4sm30407923wib.8.2012.09.03.13.22.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 13:22:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Sep 2012 22:22:44 +0200
Message-Id: <63186927dc4dd8e52456b5ddd65ec4f2d81a0245.1346703604.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346703604.git.Martin.Jansa@gmail.com>
References: <cover.1346703604.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346703604.git.Martin.Jansa@gmail.com>
References: <cover.1346703604.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/3] terminology: add version 0.1.0, negative D_P to svn and bump PE
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
X-List-Received-Date: Mon, 03 Sep 2012 20:34:58 -0000

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



