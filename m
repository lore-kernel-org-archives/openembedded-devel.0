Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58231C38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 15:16:36 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.388.1662650188188743375
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 08:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gdCr7kPR;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id bh13so17081523pgb.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 08:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Bwe5RvTCB1nsbQiDqW5/djXLOnxOEWnJmslpK/QRzCY=;
        b=gdCr7kPR2RaTahzilZdVkdahPD1h9/1N/wbDVlbyBrw+30y3iqXa8HG/q/DjiGGyOE
         QHGZwqV/jb88Bu6e/kij775lIdBEau1ifyDOxRwwFyhRjBQCMaCU6drHUjhEfsvtALCq
         rDwvXdo79laYXA7WIaE+uQkur4plocgJrZG0RPwSZKfR+M6jZ8F3s8gth1v1NhYhazU0
         jB+Nj7wLfWWEL2LMXFfCs6s4hVO4FmIiFPIk7x6x6fa1WTnSvOnw2Cv5VsaT5CbLlAWy
         h/DybIU85S9c6teALW9oFSFSl+Jb2CHob5ytP3GE7d/BE4oVARDa9mEOgSxDzBeLB0is
         Nfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Bwe5RvTCB1nsbQiDqW5/djXLOnxOEWnJmslpK/QRzCY=;
        b=g1RPNLdJ7JSRe7X/2oW9TXrU36M3Ge2n41Yjxk9lI2/YP7SC+2Hqbx1NIeSjel5a96
         e8C+YSzhgL6ybWy2Lru+1EXusDRho9sTrp4qn0E5DrgzKiBEKUN14bHpVgRf3UYI79xG
         QXeOdmojytbBuxZI/LLrT2728JLJRBdxZ0eYp3IR7yh9HE9/qmE+Ounqwd1nIac+rrZ6
         ofeIUBIxH2UScCXJgs4EMRO+XRZss2DOvOsFSHIx2XA7JTMn91MdjSNhzfzBO54zZIXo
         m2/8DYbO+hYaiXFqCGoeh7qVnnM6g4sCV5Ipz/Xrvs5HgJJy33fr6cGerUo4cfP9Cd4x
         MP3g==
X-Gm-Message-State: ACgBeo0vl7YSKRtBrd8sGK2DpY9UkYSe+6oHfNeLJ8daFPz0JiVpe/FM
	MQkV5Fsj282tXkbqYkGktnilOdrw6hLdEQ==
X-Google-Smtp-Source: 
 AA6agR542Sn66anhzGEXdBekUovZhl7WWbgmOvx+Pw0SqQEICaBng/zraQSGySwaaB/Af4oJXAuGpQ==
X-Received: by 2002:a65:63c3:0:b0:42b:5b03:ce57 with SMTP id
 n3-20020a6563c3000000b0042b5b03ce57mr8223305pgv.436.1662650187256;
        Thu, 08 Sep 2022 08:16:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 c8-20020a621c08000000b0053e4296e1d3sm6193555pfc.198.2022.09.08.08.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 08:16:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] toybox: Fix build on 32bit arches with 64bit time_t
 defaults
Date: Thu,  8 Sep 2022 08:16:25 -0700
Message-Id: <20220908151625.2594845-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Sep 2022 15:16:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98722

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...timer_settime_wrap-for-32bit-systems.patch | 37 +++++++++++++++++++
 meta-oe/recipes-core/toybox/toybox_0.8.8.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-core/toybox/toybox/0001-portability-Fix-timer_settime_wrap-for-32bit-systems.patch

diff --git a/meta-oe/recipes-core/toybox/toybox/0001-portability-Fix-timer_settime_wrap-for-32bit-systems.patch b/meta-oe/recipes-core/toybox/toybox/0001-portability-Fix-timer_settime_wrap-for-32bit-systems.patch
new file mode 100644
index 0000000000..8976b3748b
--- /dev/null
+++ b/meta-oe/recipes-core/toybox/toybox/0001-portability-Fix-timer_settime_wrap-for-32bit-systems.patch
@@ -0,0 +1,37 @@
+From 7284c7ae0df9aa5a9c8aa0a81a018e17289fe2c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 8 Sep 2022 07:22:26 -0700
+Subject: [PATCH] portability: Fix timer_settime_wrap for 32bit systems with
+ 64bit time_t
+
+glibc does not define SYS_timer_settime if the 32bit syscall is not
+available, new architectures like riscv32 has defaulted to 64bit time_t
+from get go and avoided wiring 32bit syscall, therefore alias it to
+64bit version here
+
+Upstream-Status: Submitted [https://github.com/landley/toybox/pull/373]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/portability.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/lib/portability.c b/lib/portability.c
+index d955d081..4baa9367 100644
+--- a/lib/portability.c
++++ b/lib/portability.c
+@@ -711,6 +711,12 @@ int timer_create_wrap(clockid_t c, struct sigevent *se, timer_t *t)
+   return 0;
+ }
+ 
++#if !defined(SYS_timer_settime) && defined(SYS_timer_settime64)
++// glibc does not define defines SYS_timer_settime on 32-bit systems
++// with 64-bit time_t defaults e.g. riscv32
++#define SYS_timer_settime SYS_timer_settime64
++#endif
++
+ int timer_settime_wrap(timer_t t, int flags, struct itimerspec *val,
+   struct itimerspec *old)
+ {
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.8.bb b/meta-oe/recipes-core/toybox/toybox_0.8.8.bb
index 89411cecc9..6836b14682 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.8.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.8.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 inherit cml1 update-alternatives
 
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
+           file://0001-portability-Fix-timer_settime_wrap-for-32bit-systems.patch \
            "
 SRC_URI[sha256sum] = "dafd41978d40f02a61cf1be99a2b4a25812bbfb9c3157e679ee7611202d6ac58"
 
-- 
2.37.3


