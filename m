Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 685F66E086
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Apr 2014 12:40:07 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id hl10so1978577igb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Apr 2014 05:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1pAQeFAEwkM1aG1CbFgnrUSVIkOY87UkPZvaE6IOMLw=;
	b=TA0qndv+YAx7TlWoNJ6FNuQqfnan35Pnbh447YjelbCx0WpoRRjSkvEHDjX0Yc1pT5
	HaIbT2ixyKzRYMEF7nAQXH2yG8BAbL5ORR65tv3c+YRVsv5lWQnT1ILWf1Hjvr9rX4ic
	McqIVhnutFUTSWKE8Ny2+v966OI7hGM1sd0ebgeeDDdVQL91y8c8ZPcrSm52dIFnabxN
	fmXqNqHMS7U86mkqwvSyBEKgDgSZA/4eKTO9C3VcKycUhPPKz/jcjrDGk4zuENrQGNi7
	D2vYCbv+/y0WO5qQfFRtj0SpWwZgDoiPpE7kq7u8aSBvQiiMpy6mMPmg1DzQrzSfomv8
	Bu2g==
X-Gm-Message-State: ALoCoQlAZkMqHnrORFHMMOPqkjzPbw7AkBpz3ELV8P4IOjCPpC64c7EmLPimrrsLzeSUsv1ebf+9
X-Received: by 10.50.73.130 with SMTP id l2mr9292797igv.42.1396701608579;
	Sat, 05 Apr 2014 05:40:08 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id b8sm13735966igx.3.2014.04.05.05.40.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Apr 2014 05:40:08 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Apr 2014 08:39:40 -0400
Message-Id: <1396701582-15906-2-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1396701582-15906-1-git-send-email-trevor.woerner@linaro.org>
References: <1396701582-15906-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [meta-oe][PATCH 1/3] liblockfile: remove configure warning
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
X-List-Received-Date: Sat, 05 Apr 2014 12:40:08 -0000

This fix gets rid of the following warning:

    configure: WARNING: unrecognized options: ... --with-libtool-sysroot

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 .../liblockfile/liblockfile-1.09/configure.patch       | 18 ++++++++++++++----
 .../recipes-extended/liblockfile/liblockfile_1.09.bb   |  4 ++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/configure.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/configure.patch
index ea13e11..12413cf 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/configure.patch
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/configure.patch
@@ -3,16 +3,26 @@
 # Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
 #
 
---- liblockfile-1.05/./configure.in~configure
-+++ liblockfile-1.05/./configure.in
-@@ -1,4 +1,5 @@
+Index: liblockfile-1.09/configure.in
+===================================================================
+--- liblockfile-1.09.orig/configure.in
++++ liblockfile-1.09/configure.in
+@@ -1,10 +1,13 @@
 -AC_INIT(lockfile.c)
 +AC_INIT
 +AC_CONFIG_SRCDIR([lockfile.c])
  AC_CONFIG_HEADER(autoconf.h)
  AC_REVISION($Revision: 1.0 $)dnl
  
-@@ -111,7 +112,8 @@
+ dnl Check for GNU cc
+ AC_PROG_CC
+ 
++AC_PROG_LIBTOOL
++
+ dnl Set Default CFLAGS
+ if test "$GCC" = "yes"; then
+     CFLAGS="$CFLAGS -Wall -D_GNU_SOURCE"
+@@ -111,7 +114,8 @@ AC_SUBST(TARGETS)
  AC_SUBST(INSTALL_TARGETS)
  AC_SUBST(nfslockdir)
  
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
index 88ebfd8..67d2221 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
@@ -16,6 +16,10 @@ inherit autotools
 
 EXTRA_OECONF = "--enable-shared"
 
+do_configure_prepend () {
+    touch install-sh
+}
+
 do_install () {
     oe_runmake 'ROOT=${D}' INSTGRP='' install
 }
-- 
1.9.0


