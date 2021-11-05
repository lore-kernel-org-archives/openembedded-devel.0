Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC12C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 20:24:37 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.11161.1636143875904002781
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 13:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X8xJ+4cs;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so4120222pjc.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 13:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V84LEDd4gQWEdc/HbNQJlD8JxJjB3OOcc3sYunMJTHQ=;
        b=X8xJ+4csXl5qBUZN4BiTtnL7Y34BLum3ctF5PDzhpG71XBWusCRGxmrJq02U5/wHSl
         UJR24y/QwZCbckQc8Yr92F8GOgYMDqXBYAn88Oap37cFw+srXHFQXqLzFbv4d2XpipUL
         2VJj2wi7r9xQTZsjd3TNa6VbsEKAQRL1dE/KwuTkpAvsd33+8KwetAUfg5cXh9ZuTNcp
         dTq3h0dPVlIqVEyAw2Ymhl6Av9j60fv1B2XjtyriK79mpozck68jP3GhmSsMg6tYCXic
         jz5Ao+5j5ThQSbeht2zPvSBlutYyIZLXK8miGwGskuLDiowVZEJPI80KwpjnVHws5it6
         /JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V84LEDd4gQWEdc/HbNQJlD8JxJjB3OOcc3sYunMJTHQ=;
        b=6B3s6DdqkUzQd5NJLxPJtKANuFo0Vn09EzZ5FdeHClga5NR75DdA6Og2/dmK0XTodD
         //Sq/Oz3KOFCDe0gS4rSHDSGje0WNxiBWCXQPUupi4S+aqooEng7sJNeTOg6/PsJ4a9n
         sk2pJLUl8DcDN1p20jCWiexlIP/o0nJ902BFHe5onZsZo18i8DnGbZiJ0NoZzE56MhPu
         XTXBBRza3UUC4oey9W/dpnJDJE6Tm/k8JJ4q60HWisWIidh4mcCfO+cefPnpy+hrbjec
         hIWnzpSbIjhP0VKneSGCWDW8K+L3CilcRHreMtUoPvUvf1DQ1a/uCKe+X0ncVzUvnGEe
         gtvg==
X-Gm-Message-State: AOAM531R/5tzxg9n0jaQcfZbnHbflRXBipe9LXa/v/to/k9ALivZBJaT
	Mja+R4QXDTGFtaf1lEk6SWnuC5r1UT4=
X-Google-Smtp-Source: 
 ABdhPJyadcJypCcWlbJcfpiyR7Je+BbnM91hIRMq0EEr87GM1AbkofWXxhxOHoyorE7K2fL4/QnlFA==
X-Received: by 2002:a17:90a:e506:: with SMTP id
 t6mr30811998pjy.9.1636143874781;
        Fri, 05 Nov 2021 13:24:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 d15sm8839870pfu.12.2021.11.05.13.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 13:24:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-networking][PATCH] mctp: Fix build with 5.15+ kernel headers
Date: Fri,  5 Nov 2021 13:24:32 -0700
Message-Id: <20211105202432.1769846-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 20:24:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93850

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../0001-build-Adjust-for-kernel-mctp.h.patch | 84 +++++++++++++++++++
 .../recipes-support/mctp/mctp_git.bb          |  8 +-
 2 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/mctp/mctp/0001-build-Adjust-for-kernel-mctp.h.patch

diff --git a/meta-networking/recipes-support/mctp/mctp/0001-build-Adjust-for-kernel-mctp.h.patch b/meta-networking/recipes-support/mctp/mctp/0001-build-Adjust-for-kernel-mctp.h.patch
new file mode 100644
index 0000000000..83bf197703
--- /dev/null
+++ b/meta-networking/recipes-support/mctp/mctp/0001-build-Adjust-for-kernel-mctp.h.patch
@@ -0,0 +1,84 @@
+From 653eccc918ef993186c312694c288b2a5b39248e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 5 Nov 2021 13:14:55 -0700
+Subject: [PATCH] build: Adjust for kernel mctp.h
+
+Starting 5.15 kernel has mctp.h as well and provides some of the
+defintions, therefore move the ones we need to provide in this header
+outside the conditional check so its always provided regardless of
+header coming from kernel or not.
+
+Include linux/if_link.h so it can pre-define IFLA_MCTP_UNSPEC and other
+defines and there is a check for conditionally providing them here but
+kernel does not have such a check, so if linux/if_link.h is included
+after this header then we end up with duplicate defines
+
+linux/if_link.h:1267:2: error: redefinition of enumerator 'IFLA_MCTP_UNSPEC'
+        IFLA_MCTP_UNSPEC,
+        ^
+../git/src/mctp.h:74:2: note: previous definition is here
+        IFLA_MCTP_UNSPEC,
+        ^
+
+Upstream-Status: Submitted [https://github.com/CodeConstruct/mctp/pull/2]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/mctp.h | 21 +++++++++++----------
+ 1 file changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/src/mctp.h b/src/mctp.h
+index 4f73def..e602168 100644
+--- a/src/mctp.h
++++ b/src/mctp.h
+@@ -19,6 +19,7 @@
+ #if HAVE_LINUX_MCTP_H
+ #include <linux/mctp.h>
+ #endif
++#include <linux/if_link.h>
+ 
+ #ifndef AF_MCTP
+ #define AF_MCTP 45
+@@ -33,10 +34,6 @@
+ 
+ #ifndef MCTP_NET_ANY
+ 
+-#ifndef MAX_ADDR_LEN
+-#define MAX_ADDR_LEN 32
+-#endif
+-
+ typedef uint8_t			mctp_eid_t;
+ 
+ struct mctp_addr {
+@@ -53,6 +50,16 @@ struct sockaddr_mctp {
+ 	uint8_t			__smctp_pad1;
+ };
+ 
++#define MCTP_NET_ANY 0
++#define MCTP_ADDR_ANY 0xff
++#define MCTP_TAG_OWNER 0x08
++
++#endif /* MCTP_NET_ANY */
++
++#ifndef MAX_ADDR_LEN
++#define MAX_ADDR_LEN 32
++#endif
++
+ struct sockaddr_mctp_ext {
+ 	struct sockaddr_mctp	smctp_base;
+ 	int			smctp_ifindex;
+@@ -61,12 +68,6 @@ struct sockaddr_mctp_ext {
+ 	unsigned char		smctp_haddr[MAX_ADDR_LEN];
+ };
+ 
+-#define MCTP_NET_ANY 0
+-#define MCTP_ADDR_ANY 0xff
+-#define MCTP_TAG_OWNER 0x08
+-
+-#endif /* MCTP_NET_ANY */
+-
+ #ifndef IFLA_MCTP_MAX
+ 
+ /* From if_link.h */
+-- 
+2.33.1
+
diff --git a/meta-networking/recipes-support/mctp/mctp_git.bb b/meta-networking/recipes-support/mctp/mctp_git.bb
index ebfa84d893..50d84d204d 100644
--- a/meta-networking/recipes-support/mctp/mctp_git.bb
+++ b/meta-networking/recipes-support/mctp/mctp_git.bb
@@ -5,9 +5,13 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4cc91856b08b094b4f406a29dc61db21"
 
-SRCREV = "a8658290b7914f67146a982671b09f2270ba1654"
+PV = "0.1+git${SRCPV}"
 
-SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https"
+SRCREV = "072bafe725c50329f99cf9d3b2624e8799e8163a"
+
+SRC_URI = "git://github.com/CodeConstruct/mctp;branch=main;protocol=https \
+           file://0001-build-Adjust-for-kernel-mctp.h.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.33.1


