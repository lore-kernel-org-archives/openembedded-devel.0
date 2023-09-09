Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5026FEC8756
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 16:54:10 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.20354.1694278442804404729
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Sep 2023 09:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gP6qiMwv;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d7260fae148so2795430276.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 09:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694278442; x=1694883242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFqx5e4xCkj9wvuCIVZ6jAvDohzBjGHt2mYpubCFv4k=;
        b=gP6qiMwvoU2KO/3rNfka87xxxD86XNA0FswDyens9j7s+2KRiATOHnq9QpSXp/GvUZ
         Tluv+MYz96bOpwlTZUXDoNoUPDE3sCNqHoiIMx/uhA9S+We+rM4D0Q0b8TOrz6vPciUt
         CVpn50vw+Z4XrvkDfKw4sS7FYW5deEoL0phW1rWRcCc344jw2rVx4VZR0NqOCgBR14nk
         h2i/G80LUJXjsxh5FRpM5v2fUN4XZ+9RaJplQ7V5bhV7u9PTP/iv468/07YBagciKSKp
         7EyIjt1cwYZpc4GCWrMPHGOvTzeywiR9vCus96e0HHS1PEnYGjqV3gm2kS34U6Db14kr
         FssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694278442; x=1694883242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xFqx5e4xCkj9wvuCIVZ6jAvDohzBjGHt2mYpubCFv4k=;
        b=qTfEohKMAkKObDHmPax7PovGxlGkGuCQEfXClWa7yzWjF4G5vNe7TGZoc0ty55VwQq
         tRtOSGJdXpo3kxrufN8W5IAbCYRT4IEmlLpRNjO2SetArkuMdlmRRlWs7QumvCaOmaxG
         u6LWh9NtoSdm1VGDgR1UxWOlxaNpmz2q4PpMr3BCcAbuAnQAbjBO+dccwsAweaZjVmOa
         fN/Sqy2/NDkTHs126/PECfn9iX1jLqfcowyu7Md1H23kKWmoeuI1Es4GCIVl9nzvvgUC
         V2PYt+fQFrEYytqo8j3h+EXk+5geIudGnkjsufvKIxc3VLJh/Rul3zYCJHOrEpQ2ZX/6
         BnSA==
X-Gm-Message-State: AOJu0YyuJ8SyT0tcRAV5+xL+XVil8ZHqt/5QQ0RbS7rRI58v8FoVrjZA
	y2GZ6tD0p448/wcN5ZRm4i37GBgu0L0=
X-Google-Smtp-Source: AGHT+IGtaxCjlfhEQ8/kB/nsG1MbhECpsW2pL5yVwg5ixunNHHdFMUTVQKCjGho0jxqE1KJqSaAZlQ==
X-Received: by 2002:a05:6902:4d4:b0:d0e:9914:f5e1 with SMTP id v20-20020a05690204d400b00d0e9914f5e1mr5036908ybs.15.1694278441472;
        Sat, 09 Sep 2023 09:54:01 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2fc7:531e:3376:5faf])
        by smtp.gmail.com with ESMTPSA id z21-20020a25ad95000000b00d071631665fsm872110ybi.59.2023.09.09.09.54.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 09:54:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] postgresql: refresh patches
Date: Sat,  9 Sep 2023 12:54:00 -0400
Message-Id: <20230909165400.1189310-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 16:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104816

fixes:

WARNING: postgresql-12.16-r0 do_patch: Fuzz detected:

Applying patch 0001-Add-support-for-RISC-V.patch
patching file src/include/storage/s_lock.h
Hunk #2 succeeded at 339 with fuzz 1.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/0001-Add-support-for-RISC-V.patch         | 13 +++++--------
 .../files/0001-Improve-reproducibility.patch        | 13 +++++--------
 .../postgresql/files/not-check-libperl.patch        | 13 +++++--------
 3 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
index a1f5b2a7b4..e5fb85170b 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
@@ -9,10 +9,10 @@ extending the existing aarch64 macro works.
  src/include/storage/s_lock.h | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
-diff --git a/src/include/storage/s_lock.h b/src/include/storage/s_lock.h
-index 3fe29ce..7cd578f 100644
---- a/src/include/storage/s_lock.h
-+++ b/src/include/storage/s_lock.h
+Index: postgresql-12.16/src/include/storage/s_lock.h
+===================================================================
+--- postgresql-12.16.orig/src/include/storage/s_lock.h
++++ postgresql-12.16/src/include/storage/s_lock.h
 @@ -317,11 +317,12 @@ tas(volatile slock_t *lock)
  
  /*
@@ -35,7 +35,4 @@ index 3fe29ce..7cd578f 100644
 +#endif	 /* __arm__ || __arm || __aarch64__ || __aarch64 || __riscv */
  
  
- /*
--- 
-2.9.3
-
+ /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
index 32b7f42845..70c813adf5 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
@@ -19,11 +19,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  src/common/Makefile | 4 ----
  1 file changed, 4 deletions(-)
 
-diff --git a/src/common/Makefile b/src/common/Makefile
-index 1fc2c66..5e6c457 100644
---- a/src/common/Makefile
-+++ b/src/common/Makefile
-@@ -27,10 +27,6 @@ include $(top_builddir)/src/Makefile.global
+Index: postgresql-12.16/src/common/Makefile
+===================================================================
+--- postgresql-12.16.orig/src/common/Makefile
++++ postgresql-12.16/src/common/Makefile
+@@ -31,10 +31,6 @@ include $(top_builddir)/src/Makefile.glo
  # don't include subdirectory-path-dependent -I and -L switches
  STD_CPPFLAGS := $(filter-out -I$(top_srcdir)/src/include -I$(top_builddir)/src/include,$(CPPFLAGS))
  STD_LDFLAGS := $(filter-out -L$(top_builddir)/src/common -L$(top_builddir)/src/port,$(LDFLAGS))
@@ -34,6 +34,3 @@ index 1fc2c66..5e6c457 100644
  override CPPFLAGS += -DVAL_CFLAGS_SL="\"$(CFLAGS_SL)\""
  override CPPFLAGS += -DVAL_LDFLAGS="\"$(STD_LDFLAGS)\""
  override CPPFLAGS += -DVAL_LDFLAGS_EX="\"$(LDFLAGS_EX)\""
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
index 22b62d9ded..eb6226b179 100644
--- a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
@@ -19,11 +19,11 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.in b/configure.in
-index b98b9bb..8584677 100644
---- a/configure.in
-+++ b/configure.in
-@@ -2211,7 +2211,7 @@ Use --without-tcl to disable building PL/Tcl.])
+Index: postgresql-12.16/configure.in
+===================================================================
+--- postgresql-12.16.orig/configure.in
++++ postgresql-12.16/configure.in
+@@ -2357,7 +2357,7 @@ Use --without-tcl to disable building PL
  fi
  
  # check for <perl.h>
@@ -32,6 +32,3 @@ index b98b9bb..8584677 100644
    ac_save_CPPFLAGS=$CPPFLAGS
    CPPFLAGS="$CPPFLAGS $perl_includespec"
    AC_CHECK_HEADER(perl.h, [], [AC_MSG_ERROR([header file <perl.h> is required for Perl])],
--- 
-2.7.4
-
-- 
2.34.1


