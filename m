Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E50AC6FA86
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:34 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.11128.1662276869216649205
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fJrZVode;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 o2-20020a17090a9f8200b0020025a22208so2179197pjp.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=n54/nIAkfHD6HaWTbBmWO/sb16stbuZQSU1k75zSGT8=;
        b=fJrZVodedgjes59VSiI+beD7PoRF8GnqNGdNzjWg5bwlvGQ46BJYpeYG0UeEBML01e
         M1guGev7EmLMnAl2KzAmO1IpI2o3/LzzUftjGaf5faLSH8NboBTnVGI6SB4nQ8ZNz7Se
         8HEt1bpT3DYGvdB7uxSNu+jC3zmHKDkZ6bjA0gKIUZF2AVsiaGIc0A0YSOgBpYL8uNeZ
         Ie8vo1SsYUfrpXlzYrgwECpOeBIROLwU836AxdIFmoEE4Xvdjgyo0gqayzJS4g9q1emr
         2B3BHuf8yQqjo/mnzcg8H1Bk0fC8hDqTraL+0IuJBEJppU7DGYdm3ASfmBhq2Ny8C2mg
         D8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=n54/nIAkfHD6HaWTbBmWO/sb16stbuZQSU1k75zSGT8=;
        b=n1snrgfyy/VUEa7WKXC46RNPyqH9yQ4tqFqcOYi/iWZcNfYET5qsIc81q3z/mT0rVc
         EpuSJbHZ+PCr3GDzi+080VkKA2ycQXO5SzDk4CPRC784GPUPUEMXI1LPKQLLYTM7saWx
         GPnxoTMB6dwHsSXL7sjX/JFaeRUYfoJDPcW17aWyXoUynE0VP0KkfHwaSqajtdJ3mqvQ
         v0KKzGEhB8ObnpfscsTkR3age6nvQnTbzuXdEYICJTjknRlk4q15aa0IA0hccceJ/csY
         XQ7/52qbeFzwgTHNHONePtm+SBCwi82hDb18T6xuHenFBNoP5R7746EreFaQBnrn1vKo
         wg5Q==
X-Gm-Message-State: ACgBeo29C2wr6wct+TbAk534u+zOBnXi1z/DRt8sHMbmDln1CRx23TbX
	/W82gcXifk1xi1+xM2n05ahfqgRaoHeb+A==
X-Google-Smtp-Source: 
 AA6agR7y+rsgZLY7rPa+SONqGQpGmVm7I2A06mtfn9wWfSzORgosXFDpx9z+PipTgOzf87o0QfpZ+A==
X-Received: by 2002:a17:90b:4acb:b0:1fe:212:986 with SMTP id
 mh11-20020a17090b4acb00b001fe02120986mr13196095pjb.19.1662276870221;
        Sun, 04 Sep 2022 00:34:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/63] ckermit: Fix build with clang
Date: Sun,  4 Sep 2022 00:33:23 -0700
Message-Id: <20220904073417.3251865-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98603

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-function-prototype-errors.patch  | 106 ++++++++++++++++++
 .../recipes-support/ckermit/ckermit_302.bb    |   4 +-
 2 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/ckermit/ckermit/0001-Fix-function-prototype-errors.patch

