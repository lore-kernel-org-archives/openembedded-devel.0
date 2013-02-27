Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UAbkw-0000VB-EF
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2013 08:48:51 +0100
Received: by mail-ee0-f47.google.com with SMTP id e52so168312eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2013 23:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Pnn1V7YH1MgbIh/njWuajwUCs4YmhyeC4DhV72g9sJw=;
	b=wD1BQ6IgMJzqkiZO/+9jnS5Q0WOIIpu5HoOr60DP66Ut905idhYPUUMzoqYFfU+Qpy
	dW/gHA6QPUuqZNg4erWqmvqINUge4EQptIUWZGCyWI1NbNVn0qVGl4zzEUOVn0CofM6n
	Yz8kAQUl6GzwKVg07kMJxi1bOpWWABPQRc3M1/kLWgcwGJT5YIMs7vMlG+YS/1SuwZf8
	FXdlkkZtEcZHcbOpvsIjEb7q8RNFwahImK78pEgL2Y/mCZnk6VrbArvX2X5uNkSCWJp7
	hQz0xUiE4AuwHdhhoQF8aLMRB4of7dB5GIVpH0vMfY2XZoN9QvNy/h5fYB/3282djhWr
	aIAw==
X-Received: by 10.14.223.69 with SMTP id u45mr3532010eep.23.1361950350145;
	Tue, 26 Feb 2013 23:32:30 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id f47sm4872129eep.13.2013.02.26.23.32.28
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 23:32:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Feb 2013 08:30:24 +0100
Message-Id: <1361950224-26188-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1361950224-26188-1-git-send-email-schnitzeltony@googlemail.com>
References: <1361950224-26188-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe] geany: fix compile by removing extra check for c++ compiler
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
X-List-Received-Date: Wed, 27 Feb 2013 07:48:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...001-configure.ac-remove-additional-c-test.patch |   47 ++++++++++++++++++++
 meta-oe/recipes-devtools/geany/geany_1.22.bb       |    6 ++-
 2 files changed, 52 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/geany/geany/0001-configure.ac-remove-additional-c-test.patch

diff --git a/meta-oe/recipes-devtools/geany/geany/0001-configure.ac-remove-additional-c-test.patch b/meta-oe/recipes-devtools/geany/geany/0001-configure.ac-remove-additional-c-test.patch
new file mode 100644
index 0000000..5166fec
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany/0001-configure.ac-remove-additional-c-test.patch
@@ -0,0 +1,47 @@
+From e62d5b59262ec7ffe07931790712c7e247377795 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 21 Feb 2013 09:31:31 +0100
+Subject: [PATCH] configure.ac remove additional c++ test
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+For openembedded cross-builds CXX can contain something like:
+
+arm-oe-linux-gnueabi-g++  -march=armv5te  -marm -mthumb-interwork --sysroot=/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm
+
+This ends up in
+
+configure:5582: error: No C++ compiler found. Please install a C++ compiler.
+
+Anyway if [1] is still valid, the combination of AC_PROG_CC and AC_PROG_CXX
+should thow an error message.
+
+[1] http://lists.gnu.org/archive/html/bug-autoconf/2010-05/msg00001.html
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac |    5 -----
+ 1 files changed, 0 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c37312a..742bf35 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -26,11 +26,6 @@ AC_USE_SYSTEM_EXTENSIONS
+ AC_PROG_CC
+ 
+ AC_PROG_CXX
+-# check for C++ compiler explicitly and fail if none is found, do this check
+-# after AC_PROG_CXX has set the CXX environment variable
+-if ! which $CXX >/dev/null 2>&1; then
+-	AC_MSG_ERROR([No C++ compiler found. Please install a C++ compiler.])
+-fi
+ 
+ AC_PROG_INSTALL
+ AC_PROG_LN_S
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-devtools/geany/geany_1.22.bb b/meta-oe/recipes-devtools/geany/geany_1.22.bb
index 1e56ec8..e0b5df5 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.22.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.22.bb
@@ -3,10 +3,14 @@ HOMEPAGE = "http://www.geany.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
 DEPENDS = "gtk+"
+PR = "r1"
 
 inherit autotools pkgconfig
 
-SRC_URI = "http://download.geany.org/${PN}-${PV}.tar.bz2"
+SRC_URI = " \
+    http://download.geany.org/${PN}-${PV}.tar.bz2 \
+    file://0001-configure.ac-remove-additional-c-test.patch \
+"
 SRC_URI[md5sum] = "0672077fe83e2a739aa0eaca426aacf0"
 SRC_URI[sha256sum] = "901a35a7395ef10a80fb10b3ab63bae3871693a4e82d56388e9521a27877577e"
 
-- 
1.7.6.5



