Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8087C7064C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 13:35:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6HDZCAZ023007 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:35:54 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hWh1JlQE_LSS
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:35:54 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6HDZmuk023041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:35:50 +0100
Message-ID: <1405604143.3668.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jul 2014 14:35:43 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: libgc: Drop, its bwdgc in OE-Core
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
X-List-Received-Date: Thu, 17 Jul 2014 13:36:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There is not point in having two of this piece of software, I've merged
the missing PACKAGECONFIG into the OE-Core version, we can drop this one.

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



