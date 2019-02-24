Return-Path: <tuanhoanganh.dev@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 47D4C71E5A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2019 13:19:01 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y10so3233758plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2019 05:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=SrJ++CjinTen17wNRiniRd1JO5qAMNWA2VAwopThtKo=;
	b=C5pBIohIiJhSUhFFvgCAzHfPMgd0O7QtxuI3kH6qE9cI/Bmh/MPIZUPiyRLbbwHjIu
	cjZkwK8K/0oE14ih0jvOq7/jzpauk1LDBvvs7l3D/Ku/TwaZoAwj3UL4h3DnGICeV4dW
	ka1w4SzJw9dCJ2MUnOPYGNdfGhCAdxk0Yy9OeSKvWRX59OpdZxOag+ob0VDe/3NaXV7U
	xIvjExjMU2FZv4gMSupU/K+w8tyzcxLexpiAJkFET1uIhTWtOYcu8x9aJSg2WVBg2jWk
	8SePH8yK1fn7121LJQu4CyD5Lcn5aTb7bw4vRnEAclYo1bOeJMq+i6ijHtMn8VbKgMNw
	Fblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SrJ++CjinTen17wNRiniRd1JO5qAMNWA2VAwopThtKo=;
	b=Q16L/kWLQlrv9YQgLDO+b3bXsU+i9uaVN5vh1iP6nWBpMD7ba0OIi8rMN4/c41byej
	B95SuFimS9lM7MHfQduxn+s6w5a4qjJ5vP2FHEemdk9Bc+JBpMpodN671rxAR9K3bqVT
	YrPVH8CYqB39X+AhWOPYPoz8X1+aaiN7UJrvhPAV9FMd0Y1fp1x410XRoyH3uWq3y+oZ
	mFBvxlwoc7Vjej1S48Sv/BCAaZCubvX3ExQGmp3HjLILpOn3htM+vCP/FfB84wxeADE5
	FHfytxgxOwuFRXAL9miG+fYcQJtrbU5nMI5tBAN/ochKj2FihrSh/rrn22pvDUf7Zk/d
	PUpw==
X-Gm-Message-State: AHQUAuYDisEBQFezC3XxPaLVHirUob2WWOOhCdE8w4E4NRTHxiLZ6Ugj
	oRPsvK5eMrHqLY5hEMkVH7KX0EAuOEs=
X-Google-Smtp-Source: AHgI3IYDpJxpXLaCE0GjpAoI9SNTofBrSFVFoutQZZsqdBIkOl84JKv9E5QgEnWc/IsugSYSqwMzTw==
X-Received: by 2002:a17:902:765:: with SMTP id
	92mr12641815pli.95.1551014342104; 
	Sun, 24 Feb 2019 05:19:02 -0800 (PST)
Received: from localhost.localdomain ([128.242.105.20])
	by smtp.gmail.com with ESMTPSA id
	t185sm10724509pfd.165.2019.02.24.05.19.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Feb 2019 05:19:01 -0800 (PST)
From: Hoang Anh Tuan <tuanhoanganh.dev@gmail.com>
X-Google-Original-From: Hoang Anh Tuan <tuanha@viosoft.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Feb 2019 13:18:52 +0000
Message-Id: <1551014332-1608-1-git-send-email-tuanha@viosoft.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] libforms: add version 1.2.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Feb 2019 13:19:01 -0000

Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
---
 .../files/add-absolute-path-for-include-dir.patch  | 12 +++++++++++
 .../libforms/files/fix-link-to-xforms-man.patch    | 12 +++++++++++
 .../libforms/files/fix-path-fdesign_LDADD.patch    | 12 +++++++++++
 .../recipes-graphics/libforms/libforms_1.2.3.bb    | 24 ++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libforms/files/add-absolute-path-for-include-dir.patch
 create mode 100644 meta-oe/recipes-graphics/libforms/files/fix-link-to-xforms-man.patch
 create mode 100644 meta-oe/recipes-graphics/libforms/files/fix-path-fdesign_LDADD.patch
 create mode 100644 meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb

diff --git a/meta-oe/recipes-graphics/libforms/files/add-absolute-path-for-include-dir.patch b/meta-oe/recipes-graphics/libforms/files/add-absolute-path-for-include-dir.patch
new file mode 100644
index 0000000..db400f7
--- /dev/null
+++ b/meta-oe/recipes-graphics/libforms/files/add-absolute-path-for-include-dir.patch
@@ -0,0 +1,12 @@
+diff -Naur xforms-1.2.3.orig/fdesign/Makefile.am xforms-1.2.3/fdesign/Makefile.am
+--- xforms-1.2.3.orig/fdesign/Makefile.am	2019-02-24 12:58:51.968645873 +0000
++++ xforms-1.2.3/fdesign/Makefile.am	2019-02-24 13:00:48.500635163 +0000
+@@ -11,7 +11,7 @@
+ fdesign.1:
+ 	cp -p $(srcdir)/fdesign.man fdesign.1
+ 
+-INCLUDES = -I./xpm $(X_CFLAGS)
++INCLUDES = -I./xpm -I$(srcdir)/xpm $(X_CFLAGS)
+ 
+ bin_PROGRAMS = fdesign
+ 
diff --git a/meta-oe/recipes-graphics/libforms/files/fix-link-to-xforms-man.patch b/meta-oe/recipes-graphics/libforms/files/fix-link-to-xforms-man.patch
new file mode 100644
index 0000000..c95bd18
--- /dev/null
+++ b/meta-oe/recipes-graphics/libforms/files/fix-link-to-xforms-man.patch
@@ -0,0 +1,12 @@
+diff -Naur xforms-1.2.3.orig/lib/Makefile.am xforms-1.2.3/lib/Makefile.am
+--- xforms-1.2.3.orig/lib/Makefile.am	2019-02-24 12:53:58.340678373 +0000
++++ xforms-1.2.3/lib/Makefile.am	2019-02-24 12:54:33.096674102 +0000
+@@ -25,7 +25,7 @@
+ man_MANS = xforms.5
+ 
+ xforms.5:
+-	cp -p ./xforms.man xforms.5
++	cp -p $(srcdir)/xforms.man xforms.5
+ 
+ libforms_la_SOURCES = \
+ 	align.c \
diff --git a/meta-oe/recipes-graphics/libforms/files/fix-path-fdesign_LDADD.patch b/meta-oe/recipes-graphics/libforms/files/fix-path-fdesign_LDADD.patch
new file mode 100644
index 0000000..73956de
--- /dev/null
+++ b/meta-oe/recipes-graphics/libforms/files/fix-path-fdesign_LDADD.patch
@@ -0,0 +1,12 @@
+diff -Naur xforms-1.2.3.orig/fdesign/Makefile.am xforms-1.2.3/fdesign/Makefile.am
+--- xforms-1.2.3.orig/fdesign/Makefile.am	2019-02-24 13:08:48.412603250 +0000
++++ xforms-1.2.3/fdesign/Makefile.am	2019-02-24 13:09:18.412601874 +0000
+@@ -15,7 +15,7 @@
+ 
+ bin_PROGRAMS = fdesign
+ 
+-fdesign_LDADD = $(top_srcdir)/lib/libforms.la $(X_LIBS) $(X_PRE_LIBS) $(XPM_LIB) -lX11 $(LIBS) $(X_EXTRA_LIBS)
++fdesign_LDADD = $(top_builddir)/lib/libforms.la $(X_LIBS) $(X_PRE_LIBS) $(XPM_LIB) -lX11 $(LIBS) $(X_EXTRA_LIBS)
+ 
+ fdesign_SOURCES = \
+ 	fd_attribs.c \
diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
new file mode 100644
index 0000000..8a214d1
--- /dev/null
+++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "The XForms graphical interface widget library	"
+HOMEPAGE = "http://savannah.nongnu.org/projects/xforms/"
+PR = "r0"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=ade9a053df81f5b9408d2f4f5546df86"
+
+SRC_URI = "http://download.savannah.nongnu.org/releases/xforms/xforms-${PV}.tar.gz \
+           file://fix-link-to-xforms-man.patch \
+           file://add-absolute-path-for-include-dir.patch \
+           file://fix-path-fdesign_LDADD.patch \
+          "
+
+SRC_URI[md5sum] = "235720a758a8b8d9e6e452dc67190e9b"
+SRC_URI[sha256sum] = "7989b39598c769820ad451ad91e5cb0de29946940c8240aac94ca8238c2def61"
+
+inherit autotools
+
+S = "${WORKDIR}/xforms-${PV}"
+
+DEPENDS = "libxpm jpeg libx11 mesa"
+RDEPENDS_${PN} = "bash"
+
+EXTRA_OECONF = "--with-extra-inc=${S}/lib" 
-- 
2.7.4


