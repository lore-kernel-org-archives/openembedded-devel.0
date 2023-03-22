Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FB2C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 16:12:14 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.47751.1679501532709884451
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 09:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fthrHuKC;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id le6so19708422plb.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679501532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ViLr4IzIAgxiT5wr8UGIE2FWxMSl47hLWIDp3p2iGNs=;
        b=fthrHuKCuZCoernOSf+Oveu/C7PfUprQd0c0PP/rwrdqBeAdVgY5cvX8nC9X3cA92P
         01Hi6gRK6ZHYAXOo26njDRG5Uhhw4v8n1QQCU+Sw+nC+6FZ/GUdOcQTJ0NF1I2tDGB0v
         mC9sY2CBgSgnm+xbdlMZjz+PU0qddKjAQJf4BYLSZn5U3DjaNdj2rDI0QDekD3IFGqrR
         aAW667nwS/lZ8QTcxYHo9u4LXEJz69bFvHyxMIQMBsAfWkoyW8q2qvmDnOFTmd2vK3e1
         mf64nVeYbCDr6BXd5jUg93uwmKfKQL0+mYL0y4J8cUN8OTZ1lUkiOUpW/pNc15PjZapA
         MrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679501532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ViLr4IzIAgxiT5wr8UGIE2FWxMSl47hLWIDp3p2iGNs=;
        b=jIMUjuokr6WJ71dQWZn9x6DEzq6bpQHHCxasncRKUDTogvas6qBm/o9H6j7vC21DlW
         qNF5lrNDYErVMW6N1IvyeqKDaOW5HsTiRuJo7OH0PxHqTV0iFhEUBrGu7mmUXB8UDDhR
         LFSRUGDdlqmRBMrcZq/ycAzBqbr+WWhNybDcP2sepBCG2lR6u6hBTHQQqHh93OlEhm4F
         AXAubCntGlz7gZfYOiDHRmkB4VbYEhfH/2KSL2kpBGfltlFT7aeBj75qVxvFkMg5VHw0
         4AXvZUa2bjMkzoiSG9ZqyyQqjJDE/alcIELw4K3IFg2A6LD8adnjAxiC0VwJ7nCqXL0i
         MNkw==
X-Gm-Message-State: AO0yUKV8WLHx/uRMu724Ct/GmnCh+GvX3bLrhGirVlN592SG2LkRVewm
	hGN1hUbAGfi4BcRHyv3mSaiJ27rjigDeMQ==
X-Google-Smtp-Source: AK7set8fFKYeFvOP5XiDK2TLr0v2EENlG8kN8TkibcJJwtHbeDwJnSSguOqgrkmbto9OI2fF40rUKw==
X-Received: by 2002:a17:902:eccb:b0:19c:da68:337a with SMTP id a11-20020a170902eccb00b0019cda68337amr3675002plh.31.1679501531021;
        Wed, 22 Mar 2023 09:12:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::86bb])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c24c00b0019e5fc3c7e6sm10769459plg.101.2023.03.22.09.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 09:12:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] cmocka: Check for previous declaration of uintptr_t
Date: Wed, 22 Mar 2023 09:12:05 -0700
Message-Id: <20230322161205.277029-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Mar 2023 16:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101638

Fix build with musl/aarch64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb   |  1 +
 ...or-previous-declaration-of-uintptr_t.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-test/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch

diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
index 308d5ca1fb..44077a0d35 100644
--- a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
+++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRCREV = "a01cc69ee9536f90e57c61a198f2d1944d3d4313"
 PV .= "+git${SRCPV}"
 SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=stable-1.1 \
+           file://0001-include-Check-for-previous-declaration-of-uintptr_t.patch \
            file://run-ptest \
           "
 
diff --git a/meta-oe/recipes-test/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch b/meta-oe/recipes-test/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch
new file mode 100644
index 0000000000..65d30ea993
--- /dev/null
+++ b/meta-oe/recipes-test/cmocka/files/0001-include-Check-for-previous-declaration-of-uintptr_t.patch
@@ -0,0 +1,43 @@
+From a54e035f802e79e3292d8ad39a14bd7c060eb7b1 Mon Sep 17 00:00:00 2001
+From: Breno Leitao <breno.leitao@gmail.com>
+Date: Tue, 21 Mar 2023 21:58:28 -0700
+Subject: [PATCH] include: Check for previous declaration of uintptr_t
+
+Adding a extra check before declaring uintptr_t. Currently musl uses
+macro __DEFINED_uintptr_t once it defines uintptr_t type. Checking
+this macro before defining it, and, defining it when uintptr_t is
+defined.
+
+Taken from Alpine
+
+Upstream-Status: Pending
+Signed-off-by: Breno Leitao <breno.leitao@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/cmocka.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/cmocka.h b/include/cmocka.h
+index a21d965..f540793 100644
+--- a/include/cmocka.h
++++ b/include/cmocka.h
+@@ -121,7 +121,7 @@ typedef uintmax_t LargestIntegralType;
+     ((LargestIntegralType)(value))
+ 
+ /* Smallest integral type capable of holding a pointer. */
+-#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED) && !defined(HAVE_UINTPTR_T)
++#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED) && !defined(HAVE_UINTPTR_T) && !defined(__DEFINED_uintptr_t)
+ # if defined(_WIN32)
+     /* WIN32 is an ILP32 platform */
+     typedef unsigned int uintptr_t;
+@@ -147,6 +147,7 @@ typedef uintmax_t LargestIntegralType;
+ 
+ # define _UINTPTR_T
+ # define _UINTPTR_T_DEFINED
++# define __DEFINED_uintptr_t
+ #endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
+ 
+ /* Perform an unsigned cast to uintptr_t. */
+-- 
+2.40.0
+
-- 
2.40.0


