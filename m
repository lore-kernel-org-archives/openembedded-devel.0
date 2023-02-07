Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592F2C636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 06:16:29 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.77481.1675750579461688997
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 22:16:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UoSdR3ni;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id i5so5317230wrc.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 22:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGsgWg79oYBHO3ucDN5oaK3tymWP+ZJ7E4PNmhGvZ9A=;
        b=UoSdR3nikT+7BEtU2Gvi4nxBrrGi55gGPowoYr6dcLVRHmQ1zDsPx34A9ydMKvBAYx
         pCc85eR0iPcmzDHxYrvBbDscDn1/6qYye2zNJCPyWZsT5DpJ1imSqr4eFD+kwsuaoAMD
         LkDB3ss3EjVqDq6NFPn5HwFPu9ONY8b3UG1y2dB7U3WRnfx1c1FtJFh8V3w6w4s3tpEP
         4iml5okwV4eEbfunViJVgUConD5BQTJVSh6TK593jWoHjanNtTNedNw1L62ysKubLNAT
         tUVWoabAdQ7Ut80P8W4+3nFGxfUdpN+/ZXXXGMrHi2XTFfY3nj5xazvnZ99NE8Yp8hBZ
         kWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGsgWg79oYBHO3ucDN5oaK3tymWP+ZJ7E4PNmhGvZ9A=;
        b=soisuHCs3pYuAqAPkODqiIJvQ6YOh4oeUcJR5n8QVoG5izT2BCoYzMPK6u0gjuyImb
         SEWeZGitkM89AHlgtyIwZN7UhKj4EqXtcFpRl8kZ5+ue81HhMEvLGXXDs14LjcGP2FCl
         GX9uCoocFSZ26UxVTwtlS7FqPzeuPgTBQz+O/9u6IpK+7I7aMdHtGe834iRxeiQ9u08/
         qcPSPS2g0V8A41nbv1LlvZXVHPI9zXWGZTqPJFgbua0nLgU6gCWwsgSln854dcrL9G/+
         RJq6XSFNAejH2/RwJaf5FzQcsuddyUsvsnGN9vE49Q4OnKqid6TPfNieDkf8C594prMy
         4Khg==
X-Gm-Message-State: AO0yUKUh3vZMrc/A2Y6mqY4defUSPZ0zmTfSDnpb8Kl9lJ8ovhrR6kYE
	wzDugljHWPW3OfHqx72/Q2zZR2KNhWo=
X-Google-Smtp-Source: AK7set9UVL3jASuwxz+MAStfOCxokQqMmorpCskheTchvkxa2kw7rOyD0AenuymZbLCT//OGeptTDA==
X-Received: by 2002:adf:fa10:0:b0:2bf:ad43:8f08 with SMTP id m16-20020adffa10000000b002bfad438f08mr1580985wrr.14.1675750577673;
        Mon, 06 Feb 2023 22:16:17 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id bl1-20020adfe241000000b002bcaa47bf78sm10169968wrb.26.2023.02.06.22.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 22:16:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][langdale][PATCH] nss: fix cross-compilation error
Date: Tue,  7 Feb 2023 07:16:01 +0100
Message-Id: <20230207061601.615419-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 06:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100955

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Change OS_TEST to be soft assignment so that the cross-compilation
doens't fail with the errors like (note the difference in CPU tags):

| make[4]: *** No rule to make target
'../certhigh/Linux3.4_x86_64_glibc_PTH_64_OPT.OBJ/certhtml.o', needed by
'Linux3.4_aarch64_glibc_PTH_64_OPT.OBJ/libnss3.so'.  Stop.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nss/nss/0001-nss-fix-support-cross-compiling.patch     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
index eb6174a7b0..950fae667a 100644
--- a/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
+++ b/meta-oe/recipes-support/nss/nss/0001-nss-fix-support-cross-compiling.patch
@@ -18,7 +18,12 @@ diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
 index 2012d18..78fca62 100644
 --- a/nss/coreconf/arch.mk
 +++ b/nss/coreconf/arch.mk
-@@ -30,7 +30,7 @@ OS_TEST := $(shell uname -m)
+@@ -26,11 +26,11 @@ OS_ARCH := $(subst /,_,$(shell uname -s)
+ # Attempt to differentiate between sparc and x86 Solaris
+ #
+ 
+-OS_TEST := $(shell uname -m)
++OS_TEST ?= $(shell uname -m)
  ifeq ($(OS_TEST),i86pc)
      OS_RELEASE := $(shell uname -r)_$(OS_TEST)
  else
-- 
2.39.1


