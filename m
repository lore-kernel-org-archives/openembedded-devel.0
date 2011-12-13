Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVbM-00021p-PQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 17:53:12 +0100
Received: by mail-ee0-f47.google.com with SMTP id b15so3169269eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=oVgJcisxy41HnUFDDzJwiWnPGBpEWfLlABfxy89PdMo=;
	b=pz2+drk0T3sSCLZe7HUQXTl6/s6YNAmbwym0yJm0GW1mflaOi4hkeVCVzLhKGfQz3v
	JHxsHdcZ1endSSSEYySBGVuv3wPeHMVgNxXSPSWwyorFUQaiCXqN2cbkXOo503RFzVRL
	mfIk9RWp10r2Y7XQ86t4fTHaZb6iXyUMsWhoc=
Received: by 10.180.104.2 with SMTP id ga2mr33316172wib.33.1323794779125;
	Tue, 13 Dec 2011 08:46:19 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id
	n9sm27277056wbo.16.2011.12.13.08.46.17 (version=SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 08:46:18 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:44:43 +0400
Message-Id: <1323794683-24233-7-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
References: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
Subject: [meta-opie 6/6] opie: fix SDK generation
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
X-List-Received-Date: Tue, 13 Dec 2011 16:53:12 -0000

Fix SDK generation. Include correct version of tools, set up environment
for the linux-oe-g++ qmake spec. qmake still has some room for
improvement to add automatic handling of (e.g.) thread/non-threaded
config, opie-related defines, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/meta/meta-toolchain-opie.bb           |   30 ++++++++++++++++---
 .../tasks/task-opie-toolchain-host-nativesdk.bb    |    8 +++++
 recipes-opie/tasks/task-opie-toolchain-target.bb   |   16 ++++++++++
 3 files changed, 49 insertions(+), 5 deletions(-)
 create mode 100644 recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
 create mode 100644 recipes-opie/tasks/task-opie-toolchain-target.bb

diff --git a/recipes-opie/meta/meta-toolchain-opie.bb b/recipes-opie/meta/meta-toolchain-opie.bb
index 6a941c3..3238b37 100644
--- a/recipes-opie/meta/meta-toolchain-opie.bb
+++ b/recipes-opie/meta/meta-toolchain-opie.bb
@@ -1,8 +1,28 @@
-PR = "r1"
-TOOLCHAIN_TARGET_TASK = "\
-    task-sdk-base \
-    task-sdk-opie"
+PR = "r3"
+TOOLCHAIN_HOST_TASK = "task-opie-toolchain-host-nativesdk task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_TARGET_TASK = "task-opie-toolchain-target"
+TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-opie-${DISTRO_VERSION}"
 
 require recipes-core/meta/meta-toolchain.bb
 
-SDK_SUFFIX = "toolchain-opie"
+QT_TOOLS_PREFIX = "${SDKPATHNATIVE}${bindir_nativesdk}"
+
+toolchain_create_sdk_env_script_append() {
+
+    echo 'export OE_QMAKE_CC=${TARGET_PREFIX}gcc' >> $script
+    echo 'export OE_QMAKE_CFLAGS="-DQWS $CFLAGS"' >> $script
+    echo 'export OE_QMAKE_CXX=${TARGET_PREFIX}g++' >> $script
+    echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
+    echo 'export OE_QMAKE_AR=${TARGET_PREFIX}ar' >> $script
+    echo 'export OE_QMAKE_STRIP="echo"' >> $script
+    echo 'export OE_QMAKE_UIC=${QT_TOOLS_PREFIX}/uic2' >> $script
+    echo 'export OE_QMAKE_MOC=${QT_TOOLS_PREFIX}/moc2' >> $script
+    echo 'export OE_QMAKE_CXXFLAGS="-fno-exceptions -fno-rtti -DQWS $CXXFLAGS"' >> $script
+    echo 'export OE_QMAKE_LINK="${TARGET_PREFIX}g++"' >> $script
+    echo 'export OE_QMAKE_INCDIR_QT="${SDKTARGETSYSROOT}${includedir}/qte"' >> $script
+    echo 'export OE_QMAKE_LIBDIR_QT="${SDKTARGETSYSROOT}${libdir}"' >> $script
+    echo 'export OE_QMAKE_LIBS_QT="qte"' >> $script
+    echo 'export OE_QMAKE_LIBS_X11=""' >> $script
+
+    echo 'export QMAKESPEC=${SDKPATHNATIVE}${datadir}/qmake/linux-oe-g++' >> $script
+}
diff --git a/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb b/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
new file mode 100644
index 0000000..5ca80e6
--- /dev/null
+++ b/recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb
@@ -0,0 +1,8 @@
+require recipes-core/tasks/task-sdk-host-nativesdk.bb
+
+DESCRIPTION = "Host packages for Opie SDK"
+PR = "r2"
+LICENSE = "MIT"
+ALLOW_EMPTY = "1"
+
+RDEPENDS_${PN} += "qmake-nativesdk uicmoc-nativesdk"
diff --git a/recipes-opie/tasks/task-opie-toolchain-target.bb b/recipes-opie/tasks/task-opie-toolchain-target.bb
new file mode 100644
index 0000000..b9ea713
--- /dev/null
+++ b/recipes-opie/tasks/task-opie-toolchain-target.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Target packages for Opie SDK"
+PR = "r7"
+LICENSE = "MIT"
+ALLOW_EMPTY = "1"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+
+RDEPENDS_${PN} = "\
+    task-core-standalone-sdk-target \
+    libopie2-dev \
+    libqpe-opie-dev \
+    ${@base_conditional("PALMTOP_USE_MULTITHREADED_QT", "yes", "qte-mt", "qte", d)}-dev \
+    libqtaux2-dev \
+    libmailwrapper-dev"
-- 
1.7.7.3



