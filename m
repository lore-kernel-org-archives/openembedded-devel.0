Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12018.1794070355834109728
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 08:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=p46aYbJ1;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49412eb1474so277366f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 08:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794070354; x=1794675154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sTyZJsd+VtqXvO36ipyXo6WsnQJCbnR1QNKdLdtktsY=;
        b=p46aYbJ1YBWWHX+uJD5uRjR4vmI6PBiUaKPQcdEv+VW9nvVt5VS+UbxCVt7U8Phl2+
         7SX55wbkUJhMNABLpCuhDMUjI7quBKR0/saT5E/BKaxZqYMQrZISfwlQOXIjk33rsi3k
         I2tbJuNieMDmDc0xKxzVnmu9L/AVHQ0QiSZcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070354; x=1794675154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sTyZJsd+VtqXvO36ipyXo6WsnQJCbnR1QNKdLdtktsY=;
        b=siJedpmAyIK+JW6ZFAVPJhjKKCz9UeudbTRSUT4PSdTQkRP4fkvMFrpRRs6ZK+z+oT
         /WVRiRcg8VqCOyV96nOwkW+SKb5Vm1ZXRe+mA/gIx+8pixFaTh2tOlxJY9vbjnIPW7Md
         usV3HEGIi0CuC90fRv4xCwlB0CiaNYn+UvSuUj26PbLFFwylO654a5IeGyCFYG+RN3Zg
         ky7yZMdFk/Euy+2fTqu4Ne7Qz3ZDq1rIJS5IXqaj3K8FO8mgJuSeNr/rDMZxyqyg3/Iu
         91YIeU5bhrjicEK3qnxWDVTQTearkbaiD4Dbjrv3LYENVCkrO6I5OcPds50/Y10++TB3
         lRRQ==
X-Gm-Message-State: APuU4Z8zd+imek3UubGNQptouPFjQ7H5dZfRyuJsmdmVTdO30B6r1gTR
	iwXU/p6hzZMsDZK0rR7N12n02kcLn48ftyIBNkS+AOr8u0yNX34sC9Fo6pT2DfKudRCL9xpD960
	2bQys
X-Gm-Gg: AYBFou2aCAjF/aXFllPvbQHp4O47Tqrb/G+mdp2lbgOYiTWFHvXVMsxn4jLCX8UufXp
	tSe9+ViqcOG+3Tk+fTscw3mGIfSj+N798lXojX6wDG+RfSqrH5xSFIxUl3rsIylT+Xd4F/4k2Cb
	zS8QUMdyId/wemV5+NnUjNxSy3WDO4twIjva6tOGRGj4AB7fN61KX3YFnP/fw9MVnJpKeIQjSoA
	areLo28dsFdqSVCUWlYDU/vh8tegATc1vGHMB7Vmh/SQCcn4aF7zbjzPvTfYOVgGIGKv4YwstHt
	2Shs5yMNAxWLwvx/oX2+xN1C78qc/e2Wr0l+qksbE8NbWHIOJ7nR6eOrIXiEnm8JFNnGevbhC0U
	IxJcI00z8Gc8rJQAeJcl5encMJc2NAkmwuL3aplrdrW+3aJ323GTHN0FnNgQY6o8c9UCCxMY2FX
	zUzkuJDtHA/03glHrCdi61BouXi5/oiVHdaXxFI4saK+msAOWzN4NbJyecQDfVNH5Ma6DEv2LWe
	0zKVyX5N5wKDzTnAKwo/k7VJ66P7Pj3EwT/T22+gd2S6wJhttbn/8glEHX0rECnmidoglGiINpp
	B/YzNV03wAeVnk1YHhieUhhrfPaExi6qns4oqYBwH3l+df4zawvMJ3WocEK4G6qFUu5g9447q9G
	1q0oWJZ4ofdV2yJEI3HuY+13ft+6C8c6AwMEO6Wg2gcZBqJzSUiwi+w==
X-Received: by 2002:a05:6000:4013:b0:48e:5db7:fd6c with SMTP id ffacd0b85a97d-492732dc848mr11932902f8f.4.1794070354084;
        Sat, 07 Nov 2026 08:52:34 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4948a99b9b0sm4127090f8f.4.2026.11.07.08.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:52:33 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 10/22] ipmiutil: Upgrade 3.2.2 -> 3.2.3
Date: Sat,  7 Nov 2026 18:52:09 +0200
Message-ID: <20261107165221.122340-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107165221.122340-1-leon.anavi@konsulko.com>
References: <20261107165221.122340-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 16:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131995
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.2.3:

- configure.ac: add 0800-openssl-4.patch from Brent Kirby
- util/ipmiutil.c: set ver 3.23

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...lib.h-for-malloc-free-atoi-functions.patch |  5 +---
 ...configure-enable-SSL11-for-OpenSSL-4.patch | 25 -------------------
 .../ipmiutil/ipmiutil/fix_systemd_path.patch  | 23 ++++++++++++-----
 .../{ipmiutil_3.2.2.bb => ipmiutil_3.2.3.bb}  |  5 ++--
 4 files changed, 20 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/ipmiutil/ipmiutil/0002-configure-enable-SSL11-for-OpenSSL-4.patch
 rename meta-oe/recipes-kernel/ipmiutil/{ipmiutil_3.2.2.bb => ipmiutil_3.2.3.bb} (92%)

diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-ihpm-Include-stdlib.h-for-malloc-free-atoi-functions.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-ihpm-Include-stdlib.h-for-malloc-free-atoi-functions.patch
index 1ed6472f6d..acd9de5f57 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-ihpm-Include-stdlib.h-for-malloc-free-atoi-functions.patch
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0001-ihpm-Include-stdlib.h-for-malloc-free-atoi-functions.patch
@@ -1,4 +1,4 @@
-From 097e108b81f2571c4c51871044adf409b6954649 Mon Sep 17 00:00:00 2001
+From a43ea47f1a1011ea9e9a365e4fb3612c7703f15e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 3 Sep 2022 00:44:52 -0700
 Subject: [PATCH] ihpm: Include stdlib.h for malloc/free/atoi functions
@@ -21,6 +21,3 @@ index 740ab74..5ad9ef6 100644
  #include <string.h>
  #include <time.h>
  
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0002-configure-enable-SSL11-for-OpenSSL-4.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0002-configure-enable-SSL11-for-OpenSSL-4.patch
deleted file mode 100644
index ae790f1909..0000000000
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0002-configure-enable-SSL11-for-OpenSSL-4.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Wed, 9 Sep 2026 23:00:00 +0300
-Subject: [PATCH] configure: enable SSL11 for OpenSSL 4
-
-OpenSSL 4 keeps EVP_CIPHER_CTX opaque, so it cannot go on the stack.
-The heap path behind SSL11 is already there, configure just does not
-turn it on for major version 4.
-
-Upstream-Status: Submitted [https://sourceforge.net/p/ipmiutil/feature-requests/13/]
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -443,7 +443,7 @@
- 		MD2_CFLAGS="-DSKIP_MD2 -DSSL11"
- 		sslnew=1
- 	fi
--	if test "$sslrel" = "3"; then
-+	if test "$sslrel" = "3" -o "$sslrel" = "4"; then
- 		echo "Detected openssl-$sslver" 
- 		MD2_CFLAGS="-DSKIP_MD2 -DSSL11"
- 		sslnew=1
diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
index c094b13507..bf0f01c44b 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/fix_systemd_path.patch
@@ -1,11 +1,20 @@
-allow systemd path to be defined by configure option.
+From 4e40e47ff5e128a0763e648180fe8ad01027f7c4 Mon Sep 17 00:00:00 2001
+From: Armin Kuster <akuster@mvista.com>
+Date: Sun, 16 Aug 2015 15:02:20 -0700
+Subject: [PATCH] allow systemd path to be defined by configure option.
 
 The configure probes the host for systemd path information.
 
 Upstream-Status: Inappropriate [Embedded]
 
 Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ configure.ac        | 60 +++++++++++++++++++++++++++------------------
+ scripts/Makefile.am | 14 +++++++----
+ 2 files changed, 45 insertions(+), 29 deletions(-)
 
+diff --git a/configure.ac b/configure.ac
+index aaab77e..b540fdd 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -151,7 +151,6 @@ CROSS_LFLAGS=""
@@ -13,11 +22,11 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  LIBSENSORS=""
  SAM2OBJ="isensor2.o ievents2.o"
 -SYSTEMD_DIR=/usr/share/ipmiutil
-
+ 
  AC_ARG_ENABLE([useflags],
      [  --enable-useflags    include environment CFLAGS and LDFLAGS.],
 @@ -211,29 +210,42 @@ AC_ARG_ENABLE([gpl],
-
+ 
  dnl Does this Linux have systemd enabled?  Otherwise use sysv init.
  AC_ARG_ENABLE([systemd],
 -    [  --enable-systemd       enable systemd service type=notify support and %_unitdir [[default=disabled]]],)
@@ -79,7 +88,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
 +	fi
 +fi
  fi
-
+ 
  dnl start main logic
 @@ -563,7 +575,7 @@ AC_SUBST(INS_LIB)
  AC_SUBST(SUBDIR_S)
@@ -89,7 +98,9 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
 +AC_SUBST(systemddir)
  AC_SUBST(SHR_LINK)
  AC_SUBST(pkgconfigdir)
-
+ 
+diff --git a/scripts/Makefile.am b/scripts/Makefile.am
+index 9a89e3b..fbc074a 100755
 --- a/scripts/Makefile.am
 +++ b/scripts/Makefile.am
 @@ -17,7 +17,8 @@ cronto = ${DESTDIR}${etcdir}/cron.daily
@@ -101,7 +112,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
 +systemddir = @systemddir@
  sysvinit = ${datato}
  sbinfls = ialarms ihealth ifru igetevent ireset icmd isol ilan isensor isel iserial iwdt iconfig ipicmg ifirewall ifwum ihpm iuser
-
+ 
 @@ -47,10 +48,13 @@ install:
  	${INSTALL_SCRIPT_SH} ipmi_port.sh ${sysvinit}/ipmi_port
  	${INSTALL_SCRIPT_SH} ipmi_info    ${sysvinit}/ipmi_info
diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.3.bb
similarity index 92%
rename from meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb
rename to meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.3.bb
index 4bcf627672..944966ef5e 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.3.bb
@@ -22,9 +22,8 @@ PARALLEL_MAKE = ""
 SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
            file://fix_systemd_path.patch \
            file://0001-ihpm-Include-stdlib.h-for-malloc-free-atoi-functions.patch \
-           file://0002-configure-enable-SSL11-for-OpenSSL-4.patch \
-          "
-SRC_URI[sha256sum] = "37f9bc8e6b18c1155e4d5ea38c87b83908b7acc7a44fbc5e3af493f26ef8b767"
+           "
+SRC_URI[sha256sum] = "d26cae7318f12ab1098ec6c8ef2f017722659dda26eb81ebc6b50edc0453867a"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/ipmiutil/files/"
 UPSTREAM_CHECK_REGEX = "ipmiutil-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
-- 
2.47.3

