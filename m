Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.850.1590010453123043812
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2020 14:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lu0YF2rx;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id f4so2049844pgi.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2020 14:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UCm3iV5J8YjBoxhfKOmEGrffmFRSNF1aALm77irtA48=;
        b=Lu0YF2rx0nmAr9iaxOx3jFNQjo2R25slyNFcD2m9XMsF3loI9RFFAaTzqc1YJOG+nV
         PfMc9iNAZ8Vsm0orjzSl7gkDl5SG5omNRPCSMAENVIS260S6HouZl2ZHyh8G5XSfsPDA
         eEW7Jc/kZak4PeexKykh18k/OdYMZOWEO01/NryWybDI2flxpG0u9ozYseAxDAdAWte4
         nijSPedL5g52ANHGo0/CSIg/l19mtVui1ga7WwmvckMK8gixHS2ZGrsvP6v+ix7eq0OR
         beNazjLpsVRDJ1sn8Hq5u+qLzF1EiNBnFC69lCeWLq/kfvfSJEeR+L5vpJPlQKljlu75
         g9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UCm3iV5J8YjBoxhfKOmEGrffmFRSNF1aALm77irtA48=;
        b=hvvSpeoLveBD16E2KeTAVJU3BT6rTjNoQEuTUmrxtfbL0cX/XJMnZOXkJ1LqcyjbKS
         TM5B+OU5kDX6FXxj0sKxHVZg97U7NXYOCMAZbobqD7ihSP8p1i14SCtxAMdLYDCAbopb
         rqYtoMQIiD6bqy1SKwKsr5yAjn0rnk8xDXBnuiJ7zMLpaujd7DazLI1BwDjz08M1QrZt
         wKTGv1hllFT4f3A5SxfDJtpLcF7aYxP4EIqsBYGwg6WnI6osbrk9Y5MZ8mujDnnN04Ds
         U4txq7iF2XOZf4K3skJlvjMdsS01TF+LL2AnU7xQ5oH06OlW8MHoTM3f8anCVoyqNgF7
         ZRrw==
X-Gm-Message-State: AOAM532BqlgXN8KvSkJBR/Fjzbx8M2mxNMw0axzPskjpbeEWqCWW9Sgw
	DB/bKGcP6byhQmtboBtxd6w0ahILUpg=
X-Google-Smtp-Source: ABdhPJw5XF1ZDTJaHzQbWFGsOU9HlWbwWUojY6rPWiwKUAQEhFFefIcrlpOeIe0Cgos+Z5qyJBxF6w==
X-Received: by 2002:a63:33ca:: with SMTP id z193mr6068023pgz.210.1590010451704;
        Wed, 20 May 2020 14:34:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id t188sm2608786pgc.3.2020.05.20.14.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 14:34:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Miartus <adam.miartus@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] toybox: bump version to 0.8.2
Date: Wed, 20 May 2020 14:34:08 -0700
Message-Id: <20200520213408.140096-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520213408.140096-1-raj.khem@gmail.com>
References: <20200520213408.140096-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Miartus <adam.miartus@gmail.com>

remove OE-path-changes.patch as already applied to upstream

fix CC, CFLAGS and CROSS_COMPILE variables as toybox is strict
on what is expected to be filled in these variables:
CC = should contain compiler name
CROSS_COMPILE = should contain compiler prefix
CFLAGS = should contain only compiler flags

License wording changed due to commits:
 8014d31278411e22655aeae47338e95f209e2907
 b31192fd73b382358b1deb33dc6c4cf4ce9c613f
in toybox repository, type of license remains the same

Signed-off-by: Adam Miartus <adam.miartus@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../toybox/toybox/OE-path-changes.patch       | 195 ------------------
 meta-oe/recipes-core/toybox/toybox_0.8.2.bb   |  23 ++-
 2 files changed, 18 insertions(+), 200 deletions(-)
 delete mode 100644 meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch

