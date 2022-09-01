Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CB6ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 20:09:09 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.17465.1662062939547380845
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 13:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kdcJnOJ1;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 n65-20020a17090a5ac700b001fbb4fad865so128894pji.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 13:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EV47Zf4crKUAnn/0SHL/TIEMUW8fE7RsIJJK/7+ywmc=;
        b=kdcJnOJ1fZTUAZPY0BJcclFdMxCGFfnpeWx1mZgRogz2UGuAOEJhxuFQMCEdAVJqIu
         MElKd5U9uWhs5O9DbMSklJT8yhzTnW78kNYhPkeW9NsJ0SEJ4AcOy31z/0Scwv1wcxGr
         UfdeTbCq1+cPMQu3T61MtYq81HZbncrf2Zxmaigdc/t5e0dAvTTXLHUAUwjAUDr6uYS6
         bSKNIKvs/HecgSJkYYBJW/JP1l0+dGPG2+J1F8x/c1jP8JZ1X5Zej5Igcs9rQi/D/NUU
         oSXlKMgh96f28eZwGwk+7l/edCReRWZAJrc5Cz9KJJxQJXV8VbM/K+lqGnfqRKqr1yA+
         NTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EV47Zf4crKUAnn/0SHL/TIEMUW8fE7RsIJJK/7+ywmc=;
        b=8PZZkkQ2yzqBnxjsKaVIt0tOktvLJj3Q2rioZMwdVaDXBYbeN/dQql2iJSlfahwnBj
         V6ZUEtufTBfUO9WeY4p2zGn3i0GLfnV52Id2/8XArH4Wu7YNcx6d+CUI3LTanHMv/X5X
         JZzWYB4XBZNBH3NK3mLSp8peBTjsx2bBigCvLovY2WuRevLZx/ozB8mJf2vQIXAe1KSb
         LY+pdGr/lSB0YyXjLAs4yJULTmYTvvgktgZlR7VukN3+Czg3eEjWJGSqQwCmUG7oHB6N
         ZbyfQNE4U5x+UFKunWqmksDyo65OeYiokuiPIvKKphjiTadDToCL6OKr7ishNlMtQXqb
         y8Zw==
X-Gm-Message-State: ACgBeo3XpYFz5VtrlnZFPUlHakG0of62k0t1c5vydbbDaIhcAWG3uGiO
	bG7Ud8w6vZblNTLEw2gLxablc/7VxlbHJA==
X-Google-Smtp-Source: 
 AA6agR6UkzYJBnBNqdgtbXm9t/krbznNDYOEDPN+9fqycHMn3OWQQcamgr0YacQAU69LGem0rcbUJA==
X-Received: by 2002:a17:902:eb46:b0:174:b04f:2ddc with SMTP id
 i6-20020a170902eb4600b00174b04f2ddcmr22142465pli.126.1662062938660;
        Thu, 01 Sep 2022 13:08:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 w6-20020a654106000000b0042b80a27ac2sm5664045pgp.75.2022.09.01.13.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 13:08:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] linux-atm: Fix AC_CHECK_LIB for
 libresolv
Date: Thu,  1 Sep 2022 13:08:55 -0700
Message-Id: <20220901200855.251686-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901200855.251686-1-raj.khem@gmail.com>
References: <20220901200855.251686-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Sep 2022 20:09:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98588

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...for-symbol-from-libresolv-instead-of.patch | 29 +++++++++++++++++++
 .../linux-atm/linux-atm_2.5.2.bb              |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-configure-Check-for-symbol-from-libresolv-instead-of.patch

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-configure-Check-for-symbol-from-libresolv-instead-of.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-configure-Check-for-symbol-from-libresolv-instead-of.patch
new file mode 100644
index 0000000000..c62365d835
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0001-configure-Check-for-symbol-from-libresolv-instead-of.patch
@@ -0,0 +1,29 @@
+From a2a2e1b7a3f4f90e32912b5ba9b79e1a02275775 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 1 Sep 2022 11:17:13 -0700
+Subject: [PATCH] configure: Check for symbol from libresolv instead of main
+
+This checks will fail with modern autoconf and compilers
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 0d2f613..f737f87 100644
+--- a/configure.in
++++ b/configure.in
+@@ -46,7 +46,7 @@ AC_CHECK_HEADER(linux/atmsap.h, ,
+ 
+ dnl Check for libraries
+ dnl libresolv is required
+-AC_CHECK_LIB(resolv, main, ,
++AC_CHECK_LIB(resolv, res_init, ,
+ 	AC_MSG_ERROR([*** Unable to find libresolv!!!])
+ )
+ 
+-- 
+2.37.3
+
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index 70125102cd..86b9112ba2 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${P
            file://0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch \
            file://0001-make-Add-PREFIX-knob.patch \
            file://0001-include-string-h-from-memcpy-and-strcpy-function-pro.patch \
+           file://0001-configure-Check-for-symbol-from-libresolv-instead-of.patch \
            "
 
 SRC_URI:append:libc-musl = " file://musl-no-on_exit.patch"
-- 
2.37.3


