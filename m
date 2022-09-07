Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5CBC54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:15 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.2741.1662594073296777695
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OjbNyj6o;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d82so2529713pfd.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=fffQkmT+JIz88MToxEwpthEI1vrjSDbcsMdSwxUNQA0=;
        b=OjbNyj6o+lkvDzqAGLV4xESSazQ85+S8+4OxBhjMoXLU7bax0fD2ugn4cINdRxx2Fs
         GlQRODoRMolethJdPoz0q40wtz7wwVFOG3CKOUBAcupghzMuiWALD4iMv82Bv318ds84
         jZHtx7y5Ixh88bWHDXwSo5VbSEEMJM0NEutrAA+Zadp0JwWiVFh06XaVLGO4umXn/+9E
         JQHXQWOm7FSWfxOo+qwdJ3IAHy1DD7gjWJr0NWczTo7AThc8CBT1zhV/txLU4oD/2jjB
         YesayrYTgXqCozKulu3YkNd3J/SyrJ6B/f6E3VOxRUPqZPxdje4b1eGEZqaXpgtC8yDk
         /upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fffQkmT+JIz88MToxEwpthEI1vrjSDbcsMdSwxUNQA0=;
        b=HYdIjIeUtGwM3RPhmCbobENBemlpB5caJtYfc982FYOpcztkYC6eQomPmJo6T6zeCY
         oSzRphhnZga0bm69Ap6EwM0L3f9HKp96oQ9GrjDcoEM+lRInTBesEmhFA/rwDMGimd6M
         pwk9gQeJhTywMhsC7kBSTb9YUUtUDjJQlQdD++MJyYxBervjxO1NJ+PHFtwQpHwEkbGh
         PBlhq1zQbI4RYJP7bxe/CcRv8zpBLzAbqsPELTO8IZcaFCfOQQwYqY2yKaL68AHy8XE0
         C9r1uJ/ANtN6cqirzvCuZSX8blF1/XKgHKpibCIyoYfqD0RXPwzTJqlPoAYnQTqiJGrZ
         ZPKA==
X-Gm-Message-State: ACgBeo1VNAQs5fE4MlNLgoqCaATDI3wAzHXolU9e+MaE2Q13RG4fCa60
	b+/FzkBChSqo4itP03tWXVZsIkQSxOF4gQ==
X-Google-Smtp-Source: 
 AA6agR5ZmIuERAmgfUcfi51bq7tpJK/LTS8ZP8xeH+z+K+MGjgYKkM7kntIgROc8V/Xr/UoOeg7f0A==
X-Received: by 2002:a62:30c7:0:b0:52f:9a31:5935 with SMTP id
 w190-20020a6230c7000000b0052f9a315935mr6236362pfw.14.1662594072550;
        Wed, 07 Sep 2022 16:41:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 10/22] ntp: Fix check for pthread_detach
Date: Wed,  7 Sep 2022 16:40:50 -0700
Message-Id: <20220907234102.3312797-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98700

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ix-types-in-check-for-pthread_detach.patch | 33 +++++++++++++++++++
 .../recipes-support/ntp/ntp_4.2.8p15.bb       |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/0001-sntp-Fix-types-in-check-for-pthread_detach.patch

diff --git a/meta-networking/recipes-support/ntp/ntp/0001-sntp-Fix-types-in-check-for-pthread_detach.patch b/meta-networking/recipes-support/ntp/ntp/0001-sntp-Fix-types-in-check-for-pthread_detach.patch
new file mode 100644
index 0000000000..ca15470ace
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/0001-sntp-Fix-types-in-check-for-pthread_detach.patch
@@ -0,0 +1,33 @@
+From 864f43ae09d18b1114d5c894e836698743e4e44c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Sep 2022 21:36:35 -0700
+Subject: [PATCH] sntp: Fix types in check for pthread_detach
+
+New compilers are stricter and flag assigning NULL to pthread_t as error
+therefore using a pthread_t variable constructed from -1
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sntp/m4/openldap-thread-check.m4 | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/sntp/m4/openldap-thread-check.m4 b/sntp/m4/openldap-thread-check.m4
+index 7768a5c..b9e54ad 100644
+--- a/sntp/m4/openldap-thread-check.m4
++++ b/sntp/m4/openldap-thread-check.m4
+@@ -262,10 +262,7 @@ pthread_rwlock_t rwlock;
+ 				dnl save the flags
+ 				AC_LINK_IFELSE([AC_LANG_PROGRAM([[
+ #include <pthread.h>
+-#ifndef NULL
+-#define NULL (void*)0
+-#endif
+-]], [[pthread_detach(NULL);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
++]], [[pthread_detach((pthread_t)-1);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
+ 			])
+ 
+ 			if test $ol_cv_func_pthread_detach = no ; then
+-- 
+2.37.3
+
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index a30f720bb5..50f5477f27 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://reproducibility-fixed-path-to-posix-shell.patch \
            file://0001-libntp-Do-not-use-PTHREAD_STACK_MIN-on-glibc.patch \
            file://0001-test-Fix-build-with-new-compiler-defaults-to-fno-com.patch \
+           file://0001-sntp-Fix-types-in-check-for-pthread_detach.patch \
            file://ntpd \
            file://ntp.conf \
            file://ntpdate \
-- 
2.37.3