diff --git a/meta-oe/recipes-support/ckermit/ckermit/0001-Fix-function-prototype-errors.patch b/meta-oe/recipes-support/ckermit/ckermit/0001-Fix-function-prototype-errors.patch
new file mode 100644
index 0000000000..306a2ee52a
--- /dev/null
+++ b/meta-oe/recipes-support/ckermit/ckermit/0001-Fix-function-prototype-errors.patch
@@ -0,0 +1,106 @@
+From f73eade85b7a1b93f7b9ef6ca9ead9d2441f8f84 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 19:01:38 -0700
+Subject: [PATCH] Fix function prototype errors
+
+Clang 15 is strict, therefore ensure that right headers are pulled in
+and also right function prototypes are used.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ckcmai.c | 4 ++++
+ ckucmd.c | 2 +-
+ ckucmd.h | 2 --
+ ckucon.c | 2 +-
+ ckufio.c | 2 +-
+ ckuusx.c | 2 +-
+ 6 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/ckcmai.c b/ckcmai.c
+index a5640e5..a4e322d 100644
+--- a/ckcmai.c
++++ b/ckcmai.c
+@@ -561,6 +561,10 @@ ACKNOWLEDGMENTS:
+ #include "ckntap.h"
+ #endif /* NT */
+ 
++#ifndef VMS
++#include <time.h> /* time() */
++#endif
++
+ #ifndef NOSERVER
+ /* Text message definitions.. each should be 256 chars long, or less. */
+ #ifdef MINIX
+diff --git a/ckucmd.c b/ckucmd.c
+index 274dc2d..730f20d 100644
+--- a/ckucmd.c
++++ b/ckucmd.c
+@@ -7356,7 +7356,7 @@ cmdgetc(timelimit) int timelimit; {	/* Get a character from the tty. */
+   Returns 0 or greater always.
+ */
+ int
+-cmdconchk() {
++cmdconchk(void) {
+     int x = 0, y;
+     y = pushc ? 1 : 0;			/* Have command character pushed? */
+ #ifdef OS2
+diff --git a/ckucmd.h b/ckucmd.h
+index 7cd4ced..5c43cc4 100644
+--- a/ckucmd.h
++++ b/ckucmd.h
+@@ -280,9 +280,7 @@ _PROTOTYP( int cmdsquo, (int) );
+ _PROTOTYP( int cmdgquo, (void) );
+ _PROTOTYP( char * ckcvtdate, (char *, int) );
+ _PROTOTYP( int cmdgetc, (int));
+-#ifndef NOARROWKEYS
+ _PROTOTYP( int cmdconchk, (void) );
+-#endif /* NOARROWKEYS */
+ 
+ #ifdef CK_RECALL
+ _PROTOTYP( char * cmgetcmd, (char *) );
+diff --git a/ckucon.c b/ckucon.c
+index 50ceb7e..954719e 100644
+--- a/ckucon.c
++++ b/ckucon.c
+@@ -39,8 +39,8 @@ _PROTOTYP( static VOID concld, (void) );
+ 
+ #ifdef NEXT
+ #undef NSIG
+-#include <sys/wait.h>			/* For wait() */
+ #endif /* NEXT */
++#include <sys/wait.h>			/* For wait() */
+ 
+ #include <signal.h>			/* Signals */
+ 
+diff --git a/ckufio.c b/ckufio.c
+index b5bfaae..2a8d4e5 100644
+--- a/ckufio.c
++++ b/ckufio.c
+@@ -142,8 +142,8 @@ _PROTOTYP( int parser, ( int ) );
+ 
+ #ifdef UNIX                             /* Pointer arg to wait() allowed */
+ #define CK_CHILD                        /* Assume this is safe in all UNIX */
++#include <sys/wait.h>			/* wait() API */
+ #endif /* UNIX */
+-
+ extern int binary, recursive, stathack;
+ #ifdef CK_CTRLZ
+ extern int eofmethod;
+diff --git a/ckuusx.c b/ckuusx.c
+index d332bed..253f992 100644
+--- a/ckuusx.c
++++ b/ckuusx.c
+@@ -9144,7 +9144,7 @@ char *s;        /* a string */
+ #ifndef CK_CURPOS
+ /* Dummies for when cursor control is not supported */
+ int
+-ck_curpos(row, col) {
++ck_curpos(int row, int col) {
+     return(-1);
+ }
+ 
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/ckermit/ckermit_302.bb b/meta-oe/recipes-support/ckermit/ckermit_302.bb
index abeeeccd1d..53f2b9d2c5 100644
--- a/meta-oe/recipes-support/ckermit/ckermit_302.bb
+++ b/meta-oe/recipes-support/ckermit/ckermit_302.bb
@@ -8,7 +8,9 @@ SECTION = "console/network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.TXT;md5=932ca542d6c6cb8a59a0bcd76ab67cc3"
 
-SRC_URI = "http://www.kermitproject.org/ftp/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV}"
+SRC_URI = "http://www.kermitproject.org/ftp/kermit/archives/cku${PV}.tar.gz;subdir=${BPN}-${PV} \
+           file://0001-Fix-function-prototype-errors.patch \
+           "
 SRC_URI[md5sum] = "eac4dbf18b45775e4cdee5a7c74762b0"
 SRC_URI[sha256sum] = "0d5f2cd12bdab9401b4c836854ebbf241675051875557783c332a6a40dac0711"
 
-- 
2.37.3


