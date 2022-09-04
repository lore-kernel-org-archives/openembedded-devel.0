Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756F7C6FA82
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:54 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.11315.1662276892601882509
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fZmnDwMv;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d12so5775332plr.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qtOWpZ9fSzHT/LU+UY0elgI9Dtu5hmGAd+DfoTZZaP4=;
        b=fZmnDwMvyIHtW8UlAh6rgIS3knXIb4GhWkYRKB/hhKf/ft6QEPKVlxd59Gu+1SSTx4
         vJJpvTfAP5SKtbDm/wjhqyZZN6c0Q9e8cHQnK8lAqOVGsSmyI6BHqzY8y8pjzsCrK+M6
         b1G97/WI5kC/rhpviKG1wCgGeoJpbTt804RHeSywUICh6gDooJDuD1yYdJXCYYvLC6s2
         GCYZ3yMUi5TWI8dXLZv87LYUOpFJxFZc+GSA3wkPei0NocWQOiRpslx7zGfKZN999Q0P
         CfRjT7kIxlAMDTXrn7DjPvxl5QcuOb4B07dY6fsMIuyNCCsVmPSJumxIiqKVI2BWGliS
         B8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qtOWpZ9fSzHT/LU+UY0elgI9Dtu5hmGAd+DfoTZZaP4=;
        b=kZwOUvinGoNkzsRCFoi4s9anTN627yBiCFCsGHnpp9rMsodOQL99Clvk9VDf/xRvMv
         jLUOvH9Kf9D3R8NDNUhYAbi0MKs/ByVrBGbYThcpnQ6h8Qu4zDPwjUQvuaYTmcRYWFSJ
         9S5fy2tyG8hNvUJ3ntDcuIY68Yknu3lzW8AWQZgkwxdcFhLvV4j7mIk7zv876Zgw7SK/
         wnq6MYdaI7UsiPUxSapanw+/pOOUJ/pFIqmbnFR3r7OFzsoqlYFHnnitvYphb1rNr0xG
         NQ/VBCwKvKkd0vH0Ox3lirHv3AUzsZptqcbdLURdNfEsOzQrxaKkERk74SX850Jo/pg0
         1YBA==
X-Gm-Message-State: ACgBeo0/n27euVvpQGrZccmssqmpORtAXskCPutHU7gJoeRiauUTv6gz
	e5P4haaMpih9xIZyOjzwggm2fHHiNaJwIA==
X-Google-Smtp-Source: 
 AA6agR4liVKl6ZT9b/RfMvkXM4f87vIgiZsNFGHefb7nr2QRyQCsULswj9e0Ab5TYfnyGB3KUEZcTA==
X-Received: by 2002:a17:902:f612:b0:172:cbb0:9b4f with SMTP id
 n18-20020a170902f61200b00172cbb09b4fmr42159579plg.142.1662276891668;
        Sun, 04 Sep 2022 00:34:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 30/63] daemontools: Fix build with clang15 and musl
Date: Sun,  4 Sep 2022 00:33:44 -0700
Message-Id: <20220904073417.3251865-30-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98624

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-signature-of-main-function.patch | 209 ++++++++++++++++++
 .../daemontools/daemontools/warnings.patch    |  74 +++++++
 .../daemontools/daemontools_0.76.bb           |   4 +
 3 files changed, 287 insertions(+)
 create mode 100644 meta-oe/recipes-support/daemontools/daemontools/0001-Fix-signature-of-main-function.patch
 create mode 100644 meta-oe/recipes-support/daemontools/daemontools/warnings.patch

