Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B2FC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 11:39:35 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.7090.1646134774453157949
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NsIR16z5;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id f37so26316390lfv.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 03:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=czAhA7oBBkni+Ftbq/6luwa5NuENBIAgRGbLMdcgpuM=;
        b=NsIR16z5to+YhhtOED57UHW1boL4xVUdttidWHjkPI+tmDkhcvlOqfTi8x69fJQtOc
         7DKolNVzSSWbimncxAz0MUc+5e52YdpR1friCJaj0uazz3CTKGYlG4e+sqdhLgUfzK0K
         hMllgnpTKBog+eXkxbhK9g9D/mqU7Tox5tPGX6zpXTCyjYd++zBGu2WefaPZnLezGD5j
         MCjemcDH+herBIpVO47ZiVqNy3yHMZtgB0YyYhNBNDze+95SdqyVcLbBPcpbLhXKknSD
         DmRiNcvczYEUhZZFram35ZIzefNC5thc/wtqvLLtel7LdokWs6oDeA3OtuGbLSqVGxFe
         EgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=czAhA7oBBkni+Ftbq/6luwa5NuENBIAgRGbLMdcgpuM=;
        b=uTw6j4Uh3Fc9EaDklfG92aLJ34bK+g89NFiQHtEDoneJ1ag0ToCitYdkdeseC+UQ3R
         c5BQM4fxXu0B4teQqJDKWaS0mOUMxHFE60cGbTVimz4zwTCk6ot5voaSAaVhisRiuYnh
         PjflZTlLcpJC9il51sKxgA0sQqMi9twLvmEAJLub7Yejq1k98Nct73JU3iBjbuuPwrpR
         GehYvrs1+7iKZro+P69zM1Yj6KH0wCvN96sdSVEaSdvyFdC9xIOhil3QGEceFyRCLyCw
         mInhrgkBoG0kuK1jJg5JQWetIWYTzrB2THVTlEke9V6OJipv6fNkxrhJQTfI6uMQaZXN
         Fm0g==
X-Gm-Message-State: AOAM533w4BzI+X4ePamJ5kIirao1AO19rcy2E2lBkiCFEqYevIVN/DHA
	Rs27z1YdfoOJfu+sJ9piuUcGK4G05YI=
X-Google-Smtp-Source: 
 ABdhPJwbQLtNVuhzcmP7M82vC2xFLnBnQnzObSI5ug6X0SFAdrq7l9gKt9OGXL628U0qefcqjp0P2A==
X-Received: by 2002:a19:f501:0:b0:443:ac2a:b63c with SMTP id
 j1-20020a19f501000000b00443ac2ab63cmr14953341lfb.638.1646134772351;
        Tue, 01 Mar 2022 03:39:32 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 m15-20020a056512014f00b00443cd5b013fsm1443933lfo.244.2022.03.01.03.39.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 03:39:31 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCHv2 3/3] python3-qface: add recipe
Date: Tue,  1 Mar 2022 11:39:26 +0000
Message-Id: <20220301113926.3204930-3-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301113926.3204930-1-samuli.piippo@qt.io>
References: <20220301113926.3204930-1-samuli.piippo@qt.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 11:39:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95628

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 .../python/python3-qface_2.0.6.bb             | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-qface_2.0.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-qface_2.0.6.bb b/meta-python/recipes-devtools/python/python3-qface_2.0.6.bb
new file mode 100644
index 000000000..751e205db
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-qface_2.0.6.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A generator framework based on a common modern IDL"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eee61e10a40b0e3045ee5965bcd9a8b5"
+
+SRC_URI[sha256sum] = "87ce8ce7123ae57d91ac903c6c330a99273e7f4665a0ab88e6a17f9c98143a68"
+
+inherit pypi setuptools_build_meta
+
+DEPS = "\
+    python3-jinja2 \
+    python3-click \
+    python3-pyyaml \
+    python3-pytest \
+    python3-six \
+    python3-path \
+    python3-antlr4-runtime \
+    python3-watchdog \
+    python3-markupsafe \
+    python3-setuptools \
+"
+DEPENDS += "${DEPS}"
+RDEPENDS:${PN} += "${DEPS}"
+
+BBCLASSEXTEND = "nativesdk native"
-- 
2.25.1


