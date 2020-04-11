Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.2437.1586643863211518110
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Apr 2020 15:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FQJ3wrYF;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id a32so2237587pje.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2020 15:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9td+R5o3WLh8bnfpub41bi+qm20JW/rD+k36eW+m2dY=;
        b=FQJ3wrYF02HbdbcSmywi5Y7dhyQr+CPgqVXD4ycQcSg+Ci7CknY0Ue9OJ0xeOjUEcF
         Es4j4eNx6gFf0CPqAH8hn00Uk79tKP7xRReTP4RCkE6q0vNjxt18TxCW2keIM2F6NJgd
         UmiMoPWnV6F/uyY/6IwvQI05xj8WL8BLp4ybbS+2MIEVZADbYo/tM5+WBp5UjAnDSt/d
         xf56aluEs/VXlsClO4Eto5qz+5/zl5tzivAp9Qz3oU+f+ZZWiA0nMupgR+MTA4rr1t/x
         KF9VBKKko7pvpYRADazXAAN6M4s7zOAY/u5gADr1gPvLHNH5DbQ2bglcSaVjJ/nHcaHm
         0vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9td+R5o3WLh8bnfpub41bi+qm20JW/rD+k36eW+m2dY=;
        b=W9KxUwkX1J2vpTAMlRDI5+mPqrTERzWiQFxD2/pEIs4oPbgQuW3MdVO9Mcoe4IHXWP
         U7YT/nDzhKjfXPyouZ7i1U51F5xsbo8PJQbayezm9+Rz7LjHKd+WaO9vZFu/IQV6hjp8
         SEnJJLXYUAdIIU3eyy/If39aoyhp9xE1cDRi1WHyan+JepmmkgmAfLeJlcnq0U+gqJyy
         GnikhXpajwUrGrlmQ3TgF2TsDfs4McRB0ornJspP4NzBCceQgEUgzIBDNSZieyenPMh1
         neJLp9MimHGm6zi3wKmB/vTwpw1hZ/KRN+8DHIy0+Emi4i409SHvM59/wiW0B+56XYZc
         3LPw==
X-Gm-Message-State: AGi0PuZn4wil50Al8H7MbD8x8R/n1sMW7OmDqJljpWzAduKyaA455j0Z
	aNFWk/0iAbWn/LjRYSD1Xl3oNr82ang=
X-Google-Smtp-Source: APiQypLGnLcxdp0oK/JMccWorjtGO+wy7oI17kdvtZBa1kiaJKAwLihpI9DWmBYepfqQAFrQRCERig==
X-Received: by 2002:a17:902:ec03:: with SMTP id l3mr10512141pld.73.1586643862193;
        Sat, 11 Apr 2020 15:24:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id y3sm4877952pfy.6.2020.04.11.15.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2020 15:24:21 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Przemyslaw Czarnowski <przemyslaw.hawrylewicz.czarnowski@intel.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH v3] nbdkit: Add recipe to extend backend possibilities of nbd.
Date: Sat, 11 Apr 2020 15:24:19 -0700
Message-Id: <20200411222419.1012342-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Przemyslaw Czarnowski <przemyslaw.hawrylewicz.czarnowski@intel.com>

Nbdkit uses plugins to add more sources of data for nbd client.
Nbdkit can also spawn nbd-client, uses unix or network socket to
communicate with client, uses different plugins to serve data for nbd
device eg. curl, file, custom plugins in many languages (perl, python)
and some others.

Fix build when printf is a macro instead of function

Use BSD-3-Clause for license
inherit bash-completion so these are packaged correctly

Signed-off-by: Przemyslaw Czarnowski <przemyslaw.hawrylewicz.czarnowski@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Fix build with clang/x86 and general cleanups

 ...ver-Fix-build-when-printf-is-a-macro.patch | 39 +++++++++++++++++++
 .../recipes-support/nbdkit/nbdkit_git.bb      | 36 +++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch
 create mode 100644 meta-networking/recipes-support/nbdkit/nbdkit_git.bb

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch b/meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch
new file mode 100644
index 0000000000..c7ec41eb9a
--- /dev/null
+++ b/meta-networking/recipes-support/nbdkit/nbdkit/0001-server-Fix-build-when-printf-is-a-macro.patch
@@ -0,0 +1,39 @@
+From 28f07715ab4d670ce81e12776bbece043305bd83 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 Apr 2020 15:08:39 -0700
+Subject: [PATCH] server: Fix build when printf is a macro
+
+clang complains on x86 when building
+
+main.c:116:2: error: embedding a #include directive within macro arguments is not supported
+ ^
+
+convert nesting include into a string assignment, to same effect but
+making it compatible with clang as well
+
+Upstream-Status: Submitted [https://github.com/libguestfs/nbdkit/pull/3]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ server/main.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/server/main.c b/server/main.c
+index 748122f..c0ac874 100644
+--- a/server/main.c
++++ b/server/main.c
+@@ -112,9 +112,10 @@ static void
+ usage (void)
+ {
+   /* --{short,long}-options remain undocumented */
+-  printf (
++  char const *opt_list =
+ #include "synopsis.c"
+-  );
++	  ;
++  printf ("%s\n", opt_list);
+   printf ("\n"
+           "Please read the nbdkit(1) manual page for full usage.\n");
+ }
+-- 
+2.26.0
+
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_git.bb b/meta-networking/recipes-support/nbdkit/nbdkit_git.bb
new file mode 100644
index 0000000000..a63e49ec55
--- /dev/null
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_git.bb
@@ -0,0 +1,36 @@
+SUMMARY = "nbdkit is a toolkit for creating NBD servers."
+DESCRIPTION = "NBD — Network Block Device — is a protocol \
+for accessing Block Devices (hard disks and disk-like things) \
+over a Network. \
+\
+nbdkit is a toolkit for creating NBD servers."
+
+HOMEPAGE = "https://github.com/libguestfs/nbdkit"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4332a97808994cf2133a65b6c6f33eaf"
+
+SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https \
+           file://0001-server-Fix-build-when-printf-is-a-macro.patch \
+"
+
+PV = "1.19.6+git${SRCPV}"
+SRCREV = "257561bc9f2f01eb9f21686bcec4b863d17a26c4"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "curl xz e2fsprogs zlib"
+
+# autotools-brokensep is needed as nbdkit does not support build in external directory
+inherit pkgconfig python3native perlnative bash-completion autotools-brokensep
+
+# Those are required to build standalone
+EXTRA_OECONF = " --without-libvirt --without-libguestfs --disable-perl"
+
+# Disable some extended support (not desired for small embedded systems)
+#EXTRA_OECONF += " --disable-python"
+#EXTRA_OECONF += " --disable-ocaml"
+#EXTRA_OECONF += " --disable-rust"
+#EXTRA_OECONF += " --disable-ruby"
+#EXTRA_OECONF += " --disable-tcl"
+#EXTRA_OECONF += " --disable-lua"
+#EXTRA_OECONF += " --disable-vddk"
-- 
2.26.0