diff --git a/meta-oe/recipes-support/daemontools/daemontools/0001-Fix-signature-of-main-function.patch b/meta-oe/recipes-support/daemontools/daemontools/0001-Fix-signature-of-main-function.patch
new file mode 100644
index 0000000000..19f0ae7f21
--- /dev/null
+++ b/meta-oe/recipes-support/daemontools/daemontools/0001-Fix-signature-of-main-function.patch
@@ -0,0 +1,209 @@
+From 269f18d5e6698fdd34fec2798f10c6fe072f3cd5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 23:36:52 -0700
+Subject: [PATCH] Fix signature of main function
+
+Clang-15 errors out otherewise.
+Include needed headers for missing functions
+
+Upstream-Status:Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/chkshsgr.c    | 2 +-
+ src/tai64n.c      | 2 +-
+ src/tai64nlocal.c | 2 +-
+ src/trycpp.c      | 5 +++--
+ src/tryflock.c    | 4 ++--
+ src/trymkffo.c    | 2 +-
+ src/trypoll.c     | 3 ++-
+ src/trysgact.c    | 4 ++--
+ src/trysgprm.c    | 4 ++--
+ src/tryshsgr.c    | 3 ++-
+ src/tryulong64.c  | 4 ++--
+ src/trywaitp.c    | 4 ++--
+ src/x86cpuid.c    | 2 +-
+ 13 files changed, 22 insertions(+), 19 deletions(-)
+
+diff --git a/src/chkshsgr.c b/src/chkshsgr.c
+index 038afe9..9547a4c 100644
+--- a/src/chkshsgr.c
++++ b/src/chkshsgr.c
+@@ -5,7 +5,7 @@
+ #include <grp.h>
+ #include <unistd.h>
+ 
+-int main()
++int main(int argc, char *argv[])
+ {
+   gid_t x[4];
+ 
+diff --git a/src/tai64n.c b/src/tai64n.c
+index 17bdb82..7096ab3 100644
+--- a/src/tai64n.c
++++ b/src/tai64n.c
+@@ -27,7 +27,7 @@ buffer in = BUFFER_INIT(myread,0,inbuf,sizeof inbuf);
+ 
+ char stamp[TIMESTAMP + 1];
+ 
+-int main()
++int main(int argc, char *argv[])
+ {
+   char ch;
+ 
+diff --git a/src/tai64nlocal.c b/src/tai64nlocal.c
+index ce16ad8..2435737 100644
+--- a/src/tai64nlocal.c
++++ b/src/tai64nlocal.c
+@@ -28,7 +28,7 @@ unsigned long nanosecs;
+ unsigned long u;
+ struct tm *t;
+ 
+-int main()
++int main(int argc, char *argv[])
+ {
+   char ch;
+ 
+diff --git a/src/trycpp.c b/src/trycpp.c
+index e4503d4..d96c955 100644
+--- a/src/trycpp.c
++++ b/src/trycpp.c
+@@ -1,6 +1,7 @@
+ /* Public domain. */
+-
+-int main()
++#include <stdio.h>
++#include <stdlib.h>
++int main(int argc, char *argv[])
+ {
+ #ifdef NeXT
+   printf("nextstep\n"); exit(0);
+diff --git a/src/tryflock.c b/src/tryflock.c
+index a82ffc2..5ca97d3 100644
+--- a/src/tryflock.c
++++ b/src/tryflock.c
+@@ -3,8 +3,8 @@
+ #include <sys/types.h>
+ #include <sys/file.h>
+ #include <fcntl.h>
+-
+-main()
++void
++main(int argc, char *argv[])
+ {
+   flock(0,LOCK_EX | LOCK_UN | LOCK_NB);
+ }
+diff --git a/src/trymkffo.c b/src/trymkffo.c
+index 9356342..f92414a 100644
+--- a/src/trymkffo.c
++++ b/src/trymkffo.c
+@@ -3,7 +3,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ 
+-void main()
++void main(int argc, char *argv[])
+ {
+   mkfifo("temp-trymkffo",0);
+ }
+diff --git a/src/trypoll.c b/src/trypoll.c
+index 6506617..cb888cc 100644
+--- a/src/trypoll.c
++++ b/src/trypoll.c
+@@ -3,8 +3,9 @@
+ #include <sys/types.h>
+ #include <fcntl.h>
+ #include <poll.h>
++#include <unistd.h>
+ 
+-int main()
++int main(int argc, char *argv[])
+ {
+   struct pollfd x;
+ 
+diff --git a/src/trysgact.c b/src/trysgact.c
+index e264ef2..25da013 100644
+--- a/src/trysgact.c
++++ b/src/trysgact.c
+@@ -1,8 +1,8 @@
+ /* Public domain. */
+ 
+ #include <signal.h>
+-
+-main()
++void
++main(int argc, char *argv[])
+ {
+   struct sigaction sa;
+   sa.sa_handler = 0;
+diff --git a/src/trysgprm.c b/src/trysgprm.c
+index a46c82c..5a9491c 100644
+--- a/src/trysgprm.c
++++ b/src/trysgprm.c
+@@ -1,8 +1,8 @@
+ /* Public domain. */
+ 
+ #include <signal.h>
+-
+-main()
++void
++main(int argc, char *argv[])
+ {
+   sigset_t ss;
+  
+diff --git a/src/tryshsgr.c b/src/tryshsgr.c
+index c5ed6d6..d111e40 100644
+--- a/src/tryshsgr.c
++++ b/src/tryshsgr.c
+@@ -1,6 +1,7 @@
+ /* Public domain. */
+ 
+-int main()
++#include <unistd.h>
++int main(int argc, char *argv[])
+ {
+   short x[4];
+  
+diff --git a/src/tryulong64.c b/src/tryulong64.c
+index 003548a..20a3a40 100644
+--- a/src/tryulong64.c
++++ b/src/tryulong64.c
+@@ -1,6 +1,6 @@
+ /* Public domain. */
+-
+-int main()
++#include <unistd.h>
++int main(int argc, char *argv[])
+ {
+   unsigned long u;
+   u = 1;
+diff --git a/src/trywaitp.c b/src/trywaitp.c
+index 319b81f..90bc5aa 100644
+--- a/src/trywaitp.c
++++ b/src/trywaitp.c
+@@ -2,8 +2,8 @@
+ 
+ #include <sys/types.h>
+ #include <sys/wait.h>
+-
+-main()
++void
++main(int argc, char *argv[])
+ {
+   waitpid(0,0,0);
+ }
+diff --git a/src/x86cpuid.c b/src/x86cpuid.c
+index f81c593..1cb1ea6 100644
+--- a/src/x86cpuid.c
++++ b/src/x86cpuid.c
+@@ -7,7 +7,7 @@ void nope()
+   exit(1);
+ }
+ 
+-int main()
++int main(int argc, char *argv[])
+ {
+   unsigned long x[4];
+   unsigned long y[4];
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/daemontools/daemontools/warnings.patch b/meta-oe/recipes-support/daemontools/daemontools/warnings.patch
new file mode 100644
index 0000000000..2fd18f6f1c
--- /dev/null
+++ b/meta-oe/recipes-support/daemontools/daemontools/warnings.patch
@@ -0,0 +1,74 @@
+Fixup misc warnings
+
+Patch by RiverRat
+
+http://bugs.gentoo.org/124487
+
+--- a/src/chkshsgr.c
++++ b/src/chkshsgr.c
+@@ -1,10 +1,13 @@
+ /* Public domain. */
+ 
++#include <sys/types.h>
++#include <stdlib.h>
++#include <grp.h>
+ #include <unistd.h>
+ 
+ int main()
+ {
+-  short x[4];
++  gid_t x[4];
+ 
+   x[0] = x[1] = 0;
+   if (getgroups(1,x) == 0) if (setgroups(1,x) == -1) _exit(1);
+--- a/src/matchtest.c
++++ b/src/matchtest.c
+@@ -1,3 +1,4 @@
++#include <unistd.h>
+ #include "match.h"
+ #include "buffer.h"
+ #include "str.h"
+--- a/src/multilog.c
++++ b/src/multilog.c
+@@ -1,3 +1,4 @@
++#include <stdio.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+--- a/src/prot.c
++++ b/src/prot.c
+@@ -1,5 +1,8 @@
+ /* Public domain. */
+ 
++#include <sys/types.h>
++#include <unistd.h>
++#include <grp.h>
+ #include "hasshsgr.h"
+ #include "prot.h"
+ 
+--- a/src/seek_set.c
++++ b/src/seek_set.c
+@@ -1,6 +1,7 @@
+ /* Public domain. */
+ 
+ #include <sys/types.h>
++#include <unistd.h>
+ #include "seek.h"
+ 
+ #define SET 0 /* sigh */
+--- a/src/supervise.c
++++ b/src/supervise.c
+@@ -1,3 +1,4 @@
++#include <stdio.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+--- a/src/pathexec_run.c
++++ b/src/pathexec_run.c
+@@ -1,5 +1,6 @@
+ /* Public domain. */
+ 
++#include <unistd.h>
+ #include "error.h"
+ #include "stralloc.h"
+ #include "str.h"
diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index ed73408cdb..a35b54e3bc 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -15,11 +15,15 @@ SECTION = "System/Servers"
 LIC_FILES_CHKSUM = "file://src/prot.c;beginline=1;endline=1;md5=96964cadf07e8f8c1e2ffb3b507dd647"
 LICENSE = "PD"
 
+DEPENDS += "coreutils"
+
 SRC_URI = "http://cr.yp.to/daemontools/${BPN}-${PV}.tar.gz \
     file://0001-error.h-include-errno.h-instead-of-extern-int.diff \
     file://0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff \
     file://cross-compile.patch \
     file://0001-daemontools-Fix-QA-Issue.patch \
+    file://warnings.patch \
+    file://0001-Fix-signature-of-main-function.patch \
 "
 
 SRC_URI[md5sum] = "1871af2453d6e464034968a0fbcb2bfc"
-- 
2.37.3


