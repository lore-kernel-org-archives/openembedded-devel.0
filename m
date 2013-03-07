Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UDZWX-0001AL-AF
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 13:02:15 +0100
Received: by mail-ea0-f182.google.com with SMTP id a12so1466880eaa.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 03:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=1NHy4E9dNoZiBjXJ4F0WZhh5f3RNL0tKExKA7a2Qew4=;
	b=QFRgpY7r/eoWmedtUsJ0U4b7QJKNdUFmnoN0XbeBomL7KS7H+royh+WjDfcWlP4D5m
	9QviyIEIr4R6z5C9PiDQP7xkKRb6OWTx3aIkiBcNQUpwvZb7UD4GKMj/zryRG3elVkgJ
	JoAbyZhB0GRLDqWeDRnCR5m1Iowq/6SadK4cVyW4vQSfZbXlVugW14QGFgBXs+Siq+/t
	ISumQzTYMxZOY0IKTR4qRioWiIRAaWuexpgEykN2ZuMoqgqaR9LivbCNtSUshK44xjLP
	/1wTRb2Ad9CSt3HMixd64NVI4aD9Rc0PofI0N7qB0iYtKS2JwCLRYWcDsbmGEFQ+wf27
	P6Zw==
X-Received: by 10.14.210.8 with SMTP id t8mr5719094eeo.35.1362656741554;
	Thu, 07 Mar 2013 03:45:41 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id q42sm1778870eem.14.2013.03.07.03.45.40
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 03:45:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 12:43:33 +0100
Message-Id: <1362656613-10357-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1362656613-10357-1-git-send-email-schnitzeltony@googlemail.com>
References: <1362656613-10357-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce/meta-gnome 4/4] xfce4-vala: initial add 4.10.2
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
X-List-Received-Date: Thu, 07 Mar 2013 12:02:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../vala/files/0001-align-vapi-dir.patch           |   39 ++++++++++++++++++++
 .../recipes-bindings/vala/xfce4-vala_4.10.2.bb     |   17 +++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-bindings/vala/files/0001-align-vapi-dir.patch
 create mode 100644 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.2.bb

diff --git a/meta-xfce/recipes-bindings/vala/files/0001-align-vapi-dir.patch b/meta-xfce/recipes-bindings/vala/files/0001-align-vapi-dir.patch
new file mode 100644
index 0000000..33c6ed3
--- /dev/null
+++ b/meta-xfce/recipes-bindings/vala/files/0001-align-vapi-dir.patch
@@ -0,0 +1,39 @@
+From 9ac15a092c50bb95973d1d81200af031109ad377 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 3 Feb 2013 23:31:50 +0100
+Subject: [PATCH 1/2] align vapi dir
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
+Upstream-Status: : Inappropriate [configuration]
+---
+ configure.ac |   10 ++--------
+ 1 files changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1692ce9..f43f904 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -35,14 +35,8 @@ M8T_CHECK_PACKAGE([EXO], [exo-1], [0.8.0])
+ 
+ dnl Check for Vala
+ M8T_CHECK_VALA([0.16.0])
+-AC_ARG_WITH([default-vapidir],
+-		AC_HELP_STRING([--with-default-vapidir],
+-				[Use default VAPI prefix from Vala installation]),
+-		[],
+-		[with_default_vapidir=no])
+-if test x"$with_default_vapidir" == xno ; then
+-	AC_SUBST([vapidir], [${datarootdir}/vala-0.16/vapi])
+-fi
++
++AC_SUBST([vapidir], [${datarootdir}/vala/vapi])
+ 
+ dnl Makefile outputs
+ AC_OUTPUT([
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.2.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.2.bb
new file mode 100644
index 0000000..152335a
--- /dev/null
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.2.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Xfce4 Vala provides bindings for the Xfce framework"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
+DEPENDS = "libxfce4util garcon xfconf libxfce4ui xfce4-panel exo vala xfce4-dev-tools-native"
+
+inherit xfce
+
+SRC_URI = " \
+    http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2 \
+    file://0001-align-vapi-dir.patch \
+"
+SRC_URI[md5sum] = "afcca7cb5ae84b9a9a621a352eaf59c4"
+SRC_URI[sha256sum] = "7d9ee9f7f4ce88f3ebc1bd465bad1cd813fa5d268be62fc8d313cbec5345a978"
+
+FILES_${PN} += "${datadir}/vala"
+
+RDEPENDS_${PN} = "vala"
-- 
1.7.6.5



