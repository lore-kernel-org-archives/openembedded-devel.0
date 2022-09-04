Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F606C6FA8E
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:54 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.11129.1662276888502627586
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QOT36BGN;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id r69so5608173pgr.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=VwgFNljJ21q95+Ui2IlrxyAHx75tI9uwY3KNbssHVzo=;
        b=QOT36BGN4pDESoEamAuPRrVYcVLWYN6tDldNCsKvW/uBAi/tMM8Eb9z76ZjPqGnWYJ
         56QcPEZTNh/MceWWWPNBulqALMV6g3eQIM4M7ditulyl99Uh23+9kr5X4RtO9+NXERCa
         IUlIjvqX3JS/baSxHctU9+tO8+T9Orf7JVYaq2FsBXo/NzllIOLHK8sEyfo0l7SuV8cB
         Fb1xfbMDMbgk/5bqyHWOLdUO8SzSTVh86mHMpFv847YGwtLIGdnYl4qv7JUKkSX9LzdW
         2strEZB/oZdLHJs9d54u6AfTF6oVI18PoiueZr0ZFGE/ux56D9/21f02jv4ygVdMpVIH
         0JIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VwgFNljJ21q95+Ui2IlrxyAHx75tI9uwY3KNbssHVzo=;
        b=WYwdXw66k3LetSQm5c/sRNLES7guxf7e8XxXfSBB0JYFk5ebPvAfXvUcvIKeSs4XQU
         R7+CPFYlWiIJiMC7aVoX+cMSuBuMGVDEZ5I78FLkAbc2eryMyGBxESxo3Ft960qFPD9Q
         lqwd7+ue6rOz2Vr9J4RU9o9HWTP6u9Y5i+WqpuMsV6nHp5WbMRUQUnw7qfwo1UA7ec0W
         4yjF5/MBVJa5laUUTTskh1NyWPaGDP+hWNUfntJkdWnzhNzL66ysWtFV3rIyl4qrShFL
         M/qxm/f2ffgiDohLSJ0t3I1Ui6TejnmtrVYopb6ABRnFWY1w8rBPuFAs2yv8YDqobp2K
         XnwQ==
X-Gm-Message-State: ACgBeo3VgFmU+dxR9aAXy61NvsCAQK1NTmKcEPr1uBOYt2yjDYGlhM7P
	X3pA32XuaABTwinoiIJTiiyeuoyrYygHZg==
X-Google-Smtp-Source: 
 AA6agR5+jrvB9rP/8MV2Bouym5/v9vHAORNdtYBwS+S1CuNz606m4eEEdbdNg/6EUQTW7psbtlVqfw==
X-Received: by 2002:a65:6b95:0:b0:420:2cb1:68e5 with SMTP id
 d21-20020a656b95000000b004202cb168e5mr36896895pgw.220.1662276887596;
        Sun, 04 Sep 2022 00:34:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 26/63] tokyocabinet: Fix AC_CHECK_LIB test functions
Date: Sun,  4 Sep 2022 00:33:40 -0700
Message-Id: <20220904073417.3251865-26-raj.khem@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98620

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...heck-functions-for-AC_CHECK_LIB-test.patch | 58 +++++++++++++++++++
 .../tokyocabinet/tokyocabinet_1.4.48.bb       |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-support/tokyocabinet/tokyocabinet/0001-configure-Fix-check-functions-for-AC_CHECK_LIB-test.patch

diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet/0001-configure-Fix-check-functions-for-AC_CHECK_LIB-test.patch b/meta-oe/recipes-support/tokyocabinet/tokyocabinet/0001-configure-Fix-check-functions-for-AC_CHECK_LIB-test.patch
new file mode 100644
index 0000000000..001fa9dd75
--- /dev/null
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet/0001-configure-Fix-check-functions-for-AC_CHECK_LIB-test.patch
@@ -0,0 +1,58 @@
+From e192da006dd9b0ecbbef540a3e86b65ff88e89e2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 13:28:29 -0700
+Subject: [PATCH] configure: Fix check functions for AC_CHECK_LIB test
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.in | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 5b24947..0542490 100644
+--- a/configure.in
++++ b/configure.in
+@@ -247,30 +247,30 @@ test -n "$LDFLAGS" && MYLDFLAGS="$LDFLAGS $MYLDFLAGS"
+ AC_C_BIGENDIAN(MYCPPFLAGS="$MYCPPFLAGS -D_MYBIGEND")
+ 
+ # Underlying libraries
+-AC_CHECK_LIB(c, main)
+-AC_CHECK_LIB(m, main)
++AC_CHECK_LIB(c, printf)
++AC_CHECK_LIB(m, pow)
+ if test "$enable_pthread" != "no"
+ then
+-  AC_CHECK_LIB(pthread, main)
+-  AC_CHECK_LIB(rt, main)
++  AC_CHECK_LIB(pthread, pthread_create)
++  AC_CHECK_LIB(rt, clock_gettime)
+ fi
+ if test "$enable_zlib" != "no"
+ then
+-  AC_CHECK_LIB(z, main)
++  AC_CHECK_LIB(z, inflate)
+ fi
+ if test "$enable_bzip" != "no"
+ then
+-  AC_CHECK_LIB(bz2, main)
++  AC_CHECK_LIB(bz2, BZ2_bzCompressInit)
+ fi
+ if test "$enable_exlzma" = "yes"
+ then
+-  AC_CHECK_LIB(lzma, main)
++  AC_CHECK_LIB(lzma, lzma_easy_buffer_encode)
+ fi
+ if test "$enable_exlzo" = "yes"
+ then
+-  AC_CHECK_LIB(lzo2, main)
++  AC_CHECK_LIB(lzo2, lzo1x_1_compress)
+ fi
+-AC_CHECK_LIB(tokyocabinet, main, AC_MSG_WARN([old version of Tokyo Cabinet was detected]))
++AC_CHECK_LIB(tokyocabinet, tcbdbopen, AC_MSG_WARN([old version of Tokyo Cabinet was detected]))
+ 
+ # Necessary headers
+ AC_CHECK_HEADER(stdlib.h, true, AC_MSG_ERROR([stdlib.h is required]))
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
index 22cbcc0f2f..ae00ff4e55 100644
--- a/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
+++ b/meta-oe/recipes-support/tokyocabinet/tokyocabinet_1.4.48.bb
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "http://fallabs.com/tokyocabinet/${BP}.tar.gz \
            file://remove-hard-coded-include-and-lib-paths.patch \
+           file://0001-configure-Fix-check-functions-for-AC_CHECK_LIB-test.patch \
 "
 
 SRC_URI[md5sum] = "fd03df6965f8f56dd5b8518ca43b4f5e"
-- 
2.37.3


