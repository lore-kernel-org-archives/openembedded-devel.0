Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E53C6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 12:03:33 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.5440.1663157011015116070
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WcrZUvCv;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id bj14so25305365wrb.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=UYtigN06+hDyM0qV4OYLYmDS+ZCMgWyzAd3Yn2LLEUs=;
        b=WcrZUvCvAXcvPA8SRmto/XAK8LB20bgSgqImUfpXGSFVOMBKaD/G5/bGb+u2JTt76X
         2Q+XJgKKDlExedmx97cVFBi0wOZKmdwVmcGMw+PnCNoFVNdjI516EzFVck0B/T5QaFas
         uoQhqDbSal42CwT1xd6E89VqywSDhBA7rK/CmV8tYTbFH7tMZfRyXQ+10AT53VB80Tn/
         VFEAsWJgPJpDnLoBrBWpb7/Ty+9M8eMa2MhKz3rPg0nzqjQMVoy8UnLN0hzt5w3GutzC
         pjgasX8xts60VahNepbfIwj/VytdWbMutT3x0VmF3mYl6Dl5Ezq8oJTeIy91Fx3q1Ly/
         xIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=UYtigN06+hDyM0qV4OYLYmDS+ZCMgWyzAd3Yn2LLEUs=;
        b=rChsqRA9PPQtzfRkI+EFCbCr0dWZSCkNmzPz3s4EXTDUtpjsou5E9MOWpK8MTnX5gz
         GAyp21BD6fTqSc10PNzs8B3l2oFJVFRKKZf8ARhf0dNvMN/jU9tLse5nXPm4IbSKTjTW
         rjZogfnml0sOooS5H4zFCFdqt4/7CPwLX3NWAR6bIr8PrudITEESvHN//aNTnvZJ0x+Z
         dxroPk/q5QzfTz3YsAd9h1SXhOAQuwxj+ypAx8wentXJHO0DtXk+n3rr8MN5N0qgu0XJ
         tBcOlgYc7PqK/HteRKOjCaZ65+N3Kq/nVfRhLFJS0uBJvq8n5FW3+WmctgkvfWLdAw5J
         AqrA==
X-Gm-Message-State: ACgBeo3viqEYhVEXR5EZeXPvAeMeKRuzSptZPV8O6c+dldCbbImpiVzS
	V6CZ+xkB+doY1fyKLETwBrDtfBNBEJQnYw==
X-Google-Smtp-Source: 
 AA6agR6pZ2aV08KyvVmUTHdpI/HWtT+kzAEuUHq3NisrAS4O6DmGPqafMcut7Wr83NcKYyhQ9oXr1Q==
X-Received: by 2002:a05:6000:15c6:b0:228:de49:dade with SMTP id
 y6-20020a05600015c600b00228de49dademr21112448wry.28.1663157009372;
        Wed, 14 Sep 2022 05:03:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 w1-20020a5d6081000000b0022a2dbc80fdsm13286233wrt.10.2022.09.14.05.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 05:03:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/8] libsigrockdecode: add python 3.11 compatibility
Date: Wed, 14 Sep 2022 14:03:13 +0200
Message-Id: <20220914120316.551377-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914120316.551377-1-alex@linutronix.de>
References: <20220914120316.551377-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 12:03:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98799

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-configure.ac-add-py-3.10-support.patch               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch b/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
index 85e49cca2..a90f588d2 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
@@ -1,7 +1,7 @@
 From a5835dfe126bfe6ed0b8197c6578960835bf1fe8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 3 Oct 2021 22:08:50 +0200
-Subject: [PATCH] configure.ac: add py 3.10 support
+Subject: [PATCH] configure.ac: add py 3.10/11 support
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
@@ -18,7 +18,7 @@ index 4802f35..e0e468f 100644
  # https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
  SR_PKG_CHECK([python3], [SRD_PKGLIBS],
 -	[python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
-+	[python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
++	[python-3.11-embed], [python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
  AS_IF([test "x$sr_have_python3" = xno],
  	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])
  
-- 
2.30.2


