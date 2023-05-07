Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC19C7EE31
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:23 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.69127.1683477191715428731
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TSEFBtBf;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55a214572e8so56929867b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477195; x=1686069195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McKbKw1AdSdOCKvYkfkQXM6UFRuiprHaax+4av6j2Ys=;
        b=TSEFBtBfQznuMgm4ABzeCJLKEq50sYURbIrEdcnQH0pMDxa+6f6wcFiN/BEoIxiLry
         jKYec7A7V9lPUbWG6NH+ntM5AxwEmOLCDTV3H2nFazPqyYYzB0kETdWcSWMeo4+5Bi6c
         g9JeN1pGVNFU97j7X/+Y8A2zqubtgxhhhez/PGLeJDvDE6u+zgbJZFctRPBddgA9+bTo
         9o39iTmPuuHPMtnHCgUQ2JF0qlP+z/vLF/+evsCbUSOs7bZUDLeFGDML+XBaD5xb/ORB
         BL5Qti0wtKqNddQ8LQmz+OnW0CRQzAA/BNZXDz/AhTrDbMrw3KopULXzOeclJcW3VUuJ
         tJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477195; x=1686069195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McKbKw1AdSdOCKvYkfkQXM6UFRuiprHaax+4av6j2Ys=;
        b=USd6trj2EVcTvMbx8bpsoJPerRyMnUyJqSYPI/vaoPrQp/uf+JTFdCsYQD/3xEWDoa
         TiKFKTrOMNp2cvo+tpTbgDHs1Lt+gOvKH+DZ3OZwgW8TcKCcoUZqck1bX24WOD6Z70g0
         JxWWQPRIsY5piwOsChMvPK+kVWzTYktF1RcNzGgzNg8eFdeF24RwyyCZzF6KyRW+il1i
         7OfIfja8jkk7PqX06iIYWFS8T7QG6rvo0Oxz9yBC8omJ3Yz/IJEgB40Dn91752NFUUYV
         tPKXpvgmPPa1SVxkohK+NH490TlopCiJPg5i5Hf3ukD10Bjluj6anvPTWXyxGr0jzoho
         NFwQ==
X-Gm-Message-State: AC+VfDx1WJiwBc35o+1fBOTYrTwoHdY7kbc4OLNv5eplqSL3cQWGYODh
	Z0z7trFY4KZHHE1MT7EYiwoSLb5XtRI=
X-Google-Smtp-Source: ACHHUZ4H0+6xbZeacbqfS6GywibnLBKkUNeHS8xuRkuYFo0S5T50eE58bKJ/aNA29JarPmWecA52sg==
X-Received: by 2002:a81:6007:0:b0:55a:9303:1fb4 with SMTP id u7-20020a816007000000b0055a93031fb4mr8294650ywb.32.1683477194966;
        Sun, 07 May 2023 09:33:14 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 09/29] libcereal: Fix TMPDIR leaking into debug_str section
Date: Sun,  7 May 2023 12:32:45 -0400
Message-Id: <20230507163305.3261044-9-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102339

From: Khem Raj <raj.khem@gmail.com>

Fixes errors like
File /usr/lib/libcereal/ptest/tests/.debug/test_unordered_map in package libcereal-dbg contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8eb74815c2e6ddebd7f28ff703b4b91f90b468d3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...001-doctest-Do-not-use-unnamed-class.patch | 38 +++++++++++++++++++
 .../libcereal/libcereal_1.3.2.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcereal/files/0001-doctest-Do-not-use-unnamed-class.patch

diff --git a/meta-oe/recipes-support/libcereal/files/0001-doctest-Do-not-use-unnamed-class.patch b/meta-oe/recipes-support/libcereal/files/0001-doctest-Do-not-use-unnamed-class.patch
new file mode 100644
index 0000000000..9396cc5d01
--- /dev/null
+++ b/meta-oe/recipes-support/libcereal/files/0001-doctest-Do-not-use-unnamed-class.patch
@@ -0,0 +1,38 @@
+From 03bbb1b055c41ec652470f775b55a7cf80d664ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Apr 2023 16:46:12 -0700
+Subject: [PATCH] doctest: Do not use unnamed class
+
+When compiling with clang this results in emitting absolute path into
+debug info, especially .debug_str section has
+
+~(unnamed class at /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libcereal/1.3.2+gitAUTOINC+ebef1e9298-r0/git/unittests/doctest.h:6428:5)
+(unnamed class at /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libcereal/1.3.2+gitAUTOINC+ebef1e9298-r0/git/unittests/doctest.h:6428:5)
+
+Therefore use a name for the class instead and help get rid of this
+absolute path in debug info. This fixes
+
+File /usr/lib/libcereal/ptest/tests/.debug/test_unordered_map in package libcereal-dbg contains reference to TMPDIR
+
+Upstream-Status: Submitted [https://github.com/USCiLab/cereal/pull/788]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unittests/doctest.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unittests/doctest.h b/unittests/doctest.h
+index cd5b44d6..e6d8f7f9 100644
+--- a/unittests/doctest.h
++++ b/unittests/doctest.h
+@@ -6424,7 +6424,7 @@ void Context::setCout(std::ostream* out) { p->cout = out; }
+ static class DiscardOStream : public std::ostream
+ {
+ private:
+-    class : public std::streambuf
++    class discardBufStream: public std::streambuf
+     {
+     private:
+         // allowing some buffering decreases the amount of calls to overflow
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index f15927554b..c5f26ecb4e 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -21,6 +21,7 @@ SRCREV = "ebef1e929807629befafbb2918ea1a08c7194554"
 SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https \
            file://0001-sandbox-Do-not-use-int8_t-in-std-uniform_int_distrib.patch \
            file://0001-cmake-Use-idirafter-instead-of-isystem.patch \
+           file://0001-doctest-Do-not-use-unnamed-class.patch \
            file://run-ptest \
 "
 
-- 
2.25.1


