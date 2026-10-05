Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DCFFCA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 07:14:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14570.1791184437088160307
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2026 00:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FzCS/IMg;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-486e70f2457so549378f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 00:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791184435; x=1791789235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r3/40Sz+V+MdIb5EqLX+BlZxzTJaJA0gmq7rWGzJO/A=;
        b=FzCS/IMggSfdgj3RJZwJNUX29IyALkF/mYwhRW4wcdvJ3wl2uOGI50KPlkj/R72Ldz
         hd1uRrE+0ODsMBFMZoi5RGuHTQaFxIpuEh/YLib+lQ3aJl6enBIoPGjXWbdLq6DHKaur
         S7j+oiHigkuu1PY51k5SOSdmtUcREOda1uCm2HAaw0jjw7YxEBiO4XhwDEbu8KnSzeUW
         xWGBLr4CA440CMj7HA/cBxX1136mC5JNtIzk4QTyqYTXMYAKeDPzKUhptcWaH12EPqnR
         mVDZMvMyCAC/7me6ZmzS4IBUWqLcM2nRl62SKk8npWphRRKBdhCmfRfL0OLqDCf0Oqq+
         OCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184435; x=1791789235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3/40Sz+V+MdIb5EqLX+BlZxzTJaJA0gmq7rWGzJO/A=;
        b=beClgRVsihiEvt+vDyrt2UJ0pclpLbem43k0NLzx0srlVCHfydX9+EIFUyEnojj7Re
         /jtLVEmKgZ5G4VddRVTxyyV3O55kMN6gRBdW/qojCenjYwsu2Y7jZi3WqlklRo/YHt+V
         BRtZQVb8Qs7Ct+qSvTo4TjtE09LafQgI69o0cpersnrQgqRf79GMFejtJuOMXddw0OC3
         lhWQs1cZU4BZSmUFDPsYzckL5hxAhOdMhKKy9ntXUWRH5Mpe5t7N0zgnfbh1bVPKl/gb
         4Y9aVWaRlRf4ewq20rlev+Ll+UWKLqUACq/DOVCYvVzhOIL7awBkBfarbihT5lZgZ6kk
         gDew==
X-Gm-Message-State: AFuF++n7aM73bAYmhMe2525DD4+dyf+UlPgc/dMjO6KILihqr4R4VVYZ
	I4/1klLYr9ZjR76Y+V6p6VDS/2DifQvdn2NlW1rOnB8KcYUuGG+Tn+W83mkhnQ==
X-Gm-Gg: AYBFou3KAWGVi+a+OiRcUjMG7cFT2oC/fYuNPStshY8UcuKOfaahhZfm1za6U+NFvel
	JnAbAl+vqQsq4xfFd6e7JTQJJl0OKQy2FE/hqT0D8luk1ScTu0eRWr7MP7pIeDB9VBmMhzuQpuZ
	U42JYaaRgssByAESje8I/hM6SB5QrQcAAetYF6KW05g6CDCfexEtGIEvSY4Z7khtH7mE5s0rd7N
	d+GktfbcgmKjgnp45DftuWRRNWgOJCHAVWLPMEtFZ4zsLNZ4hGdVLnUF8bxfaJB7cHYa0UizjV+
	MtFyTThjpEr81WsefFjdiRtB8Z9w7gKCmwQ1ar9oczbzEbz4zGFMaSKd59WsoLp6boGft+4LJaY
	gaK6rNO4s+vqI/EcpoZI5Euy2FMTL6XBh1ZFqT4jlqKmLEXQcJ/AGbtFMQB+kwTZewLhiIdcIx0
	+iHPss0qfq6V/4pXquqH+TMQhsbimbD7vQ21uk702z0q84ctJ+DvHvVB0joAf00Fq5bRX8pQGbR
	YiuZjzPqyUs11KgW/g/o56/3JH5pV+fNZN5JUoVKAgT4qsFBAdQyP/AEyk=
X-Received: by 2002:a05:600c:5883:b0:4a0:12d7:4c88 with SMTP id 5b1f17b1804b1-4a168101d97mr72293475e9.30.1791184434939;
        Mon, 05 Oct 2026 00:13:54 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm316004485e9.4.2026.10.05.00.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:13:54 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] luajit: run the host helpers under qemu-user on non-x86 build hosts
Date: Mon,  5 Oct 2026 08:13:17 +0100
Message-ID: <20261005071316.44070-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 07:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130624

