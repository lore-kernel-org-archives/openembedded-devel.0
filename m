Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399D7C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 22:32:37 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.4199.1644964356016565170
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 14:32:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pa7lPGEz;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id d16so302763pgd.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 14:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9debbGZzt1alQQAZu47TX7skZQLtPVpulzYgrfKCjQ=;
        b=Pa7lPGEzoy5dsOPfqOz8qsZHz7lyRyb6wWS6A8muVryQmio1FYwtyMsiKZQMrvDw2x
         LBtvocBPrs1Vd9G1LYLjMGNkaZdzAiKhJY7OfPgX+/GSoAtf5kG7GF58YP2MMf3pzqyv
         0vPXG/n+aZKggIiNSzoCqPIEHBwHM0utDzzKmLT8M/r1ryBG2ye7EhBEF7UF5Ey+cCpy
         jzdXq3GPwP6sYgHcaVfjpdvmDWTpp9/m8wgf4w1GyDh3cbCZT0A9tUtgjcqyR6EyrB8T
         +SqsFZ9b76jWMbiS17aHiGQX0FJ6x9Ewqr37mcCc0r7iXdCQyXDhcb6wM9kfBClOBOuj
         y6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9debbGZzt1alQQAZu47TX7skZQLtPVpulzYgrfKCjQ=;
        b=zvvRfEscUzH8IkCzmEYNorPVQoF8c+Wuj2khJFdHtY2KBwNQxPv3J7iWvLtlcv7+Jq
         szlbKApbEXG0kqMkCEfD82ARE7CIoHiYjEaxPbfQP7S0H8XzWEbVZwIIwxKMaaJPMZLV
         uOO+DwMGHBmFjwuGhynmWhKPd3qtL5064ujnITEEWR2KGZA76nEKAKI5La2TuiWTkgFv
         1BZ6UVEiYO9WfegjQDvC3Y/mdAjPP8mBLTgwS2VC+qq28YX7BZSNmK8nDOnnOkbwrexh
         BO6M134WM3qgZj7/rpvwfmtHwlvrGv7cLrnupH2KkLmhUEKLdN7NZgONAS6EaFBCSDlo
         cT9g==
X-Gm-Message-State: AOAM531pgX83z5gpbrxjpACX0Wsz1ApqRR0/rUJa3J2kIt+qzZ08vQvq
	QWuMqwEDPFr+103JUBmPGEHLvK1zxnp1fg==
X-Google-Smtp-Source: 
 ABdhPJz4QEDHp3ORBFCirngak3p8Fw2BWR6EZrOm6M1zpTuAGexWhtxaNzJi+vbBIQPk2ehDh5gSrA==
X-Received: by 2002:a63:cf05:: with SMTP id j5mr877816pgg.544.1644964354899;
        Tue, 15 Feb 2022 14:32:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 c11sm41764351pfv.76.2022.02.15.14.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 14:32:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] ntopng: Avoid linking libm statically
Date: Tue, 15 Feb 2022 14:32:31 -0800
Message-Id: <20220215223231.3960960-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Feb 2022 22:32:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95320

This fixes build on x86

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Allow-dynamic-linking-against-ndpi-3.patch | 39 +++++++++++++++++++
 .../recipes-support/ntopng/ntopng_5.2.1.bb    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch

diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch
new file mode 100644
index 0000000000..c645110f22
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch
@@ -0,0 +1,39 @@
+From a913b85f720f41bf7e5819c0dc4acc252467a8a4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Feb 2022 14:25:07 -0800
+Subject: [PATCH] configure.ac.in: Allow dynamic linking against ndpi 3.0
+
+Linking statically is problematic since NDPI_LIBS is '-lndpi -lm'
+and when we use -Bstatic it also brings in -lm to use libm.a and on some
+architectures ( x86 ) which this does not work and results in missing symbols
+
+Fixes
+ipe-sysroot/usr/lib/libm.a(e_logf.o): in function `logf_ifunc_selector':
+/usr/src/debug/glibc/2.35-r0/git/math/../sysdeps/i386/i686/multiarch/ifunc-sse2.h:30: undefined reference to `_dl_x86_cpu_features'
+
+Upstream-Status: Submitted [https://github.com/ntop/ntopng/pull/6318]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac.in | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac.in b/configure.ac.in
+index 7f4c0f893..c3299fda2 100644
+--- a/configure.ac.in
++++ b/configure.ac.in
+@@ -193,10 +193,8 @@ if test -d /usr/local/include/ndpi ; then :
+ fi
+ 
+ PKG_CHECK_MODULES([NDPI], [libndpi >= 2.0], [
+-   NDPI_INC=`echo $NDPI_CFLAGS | sed -e "s/[ ]*$//"`
+-   # Use static libndpi library as building against the dynamic library fails
+-   NDPI_LIB="-Wl,-Bstatic $NDPI_LIBS -Wl,-Bdynamic"
+-   #NDPI_LIB="$NDPI_LIBS"
++   NDPI_INC="$NDPI_CFLAGS"
++   NDPI_LIB="$NDPI_LIBS"
+    NDPI_LIB_DEP=
+    ], [
+       AC_MSG_CHECKING(for nDPI source)
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
index 63046e730e..1c74845cc9 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/ntop/ntopng.git;protocol=https;branch=5.2-stable \
            file://0001-Makefile.in-don-t-use-the-internal-lua.patch \
            file://0001-autogen.sh-generate-configure.ac-only.patch \
            file://0001-configure.ac.in-not-check-clang-on-host.patch \
+           file://0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch \
            file://ntopng.service \
            "
 
-- 
2.35.1


