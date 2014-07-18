Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2D4706E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h3fe030280; Fri, 18 Jul 2014 09:43:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dijiQ2qyCc2L; Fri, 18 Jul 2014 09:43:04 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gw0h030245
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:42:59 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kj-0006ig-4P; Fri, 18 Jul 2014 09:42:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:26 +0100
Message-Id: <1405672966-25729-7-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/27] claws-plugin-gtkhtml2: Use "foreign" automake strictness and autotools-brokensep
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:24 -0000

---
 .../claws-plugin-gtkhtml2-viewer/configure.patch   | 52 ++++++++++++++++++++++
 .../claws-plugin-gtkhtml2-viewer_0.31.bb           |  3 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer/configure.patch

diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer/configure.patch b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer/configure.patch
new file mode 100644
index 0000000..222a796
--- /dev/null
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer/configure.patch
@@ -0,0 +1,52 @@
+Index: gtkhtml2_viewer-0.31/configure.ac
+===================================================================
+--- gtkhtml2_viewer-0.31.orig/configure.ac	2011-08-27 08:08:55.000000000 +0000
++++ gtkhtml2_viewer-0.31/configure.ac	2014-07-18 07:28:42.769518618 +0000
+@@ -1,33 +1,27 @@
+ AC_PREREQ(2.60)
+-AC_INIT(src/gtkhtml2_viewer.c)
++
++dnl plugin version
++m4_define([plugin_major_version],[0])
++m4_define([plugin_minor_version],[31])
++m4_define([plugin_micro_version],[0])
++m4_define([plugin_version], [plugin_major_version.plugin_minor_version.plugin_micro_version])
++
++AC_INIT(gtkhml2_viewer, plugin_version)
++AC_CONFIG_SRCDIR(src/gtkhtml2_viewer.c)
+ AC_CONFIG_AUX_DIR(config)
+ AM_MAINTAINER_MODE
+ 
+ PACKAGE=gtkhtml2_viewer
+ 
+-dnl plugin version
+-MAJOR_VERSION=0
+-MINOR_VERSION=31
+-MICRO_VERSION=0
++MAJOR_VERSION=plugin_major_version
++MINOR_VERSION=plugin_minor_version
++MICRO_VERSION=plugin_micro_version
+ EXTRA_VERSION=0
+-
+-if test \( $EXTRA_VERSION -eq 0 \); then
+-    if test \( $MICRO_VERSION -eq 0 \); then
+-        VERSION=${MAJOR_VERSION}.${MINOR_VERSION} 
+-    else
+-		VERSION=${MAJOR_VERSION}.${MINOR_VERSION}.${MICRO_VERSION}
+-    fi
+-else
+-    if test \( $MICRO_VERSION -eq 0 \); then
+-        VERSION=${MAJOR_VERSION}.${MINOR_VERSION}cvs${EXTRA_VERSION}
+-    else
+-		VERSION=${MAJOR_VERSION}.${MINOR_VERSION}.${MICRO_VERSION}cvs${EXTRA_VERSION}
+-    fi
+-fi
++VERSION=plugin_version
+ 
+ AC_CANONICAL_SYSTEM
+ 
+-AM_INIT_AUTOMAKE($PACKAGE, $VERSION, no-define)
++AM_INIT_AUTOMAKE([foreign no-define])
+ AC_CONFIG_HEADERS(config.h)
+ AC_DEFINE_UNQUOTED(PLUGINVERSION, "$VERSION", [plugin version])
+ 
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
index f203cc0..9adfd28 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=977f04a8048c04684e521c06e2844a94"
 
 PR = "r1"
 
-SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/gtkhtml2_viewer-${PV}.tar.gz"
+SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/gtkhtml2_viewer-${PV}.tar.gz \
+           file://configure.patch"
 SRC_URI[md5sum] = "a6c9dfa6f969ccd844796a5724b52167"
 SRC_URI[sha256sum] = "4d41f6d961efaac0f51705e5052bac732bc0bdafee2ef2082a9cf9d89f183ae5"
 
-- 
2.0.2


