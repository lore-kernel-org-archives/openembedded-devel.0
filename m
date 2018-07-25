Return-Path: <ricardo@foundries.io>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id D6BED7455E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 21:45:21 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id u21-v6so5929749qku.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 14:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hzIWTUHma7GAEq+BsfZzRtJOFI+a5jpbNLWs6jy8lAc=;
	b=UVs88tJfmktcQuQ6j4ceYGJsW76KECIjLQorR0a+HIP21jcwbFBlhrIuN6qzJlkkRM
	r+GyXsNXKdtOCoNhJsExR5uC7W7pJweaRHN7Fu9wZlsLIPKwd/fbzRyyZdm9N4E03MG4
	Jho8NdWoORplR3wtB1RfvUOTZ7a3MDwPkXyiI8Xgu8LnRdKU6sXacmRHoo8MBCHYI7dN
	HLUz0Pg3evZ0VgzG7mAbxh3qCiswdV31vNzUYcwqE4PYp574uYP/i6iaAw6HoSJgnfPq
	HqS0siAbV/9NOFvLKRqCcIW3qybI7o+mvUAIB1AULpLDNxBi7COWbb3AteTWGCYLhNS9
	6M0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hzIWTUHma7GAEq+BsfZzRtJOFI+a5jpbNLWs6jy8lAc=;
	b=jZcxuD4hcU5dGiGRWWZStevDmlgpj/O9e6d90MQDD9lbZp9D+lg/JrpPOFIeFuuwm5
	cGbGjucH46B5HxRxIYIuzUuaf8N+EuPZqL3hYhKvSMsC0BEchPzIO4gp4HDUdMbsYMiz
	86lYdol5RFaXlSME+yP759bDuIRdFAtgk4OWLPsVv7gZ2m6L9ro8fDB7q/j8L1IyRbwG
	d2ioirkAlSKC0qSjFdcXj/egMSDuPeVPX+WaeleEtWLj0eLM74oVj2CXbcZSOiEGWzA8
	53N0Fnc+rmG04sKtMr3zj8eOoYkconMs95Wq5L2mCNu1Cy2F7HDIHSUrH8EIEDTgnb4Q
	zYeg==
X-Gm-Message-State: AOUpUlHEAK9JSWjgmx6yL6o3lSsj9GZacjmj4KKy8f7o51fB/AAmZ0p7
	bkffPVmCJp2Jz+mmguB6ii1tLJVz1A==
X-Google-Smtp-Source: AAOMgpcs7sDsAneDwVTVA4vQdY2mYjUX8koBZg3PI7H6q8z760y558E1gnVaunqEIkFESNs8T7/ttQ==
X-Received: by 2002:a37:8742:: with SMTP id
	j63-v6mr21125912qkd.353.1532555122368; 
	Wed, 25 Jul 2018 14:45:22 -0700 (PDT)
Received: from localhost.localdomain ([189.4.104.186])
	by smtp.gmail.com with ESMTPSA id
	j20-v6sm12376381qtc.71.2018.07.25.14.45.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jul 2018 14:45:21 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jul 2018 18:45:15 -0300
Message-Id: <1532555115-30074-1-git-send-email-ricardo@foundries.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] mozjs: disable MOZ_GLUE_IN_PROGRAM in standalone builds
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
X-List-Received-Date: Wed, 25 Jul 2018 21:45:22 -0000

Otherwise anyone consuming mozjs will fail to start with a segmentation
fault (e.g. polkitd).

Patch also used by Fedora and Debian.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 .../disable-mozglue-in-stand-alone-builds.patch    | 74 ++++++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb     |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/disable-mozglue-in-stand-alone-builds.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/disable-mozglue-in-stand-alone-builds.patch b/meta-oe/recipes-extended/mozjs/mozjs/disable-mozglue-in-stand-alone-builds.patch
new file mode 100644
index 0000000..5487cdb
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/disable-mozglue-in-stand-alone-builds.patch
@@ -0,0 +1,74 @@
+From 2fb531ac753500314336ccd508cb2d53f5e768e5 Mon Sep 17 00:00:00 2001
+From: Till Schneidereit <till@tillschneidereit.net>
+Date: Thu, 1 Oct 2015 12:59:09 +0200
+Subject: Disable MOZ_GLUE_IN_PROGRAM in stand-alone builds on all platforms
+
+Otherwise, build fails not being able to find HashBytes.
+
+Patch ported forward to mozjs52 by Philip Chimento
+<philip.chimento@gmail.com>.
+
+https://bugzilla.mozilla.org/show_bug.cgi?id=1176787
+
+Upstream-Status: Backport
+
+Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
+---
+ js/src/old-configure    | 20 ++++++++++++--------
+ mozglue/build/moz.build |  2 +-
+ 2 files changed, 13 insertions(+), 9 deletions(-)
+
+diff --git a/js/src/old-configure b/js/src/old-configure
+index d7afcff..8a6f142 100644
+--- a/js/src/old-configure
++++ b/js/src/old-configure
+@@ -8546,21 +8546,25 @@ if test -z "$MOZ_ENABLE_WARNINGS_AS_ERRORS"; then
+ fi
+ 
+ 
+-case "${OS_TARGET}" in
+-Android|WINNT|Darwin)
++if test "$JS_STANDALONE"; then
+   MOZ_GLUE_IN_PROGRAM=
+-  ;;
+-*)
+-    MOZ_GLUE_IN_PROGRAM=1
+-  cat >> confdefs.pytmp <<\EOF
++else
++  case "${OS_TARGET}" in
++  Android|WINNT|Darwin)
++    MOZ_GLUE_IN_PROGRAM=
++    ;;
++  *)
++        MOZ_GLUE_IN_PROGRAM=1
++    cat >> confdefs.pytmp <<\EOF
+     (''' MOZ_GLUE_IN_PROGRAM ''', ' 1 ')
+ EOF
+ cat >> confdefs.h <<\EOF
+ #define MOZ_GLUE_IN_PROGRAM 1
+ EOF
+ 
+-  ;;
+-esac
++    ;;
++  esac
++fi
+ 
+ if test "$MOZ_MEMORY"; then
+   if test "x$MOZ_DEBUG" = "x1"; then
+diff --git a/mozglue/build/moz.build b/mozglue/build/moz.build
+index d289747..e3be5a2 100644
+--- a/mozglue/build/moz.build
++++ b/mozglue/build/moz.build
+@@ -6,7 +6,7 @@
+ 
+ # Build mozglue as a shared lib on Windows, OSX and Android.
+ # If this is ever changed, update MOZ_SHARED_MOZGLUE in browser/installer/Makefile.in
+-if CONFIG['OS_TARGET'] in ('WINNT', 'Darwin', 'Android'):
++if CONFIG['OS_TARGET'] in ('WINNT', 'Darwin', 'Android') and not CONFIG['JS_STANDALONE']:
+     SharedLibrary('mozglue')
+ else:
+     Library('mozglue')
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
index 5996812..da80b63 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.8.1.o
            file://0003-workaround-autoconf-2.13-detection-failed.patch \
            file://0004-do-not-use-autoconf-2.13-to-refresh-old.configure.patch \
            file://0005-fix-do_compile-failed-on-mips.patch \
+           file://disable-mozglue-in-stand-alone-builds.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0006-support-musl.patch \
-- 
2.7.4


