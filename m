Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1356ECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:22 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.8826.1661843661083690107
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pl3CgD3P;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 z3-20020a17090abd8300b001fd803e34f1so8398563pjr.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/5pLb5rjCRj6TV+L9THFBb8NyTIG/iEI0nVOijKztDE=;
        b=Pl3CgD3Pzqwi8kbO54nS4nvkP3L8Gv49p7M0rxS5KwiTRa/PMp9m4TUHC+yAtdi+pv
         f04Vp//AVqPW3CpO3sDhxJW/7NyJdMGk2eBmrQkfiOfp1o4Cel10B9buDOFESEeDOK3H
         vvw0I8nQ0wYAxJ3Q6OLRoL0RwOPnyifPxq9Z4YpgYc6IBW5sd9+oGhyezIGnRBRknfl8
         YWNicM8XK5FEkFtMZZ3GjUhFrMY0ShJQ0hX6XKCCLoHlGWfkNE+O1nZePMYHJDmJ8jr7
         Cmhptv5j8qyr5PSJ1BnDpnQ2s7t6/AxtJbt2lcg9tPsoXTcziUXABfmi4FcV+5adQU9y
         bnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/5pLb5rjCRj6TV+L9THFBb8NyTIG/iEI0nVOijKztDE=;
        b=M31+Ot7lanWBXQDQe8hh+HLdNAiOtH+9yfJ8cGoUbwsugKvtYKPmNXI+2nT5j7ESqc
         /uQGJD9EtvOhGLBsIxVKQ1JJEJXC8IAOQt8Oj22Lao+6uu02K/0/Pdt+8AXbux1PzBHJ
         DRGAVf7PjVHCCOGxrcU/9usku3OZ/0ivNs03h+lPNafLJxkCSxoQvXjqikWG0sOy6Q/e
         kDKeqKvKoOk9xaqOG+wd2jrQ6GyNOLPIo9Y9mJY7N/Jba5xHTE7UmEMfEdHuQA3D8bue
         2AzB3jGwavtEMZqpS5zN7ZhmcKMvbx3KdkowaY8vT7sxrRoglqPkHj3v9TwShQxRv6zm
         i3Kw==
X-Gm-Message-State: ACgBeo0kj6N1QuTEmq/eor9aWpi1Yb8zLveOYPiBa+IAXTUD7yAJ+VWf
	htolQjKR26MLxqo7m/kMeDBilx4kr0waEA==
X-Google-Smtp-Source: 
 AA6agR5Ja/k9RJ6ElDiCCDWJshdEIo4iBgiN3G30vEH4Y7NS0annMOv+yIEgvMBWjtT3BUIQ8voEog==
X-Received: by 2002:a17:90b:17d0:b0:1fb:5bbc:917c with SMTP id
 me16-20020a17090b17d000b001fb5bbc917cmr22561111pjb.109.1661843660267;
        Tue, 30 Aug 2022 00:14:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 06/21] ez-ipupdate: Fix build with clang
Date: Tue, 30 Aug 2022 00:13:58 -0700
Message-Id: <20220830071413.3887189-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98543

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ez-ipupdate/ez-ipupdate_3.0.11b7.bb       | 11 ++---
 ...nclude-time.h-for-time-API-prototype.patch | 44 +++++++++++++++++++
 2 files changed, 50 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/files/0001-ez-ipupdate-Include-time.h-for-time-API-prototype.patch

diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
index 8648f2e0e6..42ecf9bac4 100644
--- a/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/ez-ipupdate_3.0.11b7.bb
@@ -5,11 +5,12 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7783169b4be06b54e86730eb01bc3a31"
 
 SRC_URI = "http://sourceforge.net/projects/ez-ipupdate/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
-    file://Makefile.am.patch \
-    file://cache_file.c.patch \
-    file://conf_file.c.patch \
-    file://wformat.patch \
-    "
+           file://Makefile.am.patch \
+           file://cache_file.c.patch \
+           file://conf_file.c.patch \
+           file://wformat.patch \
+           file://0001-ez-ipupdate-Include-time.h-for-time-API-prototype.patch \
+           "
 SRC_URI[md5sum] = "525be4550b4461fdf105aed8e753b020"
 SRC_URI[sha256sum] = "a15ec0dc0b78ec7578360987c68e43a67bc8d3591cbf528a323588830ae22c20"
 
diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/0001-ez-ipupdate-Include-time.h-for-time-API-prototype.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/0001-ez-ipupdate-Include-time.h-for-time-API-prototype.patch
new file mode 100644
index 0000000000..b2a2ebdae3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/0001-ez-ipupdate-Include-time.h-for-time-API-prototype.patch
@@ -0,0 +1,44 @@
+From 6c8fe883df993b9e7987c8f1c849962f8007a373 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 12:50:37 -0700
+Subject: [PATCH] ez-ipupdate: Include time.h for time() API prototype
+
+Fix printf format specifiers for snprintf
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ez-ipupdate.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/ez-ipupdate.c b/ez-ipupdate.c
+index 15a4c13..5cbe7f3 100644
+--- a/ez-ipupdate.c
++++ b/ez-ipupdate.c
+@@ -38,6 +38,8 @@
+ #  include <config.h>
+ #endif
+ 
++#include <time.h>
++
+ // you man very well need to edit this, don't worry though, email is only sent
+ // if bad things happend and it has to exit when in daemon mode.
+ #define SEND_EMAIL_CMD "mail"
+@@ -2483,7 +2485,7 @@ int DHS_update_entry(void)
+   p += strlen(p);
+   limit = BUFFER_SIZE - 1 - strlen(buf);
+ 
+-  snprintf(buf, BUFFER_SIZE, "Content-length: %d\015\012", strlen(putbuf));
++  snprintf(buf, BUFFER_SIZE, "Content-length: %lu\015\012", strlen(putbuf));
+   output(buf);
+   snprintf(buf, BUFFER_SIZE, "\015\012");
+   output(buf);
+@@ -2620,7 +2622,7 @@ int DHS_update_entry(void)
+     p += strlen(p);
+     limit = BUFFER_SIZE - 1 - strlen(buf);
+ 
+-    snprintf(buf, BUFFER_SIZE, "Content-length: %d\015\012", strlen(putbuf));
++    snprintf(buf, BUFFER_SIZE, "Content-length: %lu\015\012", strlen(putbuf));
+     output(buf);
+     snprintf(buf, BUFFER_SIZE, "\015\012");
+     output(buf);
-- 
2.37.2


