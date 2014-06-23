Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8130865F18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 16:11:25 +0000 (UTC)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5NGBM0o003845
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 23 Jun 2014 09:11:23 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.82)
	(envelope-from <amy.fong@windriver.com>)
	id 1Wz6q2-0007he-30; Mon, 23 Jun 2014 12:11:22 -0400
Date: Mon, 23 Jun 2014 12:11:21 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140623161121.GA29589@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [meta-networking] [v2] Uprev memcached from upstream
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
X-List-Received-Date: Mon, 23 Jun 2014 16:11:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From c786655029c2d2d9f1d78ae5b3d4667003064b95 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Mon, 23 Jun 2014 12:08:58 -0400
Subject: [PATCH] Uprev memcached from upstream

memcached 1.4.15 has some configuration errors:
configure:5798: error: cannot run test program while cross compiling

Uprev has the needed fix for the configuration error and some other fixes.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 .../recipes-support/memcached/memcached_1.4.15.bb  | 15 -------
 .../recipes-support/memcached/memcached_1.4.17.bb  | 50 ++++++++++++++++++++++
 2 files changed, 50 insertions(+), 15 deletions(-)
 delete mode 100644 meta-networking/recipes-support/memcached/memcached_1.4.15.bb
 create mode 100644 meta-networking/recipes-support/memcached/memcached_1.4.17.bb

diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.15.bb b/meta-networking/recipes-support/memcached/memcached_1.4.15.bb
deleted file mode 100644
index 016eaeb..0000000
--- a/meta-networking/recipes-support/memcached/memcached_1.4.15.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Free & open source, high-performance, distributed memory object \
-caching system, generic in nature, but intended for use in speeding up dynamic \
-web applications by alleviating database load."
-HOMEPAGE = "http://memcached.org/"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7e5ded7363d335e1bb18013ca08046ff"
-
-SRC_URI = "http://memcached.googlecode.com/files/memcached-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "36ea966f5a29655be1746bf4949f7f69"
-SRC_URI[sha256sum] = "169721ab7a7531add6ae9f6b14b6b5641725fe0b1f0bdf5c3a4327725901e2b4"
-
-DEPENDS = "libevent"
-
-inherit autotools
diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
new file mode 100644
index 0000000..ab85b61
--- /dev/null
+++ b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
@@ -0,0 +1,50 @@
+SUMMARY = "A high-performance memory object caching system"
+DESCRIPTION = "\
+ Danga Interactive developed memcached to enhance the speed of LiveJournal.com, \
+ a site which was already doing 20 million+ dynamic page views per day for 1 \
+ million users with a bunch of webservers and a bunch of database servers. \
+ memcached dropped the database load to almost nothing, yielding faster page \
+ load times for users, better resource utilization, and faster access to the \
+ databases on a memcache miss. \
+ . \
+ memcached optimizes specific high-load serving applications that are designed \
+ to take advantage of its versatile no-locking memory access system. Clients \
+ are available in several different programming languages, to suit the needs \
+ of the specific application. Traditionally this has been used in mod_perl \
+ apps to avoid storing large chunks of data in Apache memory, and to share \
+ this burden across several machines."
+
+HOMEPAGE = "http://www.danga.com/memcached/"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7e5ded7363d335e1bb18013ca08046ff"
+
+inherit autotools
+
+DEPENDS += "libevent"
+RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader perl-module-tie-hash"
+
+SRC_URI = "http://www.memcached.org/files/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "46402dfbd7faadf6182283dbbd18b1a6"
+SRC_URI[sha256sum] = "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf9926a89999d8cdc0458"
+
+python __anonymous () {
+    endianness = d.getVar('SITEINFO_ENDIANNESS', True)
+    if endianness == 'le':
+        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=little")
+    else:
+        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=big")
+}
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "memcached"
+INITSCRIPT_PARAMS = "defaults"
+
+do_install_append() {
+       install -D -m 755 ${S}/scripts/memcached-init ${D}${sysconfdir}/init.d/memcached
+       mkdir -p ${D}/usr/share/memcached/scripts
+       install -m 755 ${S}/scripts/memcached-tool ${D}/usr/share/memcached/scripts
+       install -m 755 ${S}/scripts/start-memcached ${D}/usr/share/memcached/scripts
+}
-- 
2.0.0.rc0


