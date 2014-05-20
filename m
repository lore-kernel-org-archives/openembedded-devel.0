Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E9FB65D0E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 19:03:15 +0000 (UTC)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4KJ3GD6028665
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 20 May 2014 12:03:16 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.82)
	(envelope-from <amy.fong@windriver.com>)
	id 1WmpJj-0000KQ-K4; Tue, 20 May 2014 15:03:15 -0400
Date: Tue, 20 May 2014 15:03:15 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140520190315.GA32657@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-oe] [PATCH] nodejs needs python-native
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
X-List-Received-Date: Tue, 20 May 2014 19:03:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From c13975829fde23138a35d63f2b641fad0fde8c72 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Tue, 20 May 2014 14:58:54 -0400
Subject: [PATCH] nodejs needs python-native

nodejs should use python from python-native package. On some hosts, the
default python is missing bz2 support.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
index 996d68e..75a9ca4 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95a589a3257ab7dfe37d8a8379e3c72d"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl python-native"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
            file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch \
@@ -28,6 +28,7 @@ do_configure () {
 
 do_compile () {
     export LD="${CXX}"
+    export PATH=${STAGING_BINDIR_NATIVE}/python-native:$PATH
     make BUILDTYPE=Release
 }
 
@@ -40,3 +41,5 @@ RDEPENDS_${PN}_class-native = ""
 
 FILES_${PN} += "${libdir}/node/wafadmin ${libdir}/node_modules ${libdir}/dtrace"
 BBCLASSEXTEND = "native"
+
+FILES_${PN} += "/usr/lib/*"
-- 
2.0.0.rc0


