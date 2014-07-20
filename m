Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 05F9660438
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 04:08:13 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id hy4so9816848vcb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jul 2014 21:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=D8A6wcSbl2g9+4yfGMLzHeb5nPaDNQrSzDwlsRwFYdg=;
	b=EYzhkvSILJO+eV+KyH36FWNaArmQdRacF9zpWZ6qZE4J+O6rrwc2dks+sEDOpsw6k4
	KQeaUjUee7qgo2/BnQDAwBTO7yJsPumGeBxT4uhoFJvZ9jUbF2DOYzy9Za5qPunY5jOo
	3SBcDlE3RnVvoVctDsb4XTIHh7TkwnejfhDEnQ6/vgUTAoiImRCA1hzHZfukHWFb8Ix8
	6X73lxKS3Ss6QxF31tdUF62cvIiARch3K9v4lDB/PxpE7z1aEwvEfn0dLkFRUgtbuaAP
	YxL/xB20U+wHYuusNWDP0XvEzELnBCCpnTrfpYnm4KC5AX8FEHJzmFTyaZX2SpxzRqlp
	JYpg==
X-Received: by 10.220.95.132 with SMTP id d4mr18428932vcn.33.1405829294791;
	Sat, 19 Jul 2014 21:08:14 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id n7sm2868785ven.1.2014.07.19.21.08.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jul 2014 21:08:13 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Jul 2014 21:07:38 -0700
Message-Id: <1405829260-13293-3-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1405829260-13293-1-git-send-email-TicoTimo@gmail.com>
References: <1405829260-13293-1-git-send-email-TicoTimo@gmail.com>
Subject: [meta-multimedia][PATCH 2/4] vlc: use AM_PATH_LIBGCRYPT instead of libgcrypt-config
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
X-List-Received-Date: Sun, 20 Jul 2014 04:08:14 -0000

* AM_PATH_LIBGCRYPT exists for a reason, why not use it?

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../vlc/vlc/0003-use-am-path-libgcrypt.patch       | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt.patch
new file mode 100644
index 0000000..ae80745
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt.patch
@@ -0,0 +1,46 @@
+* The upstream tests for libgcrypt are awkward and not working.
+  - Requires libgcrypt-config, which seems broken?
+* AM_PATH_LIBGCRYPT exists for a reason, why not use it? KISS.
+* Upstream abandoned AM_PATH_LIBGCRYPT in the past...newer automake ok?
+
+Upstream status: Pending
+
+Index: vlc-2.1.4/configure.ac
+===================================================================
+--- vlc-2.1.4.orig/configure.ac
++++ vlc-2.1.4/configure.ac
+@@ -3940,25 +3940,19 @@ PKG_ENABLE_MODULES_VLC([LIBXML2], [xml],
+ dnl
+ dnl libgcrypt
+ dnl
++GCRYPT_LIBVER=1
++GCRYPT_REQ=1.1.94
+ AC_ARG_ENABLE(libgcrypt,
+   [  --disable-libgcrypt     gcrypt support (default enabled)])
+ AS_IF([test "${enable_libgcrypt}" != "no"], [
+-  AC_CHECK_DECL([GCRYCTL_SET_THREAD_CBS], [
+-    libgcrypt-config --version >/dev/null || \
+-        AC_MSG_ERROR([gcrypt.h present but libgcrypt-config could not be found])
+-    AC_CHECK_LIB(gcrypt, gcry_control, [
+-      have_libgcrypt="yes"
+-      GCRYPT_CFLAGS="`libgcrypt-config --cflags`"
+-      GCRYPT_LIBS="`libgcrypt-config --libs`"
+-    ], [
+-      AC_MSG_ERROR([libgcrypt not found. Install libgcrypt or use --disable-libgcrypt. Have a nice day.])
+-    ], [`libgcrypt-config --libs`])
+-  ], [
+-    AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found. Install libgcrypt or use --disable-libgcrypt. Have a nice day.])
+-  ], [#include <gcrypt.h>]
+-  )
++      AM_PATH_LIBGCRYPT($GCRYPT_LIBVER:$GCRYPT_REQ,
++      [
++          GCRYPT_CFLAGS="$LIBGCRYPT_CFLAGS"
++          GCRYPT_LIBS="$LIBGCRYPT_LIBS"
++      ],[
++          AC_MSG_ERROR([libgcrypt version 1.1.94 or higher not found. Install libgcrypt or use --disable-libgcrypt. Have a nice day.])
++      ])
+ ])
+-
+ AC_SUBST(GCRYPT_CFLAGS)
+ AC_SUBST(GCRYPT_LIBS)
+ AM_CONDITIONAL([HAVE_GCRYPT], [test "${have_libgcrypt}" = "yes"])
-- 
1.9.3


