Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A75A6706AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:12 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h38T030281; Fri, 18 Jul 2014 09:43:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Zv3BJkaVcCUq; Fri, 18 Jul 2014 09:43:04 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gvFI030240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:42:59 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83ki-0006iH-NI; Fri, 18 Jul 2014 09:42:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:21 +0100
Message-Id: <1405672966-25729-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/27] libol: Use "foreign" automake strictness
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:12 -0000

---
 meta-oe/recipes-support/libol/libol/configure.patch | 14 ++++++++++++++
 meta-oe/recipes-support/libol/libol_0.3.18.bb       |  3 ++-
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libol/libol/configure.patch

diff --git a/meta-oe/recipes-support/libol/libol/configure.patch b/meta-oe/recipes-support/libol/libol/configure.patch
new file mode 100644
index 0000000..87695fb
--- /dev/null
+++ b/meta-oe/recipes-support/libol/libol/configure.patch
@@ -0,0 +1,14 @@
+Index: libol-0.3.18/configure.in
+===================================================================
+--- libol-0.3.18.orig/configure.in	2006-03-27 14:44:52.000000000 +0000
++++ libol-0.3.18/configure.in	2014-07-18 07:05:56.029481372 +0000
+@@ -1,7 +1,7 @@
+ dnl Process this file with autoconf to produce a configure script.
+-AC_INIT(src/abstract_io.c)
++AC_INIT(libol, "0.3.18")
+ 
+-AM_INIT_AUTOMAKE(libol, "0.3.18", 1)
++AM_INIT_AUTOMAKE([foreign])
+ if test -n "$SNAPSHOT_VERSION"; then
+         VERSION=$VERSION+$SNAPSHOT_VERSION
+ fi
diff --git a/meta-oe/recipes-support/libol/libol_0.3.18.bb b/meta-oe/recipes-support/libol/libol_0.3.18.bb
index d2d7c26..c31f483 100644
--- a/meta-oe/recipes-support/libol/libol_0.3.18.bb
+++ b/meta-oe/recipes-support/libol/libol_0.3.18.bb
@@ -3,7 +3,8 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-SRC_URI = "http://www.balabit.com/downloads/files/libol/0.3/${BP}.tar.gz"
+SRC_URI = "http://www.balabit.com/downloads/files/libol/0.3/${BP}.tar.gz \
+           file://configure.patch"
 SRC_URI[md5sum] = "cbadf4b7ea276dfa85acc38a1cc5ff17"
 SRC_URI[sha256sum] = "9de3bf13297ff882e02a1e6e5f6bf760a544aff92a9d8a1cf4328a32005cefe7"
 
-- 
2.0.2


