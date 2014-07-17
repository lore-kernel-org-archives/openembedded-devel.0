Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2FAEB7067B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:17:26 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6HEHLd5025982 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 15:17:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0TVLR6p97eBt
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 15:17:21 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6HEHJgY025972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 15:17:21 +0100
Message-ID: <1405606634.26348.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jul 2014 15:17:14 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] re2c: Fix for modern automake
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
X-List-Received-Date: Thu, 17 Jul 2014 14:17:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-oe/recipes-support/re2c/re2c/configure.patch b/meta-oe/recipes-support/re2c/re2c/configure.patch
new file mode 100644
index 0000000..8ca0969
--- /dev/null
+++ b/meta-oe/recipes-support/re2c/re2c/configure.patch
@@ -0,0 +1,18 @@
+Modernise configure to work with modern automake.
+
+RP 2014/7/14
+
+Upstream-Status: Pending
+
+Index: re2c-0.13.5/configure.in
+===================================================================
+--- re2c-0.13.5.orig/configure.in	2008-05-25 14:42:34.000000000 +0000
++++ re2c-0.13.5/configure.in	2014-07-17 14:10:40.595821292 +0000
+@@ -1,6 +1,6 @@
+ AC_PREREQ([2.57])
+ AC_INIT(re2c, 0.13.5, re2c-general@lists.sourceforge.net)
+-AM_INIT_AUTOMAKE(re2c, $PACKAGE_VERSION)
++AM_INIT_AUTOMAKE([foreign])
+ AC_CONFIG_SRCDIR(actions.cc)
+ AM_CONFIG_HEADER(config.h)
+ 
diff --git a/meta-oe/recipes-support/re2c/re2c_0.13.5.bb b/meta-oe/recipes-support/re2c/re2c_0.13.5.bb
index fff7a78..dcac940 100644
--- a/meta-oe/recipes-support/re2c/re2c_0.13.5.bb
+++ b/meta-oe/recipes-support/re2c/re2c_0.13.5.bb
@@ -5,7 +5,8 @@ SECTION = "devel"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://README;beginline=180;md5=822830a2204aef353f2c489f62e02089"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+           file://configure.patch"
 SRC_URI[md5sum] = "4a97d8f77ed6d2c76c8bd840a43f5633"
 SRC_URI[sha256sum] = "f3a995139af475e80a30207d02728b1e0065b0caade7375e974cb1b14861668c"
 



