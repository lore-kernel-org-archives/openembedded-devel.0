Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 577276ABF7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2015 13:09:48 +0000 (UTC)
Received: by wgsk9 with SMTP id k9so11289222wgs.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2015 06:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3VGmv7hgvWS13Y223cZH/WFdvZ6yGLNtJmwk0HTk6t4=;
	b=VXKdnieiTEvja1o5cxP2jsj/diYnOOJtNX/IDL133zFHn1YkMfC/l+Ch9uuqJJNrGi
	D0lR8fQpsyeaLBtH6TZfnzL2T/5a0Bqlq5NheK2yXEKmOJeX0ANdF3c1qNIywvzIWNri
	AlJ3SWot9vtPUoEJMabB+YRaLDZK3z4miqBVcCgBdJgSy3xV83DA/AUaAGMnecluDv0A
	/CLQF16DPcNnW2gZ9j5MLrrStI7vm3rPUrBQyB2gXUy55vRqhwSGzhpyqPIyNMPG89cA
	wbh9fK+9NfHrRlaYfYAtedqZcJRMLGjFFavG58FcJKGmIbD6cIY5EAJSFQf2WGAOPG5o
	zDSg==
X-Gm-Message-State: ALoCoQlOuE5a2tWsXpvsP4+Ku+IJOsgTc49/NO/Jz/q6XVpI5SQkSDaQKwLO6GI6Ypq8MFAYSRCx
X-Received: by 10.194.86.9 with SMTP id l9mr12762951wjz.80.1429016989371;
	Tue, 14 Apr 2015 06:09:49 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id z12sm1512383wjw.39.2015.04.14.06.09.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Apr 2015 06:09:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Apr 2015 14:06:25 +0100
Message-Id: <1429016785-29691-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libart-lgpl: add (from oe-core)
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
X-List-Received-Date: Tue, 14 Apr 2015 13:09:49 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libart-lgpl/libart-lgpl/Makefile.am.patch      |   17 ++++++++++++
 .../libart-lgpl/libart-lgpl/aarch64/art_config.h   |   10 +++++++
 .../libart-lgpl/libart-lgpl/aarch64be/art_config.h |   10 +++++++
 .../libart-lgpl/aarch64be_32/art_config.h          |   10 +++++++
 .../libart-lgpl/libart-lgpl/arm/art_config.h       |   10 +++++++
 .../libart-lgpl/libart-lgpl/armeb/art_config.h     |   10 +++++++
 .../libart-lgpl/libart-lgpl/i386/art_config.h      |   10 +++++++
 .../libart-lgpl/libart-lgpl/i586/art_config.h      |   10 +++++++
 .../libart-lgpl/libart-lgpl/i686/art_config.h      |   10 +++++++
 .../libart-lgpl/libart-lgpl/mips/art_config.h      |   10 +++++++
 .../libart-lgpl/libart-lgpl/mips64/art_config.h    |   10 +++++++
 .../libart-lgpl/libart-lgpl/mips64el/art_config.h  |   10 +++++++
 .../libart-lgpl/libart-lgpl/mipsel/art_config.h    |   10 +++++++
 .../libart-lgpl/libart-lgpl/powerpc/art_config.h   |   10 +++++++
 .../libart-lgpl/libart-lgpl/powerpc64/art_config.h |   10 +++++++
 .../libart-lgpl/libart-lgpl/x86_64/art_config.h    |   10 +++++++
 .../libart-lgpl/libart-lgpl_2.3.21.bb              |   28 ++++++++++++++++++++
 17 files changed, 195 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/Makefile.am.patch
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be_32/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/arm/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/armeb/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i386/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i586/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i686/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64el/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mipsel/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc64/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/x86_64/art_config.h
 create mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl_2.3.21.bb

diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/Makefile.am.patch b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/Makefile.am.patch
new file mode 100644
index 0000000..190ba96
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/Makefile.am.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Inappropriate [configuration]
+
+Index: libart_lgpl-2.3.21/Makefile.am
+===================================================================
+--- libart_lgpl-2.3.21.orig/Makefile.am	2009-04-18 05:29:25.000000000 -0700
++++ libart_lgpl-2.3.21/Makefile.am	2010-11-23 23:12:32.445450075 -0800
+@@ -7,8 +7,8 @@
+ 
+ BUILT_SOURCES = art_config.h
+ 
+-art_config.h:
+-	./gen_art_config.sh > art_config.h
++#art_config.h:
++#	./gen_art_config.sh > art_config.h
+ 
+ EXTRA_DIST = 			\
+ 	libart.def		\
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64/art_config.h
new file mode 100644
index 0000000..500ffc3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 8
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be/art_config.h
new file mode 100644
index 0000000..500ffc3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 8
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be_32/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be_32/art_config.h
new file mode 100644
index 0000000..b0e74ad
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be_32/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 4
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/arm/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/arm/art_config.h
new file mode 100644
index 0000000..b0e74ad
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/arm/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 4
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/armeb/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/armeb/art_config.h
new file mode 100644
index 0000000..b0e74ad
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/armeb/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 4
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i386/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i386/art_config.h
new file mode 100644
index 0000000..b0e74ad
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i386/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 4
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i586/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i586/art_config.h
new file mode 100644
index 0000000..b0e74ad
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i586/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 4
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i686/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i686/art_config.h
new file mode 100644
index 0000000..b0e74ad
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i686/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 4
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips/art_config.h
new file mode 100644
index 0000000..b0e74ad
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 4
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64/art_config.h
new file mode 100644
index 0000000..d10cd95
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 8
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64el/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64el/art_config.h
new file mode 100644
index 0000000..d10cd95
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64el/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 8
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mipsel/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mipsel/art_config.h
new file mode 100644
index 0000000..b0e74ad
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mipsel/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 4
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc/art_config.h
new file mode 100644
index 0000000..b0e74ad
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 4
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc64/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc64/art_config.h
new file mode 100644
index 0000000..500ffc3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc64/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 8
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/x86_64/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/x86_64/art_config.h
new file mode 100644
index 0000000..500ffc3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/x86_64/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 8
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl_2.3.21.bb b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl_2.3.21.bb
new file mode 100644
index 0000000..4966ea4
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl_2.3.21.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Library of functions for 2D graphics"
+SECTION = "x11/gnome"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+PR = "r2"
+
+ART_CONFIG = "${HOST_ARCH}/art_config.h"
+
+# can't use gnome.oeclass due to _ in filename
+SRC_URI = "${GNOME_MIRROR}/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2 \
+       file://${ART_CONFIG} \
+       file://Makefile.am.patch"
+
+SRC_URI[md5sum] = "08559ff3c67fd95d57b0c5e91a6b4302"
+SRC_URI[sha256sum] = "fdc11e74c10fc9ffe4188537e2b370c0abacca7d89021d4d303afdf7fd7476fa"
+
+inherit autotools pkgconfig
+
+DEPENDS = ""
+
+FILES_${PN} = "${libdir}/*.so.*"
+FILES_${PN}-dev += "${bindir}/libart2-config"
+
+S = "${WORKDIR}/libart_lgpl-${PV}"
+
+do_configure_prepend() {
+	cp ${WORKDIR}/${ART_CONFIG} ${S}/art_config.h
+}
-- 
1.7.10.4


