Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 56AB0706EC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:22 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h3fd030280; Fri, 18 Jul 2014 09:43:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bByaEfMJJC3x; Fri, 18 Jul 2014 09:43:04 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gw6b030246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:42:59 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kj-0006il-B9; Fri, 18 Jul 2014 09:42:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:27 +0100
Message-Id: <1405672966-25729-8-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 08/27] claws-plugin-rssyl: Use "foreign" automake strictness and autotools-brokensep
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:22 -0000

---
 .../claws-mail/claws-plugin-rssyl/configure.patch  | 53 ++++++++++++++++++++++
 .../claws-mail/claws-plugin-rssyl_0.34.bb          |  3 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl/configure.patch

diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl/configure.patch b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl/configure.patch
new file mode 100644
index 0000000..a7a38f3
--- /dev/null
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl/configure.patch
@@ -0,0 +1,53 @@
+Index: rssyl-0.34/configure.ac
+===================================================================
+--- rssyl-0.34.orig/configure.ac	2014-07-18 07:37:28.981532959 +0000
++++ rssyl-0.34/configure.ac	2014-07-18 07:39:45.881536690 +0000
+@@ -1,5 +1,13 @@
++
++dnl plugin version
++m4_define([plugin_major_version],[0])
++m4_define([plugin_minor_version],[34])
++m4_define([plugin_micro_version],[0])
++m4_define([plugin_version], [plugin_major_version.plugin_minor_version.plugin_micro_version])
++
+ AC_PREREQ(2.60)
+-AC_INIT(src/plugin.c)
++AC_INIT(rssyl, plugin_version)
++AC_CONFIG_SRCDIR(src/plugin.c)
+ AC_CONFIG_AUX_DIR(config)
+ AM_MAINTAINER_MODE
+ AC_CONFIG_HEADERS(config.h)
+@@ -7,28 +15,15 @@
+ PACKAGE=rssyl
+ 
+ dnl plugin version
+-MAJOR_VERSION=0
+-MINOR_VERSION=34
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
+ AC_DEFINE_UNQUOTED(PLUGINVERSION, "$VERSION", [plugin version])
+ 
+ AC_PROG_CC
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
index f441c98..cdc465c 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
@@ -4,7 +4,8 @@ DEPENDS = "claws-mail libxml2 curl glib-2.0 gtk+"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c2348e0a084e573f0220f5e45d8097e"
 
-SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/rssyl-${PV}.tar.gz"
+SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/rssyl-${PV}.tar.gz \
+           file://configure.patch"
 SRC_URI[md5sum] = "49b45608e8d160b3625d3d50016ec2ca"
 SRC_URI[sha256sum] = "2e96a1cd6a1a5bb7f86cd2eb48f6e174665957fafe1f3b1e8361aac3bb967f79"
 inherit autotools pkgconfig gettext
-- 
2.0.2


