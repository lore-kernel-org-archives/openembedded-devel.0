Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1P6Lmn-0004zp-3P
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 13:15:59 +0200
Received: by ewy1 with SMTP id 1so2252936ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=HUouJIoz63MzQTpgHtFdE4H7C6Kjch7YQ2Vjm2Brb6c=;
	b=Jf87zeHlXJjl7s0TN+6eHKi4ipJWD4cyUPw+klKHRDE14geqMd17X3ghb7EU1nE8QK
	Mo2CMvPmeYJI0T5Vs4ucNLrH6lxow5icA1o7wLERy/uEv3yXTndAlfDkJpX4jftfqkGP
	FdDbq7Hc4V1FsKCbQo6Hw8EjJvgS2h6jbmkgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=p7jPiziZo6TpRHKdLzaBTfzI2A9pgTDWJBOnc2CGg+0bBE/z2aXCkwv0uhlTf+lV62
	m/QY1RGdr06ZPklROFITD0zwlh/dSrSSpM0HLmM8+BNNNm6DvPbXc9Ny4ySKD5DKhT5R
	4TbR3vvbh5jPET5leXaWsOqR1EgfJ02nIhtnU=
Received: by 10.213.7.81 with SMTP id c17mr1626171ebc.17.1287054918242;
	Thu, 14 Oct 2010 04:15:18 -0700 (PDT)
Received: from localhost.localdomain (147.84-49-231.nextgentel.com
	[84.49.231.147])
	by mx.google.com with ESMTPS id v56sm970338eeh.2.2010.10.14.04.15.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Oct 2010 04:15:17 -0700 (PDT)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Oct 2010 13:15:45 +0200
Message-Id: <1287054945-7708-1-git-send-email-tasskjapp@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Tasslehoff Kjappfot <tasskjapp@gmail.com>
Subject: [PATCH] log4cxx 0.10.0 recipe
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
X-List-Received-Date: Thu, 14 Oct 2010 11:16:03 -0000


Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
---
 .../0001-log4cxx_0-10-0_add-missing-includes.patch |   50 ++++++++++++++++++++
 .../0002-Remove-duplicates-from-makefile.patch     |   39 +++++++++++++++
 recipes/log4cxx/log4cxx_0.10.0.bb                  |   18 +++++++
 3 files changed, 107 insertions(+), 0 deletions(-)
 create mode 100644 recipes/log4cxx/log4cxx/0001-log4cxx_0-10-0_add-missing-includes.patch
 create mode 100644 recipes/log4cxx/log4cxx/0002-Remove-duplicates-from-makefile.patch
 create mode 100644 recipes/log4cxx/log4cxx_0.10.0.bb

