Return-Path: <jaragunde@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id C2B73795FA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:To:From;
	bh=TDCO2C6McUKXK3lnHG6P/UdX/Q80lJtCezOhmIwdfno=; 
	b=K+E/w92jU2Y5ridrqJmuc3o2NeQMBUUf8BhPZ0yeIwYL/qtLICTVZxizUItyZmFAojyRCC3btxnVJwMxYXnCws5KULTckzuHaZHgz0C6gsBjNd6IS5YLJImquVp+gC5vLJPzBmutBUFuLa8/awYrNkojBFLpiLHPFf5hBbVTQzIEN5G0cz7LlZ7rBmxK32mWmtty9zIgoGtanOTvvVa+d04YLo/IlqA67+HGUmsmNamK3JT/inLl3LdHhOhrGIuV+O17jWbyXaGpc7tZNFeXU4e0e7yHxjN6/WIMzi7I/s4DnYk8sfrNIzpUjINNvFNhGcYuNRST+ezBey94vJCWJQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1g2H1Z-0002us-H5 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 16:30:45 +0200
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1g2H1V-0007gE-VT for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 16:30:45 +0200
Received: from jaragunde by buildbox.local.igalia.com with local (Exim 4.89)
	(envelope-from <jaragunde@igalia.com>) id 1g2H1V-000WGK-Qj
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2018 16:30:41 +0200
From: =?UTF-8?q?Jacobo=20Aragunde=20P=C3=A9rez?= <jaragunde@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 16:30:35 +0200
Message-Id: <20180918143035.123860-1-jaragunde@igalia.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] tinyproxy: upgrade to version 1.10.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2018 14:30:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Highlights of this upgrade:
* tinyproxy binary is not installed to /usr/sbin now.
* removed a deprecated configure parameter.
* reworked disable-documentation.patch.

Signed-off-by: Jacobo Aragunde Pérez <jaragunde@igalia.com>
---
 .../tinyproxy/disable-documentation.patch          | 44 +++++++++++-----------
 .../tinyproxy/tinyproxy/tinyproxy.service          |  2 +-
 .../{tinyproxy_1.8.4.bb => tinyproxy_1.10.0.bb}    |  5 +--
 3 files changed, 26 insertions(+), 25 deletions(-)
 rename meta-networking/recipes-support/tinyproxy/{tinyproxy_1.8.4.bb => tinyproxy_1.10.0.bb} (85%)

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
index 01d0236be..563fde3b4 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
@@ -1,19 +1,31 @@
---- a/configure.ac	2016-01-01 17:42:27.000000000 +0100
-+++ b/configure.ac	2017-04-20 14:03:37.238254471 +0200
-@@ -284,24 +284,12 @@
- AC_SUBST(LIBS)
- AC_SUBST(ADDITIONAL_OBJECTS)
+diff --git a/Makefile.am b/Makefile.am
+index 4a3ead6..a12cb98 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,7 +2,6 @@ SUBDIRS = \
+ 	src \
+ 	data \
+ 	etc \
+-	docs \
+ 	m4macros \
+ 	tests \
+ 	scripts
+diff --git a/configure.ac b/configure.ac
+index 6ddbcc0..f993711 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -177,10 +177,6 @@ AC_SUBST(ADDITIONAL_OBJECTS)
+ AC_PATH_PROG(XSLTPROC, xsltproc, no)
+ AM_CONDITIONAL(HAVE_XSLTPROC, test "x$XSLTPROC" != "xno")
  
 -# Check for asciidoc
 -AC_PATH_PROG(A2X, a2x, no)
 -AM_CONDITIONAL(HAVE_A2X, test "x$A2X" != "xno")
--if test x"$A2X" = x"no"; then
--  AC_MSG_ERROR([Test for asciidoc failed. See the file 'INSTALL' for help.])
--fi
 -
- AC_CONFIG_FILES([
- Makefile
- src/Makefile
+ # checking xmllint
+ AC_PATH_PROG(XMLLINT, xmllint, no)
+ if test "x$XMLLINT" != "xno"; then
+@@ -202,11 +198,6 @@ src/Makefile
  data/Makefile
  data/templates/Makefile
  etc/Makefile
@@ -25,13 +37,3 @@
  m4macros/Makefile
  tests/Makefile
  tests/scripts/Makefile
---- a/Makefile.am	2016-01-01 17:42:27.000000000 +0100
-+++ b/Makefile.am	2017-04-20 14:03:53.842822997 +0200
-@@ -2,7 +2,6 @@
- 	src \
- 	data \
- 	etc \
--	docs \
- 	m4macros \
- 	tests
- 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
index ea079f955..df4274573 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
@@ -8,7 +8,7 @@ ExecStartPre=/bin/mkdir -p /var/log/tinyproxy
 ExecStartPre=/bin/chown -R nobody.tinyproxy /var/log/tinyproxy
 ExecStartPre=/bin/mkdir -p /var/run/tinyproxy
 ExecStartPre=/bin/chown -R nobody.tinyproxy /var/run/tinyproxy
-ExecStart=/usr/sbin/tinyproxy -d
+ExecStart=/usr/bin/tinyproxy -d
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb
similarity index 85%
rename from meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
rename to meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb
index e8025c4b5..2692bd89c 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.10.0.bb
@@ -7,13 +7,12 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
 		   file://disable-documentation.patch \
 		   file://tinyproxy.service"
 
-SRC_URI[md5sum] = "3b60f7d08e0821ed1a3e2cf1e5778cac"
-SRC_URI[sha256sum] = "8234c879a129feee61efa98bac14a1a3e46e5cf08f01696a216940872aa70faf"
+SRC_URI[md5sum] = "423047c8dc53a15e19f78e238198549c"
+SRC_URI[sha256sum] = "6020955e6a0ef0ef898ad5bb17a448c47f9e4c003c464b4ae7c4dba063272055"
 
 EXTRA_OECONF += " \
 	--enable-filter \
 	--enable-transparent \
-	--disable-regexcheck \
 	--enable-reverse \
 	--enable-upstream \
 	--enable-xtinyproxy \
-- 
2.11.0