LuaJIT's build compiles minilua and buildvm and runs them, and buildvm
must have the target's pointer size. For a 32 bit target the recipe adds
-m32 to the build compiler, which only exists on x86, so on any other
build host (e.g. AArch64) the build fails.

On those hosts, build the helpers with the target compiler and run them
under qemu-user. x86 build hosts keep -m32 unchanged.

AI-Generated: Claude Code (Claude Opus 5.5)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 37 ++++++++++++++-----
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index a3b671ce7fe3..707cea5766af 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -13,17 +13,30 @@ SRCREV = "659a61693aa3b87661864ad0f12eee14c865cd7f"
 # The v2.1 branch is rolling with no tags; track commits.
 UPSTREAM_CHECK_COMMITS = "1"
 
-inherit pkgconfig binconfig siteinfo
+inherit pkgconfig binconfig siteinfo qemu
 
 BBCLASSEXTEND = "native"
 
 # http://luajit.org/install.html#cross
-# Host luajit needs to be compiled with the same pointer size
-# If you want to cross-compile to any 32 bit target on an x64 OS,
-# you need to install the multilib development package (e.g.
-# libc6-dev:i386 on Debian/Ubuntu) and build a 32 bit host part
-# (HOST_CC="gcc -m32").
-BUILD_CC_ARCH:append = " ${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
+# The build compiles helpers (minilua, buildvm) and runs them, and buildvm
+# must have the target's pointer size. For a 32 bit target on an x86 build
+# host they are built with "gcc -m32", which needs the multilib development
+# package (e.g. libc6-dev:i386 on Debian/Ubuntu). Other build hosts have no
+# -m32, so there the helpers are built with the target compiler and run under
+# qemu-user instead, which needs a machine qemu-user can emulate
+# (qemu-usermode in MACHINE_FEATURES).
+LUAJIT_HOST_QEMU = "${@'1' if d.getVar('SITEINFO_BITS') == '32' and d.getVar('BUILD_ARCH') not in ('x86_64', 'i686') else ''}"
+LUAJIT_HOST_QEMU:class-native = ""
+
+BUILD_CC_ARCH:append = "${@' -m32' if d.getVar('SITEINFO_BITS') == '32' and not d.getVar('LUAJIT_HOST_QEMU') else ''}"
+DEPENDS:append = "${@' qemu-native' if d.getVar('LUAJIT_HOST_QEMU') else ''}"
+
+LUAJIT_HOST_OEMAKE = "'HOST_CC=${BUILD_CC}' 'HOST_CFLAGS=${BUILD_CFLAGS}'"
+LUAJIT_HOST_OEMAKE_QEMU = "\
+    'HOST_CC=${CC}' 'HOST_CFLAGS=${CFLAGS}' 'HOST_LDFLAGS=${LDFLAGS}' \
+    'MINILUA_X=${WORKDIR}/luajit-qemuwrapper host/minilua' \
+    'BUILDVM_X=${WORKDIR}/luajit-qemuwrapper host/buildvm' \
+"
 
 # The lua makefiles expect the TARGET_SYS to be from uname -s
 # Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
@@ -48,8 +61,7 @@ EXTRA_OEMAKE = "\
     'TARGET_CFLAGS=${CFLAGS}' \
     'TARGET_LDFLAGS=${LDFLAGS}' \
     'TARGET_SHLDFLAGS=${LDFLAGS}' \
-    'HOST_CC=${BUILD_CC}' \
-    'HOST_CFLAGS=${BUILD_CFLAGS}' \
+    ${@d.getVar('LUAJIT_HOST_OEMAKE_QEMU') if d.getVar('LUAJIT_HOST_QEMU') else d.getVar('LUAJIT_HOST_OEMAKE')} \
     \
     'PREFIX=${prefix}' \
     'MULTILIB=${baselib}' \
@@ -57,6 +69,13 @@ EXTRA_OEMAKE = "\
 "
 
 do_compile () {
+    if [ -n "${LUAJIT_HOST_QEMU}" ]; then
+        cat > ${WORKDIR}/luajit-qemuwrapper <<EOF
+#!/bin/sh
+${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}${libdir}', '${STAGING_DIR_HOST}${base_libdir}'])} "\$@"
+EOF
+        chmod +x ${WORKDIR}/luajit-qemuwrapper
+    fi
     oe_runmake
 }
 

