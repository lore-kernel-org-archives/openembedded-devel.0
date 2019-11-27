Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 356B87F89C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 07:29:01 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id e17so10342448pgd.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 23:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mVXIz5ZP5CZIseYjJ/B0dYtXnTRVM7UkWw9GF/jA+Z8=;
	b=cQNX1cTIo4UcNj4isG7ek9iag6nHzjg/QWADVLXSwvwl6pIfoe+RZnjunOja5BOFTA
	jP8uEHTHmVerMLgyegBTYBaBL7ykUZvAjNNO+oVUdUW6wqorDHaWUuw0QnvlI6zz6wkf
	jGjqjyLVUAAU0dSBRMKcophNnMGe47bX4eXYlToUwRkOxaHFdj1Tqxwp9Yx9l/QkdFxU
	/raPevYXfjpdE/t/Brz81wlrlhcW7xJ4SnllpnaQEkMLVzzprK3y4YXEfmu51VbFdAIF
	8Ao7QMv3xJX/7KYUp4O1/P4uW/YCWHvG2XaboJa/KjWuP8CkV7IgjlmHGNe56dMdZRZH
	mKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mVXIz5ZP5CZIseYjJ/B0dYtXnTRVM7UkWw9GF/jA+Z8=;
	b=AJeINBhBwGS+kyS+as42BgCojDAfbHTG2GevjpgxD19QDP49HoHy5MCqfBT/LKyDxe
	IQu5chRZyhBp210WeiQOPCmgkDPfRkW7aRCzWqeWEIPhFg+WIeUOmAyBzXdVyh1amqEC
	3V2CBIxLMNPXz/DQESch2/Pi2Wigr8ORT7zarc5aqnzHFqkIIMmuJCi1DYzMjItyCaF9
	R+Y2yKBE7EDLt/8LfIkYGUicabfOP5itUkE0ieZQvR7S2Ll5I00xc01C1uTYA4lzRk3T
	w+NWlAp5s7ZGnHmIeLJcrZBwCLx1/QiL43f01NBtRrcJwuhY46bBxoH5tJiHScg1Z7/F
	sqSQ==
X-Gm-Message-State: APjAAAWLMIQZJykr4DrY1ikKJdSvqDgIlEMcbJFbqYFeGLBL39klXfwr
	cnJeEJzHSIpWSTVdyzG5qkPHPnpMDdk=
X-Google-Smtp-Source: APXvYqwGTYNsZbCZnuC8acfRaUnEsPydI8ifciRoU8pAcYPB7MgzxbIJcuMpq1BuDJ/YFEqVYtcGkA==
X-Received: by 2002:a62:6884:: with SMTP id
	d126mr44091839pfc.109.1574839742365; 
	Tue, 26 Nov 2019 23:29:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	j14sm1853703pgs.57.2019.11.26.23.29.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 23:29:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2019 23:28:47 -0800
Message-Id: <20191127072848.785911-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] a2jmidid: Upgrade to release 9
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
X-List-Received-Date: Wed, 27 Nov 2019 07:29:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Switch to using git for SRC_URI, since 9 is not available in original location
- Drop upstreamed aarch64 support patch
- Drop waf patch as it uses meson now
- Disable lto for now, meson needs to pass full CC to LTO plugin otherwise
  we get linking errors since LTO objects are not compiled with right ABI
  especially on arm ( mixing hard/soft float)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ead-library-dependency-to-fix-linkin.patch | 43 -------------------
 .../jack/a2jmidid/0002-aarch64.patch          | 31 -------------
 .../jack/a2jmidid/riscv_ucontext.patch        |  8 ++--
 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb | 32 --------------
 meta-oe/recipes-multimedia/jack/a2jmidid_9.bb | 28 ++++++++++++
 5 files changed, 32 insertions(+), 110 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/jack/a2jmidid/0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch
 delete mode 100644 meta-oe/recipes-multimedia/jack/a2jmidid/0002-aarch64.patch
 delete mode 100644 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
 create mode 100644 meta-oe/recipes-multimedia/jack/a2jmidid_9.bb

diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid/0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch b/meta-oe/recipes-multimedia/jack/a2jmidid/0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch
deleted file mode 100644
index d17d311bdb..0000000000
--- a/meta-oe/recipes-multimedia/jack/a2jmidid/0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 488dc9b00239976caac6bd9ed76b38d9d1659dd9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 4 Oct 2016 23:44:49 +0200
-Subject: [PATCH] wscript: add pthread library dependency to fix linking
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Stolen from [1]
-
-[1] http://pkgs.fedoraproject.org/cgit/rpms/a2jmidid.git/tree/a2jmidid-linking.patch
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- wscript | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/wscript b/wscript
-index 664625b..66a532a 100644
---- a/wscript
-+++ b/wscript
-@@ -67,6 +67,7 @@ def configure(conf):
-         conf.env['DBUS_ENABLED'] = False
- 
-     conf.env['LIB_DL'] = ['dl']
-+    conf.env['LIB_PTHREAD'] = ['pthread']
- 
-     #conf.check_header('expat.h', mandatory=True)
-     #conf.env['LIB_EXPAT'] = ['expat']
-@@ -152,7 +153,7 @@ def build(bld):
- 
-     prog.includes = '.' # make waf dependency tracking work
-     prog.target = 'a2jmidid'
--    prog.uselib = 'ALSA JACK DL'
-+    prog.uselib = 'ALSA JACK DL PTHREAD'
-     if bld.env()['DBUS_ENABLED']:
-         prog.uselib += " DBUS-1"
-     prog = bld.create_obj('cc', 'program')
--- 
-2.5.5
-
diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid/0002-aarch64.patch b/meta-oe/recipes-multimedia/jack/a2jmidid/0002-aarch64.patch
deleted file mode 100644
index b344f5427b..0000000000
--- a/meta-oe/recipes-multimedia/jack/a2jmidid/0002-aarch64.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Consider compiler define for aarch64
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status:Pending
-
-Index: a2jmidid-8/sigsegv.c
-===================================================================
---- a2jmidid-8.orig/sigsegv.c
-+++ a2jmidid-8/sigsegv.c
-@@ -91,18 +91,18 @@ static void signal_segv(int signum, sigi
-     a2j_error("info.si_errno = %d", info->si_errno);
-     a2j_error("info.si_code  = %d (%s)", info->si_code, si_codes[info->si_code]);
-     a2j_error("info.si_addr  = %p", info->si_addr);
--#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__)
-+#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__)
-     for(i = 0; i < NGREG; i++)
-         a2j_error("reg[%02d]       = 0x" REGFORMAT, i,
- #if defined(__powerpc__)
-                 ucontext->uc_mcontext.uc_regs[i]
--#elif defined(__sparc__) && defined(__arch64__)
-+#elif defined(__sparc__) || defined(__arch64__)
-                 ucontext->uc_mcontext.mc_gregs[i]
- #else
-                 ucontext->uc_mcontext.gregs[i]
- #endif
-                 );
--#endif /* alpha, ia64, kFreeBSD, arm, hppa */
-+#endif /* alpha, ia64, kFreeBSD, arm, hppa aarch64 */
- 
- #if defined(SIGSEGV_STACK_X86) || defined(SIGSEGV_STACK_IA64)
- # if defined(SIGSEGV_STACK_IA64)
diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid/riscv_ucontext.patch b/meta-oe/recipes-multimedia/jack/a2jmidid/riscv_ucontext.patch
index 23618f18a1..af6612e857 100644
--- a/meta-oe/recipes-multimedia/jack/a2jmidid/riscv_ucontext.patch
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid/riscv_ucontext.patch
@@ -12,13 +12,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__) && !defined(__riscv)
      for(i = 0; i < NGREG; i++)
          a2j_error("reg[%02d]       = 0x" REGFORMAT, i,
- #if defined(__powerpc__)
-@@ -102,7 +102,7 @@ static void signal_segv(int signum, sigi
+ #if defined(__powerpc__) && !defined(__powerpc64__)
+@@ -104,7 +104,7 @@ static void signal_segv(int signum, sigi
                  ucontext->uc_mcontext.gregs[i]
  #endif
                  );
--#endif /* alpha, ia64, kFreeBSD, arm, hppa aarch64 */
-+#endif /* alpha, ia64, kFreeBSD, arm, hppa aarch64 riscv */
+-#endif /* alpha, ia64, kFreeBSD, arm, hppa, aarch64 */
++#endif /* alpha, ia64, kFreeBSD, arm, hppa, aarch64 riscv */
  
  #if defined(SIGSEGV_STACK_X86) || defined(SIGSEGV_STACK_IA64)
  # if defined(SIGSEGV_STACK_IA64)
diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
deleted file mode 100644
index a0aa412232..0000000000
--- a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "a2jmidid is daemon for exposing ALSA sequencer applications as JACK MIDI"
-SECTION = "libs/multimedia"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = " \
-    file://gpl2.txt;md5=751419260aa954499f7abaabaa882bbe \
-"
-
-DEPENDS = "alsa-lib jack dbus"
-DEPENDS_append_libc-musl = " libexecinfo"
-
-SRC_URI = " \
-    http://download.gna.org/${BPN}/${BPN}-${PV}.tar.bz2 \
-    file://0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch \
-    file://0002-aarch64.patch \
-    file://riscv_ucontext.patch \
-"
-SRC_URI[md5sum] = "9cf4edbc3ad2ddeeaf6c8c1791ff3ddd"
-SRC_URI[sha256sum] = "2a9635f62aabc59edb54ada07048dd47e896b90caff94bcee710d3582606f55f"
-
-inherit waf pkgconfig
-
-LDFLAGS_append_libc-musl = " -lexecinfo"
-
-export LINKFLAGS="${LDFLAGS}"
-
-do_configure() {
-    sed -i 's|/usr/bin/.*python$|/usr/bin/env python2|' ${S}/a2j_control ${S}/waf ${S}/wscript
-    (cd ${B} && ${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF} ${EXTRA_OECONF})
-}
-
-FILES_${PN} += "${datadir}/dbus-1/services"
diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
new file mode 100644
index 0000000000..5fffe77c2d
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid_9.bb
@@ -0,0 +1,28 @@
+SUMMARY = "a2jmidid is daemon for exposing ALSA sequencer applications as JACK MIDI"
+SECTION = "libs/multimedia"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=751419260aa954499f7abaabaa882bbe \
+"
+
+DEPENDS = "alsa-lib jack dbus"
+DEPENDS_append_libc-musl = " libexecinfo"
+
+SRCREV = "de37569c926c5886768f892c019e3f0468615038"
+SRC_URI = " \
+    git://github.com/linuxaudio/a2jmidid;protocol=https \
+    file://riscv_ucontext.patch \
+"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON = "-Db_lto=false"
+
+LDFLAGS_append_libc-musl = " -lexecinfo"
+
+export LINKFLAGS="${LDFLAGS}"
+
+FILES_${PN} += "${datadir}/dbus-1/services"
-- 
2.24.0


