Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D26C6FA8E
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:15 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.2842.1662594068352123264
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hdn4yvwH;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id u22so16076294plq.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Zc4c8v4qMh3q5deGLPxq2quTctJ6iq+1A5RYGKzlIew=;
        b=hdn4yvwHHaj5oNsxXjD43aSzNp73vi73xu509SAZoE22UXrspLO1+L3yLbQW4DtmfU
         FQJtMD/049wJj5Wu10afUbRCOGfdphHP/oqME+qo2r5UOayOMx7gFeqrSPdOcZDeVwmm
         UCI1IZwOWm8QSIGNFTyn1MQWMGewW9bJm36AhQ3ORCf49c9TofA/nsL0NhSGSgU2/vxC
         bWYrPpf98KHwUJl/2DMXqXa76QqH3sEEd8fgWRGFQkOGIf4OAXsunvV2q+PPK3E0stMe
         3kHR33Gec5PAUofjx2CObVEIujcseISX/rqBIEp7CFikbHxk6M0TRtKReJvQ1TnzOU81
         x3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Zc4c8v4qMh3q5deGLPxq2quTctJ6iq+1A5RYGKzlIew=;
        b=2c/Exxks0VtGHiwG4EsfV96FVcswYoW1BfistpTlWKxeYEgZk6mRFCf2kdg1a0GM/l
         qjlKS4zVRrO/sjfJ0Szlt9/RQzm9ypENFTrl3h7cDx3NIRQcF5BxwkUsJrYJ0WSYg2na
         dsnFufk56oWZRaVuEnkBW9NNSzVFs32GHLsBW9Qwmr/7HDfx6hmfZ2v+00+KLOMPNkNx
         1apgtMw5NRlUzhpBZz5JXD068FvNUZp0AVZ17TkRH/Asj3JzL+c+ZvkgHVY/yOoLOVF7
         xSlWFIY458XIYE3HaFhuhxUPsLvZvbGjdJZDWzhQyptYsIlC1IxnWU9kJ/jRjUIzp1v2
         EWDg==
X-Gm-Message-State: ACgBeo2iv92TC1J6Rcab9WlQuRl56vY4Hv5gIADB4ChognM81z/5Fmyf
	yMnsWBuLlU9TRZGpjf6Di5kKkiwqxfkK/g==
X-Google-Smtp-Source: 
 AA6agR5uBp6XCy2WGM6882ET+4mgfwSuujAsstGT2E0JDp3/IfEnqiy9taT9iOIhZtU/gnYI1090ww==
X-Received: by 2002:a17:902:e552:b0:16c:571d:fc08 with SMTP id
 n18-20020a170902e55200b0016c571dfc08mr6064563plf.151.1662594067599;
        Wed, 07 Sep 2022 16:41:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/22] lcdproc: Fix build on non-x86 and arm
 architectures
Date: Wed,  7 Sep 2022 16:40:44 -0700
Message-Id: <20220907234102.3312797-4-raj.khem@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98694

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-compilation-with-GCC-10.x.patch  |  7 -----
 .../0003-Fix-non-x86-platforms-on-musl.patch  | 28 ++++++++++++++-----
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-compilation-with-GCC-10.x.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-compilation-with-GCC-10.x.patch
index 35634dd9ba..cd8a69c3fb 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-compilation-with-GCC-10.x.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0001-Fix-compilation-with-GCC-10.x.patch
@@ -16,8 +16,6 @@ Signed-off-by: Harald Geyer <harald@ccbib.org>
  clients/lcdproc/iface.h | 2 +-
  2 files changed, 2 insertions(+), 1 deletion(-)
 
-diff --git a/clients/lcdproc/iface.c b/clients/lcdproc/iface.c
-index 40e50cb7..1ac355bd 100644
 --- a/clients/lcdproc/iface.c
 +++ b/clients/lcdproc/iface.c
 @@ -32,6 +32,7 @@
@@ -28,8 +26,6 @@ index 40e50cb7..1ac355bd 100644
  
  static int iface_count = 0;	/* number of interfaces */
  static char unit_label[10] = "B";	/* default unit label is Bytes */
-diff --git a/clients/lcdproc/iface.h b/clients/lcdproc/iface.h
-index cc6dbaaf..c1bd6b5b 100644
 --- a/clients/lcdproc/iface.h
 +++ b/clients/lcdproc/iface.h
 @@ -18,7 +18,7 @@
@@ -41,6 +37,3 @@ index cc6dbaaf..c1bd6b5b 100644
  
  /** Update screen content */
  int iface_screen(int rep, int display, int *flags_ptr);
--- 
-2.28.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch
index e39e9bda14..eed9ceee5e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch
@@ -17,19 +17,33 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  server/drivers/port.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/server/drivers/port.h b/server/drivers/port.h
-index c584cd4e..bde235b3 100644
 --- a/server/drivers/port.h
 +++ b/server/drivers/port.h
-@@ -94,7 +94,7 @@ static inline int port_deny_multiple(unsigned short port, unsigned short count);
+@@ -94,7 +94,7 @@ static inline int port_deny_multiple(uns
  /*  ---------------------------- Linux ------------------------------------ */
  /*  Use ioperm, inb and outb in <sys/io.h> (Linux) */
  /*  And iopl for higher addresses of PCI LPT cards */
 -#if defined HAVE_IOPERM
-+#if defined(__GLIBC__) || (defined(__x86__) || defined(__x86_64__))
++#if HAVE_INB
  
  /* Glibc2 and Glibc1 */
  # ifdef HAVE_SYS_IO_H
--- 
-2.24.1
-
+@@ -333,7 +333,7 @@ static inline int port_deny_multiple (un
+ 	return i386_set_ioperm(port, count, 0);
+ }
+ 
+-#else
++#elif defined(__x86__) && defined(__x86_64__)
+ 
+ /*  ------------------------- Everything else ----------------------------- */
+ /*  Last chance! Use /dev/io and i386 ASM code (BSD4.3 ?) */
+--- a/configure.ac
++++ b/configure.ac
+@@ -144,6 +144,7 @@ AC_CHECK_LIB(i386, i386_get_ioperm,
+ 		[])]
+ )
+ 
++AC_CHECK_FUNCS(inb)
+ AC_CHECK_FUNCS(iopl)
+ AC_CHECK_FUNCS(ioperm)
+ AC_CHECK_HEADERS(sys/io.h)
-- 
2.37.3