diff --git a/recipes/log4cxx/log4cxx/0001-log4cxx_0-10-0_add-missing-includes.patch b/recipes/log4cxx/log4cxx/0001-log4cxx_0-10-0_add-missing-includes.patch
new file mode 100644
index 0000000..8ca6628
--- /dev/null
+++ b/recipes/log4cxx/log4cxx/0001-log4cxx_0-10-0_add-missing-includes.patch
@@ -0,0 +1,50 @@
+From af4e8f0eccdc2f562f9e591b101ee856a962e01d Mon Sep 17 00:00:00 2001
+From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
+Date: Thu, 14 Oct 2010 08:57:08 +0200
+Subject: [PATCH 1/2] log4cxx_0-10-0_add missing includes
+
+---
+ src/examples/cpp/console.cpp        |    1 +
+ src/main/cpp/inputstreamreader.cpp  |    1 +
+ src/main/cpp/socketoutputstream.cpp |    1 +
+ 3 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/src/examples/cpp/console.cpp b/src/examples/cpp/console.cpp
+index 6a01d8a..a673a10 100644
+--- a/src/examples/cpp/console.cpp
++++ b/src/examples/cpp/console.cpp
+@@ -22,6 +22,7 @@
+ #include <log4cxx/logmanager.h>
+ #include <iostream>
+ #include <locale.h>
++#include <cstring>
+ 
+ using namespace log4cxx;
+ using namespace log4cxx::helpers;
+diff --git a/src/main/cpp/inputstreamreader.cpp b/src/main/cpp/inputstreamreader.cpp
+index 52b1c0a..cb45181 100644
+--- a/src/main/cpp/inputstreamreader.cpp
++++ b/src/main/cpp/inputstreamreader.cpp
+@@ -20,6 +20,7 @@
+ #include <log4cxx/helpers/exception.h>
+ #include <log4cxx/helpers/pool.h>
+ #include <log4cxx/helpers/bytebuffer.h>
++#include <cstring>
+ 
+ using namespace log4cxx;
+ using namespace log4cxx::helpers;
+diff --git a/src/main/cpp/socketoutputstream.cpp b/src/main/cpp/socketoutputstream.cpp
+index 185f835..c61eb11 100644
+--- a/src/main/cpp/socketoutputstream.cpp
++++ b/src/main/cpp/socketoutputstream.cpp
+@@ -19,6 +19,7 @@
+ #include <log4cxx/helpers/socketoutputstream.h>
+ #include <log4cxx/helpers/socket.h>
+ #include <log4cxx/helpers/bytebuffer.h>
++#include <cstring>
+ 
+ using namespace log4cxx;
+ using namespace log4cxx::helpers;
+-- 
+1.7.0.4
+
diff --git a/recipes/log4cxx/log4cxx/0002-Remove-duplicates-from-makefile.patch b/recipes/log4cxx/log4cxx/0002-Remove-duplicates-from-makefile.patch
new file mode 100644
index 0000000..6b06736
--- /dev/null
+++ b/recipes/log4cxx/log4cxx/0002-Remove-duplicates-from-makefile.patch
@@ -0,0 +1,39 @@
+From a32da098ded31e6399658a01dd5c994e23f8c5a8 Mon Sep 17 00:00:00 2001
+From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
+Date: Thu, 14 Oct 2010 09:02:11 +0200
+Subject: [PATCH 2/2] Remove duplicates
+
+---
+ src/main/include/log4cxx/Makefile.am         |    2 +-
+ src/main/include/log4cxx/private/Makefile.am |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/main/include/log4cxx/Makefile.am b/src/main/include/log4cxx/Makefile.am
+index 719c2dd..53e99b0 100644
+--- a/src/main/include/log4cxx/Makefile.am
++++ b/src/main/include/log4cxx/Makefile.am
+@@ -15,7 +15,7 @@
+ #
+ SUBDIRS = helpers net nt rolling spi varia xml config db private pattern filter
+ log4cxxincdir = $(includedir)/log4cxx
+-log4cxxinc_HEADERS= $(top_srcdir)/src/main/include/log4cxx/*.h log4cxx.h
++log4cxxinc_HEADERS= $(top_srcdir)/src/main/include/log4cxx/*.h
+ DISTCLEANFILES = log4cxx.h
+ EXTRA_DIST = log4cxx.hw
+ 
+diff --git a/src/main/include/log4cxx/private/Makefile.am b/src/main/include/log4cxx/private/Makefile.am
+index 3a896ea..474e31d 100644
+--- a/src/main/include/log4cxx/private/Makefile.am
++++ b/src/main/include/log4cxx/private/Makefile.am
+@@ -14,7 +14,7 @@
+ # limitations under the License.
+ #
+ privateincdir = $(includedir)/log4cxx/private
+-privateinc_HEADERS= $(top_builddir)/src/main/include/log4cxx/private/*.h log4cxx_private.h
++privateinc_HEADERS= $(top_builddir)/src/main/include/log4cxx/private/*.h
+ DISTCLEANFILES = log4cxx_private.h
+ EXTRA_DIST = log4cxx_private.hw
+ 
+-- 
+1.7.0.4
+
diff --git a/recipes/log4cxx/log4cxx_0.10.0.bb b/recipes/log4cxx/log4cxx_0.10.0.bb
new file mode 100644
index 0000000..fc78ad7
--- /dev/null
+++ b/recipes/log4cxx/log4cxx_0.10.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Apache logging framework for C++ library"
+SECTION = "libs"
+DEPENDS = "apr apr-util expat gdbm"
+LICENSE = "Apache License, Version 2.0"
+HOMEPAGE = "http://logging.apache.org/log4cxx/"
+PR = "r0"
+
+SRC_URI = "http://archive.apache.org/dist/logging/log4cxx/0.10.0/apache-log4cxx-0.10.0.tar.gz \
+          file://0001-log4cxx_0-10-0_add-missing-includes.patch \
+          file://0002-Remove-duplicates-from-makefile.patch"
+
+#build this:
+S = "${WORKDIR}/apache-${PN}-${PV}"
+
+inherit autotools pkgconfig
+
+SRC_URI[md5sum] = "b30ffb8da3665178e68940ff7a61084c"
+SRC_URI[sha256sum] = "0de0396220a9566a580166e66b39674cb40efd2176f52ad2c65486c99c920c8c"
-- 
1.7.0.4



