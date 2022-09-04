Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92441C6FA83
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:04 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.11276.1662276866108656816
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e7AXzWim;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 s14-20020a17090a6e4e00b0020057c70943so175541pjm.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Dd4JZVdlt0AdlLYeHTo/mWE23y4AgAG1Mb9QP35yu+M=;
        b=e7AXzWimM93O+mvwjqB+TaWCOcLfhIg2XApayGNt59cRdZ617UPryQKl4a26xTcI4E
         RdDU3QaKqE/AdsONCh+pUE7Uv6jZuM2HPtWfPFXRX4PUj3JIYQ1IlM60EHr1IDOatd/b
         QBsktHA9zttH3E+0rzlPEsORqhDFu5DLo1+LtCekwRXPhlElN3BwwyG5Clz0Nnhcsfrv
         Yz37BVicjLq8agjKcDP8HtR8zsyofIRH75rkE+Ig1D2dSNfrkcT1zPRdp6SxgU8xqaSG
         mtveLqtYOryfD6MDZQC0Kw0az8LVco5NtIpRynVp6OehvzyRwVM99ZyEDII0vGqE5M3Z
         4Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Dd4JZVdlt0AdlLYeHTo/mWE23y4AgAG1Mb9QP35yu+M=;
        b=yqVIBCy/HlQIymz8QXnJ0IImkzHrljVCG08uIo1qA76TV7lKLr8qDhwxS4tzuSb9sX
         etF5k1le7CWmZVa1LBfCUP2fLKFacSk9ackAumhugrp6lAzkzrAmxlFB71G9oJfK6Mkg
         r/OKpn9iEC7Le6W0uspmjitK68iy7YTmg4nhg6IOQGG8fssvt1b+rCbXEVlyKRQVRXU7
         CijaH10iFeILEiF6KBtjbIZs3cPvpAe+3yQvR2fdWC0BPbfXORxMj2/9LchPp/dTPZpp
         Xbxr++kPxtkLKic6jRIJE8HeBSm8II08fqk+JpIeao5Mgc76HYRXu+5/BmT4cXOFLKnw
         nKJg==
X-Gm-Message-State: ACgBeo3tGW3MmRYpUuVS9vji2pSoS+TxeD+FDXb+i7uk351kqCrRV+Cq
	dkjXfZ7wbch0uoXP/n9f7ZSBt+ZAAMV4OA==
X-Google-Smtp-Source: 
 AA6agR4hNxwE71nePLUSL2YTkk4pG0A8cTrJAqeKq/MSjOXapb6wFnkRs88n7YCmjsej+ODZfGhMnw==
X-Received: by 2002:a17:90a:9401:b0:1fa:af9c:20db with SMTP id
 r1-20020a17090a940100b001faaf9c20dbmr13641288pjo.190.1662276893702;
        Sun, 04 Sep 2022 00:34:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 32/63] uw-imap: Fix build with clang/musl
