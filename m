Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A95C6FA82
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:34 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.11128.1662276869216649205
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bEVMcVzy;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 o2-20020a17090a9f8200b0020025a22208so2179150pjp.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=USuqo5InIL7l0d4wGaINwGYyEh8E26R2aFhf2LKARYY=;
        b=bEVMcVzyMMaGAb5SbTCw7FMWfgsff3YYTyXBCZNE1WXpf8daqa79NSNCG6WrxGiqQx
         tIHk7wtEf1wn2kSv6nMzVVQ69FLirT5JAWB/nVusmSUGyqEKme+gBpJUwZDGJCo8StR4
         fjbgNEX7EfEFvYp/cEvxqe2RKXkU+jL65cbp5yRgDMS6e+1I9IuPMunIBt6I/EKlqTF+
         aPlCgpy8kI+aeTBtR8aosOK5LQPNOlW0Z+3ggT6/bN8hPawF1GiWfeYwQlQdDVqNvwEg
         rXvsc8Rz26ZYKhxpSpJPGvb7S0l9DwEMX60btpRTiUgzfv1CBUM5DPrt60gIXDvV7zji
         WM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=USuqo5InIL7l0d4wGaINwGYyEh8E26R2aFhf2LKARYY=;
        b=L0f6eyehkuEbRm12eK76Ft5p39CF5UEE6FVkIutk3QP6Fn7PEkYi7c1vOLkVC2rgas
         +29mJaPPBy7tpHzAuoFhLA3sKXK+9gAGEd4ul2lFJTVhf+I3vflL5VdY5B+Nyke/Xv1l
         z28HvEciTAwfxrzCwHPohi4vaY4li8NBLkrxZYz+FnJWB74LvJ/6uyTPoz/+gX/dzPc0
         fR1bOGxVrP97t4/lBdgqFE+4SExHVgeqaG4zmaPOFI+9eUKy+bEgfdxfPEfgXjKPadZO
         65jI8+1bw9HZAOz1CiR68YclnyPL9TkgScx62DNU07vbBAt1p15/OXlm8VGZWsZy5u9l
         hEkQ==
X-Gm-Message-State: ACgBeo2RaaNB8sDjgW1v1bFPV6iHvla+GnLes/4om45nEnWny7M+Mj+3
	SSP5JDd1VWFgqxwSsjXoQDfRPxEIiCyBEA==
X-Google-Smtp-Source: 
 AA6agR6D5PC/QTs8ASiPZ2Ir7xgILa6K0fN3EfRUUYtVyyWTaog815lxyTRKzvw1wx708Zq/z4+TKQ==
X-Received: by 2002:a17:90b:1d01:b0:1fe:56b:530d with SMTP id
 on1-20020a17090b1d0100b001fe056b530dmr12986993pjb.215.1662276868278;
        Sun, 04 Sep 2022 00:34:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/63] nana: Include stdlib.h form exit() and abort()
 functions
Date: Sun,  4 Sep 2022 00:33:21 -0700
Message-Id: <20220904073417.3251865-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98601

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...dlib.h-for-exit-and-abort-prototypes.patch | 52 +++++++++++++++++++
 meta-oe/recipes-extended/nana/nana_2.5.bb     |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-extended/nana/nana/0001-Include-stdlib.h-for-exit-and-abort-prototypes.patch

diff --git a/meta-oe/recipes-extended/nana/nana/0001-Include-stdlib.h-for-exit-and-abort-prototypes.patch b/meta-oe/recipes-extended/nana/nana/0001-Include-stdlib.h-for-exit-and-abort-prototypes.patch
new file mode 100644
index 0000000000..f1712b17f5
--- /dev/null
+++ b/meta-oe/recipes-extended/nana/nana/0001-Include-stdlib.h-for-exit-and-abort-prototypes.patch
@@ -0,0 +1,52 @@
+From 0e32b1a07b1b032576c7b0a73d7f1a090a50dd23 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 10:40:52 -0700
+Subject: [PATCH] Include stdlib.h for exit and abort prototypes
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/I.c          | 1 +
+ src/nana_error.c | 1 +
+ src/nanafilter.c | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/src/I.c b/src/I.c
+index e4577ae..4761af4 100644
+--- a/src/I.c
++++ b/src/I.c
+@@ -30,6 +30,7 @@
+ 
+ 
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <I.h>
+ 
+ /*
+diff --git a/src/nana_error.c b/src/nana_error.c
+index 51f99f2..c3a67d2 100644
+--- a/src/nana_error.c
++++ b/src/nana_error.c
+@@ -30,6 +30,7 @@
+ 
+ #include <nana_error.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ 
+ void nana_error(const char *message) {
+   fprintf(stderr, "nana_error: %s\n", message);
+diff --git a/src/nanafilter.c b/src/nanafilter.c
+index 191e8ef..1ab1978 100644
+--- a/src/nanafilter.c
++++ b/src/nanafilter.c
+@@ -33,6 +33,7 @@
+ static const char rcs[] ="Id: nanafilter.c,v 1.2 1998/06/10 06:58:55 pjm Exp ";
+ 
+ #include <stdio.h>
++#include <stdlib.h>
+ 
+ void do_input(void);
+ void do_string(void);
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-extended/nana/nana_2.5.bb b/meta-oe/recipes-extended/nana/nana_2.5.bb
index e0b6f569ca..c109d4f0fc 100644
--- a/meta-oe/recipes-extended/nana/nana_2.5.bb
+++ b/meta-oe/recipes-extended/nana/nana_2.5.bb
@@ -7,6 +7,7 @@ SECTION = "Development/Languages/C and C++"
 SRC_URI = "http://download.savannah.gnu.org/releases/${BPN}/${BP}.tar.gz \
     file://change-mandir-to-DESTDIR.patch \
     file://modify-acinclude.m4-and-configure.in.patch \
+    file://0001-Include-stdlib.h-for-exit-and-abort-prototypes.patch \
 "
 SRC_URI[md5sum] = "66c88aa0ad095b2e67673773135475f1"
 SRC_URI[sha256sum] = "fd1819ffea94b209513959447e4802afe2719600e7d161cd78b265a42812affa"
-- 
2.37.3