diff --git a/meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch b/meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch
deleted file mode 100644
index e42c22ebd4..0000000000
--- a/meta-oe/recipes-core/toybox/toybox/OE-path-changes.patch
+++ /dev/null
@@ -1,195 +0,0 @@
-diff --git a/toys/net/microcom.c b/toys/net/microcom.c
-index d34e1fe..a369e6c 100644
---- a/toys/net/microcom.c
-+++ b/toys/net/microcom.c
-@@ -2,7 +2,7 @@
-  *
-  * Copyright 2017 The Android Open Source Project.
- 
--USE_MICROCOM(NEWTOY(microcom, "<1>1s:X", TOYFLAG_BIN))
-+USE_MICROCOM(NEWTOY(microcom, "<1>1s:X", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config MICROCOM
-   bool "microcom"
-diff --git a/toys/other/blockdev.c b/toys/other/blockdev.c
-index 38e0993..c5d9fcd 100644
---- a/toys/other/blockdev.c
-+++ b/toys/other/blockdev.c
-@@ -4,7 +4,7 @@
-  *
-  * No Standard.
- 
--USE_BLOCKDEV(NEWTOY(blockdev, "<1>1(setro)(setrw)(getro)(getss)(getbsz)(setbsz)#<0(getsz)(getsize)(getsize64)(flushbufs)(rereadpt)",TOYFLAG_USR|TOYFLAG_BIN))
-+USE_BLOCKDEV(NEWTOY(blockdev, "<1>1(setro)(setrw)(getro)(getss)(getbsz)(setbsz)#<0(getsz)(getsize)(getsize64)(flushbufs)(rereadpt)",TOYFLAG_SBIN))
- 
- config BLOCKDEV
-   bool "blockdev"
-diff --git a/toys/other/chrt.c b/toys/other/chrt.c
-index a1c37a0..d6db3a5 100644
---- a/toys/other/chrt.c
-+++ b/toys/other/chrt.c
-@@ -4,7 +4,7 @@
-  *
-  * Note: -ibrfo flags sorted to match SCHED positions for highest_bit()
- 
--USE_CHRT(NEWTOY(chrt, "^mp#<0iRbrfo[!ibrfo]", TOYFLAG_USR|TOYFLAG_SBIN))
-+USE_CHRT(NEWTOY(chrt, "^mp#<0iRbrfo[!ibrfo]", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config CHRT
-   bool "chrt"
-diff --git a/toys/other/hwclock.c b/toys/other/hwclock.c
-index 1d313e3..412582d 100644
---- a/toys/other/hwclock.c
-+++ b/toys/other/hwclock.c
-@@ -4,7 +4,7 @@
-  *
-  * No standard, but see Documentation/rtc.txt in the linux kernel source..
-  *
--USE_HWCLOCK(NEWTOY(hwclock, ">0(fast)f(rtc):u(utc)l(localtime)t(systz)s(hctosys)r(show)w(systohc)[-ul][!rtsw]", TOYFLAG_USR|TOYFLAG_BIN))
-+USE_HWCLOCK(NEWTOY(hwclock, ">0(fast)f(rtc):u(utc)l(localtime)t(systz)s(hctosys)r(show)w(systohc)[-ul][!rtsw]", TOYFLAG_SBIN))
- 
- config HWCLOCK
-   bool "hwclock"
-diff --git a/toys/other/modinfo.c b/toys/other/modinfo.c
-index 1178d67..966a9de 100644
---- a/toys/other/modinfo.c
-+++ b/toys/other/modinfo.c
-@@ -4,7 +4,7 @@
-  *
-  * TODO: cleanup
- 
--USE_MODINFO(NEWTOY(modinfo, "<1b:k:F:0", TOYFLAG_BIN))
-+USE_MODINFO(NEWTOY(modinfo, "<1b:k:F:0", TOYFLAG_SBIN))
- 
- config MODINFO
-   bool "modinfo"
-diff --git a/toys/other/pmap.c b/toys/other/pmap.c
-index abb0a33..2acef02 100644
---- a/toys/other/pmap.c
-+++ b/toys/other/pmap.c
-@@ -5,7 +5,7 @@
-  *
-  * No Standard.
- 
--USE_PMAP(NEWTOY(pmap, "<1xq", TOYFLAG_BIN))
-+USE_PMAP(NEWTOY(pmap, "<1xq", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config PMAP
-   bool "pmap"
-diff --git a/toys/other/printenv.c b/toys/other/printenv.c
-index e8bcf29..65f62ed 100644
---- a/toys/other/printenv.c
-+++ b/toys/other/printenv.c
-@@ -2,7 +2,7 @@
-  *
-  * Copyright 2012 Georgi Chorbadzhiyski <georgi@unixsol.org>
- 
--USE_PRINTENV(NEWTOY(printenv, "0(null)", TOYFLAG_USR|TOYFLAG_BIN))
-+USE_PRINTENV(NEWTOY(printenv, "0(null)", TOYFLAG_BIN))
- 
- config PRINTENV
-   bool "printenv"
-diff --git a/toys/other/taskset.c b/toys/other/taskset.c
-index 8ffdab7..89fd528 100644
---- a/toys/other/taskset.c
-+++ b/toys/other/taskset.c
-@@ -2,7 +2,7 @@
-  *
-  * Copyright 2012 Elie De Brauwer <eliedebrauwer@gmail.com>
- 
--USE_TASKSET(NEWTOY(taskset, "<1^pa", TOYFLAG_BIN|TOYFLAG_STAYROOT))
-+USE_TASKSET(NEWTOY(taskset, "<1^pa", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_STAYROOT))
- USE_NPROC(NEWTOY(nproc, "(all)", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config NPROC
-diff --git a/toys/other/timeout.c b/toys/other/timeout.c
-index 9b93466..e1d0f4d 100644
---- a/toys/other/timeout.c
-+++ b/toys/other/timeout.c
-@@ -4,7 +4,7 @@
-  *
-  * No standard
- 
--USE_TIMEOUT(NEWTOY(timeout, "<2^vk:s: ", TOYFLAG_BIN))
-+USE_TIMEOUT(NEWTOY(timeout, "<2^vk:s: ", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config TIMEOUT
-   bool "timeout"
-diff --git a/toys/other/truncate.c b/toys/other/truncate.c
-index 142d3c7..40eb1e5 100644
---- a/toys/other/truncate.c
-+++ b/toys/other/truncate.c
-@@ -2,7 +2,7 @@
-  *
-  * Copyright 2011 Rob Landley <rob@landley.net>
- 
--USE_TRUNCATE(NEWTOY(truncate, "<1s:|c", TOYFLAG_BIN))
-+USE_TRUNCATE(NEWTOY(truncate, "<1s:|c", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config TRUNCATE
-   bool "truncate"
-diff --git a/toys/posix/nice.c b/toys/posix/nice.c
-index 4b587ee..9f7b119 100644
---- a/toys/posix/nice.c
-+++ b/toys/posix/nice.c
-@@ -4,7 +4,7 @@
-  *
-  * See http://opengroup.org/onlinepubs/9699919799/utilities/nice.html
- 
--USE_NICE(NEWTOY(nice, "^<1n#", TOYFLAG_USR|TOYFLAG_BIN))
-+USE_NICE(NEWTOY(nice, "^<1n#", TOYFLAG_BIN))
- 
- config NICE
-   bool "nice"
-diff --git a/toys/posix/nl.c b/toys/posix/nl.c
-index 9b02bfa..41e1b89 100644
---- a/toys/posix/nl.c
-+++ b/toys/posix/nl.c
-@@ -7,7 +7,7 @@
-  * This implements a subset: only one logical page (-ip), no sections (-dfh).
-  * todo: -lv
- 
--USE_NL(NEWTOY(nl, "v#<1=1l#b:n:s:w#<0=6E", TOYFLAG_BIN))
-+USE_NL(NEWTOY(nl, "v#<1=1l#b:n:s:w#<0=6E", TOYFLAG_USR|TOYFLAG_BIN))
- 
- config NL
-   bool "nl"
-diff --git a/toys/posix/paste.c b/toys/posix/paste.c
-index ea04f02..8972f71 100644
---- a/toys/posix/paste.c
-+++ b/toys/posix/paste.c
-@@ -6,7 +6,7 @@
-  *
-  * Deviations from posix: the FILE argument isn't mandatory, none == '-'
- 
--USE_PASTE(NEWTOY(paste, "d:s", TOYFLAG_BIN|TOYFLAG_LOCALE))
-+USE_PASTE(NEWTOY(paste, "d:s", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE))
- 
- config PASTE
-   bool "paste"
-diff --git a/toys/posix/ps.c b/toys/posix/ps.c
-index aef2a7f..b559e09 100644
---- a/toys/posix/ps.c
-+++ b/toys/posix/ps.c
-@@ -44,7 +44,7 @@
-  * TODO: top: thread support and SMP
-  * TODO: pgrep -f only searches the amount of cmdline that fits in toybuf.
- 
--USE_PS(NEWTOY(ps, "k(sort)*P(ppid)*aAdeflMno*O*p(pid)*s*t*Tu*U*g*G*wZ[!ol][+Ae][!oO]", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE))
-+USE_PS(NEWTOY(ps, "k(sort)*P(ppid)*aAdeflMno*O*p(pid)*s*t*Tu*U*g*G*wZ[!ol][+Ae][!oO]", TOYFLAG_BIN|TOYFLAG_LOCALE))
- // stayroot because iotop needs root to read other process' proc/$$/io
- USE_TOP(NEWTOY(top, ">0m" "O*Hk*o*p*u*s#<1d#=3<1n#<1bq[!oO]", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE))
- USE_IOTOP(NEWTOY(iotop, ">0AaKO" "k*o*p*u*s#<1=7d#=3<1n#<1bq", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_STAYROOT|TOYFLAG_LOCALE))
-diff --git a/toys/posix/sed.c b/toys/posix/sed.c
-index cf7d15e..130ac08 100644
---- a/toys/posix/sed.c
-+++ b/toys/posix/sed.c
-@@ -10,7 +10,7 @@
-  * TODO: handle error return from emit(), error_msg/exit consistently
-  *       What's the right thing to do for -i when write fails? Skip to next?
- 
--USE_SED(NEWTOY(sed, "(help)(version)e*f*inEr[+Er]", TOYFLAG_USR|TOYFLAG_BIN|TOYFLAG_LOCALE|TOYFLAG_NOHELP))
-+USE_SED(NEWTOY(sed, "(help)(version)e*f*inEr[+Er]", TOYFLAG_BIN|TOYFLAG_LOCALE|TOYFLAG_NOHELP))
- 
- config SED
-   bool "sed"
diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.2.bb b/meta-oe/recipes-core/toybox/toybox_0.8.2.bb
index 2f82978334..89c154db2b 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.2.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.2.bb
@@ -3,21 +3,34 @@ HOMEPAGE = "http://www.landley.net/toybox/"
 DEPENDS = "attr virtual/crypt"
 
 LICENSE = "BSD-0-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 
 inherit cml1 update-alternatives
 
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
-           file://OE-path-changes.patch \
            "
-SRC_URI[md5sum] = "a8bb502a1be941f06dd2644fff25f547"
-SRC_URI[sha256sum] = "3ada450ac1eab1dfc352fee915ea6129b9a4349c1885f1394b61bd2d89a46c04"
+SRC_URI[md5sum] = "f5cec2e37842ef552753b8b698c69690"
+SRC_URI[sha256sum] = "9a2760fa442e9baf1be6064ab5ba8b90f2098e1d4bc33c788960b8d73f52fed5"
 
 SECTION = "base"
 
 TOYBOX_BIN = "generated/unstripped/toybox"
 
-EXTRA_OEMAKE = 'HOSTCC="${BUILD_CC}" CPUS=${@oe.utils.cpu_count()}'
+# Toybox is strict on what CC, CFLAGS and CROSS_COMPILE variables should contain.
+# Fix CC, CFLAGS, CROSS_COMPILE to match expectations.
+# CC = compiler name
+# CFLAGS = only compiler flags
+# CROSS_COMPILE = compiler prefix
+CFLAGS += "${TOOLCHAIN_OPTIONS} ${TUNE_CCARGS}"
+
+COMPILER_toolchain-clang = "clang"
+COMPILER  ?= "gcc"
+
+EXTRA_OEMAKE = 'CROSS_COMPILE="${HOST_PREFIX}" \
+                CC="${COMPILER}" \
+                STRIP="strip" \
+                CFLAGS="${CFLAGS}" \
+                HOSTCC="${BUILD_CC}" CPUS=${@oe.utils.cpu_count()} V=1'
 
 do_configure() {
     # allow user to define their own defconfig in bbappend, taken from kernel.bbclass
-- 
2.26.2

