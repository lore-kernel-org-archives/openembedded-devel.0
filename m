Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A15BE706BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h38U030281; Fri, 18 Jul 2014 09:43:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id khihhZXQvBnh; Fri, 18 Jul 2014 09:43:04 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gxQr030253
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:43:00 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83kj-0006jL-UZ; Fri, 18 Jul 2014 09:42:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:34 +0100
Message-Id: <1405672966-25729-15-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 15/27] memcached: Use "foreign" automake strictness
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:17 -0000

---
 .../recipes-support/memcached/memcached/configure.patch     | 13 +++++++++++++
 .../recipes-support/memcached/memcached_1.4.17.bb           |  3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/memcached/memcached/configure.patch

diff --git a/meta-networking/recipes-support/memcached/memcached/configure.patch b/meta-networking/recipes-support/memcached/memcached/configure.patch
new file mode 100644
index 0000000..7001a0e
--- /dev/null
+++ b/meta-networking/recipes-support/memcached/memcached/configure.patch
@@ -0,0 +1,13 @@
+Index: memcached-1.4.17/configure.ac
+===================================================================
+--- memcached-1.4.17.orig/configure.ac	2013-12-20 21:44:49.000000000 +0000
++++ memcached-1.4.17/configure.ac	2014-07-18 07:17:00.593499483 +0000
+@@ -4,7 +4,7 @@
+ AC_INIT(memcached, VERSION_NUMBER, memcached@googlegroups.com)
+ AC_CANONICAL_SYSTEM
+ AC_CONFIG_SRCDIR(memcached.c)
+-AM_INIT_AUTOMAKE(AC_PACKAGE_NAME, AC_PACKAGE_VERSION)
++AM_INIT_AUTOMAKE([foreign])
+ AM_CONFIG_HEADER(config.h)
+ 
+ AC_PROG_CC
diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
index 20e1bd4..5d37df0 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
@@ -17,7 +17,8 @@ inherit autotools
 DEPENDS += "libevent"
 RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader perl-module-tie-hash"
 
-SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz"
+SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
+           file://configure.patch"
 
 SRC_URI[md5sum] = "46402dfbd7faadf6182283dbbd18b1a6"
 SRC_URI[sha256sum] = "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf9926a89999d8cdc0458"
-- 
2.0.2


