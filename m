Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE3AC6FA86
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:24 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.11137.1662276923545233578
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bBB3q28g;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id q3so5723903pjg.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=NAJSJJZhZmV1V4MP0jdJv8OqsmgXHkYy83o0HeoxbtA=;
        b=bBB3q28gJRuSD6XsDsZ6/kAKBnzzNvcxX3yb8OquUcdF6NxOQJPVpVWrqBPy/ZYqhe
         /yI3nGsp5sI7QAS9Nee2jIT56/g3z3tQ5p94E5tlQvmUUtzSR7VDi3zJXy2jsDQeO0Lx
         3mAPL3I2zVxifXqdQi/Z/WRg4/9gTLFOEArRoFktli+rJXTlnED0NLlDTsiUim9hc/xv
         KjBrje+UDeju/ko2tYOcOlSRox0woJRaok7pdd/jyj5jo825wDRXQ1T6qQFGcPWSXCUh
         Its11TTMHZ5BeqT+LF3Yynb8fWHJzte0ni0TgeuQ8M1u4DAFNG/dSrG2Tw58U3IqCcyY
         S7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=NAJSJJZhZmV1V4MP0jdJv8OqsmgXHkYy83o0HeoxbtA=;
        b=SOYI8DT1uXWJTarik/xVX8HOI1dlxrDWwRExj9dvUcA0NLDVIM+3tLOokSlyDStNjf
         ikWh2+BM1lglZc5WfRSejA8V18Wb73gfTnboPQeJlKCpJ36GoWz4GK3kpGGCLm6cj2je
         H4qg2dioeOgi3PloFNOvOHMhWbVz9sTU+6eBpBdGaVJEBEhn0SIr8qWWLxx7RZIxmQlV
         sQopyQJpDGOMUbXom49FRQXGNmB3FKPO69ek7RjQUqs3M9jxsWsBZafBkOTEPngDsXHV
         0SVfYNjIjw0uQnZ6jgFHYWwviM9aP+QaZ2lab2kL0riOeuWiEsiZWjU9o/2r/UecrmSZ
         gxjw==
X-Gm-Message-State: ACgBeo3tmuhOhw4oKrnX96wfC0mZi+xVX/MteFQsx2e0DoDC0W+tKJtQ
	+YnzE9xWg56wilSNdxYJxt/94sJiqpO5fA==
X-Google-Smtp-Source: 
 AA6agR4DZvlSGW17xyd6nY3a1l0sm3s3+rd50ctRcfV8DYY81i0Jl6YMjwwr8ptFPkcxgC9CqPncpg==
X-Received: by 2002:a17:902:e947:b0:170:d739:8cbe with SMTP id
 b7-20020a170902e94700b00170d7398cbemr44391469pll.141.1662276922663;
        Sun, 04 Sep 2022 00:35:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 61/63] linux-atm: Remove AC_CHECK_LIB for
 libresolv
Date: Sun,  4 Sep 2022 00:34:15 -0700
Message-Id: <20220904073417.3251865-61-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98655

libatm uses res_search which is provided by libc now a days in both
glibc and musl, we dont need to error out if libresolv is not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...for-symbol-from-libresolv-instead-of.patch | 28 +++++++++++++++++++
 .../linux-atm/linux-atm_2.5.2.bb              |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-configure-Check-for-symbol-from-libresolv-instead-of.patch

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-configure-Check-for-symbol-from-libresolv-instead-of.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-configure-Check-for-symbol-from-libresolv-instead-of.patch
new file mode 100644
index 0000000000..abae366d28
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0001-configure-Check-for-symbol-from-libresolv-instead-of.patch
@@ -0,0 +1,28 @@
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
+--- a/configure.in
++++ b/configure.in
+@@ -45,12 +45,7 @@ AC_CHECK_HEADER(linux/atmsap.h, ,
+ )
+ 
+ dnl Check for libraries
+-dnl libresolv is required
+-AC_CHECK_LIB(resolv, main, ,
+-	AC_MSG_ERROR([*** Unable to find libresolv!!!])
+-)
+ 
+-dnl We don't want libresolv everywhere, just with libatm
+ LIBS=""
+ 
+ INCLUDES="-I\$(top_srcdir)/src/include"
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


