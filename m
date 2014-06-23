Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C161B6600F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 19:57:55 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5NJvo2X008947 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:57:50 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ra8bQ5thIjoX
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:57:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5NJvkAZ008935
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:57:47 +0100
Message-ID: <1403553460.2104.115.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Jun 2014 20:57:40 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [meta-oe][PATCH] fuse/libmtp/tcsh/enca: Add missing explict gettext-native dependency
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
X-List-Received-Date: Mon, 23 Jun 2014 19:57:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is needed for the AM_ICONV macro and friends.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
index a761932..2ff8e20 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
@@ -19,6 +19,8 @@ SRC_URI[sha256sum] = "0beb83eaf2c5e50730fc553406ef124d77bc02c64854631bdfc86bfd64
 
 inherit autotools pkgconfig
 
+DEPENDS = "gettext-native"
+
 EXTRA_OECONF = "--disable-kernel-module"
 
 PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
index 773e559..004323a 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "\
     file://examples/albums.c;beginline=5;endline=21;md5=84f4e55dfec49e898b7f68a828c15620 \
 "
 
-DEPENDS += "libusb1 virtual/libiconv"
+DEPENDS += "libusb1 gettext-native"
 
 SCM_URI = "git://git.code.sf.net/p/libmtp/code"
 SRC_URI = "\
diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
index 16ecdb0..1dd4cb5 100644
--- a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
+++ b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.tcsh.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://Copyright;md5=1cf29be62df2be1a3763118b25b4c780"
 SECTION = "base"
-DEPENDS = "ncurses"
+DEPENDS = "ncurses gettext-native"
 SRC_URI = " \
     ${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}.orig.tar.gz;name=tarball \
     ${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}-2.diff.gz;name=diffs \
diff --git a/meta-oe/recipes-support/enca/enca_1.9.bb b/meta-oe/recipes-support/enca/enca_1.9.bb
index d4457b8..efea5a3 100644
--- a/meta-oe/recipes-support/enca/enca_1.9.bb
+++ b/meta-oe/recipes-support/enca/enca_1.9.bb
@@ -2,7 +2,7 @@ SUMMARY = "Enca is an Extremely Naive Charset Analyser"
 SECTION = "libs"
 HOMEPAGE = "http://trific.ath.cx/software/enca/"
 
-DEPENDS += "virtual/libiconv"
+DEPENDS += "gettext-native"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24b9569831c46d4818450b55282476b4"



