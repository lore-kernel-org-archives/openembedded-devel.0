Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web09.181.1630124249868439657
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Aug 2021 21:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=M11F+VDi;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1mJpma-0002on-8A; Sat, 28 Aug 2021 06:17:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=btcSaqscpkg4DeptrQCH9GQ9f60g93U4eDU6kIVkLJw=; b=M11F+VDiAPeT/+k6+YcQL1lU0n
	wL0O05fOMrrRjWmxgTIuMY++aJ464vJgJ6sNrvRBHYrdOiJjX9VahKtFYYPuk7VQ+YtfWkypfVeD4
	1lFKoNVtjPjrjKIe1Q/JuOZyxJzBVDSUjr1pxor9PAWznHEhibACHBYxmU0XGZmxjsond0WazVqil
	4wKWJYC81YWkCVozDEI1yDi0biKYBkhp9f1Nu4+/zFNHwC/p9H0g2EkscSR7gZO8zgUI6qVG2cUR9
	XVRBjrtytWxgknW3KEXVJU0/tzlnR57MtTxZ9jYc8dEzcHEQZuYV2PAjV8vCOdwp2+NDtClim9Fq0
	nXAqilvQ==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.lan)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1mJpmW-0006RR-4X; Sat, 28 Aug 2021 06:17:26 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-devel@lists.openembedded.org
Cc: zboszor@gmail.com
Subject: [meta-gnome][PATCH] metacity: Add a patch to create build/src/core before moving generated sources to it
Date: Sat, 28 Aug 2021 06:17:20 +0200
Message-Id: <20210828041720.2817832-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <ef6e4f5b-044e-0649-ae59-aa25ecba95dd@pr.hu>
References: <ef6e4f5b-044e-0649-ae59-aa25ecba95dd@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Scan-Signature: b899a7fb3baab380f674538c2418a553
X-Spam-Tracer: backend.mail.pr.hu -0.8 20210828041726Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zoltán Böszörményi <zboszor@gmail.com>

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...before-moving-generated-sources-into.patch | 49 +++++++++++++++++++
 .../recipes-gnome/metacity/metacity_3.40.0.bb |  5 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-Create-src-core-before-moving-generated-sources-into.patch

diff --git a/meta-gnome/recipes-gnome/metacity/metacity/0001-Create-src-core-before-moving-generated-sources-into.patch b/meta-gnome/recipes-gnome/metacity/metacity/0001-Create-src-core-before-moving-generated-sources-into.patch
new file mode 100644
index 000000000..935a31d09
--- /dev/null
+++ b/meta-gnome/recipes-gnome/metacity/metacity/0001-Create-src-core-before-moving-generated-sources-into.patch
@@ -0,0 +1,49 @@
+From b2f31fc2ce5a7bc14c084ddbe6ec12578c1aaf29 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Sat, 28 Aug 2021 05:58:25 +0200
+Subject: [PATCH] Create src/core before moving generated sources into it
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With split build and source directories, there's a reproducible
+make failure:
+
+| Making all in src
+| make[2]: Entering directory '.../metacity/1_3.40.0-r0/build/src'
+| .../metacity/1_3.40.0-r0/recipe-sysroot-native/usr/bin/glib-mkenums --template ../../metacity-3.40.0/src/core/meta-enum-types.c.in ../../metacity-3.40.0/src/core/window-private.h ../../metacity-3.40.0/src/include/meta-compositor.h  > \
+| 	meta-enum-types.c.tmp && mv meta-enum-types.c.tmp core/meta-enum-types.c
+| .../metacity/1_3.40.0-r0/recipe-sysroot-native/usr/bin/glib-mkenums --template ../../metacity-3.40.0/src/core/meta-enum-types.h.in ../../metacity-3.40.0/src/core/window-private.h ../../metacity-3.40.0/src/include/meta-compositor.h  > \
+| 	meta-enum-types.h.tmp && mv meta-enum-types.h.tmp core/meta-enum-types.h
+| mv: cannot move 'meta-enum-types.c.tmp' to 'core/meta-enum-types.c'mv: cannot move 'meta-enum-types.h.tmp' to 'core/meta-enum-types.h': No such file or directory
+| : No such file or directory
+| make[2]: *** [Makefile:2240: core/meta-enum-types.c] Error 1
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+---
+ src/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index f86af600..487c30d3 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -204,10 +204,12 @@ ENUM_TYPES = \
+ 	$(NULL)
+ 
+ core/meta-enum-types.c: core/meta-enum-types.c.in $(ENUM_TYPES) Makefile.am
++	$(MKDIR_P) $(builddir)/core
+ 	$(AM_V_GEN) $(GLIB_MKENUMS) --template $(srcdir)/core/meta-enum-types.c.in $(ENUM_TYPES) > \
+ 		meta-enum-types.c.tmp && mv meta-enum-types.c.tmp core/meta-enum-types.c
+ 
+ core/meta-enum-types.h: core/meta-enum-types.h.in $(ENUM_TYPES) Makefile.am
++	$(MKDIR_P) $(builddir)/core
+ 	$(AM_V_GEN) $(GLIB_MKENUMS) --template $(srcdir)/core/meta-enum-types.h.in $(ENUM_TYPES) > \
+ 		meta-enum-types.h.tmp && mv meta-enum-types.h.tmp core/meta-enum-types.h
+ 
+-- 
+2.31.1
+
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
index a5c704740..0fd631fba 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
@@ -24,7 +24,10 @@ REQUIRED_DISTRO_FEATURES = "x11"
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
 SRC_URI[archive.sha256sum] = "224c1f65487eac21f0c1d9856152343768ee726c48b1a8a2835a46a8ad9015b5"
-SRC_URI += "file://0001-drop-zenity-detection.patch"
+SRC_URI += " \
+    file://0001-drop-zenity-detection.patch \
+    file://0001-Create-src-core-before-moving-generated-sources-into.patch \
+"
 
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
 # enable as neccessary until new warnings are dealt with
-- 
2.31.1

