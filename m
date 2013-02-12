Received: from firewall.honig.net ([66.152.121.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jch@honig.net>) id 1U5ObW-00071g-Se
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Feb 2013 23:45:57 +0100
Received: from kismet.honig.net (kismet.HONIG.NET [172.25.29.32])
	by firewall.honig.net (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	r1CMMYtW026814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 12 Feb 2013 17:22:35 -0500
Received: from kismet.honig.net (kismet.honig.net [127.0.0.1])
	by kismet.honig.net (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	r1CMMYnd008182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 12 Feb 2013 17:22:34 -0500
Received: (from jch@localhost)
	by kismet.honig.net (8.14.4/8.14.4/Submit) id r1CMMX2S008181;
	Tue, 12 Feb 2013 17:22:33 -0500
From: Jeffrey C Honig <jeffrey.honig@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Feb 2013 17:22:27 -0500
Message-Id: <1360707747-8128-1-git-send-email-jeffrey.honig@windriver.com>
X-Mailer: git-send-email 1.7.9.5
Cc: jeffrey.honig@windriver.com
Subject: [PATCH] hiawatha: ennsure C flags are passed to builds.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 22:46:01 -0000
X-List-Received-Date: Tue, 12 Feb 2013 22:46:01 -0000

[ CQID: WIND00403568 ]

Hiawatha was overriding existing C flags instead of prepending warning flags.
This caused build failures on multilibs because the C compiler could not find
the proper sysroot.

Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
---
 recipes-httpd/hiawatha/files/cmake.patch |   16 ++++++++++++++++
 recipes-httpd/hiawatha/hiawatha_8.6.bb   |    3 +++
 2 files changed, 19 insertions(+)
 create mode 100644 recipes-httpd/hiawatha/files/cmake.patch

diff --git a/recipes-httpd/hiawatha/files/cmake.patch b/recipes-httpd/hiawatha/files/cmake.patch
new file mode 100644
index 0000000..f597781
--- /dev/null
+++ b/recipes-httpd/hiawatha/files/cmake.patch
@@ -0,0 +1,16 @@
+It is necessary to include the original CMAKE_C_FLAGS to insure that
+the sysroot is passed to the compiler, instead of just setting warning
+options.  Otherwise we'll get problem croos compiling in some
+circumstances.
+
+--- a/CMakeLists.txt	2012-10-31 14:16:45.000000000 -0400
++++ b/CMakeLists.txt	2013-02-12 14:07:04.297058345 -0500
+@@ -2,7 +2,7 @@
+ project(Hiawatha C)
+ 
+ # Compiler
+-set(CMAKE_C_FLAGS "-Wall -Wextra")
++set(CMAKE_C_FLAGS "-Wall -Wextra ${CMAKE_C_FLAGS}")
+ set(CMAKE_BUILD_TYPE "RelWithDebInfo")
+ 
+ # Options
diff --git a/recipes-httpd/hiawatha/hiawatha_8.6.bb b/recipes-httpd/hiawatha/hiawatha_8.6.bb
index 837354b..d46a525 100644
--- a/recipes-httpd/hiawatha/hiawatha_8.6.bb
+++ b/recipes-httpd/hiawatha/hiawatha_8.6.bb
@@ -4,9 +4,12 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "libxml2 libxslt"
 
+PR = "r1"
+
 SECTION = "net"
 
 SRC_URI = "http://hiawatha-webserver.org/files/${BPN}-${PV}.tar.gz \
+           file://cmake.patch \
            file://hiawatha-init"
 
 SRC_URI[md5sum] = "372ea9e8329ed36e4fb781fdc1a6734c"
-- 
1.7.9.5



