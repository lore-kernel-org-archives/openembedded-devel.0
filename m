Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC50EC6FA89
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:15 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.2844.1662594070794028296
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fU3gIK8F;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d12so16113141plr.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Bz5Ud1fLt1polYXaOgWS9jnm57hQyNVxhUKYAlkxxJI=;
        b=fU3gIK8FYkZyaAypxtCnCWydRVHM5MoS4GdgvPG1o4/9v3WehD3DeRQYrSn29cEuvn
         4j9Dvs6bKJiGU+fkd4ba07KcUkAJHPgc8cs3w4OKWX0NObfFhQ//TaK0w/xBauKCWyjA
         3W/HbyYJhy7Z1E/Mi0SUENcwhh3TTkwSwEGeme8NBwC0SoJ/JFsBH9/HpFYWdWMI5OBP
         4GB06iWE5E3cy9VpZfBjZouBXhcwpPGXp7PCt9CZ4lXcYhVV3mih2YrgPJImAbWXEEYV
         BynndOXhZppst+KdHncjCwSnhswc8bfXmhvOv2g/M9P3e+jzydEZjCHPc1u4Q8+jVxxj
         GOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Bz5Ud1fLt1polYXaOgWS9jnm57hQyNVxhUKYAlkxxJI=;
        b=rRRsHfFaqIwlK2sk0jQhYlCazXzr5kqX+Yb6HAUJtTar9At4cKSOQptSxsfm39CWyp
         rbPu4HGmMw1p25ydLVFBWIGUdqdJEeXktpf6nAeXceCNG4nSX8oTyIbLfwVyCbs734Ey
         nMHDCnSwxwSXbEK09Tn+JfOBBNq1xVdp87hheBsV0xJ2g7QmR/M1OUfb1TB3qHoygFRO
         tUGySPPx7gvoRRxTOOFhYB13q+1EiabDSI3V18H9e6yHxcJgLB2Sk5A3fZDWmD3Jrlwk
         vLZHh27yCdHL1hyBFW+uKhT0BCG0h/WHhNYPMSEg0mzIfupP8j+Boodej8xO8TLGjo6K
         sBog==
X-Gm-Message-State: ACgBeo158DThj9zd3GIbS+S3idBPHkr+k8uKAT093CB6qH+ZnhbLpOAA
	ARsrkaXGQzRC46nC8MPAmxGxQEr3ZXOGeQ==
X-Google-Smtp-Source: 
 AA6agR7FT7xwSa3oEZ5uY8aZPudtXtGnWrg/w9UpyLd0x4hRDbJWIe62FceQdX3739+vAtOXDhYZIw==
X-Received: by 2002:a17:903:41c3:b0:176:b990:6c28 with SMTP id
 u3-20020a17090341c300b00176b9906c28mr6137043ple.94.1662594070041;
        Wed, 07 Sep 2022 16:41:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/22] sblim-sfcb: Include config.h before using
 CONFIG_ERROR_H
Date: Wed,  7 Sep 2022 16:40:47 -0700
Message-Id: <20220907234102.3312797-7-raj.khem@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/98697

Fix use before definition case.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-for-error.h-when-it-does-not-exist.patch | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-Replace-need-for-error.h-when-it-does-not-exist.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-Replace-need-for-error.h-when-it-does-not-exist.patch
index e723050237..9bb9f44344 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-Replace-need-for-error.h-when-it-does-not-exist.patch
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-Replace-need-for-error.h-when-it-does-not-exist.patch
@@ -16,8 +16,6 @@ Upstream-Status: Pending
  trace.c       |  4 +++-
  5 files changed, 24 insertions(+), 5 deletions(-)
 
-diff --git a/brokerUpc.c b/brokerUpc.c
-index 17cbd9b..fe2b347 100644
 --- a/brokerUpc.c
 +++ b/brokerUpc.c
 @@ -20,8 +20,11 @@
@@ -33,8 +31,6 @@ index 17cbd9b..fe2b347 100644
  #include "support.h"
  #include "native.h"
  #include <sfcCommon/utilft.h>
-diff --git a/configure.ac b/configure.ac
-index ab2964e..d4915a1 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -517,7 +517,7 @@ fi
@@ -46,8 +42,6 @@ index ab2964e..d4915a1 100644
  AC_CHECK_HEADERS([cmpi/cmpimacs.h cmpi/cmpift.h cmpi/cmpidt.h],[],[AC_MSG_ERROR([Could not find required CPMI header.])])
  
  # Checks for typedefs, structures, and compiler characteristics.
-diff --git a/httpAdapter.c b/httpAdapter.c
-index 2719e6c..e768972 100644
 --- a/httpAdapter.c
 +++ b/httpAdapter.c
 @@ -71,7 +71,9 @@
@@ -61,11 +55,15 @@ index 2719e6c..e768972 100644
  /* should probably go into cimRequest.h */
  #define CIM_PROTOCOL_ANY     0
  #define CIM_PROTOCOL_CIM_XML 1
-diff --git a/support.c b/support.c
-index c7bba8b..5b3eef1 100644
 --- a/support.c
 +++ b/support.c
-@@ -32,7 +32,11 @@
+@@ -27,16 +27,20 @@
+  *  @sa native.h
+  */
+ 
++#include "config.h"
+ #include <stdio.h>
+ #include <dlfcn.h>
  #include "support.h"
  #include <stdio.h>
  #include <stdlib.h>
@@ -77,7 +75,11 @@ index c7bba8b..5b3eef1 100644
  #include <errno.h>
  #include "native.h"
  #include "trace.h"
-@@ -331,17 +335,25 @@ loadQualifierDeclMI(const char *provider,
+-#include "config.h"
+ #include "control.h"
+ #include <pthread.h>
+ 
+@@ -331,17 +335,25 @@ loadQualifierDeclMI(const char *provider
    _SFCB_RETURN(NULL);
  };
  
@@ -104,8 +106,6 @@ index c7bba8b..5b3eef1 100644
  /**
   * flag to ensure MM is initialized only once
   */
-diff --git a/trace.c b/trace.c
-index d7f30db..438af46 100644
 --- a/trace.c
 +++ b/trace.c
 @@ -279,7 +279,9 @@ _sfcb_trap(int tn)
@@ -119,6 +119,3 @@ index d7f30db..438af46 100644
  sigHandler     *
  setSignal(int sn, sigHandler * sh, int flags)
  {
--- 
-2.14.1
-
-- 
2.37.3