Date: Sun,  4 Sep 2022 00:33:46 -0700
Message-Id: <20220904073417.3251865-32-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98626

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Define-prototype-for-safe_flock.patch | 105 ++++++++++++++++++
 .../recipes-devtools/uw-imap/uw-imap_2007f.bb |   3 +-
 2 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Define-prototype-for-safe_flock.patch

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Define-prototype-for-safe_flock.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Define-prototype-for-safe_flock.patch
new file mode 100644
index 0000000000..11f1c18d4d
--- /dev/null
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/0001-Define-prototype-for-safe_flock.patch
@@ -0,0 +1,105 @@
+From c512c877a7ca933bee980dcc1268a7319f233d59 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 00:07:47 -0700
+Subject: [PATCH] Define prototype for safe_flock
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/osdep/unix/env_unix.c | 3 +++
+ src/osdep/unix/mbx.c      | 2 ++
+ src/osdep/unix/os_lnx.h   | 2 ++
+ src/osdep/unix/os_slx.h   | 3 +++
+ src/osdep/unix/unix.c     | 4 ++++
+ 5 files changed, 14 insertions(+)
+
+diff --git a/src/osdep/unix/env_unix.c b/src/osdep/unix/env_unix.c
+index 6b2c447..cefefca 100644
+--- a/src/osdep/unix/env_unix.c
++++ b/src/osdep/unix/env_unix.c
+@@ -59,6 +59,9 @@
+ #define S_IXOTH (S_IEXEC >> 6)
+ #endif
+ 
++
++extern int safe_flock (int fd,int op);
++
+ /* c-client environment parameters */
+ 
+ static char *myUserName = NIL;	/* user name */
+diff --git a/src/osdep/unix/mbx.c b/src/osdep/unix/mbx.c
+index 1ece5d8..c8a45a5 100644
+--- a/src/osdep/unix/mbx.c
++++ b/src/osdep/unix/mbx.c
+@@ -41,12 +41,14 @@ extern int errno;		/* just in case */
+ #include "mail.h"
+ #include "osdep.h"
+ #include <pwd.h>
++#include <utime.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
+ #include "misc.h"
+ #include "dummy.h"
+ #include "fdstring.h"
+ 
++extern int safe_flock (int fd,int op);
+ 
+ /* Build parameters */
+ 
+diff --git a/src/osdep/unix/os_lnx.h b/src/osdep/unix/os_lnx.h
+index b5f39ff..22c216b 100644
+--- a/src/osdep/unix/os_lnx.h
++++ b/src/osdep/unix/os_lnx.h
+@@ -57,6 +57,8 @@
+ 
+ #define direct dirent
+ 
++extern int safe_flock (int fd,int op);
++
+ #define flock safe_flock
+ 
+ 
+diff --git a/src/osdep/unix/os_slx.h b/src/osdep/unix/os_slx.h
+index b5f39ff..c9adbcd 100644
+--- a/src/osdep/unix/os_slx.h
++++ b/src/osdep/unix/os_slx.h
+@@ -46,11 +46,14 @@
+ #include <sys/types.h>
+ #include <dirent.h>
+ #include <time.h>		/* for struct tm */
++#include <utime.h>		/* for struct tm */
+ #include <fcntl.h>
+ #include <syslog.h>
+ #include <sys/file.h>
+ 
+ 
++extern int safe_flock (int fd,int op);
++
+ /* Linux gets this wrong */
+ 
+ #define setpgrp setpgid
+diff --git a/src/osdep/unix/unix.c b/src/osdep/unix/unix.c
+index be3c437..86be3f9 100644
+--- a/src/osdep/unix/unix.c
++++ b/src/osdep/unix/unix.c
+@@ -45,6 +45,7 @@ extern int errno;		/* just in case */
+ #include "mail.h"
+ #include "osdep.h"
+ #include <time.h>
++#include <utime.h>
+ #include <sys/stat.h>
+ #include "unix.h"
+ #include "pseudo.h"
+@@ -52,6 +53,9 @@ extern int errno;		/* just in case */
+ #include "misc.h"
+ #include "dummy.h"
+ 
++
++extern int safe_flock (int fd,int op);
++
+ /* UNIX I/O stream local data */
+ 
+ typedef struct unix_local {
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index df90b629a9..3f2c9a2237 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://imap-2007e-shared.patch \
            file://imap-2007f-format-security.patch \
            file://0001-Support-OpenSSL-1.1.patch \
+           file://0001-Define-prototype-for-safe_flock.patch \
            "
 
 SRC_URI[md5sum] = "2126fd125ea26b73b20f01fcd5940369"
@@ -25,7 +26,7 @@ CVE_CHECK_IGNORE += "\
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] = ",,libpam"
 
-EXTRA_OEMAKE = "CC='${CC}' ARRC='${AR} -rc' RANLIB='${RANLIB}'"
+EXTRA_OEMAKE = "CC='${CC} -std=c99 -D_GNU_SOURCE' ARRC='${AR} -rc' RANLIB='${RANLIB}'"
 
 HEADERS = "src/c-client/*.h src/osdep/unix/*.h c-client/auths.c c-client/linkage.c c-client/linkage.h c-client/osdep.h"
 
-- 
2.37.3


