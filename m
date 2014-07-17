Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0740570653
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:06:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6HE6DsY025155 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 15:06:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Fi_j9yrwR7aA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 15:06:13 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6HE67Nh025144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 15:06:08 +0100
Message-ID: <1405605962.26348.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jul 2014 15:06:02 +0100
In-Reply-To: <1405604143.3668.20.camel@ted>
References: <1405604143.3668.20.camel@ted>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH v2] libgc: Drop, its bdwgc in OE-Core
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
X-List-Received-Date: Thu, 17 Jul 2014 14:06:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is not point in having two of this piece of software, I've merged
the missing PACKAGECONFIG into the OE-Core version, we can drop this one.

Update zile's DEPENDS to match (its only user in meta-oe).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-oe/recipes-support/libgc/libgc_7.2d.bb b/meta-oe/recipes-support/libgc/libgc_7.2d.bb
deleted file mode 100644
index 82a7f13..0000000
--- a/meta-oe/recipes-support/libgc/libgc_7.2d.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Garbage Collection Library"
-DESCRIPTION = "The GC library provides a garbage collector for C and C++."
-HOMEPAGE = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
-
-LICENSE = "GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://doc/README;beginline=1;endline=37;md5=9f4fd307082acf7a8af3e3897245163b  \
-                    file://README.QUICK;beginline=1;endline=23;md5=293ea42f3f606426deefadd5dd8ddd15 \
-"
-
-SRC_URI = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/gc-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "91340b28c61753a789eb6077675d87d2"
-SRC_URI[sha256sum] = "d9fe0ae8650d43746a48bfb394cab01a319f3809cee19f8ebd16aa985b511c5e"
-
-S = "${WORKDIR}/gc-7.2"
-
-inherit autotools pkgconfig
-
-# by default use external libatomic-ops
-PACKAGECONFIG ??= "libatomic-ops"
-PACKAGECONFIG[libatomic-ops] = "--with-libatomic-ops=yes,--with-libatomic-ops=no,libatomics-ops"
-
-PACKAGES =+ "${PN}-docs"
-FILES_${PN}-docs = "/usr/share/gc"
diff --git a/meta-oe/recipes-support/zile/zile_2.4.9.bb b/meta-oe/recipes-support/zile/zile_2.4.9.bb
index dea9f6c..2551a80 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.9.bb
+++ b/meta-oe/recipes-support/zile/zile_2.4.9.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Zile is lossy Emacs"
 HOMEPAGE = "http://zile.sourceforge.net/"
-DEPENDS = "ncurses libgc"
+DEPENDS = "ncurses bdwgc"
 
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"



