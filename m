Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQo1u-00039A-6O
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 00:00:14 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2550305fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 14:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=EuN79AQGEQPFpmEjAbxFjqMrWy2v5YoB+RvL705eTEM=;
	b=OBHVnHgPikcefWgV7emujYr7dr9m2FV+r0ZtwYgv+cfUP0jDJkiPrDUeOI7VQ0pv8l
	bu4FMl+V8bF5FPNbqKghojrPZ+yp7vIRqjQE1dF3W5qHj2DcrN4vZndRWjoYTkBg6MYT
	/uQ8Db6iQ7rDH/j1tVSkzZ7basOQMNjSeygWo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OnvR3Wq73H8hEt1KJI/B8dhHkY+3dK0nsQ8taL9K+7hH/jttIwyxIC1lClIR1nQlKq
	aEGXgmOdLf8uxFTs3cWDtv/BIF759usqYyyz2S2n52IiD1eMRvDKKwhOM4WwbvwyUdFY
	uUG0zvMCChgPLJNmD0Bxj+FvvmEPnBPhGnQ5Q=
Received: by 10.223.43.145 with SMTP id w17mr4757565fae.12.1306706228203;
	Sun, 29 May 2011 14:57:08 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id b22sm528256fak.1.2011.05.29.14.57.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 14:57:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 23:56:32 +0200
Message-Id: <c424bae29966b789e50eb4112a9d95a2b7833942.1306706130.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306706130.git.Martin.Jansa@gmail.com>
References: <cover.1306706130.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/14] libelf: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Sun, 29 May 2011 22:00:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libelf/libelf_0.8.13.bb |   38 +++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/libelf/libelf_0.8.13.bb

diff --git a/meta-oe/recipes-support/libelf/libelf_0.8.13.bb b/meta-oe/recipes-support/libelf/libelf_0.8.13.bb
new file mode 100644
index 0000000..2ca562f
--- /dev/null
+++ b/meta-oe/recipes-support/libelf/libelf_0.8.13.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "libelf is an ELF object file access library. \
+The elf library provides routines to access, and manipulate, Elf object files."
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
+SECTION = "libs"
+PR = "r1"
+
+SRC_URI = "http://www.mr511.de/software/libelf-${PV}.tar.gz"
+SRC_URI[md5sum] = "4136d7b4c04df68b686570afa26988ac"
+SRC_URI[sha256sum] = "591a9b4ec81c1f2042a97aa60564e0cb79d041c52faa7416acb38bc95bd2c76d"
+
+inherit autotools
+
+PARALLEL_MAKE = ""
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+EXTRA_OECONF_append_virtclass-native = " --enable-static"
+
+do_configure_prepend () {
+	if test ! -e acinclude.m4; then
+		cp aclocal.m4 acinclude.m4
+	fi
+}
+
+do_install () {
+	oe_runmake 'prefix=${D}${prefix}' 'exec_prefix=${D}${exec_prefix}' \
+		   'libdir=${D}${libdir}' 'includedir=${D}${includedir}' \
+		   install
+	install -d ${STAGING_INCDIR}/libelf
+        for i in libelf.h nlist.h gelf.h sys_elf.h; do
+                install -m 0644 lib/$i ${STAGING_INCDIR}/libelf/
+        done
+        make includedir=${STAGING_INCDIR} install-compat
+}
+
+BBCLASSEXTEND = "native"
+
-- 
1.7.5.rc3



