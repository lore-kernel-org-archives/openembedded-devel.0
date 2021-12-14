Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A436BC433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 02:45:34 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.21037.1639449933192912009
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 18:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bcUQOxnh;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso16127211pji.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 18:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AdwvZfXMFDkfKPHEdLjqQzbkgFcnRaFWLkdxuY2BXnQ=;
        b=bcUQOxnhxrqRB/PyUzF1U0BBRgTceaB1mtwcqV9b3e9/rUVWB8VFlE6JYrbTfNxW4T
         ZS+OxBXfdlPydqXyohcC7fVNQTQ2yscnf6ms3l13WqBGmWwAmRgdAY5RULsOzmzCccEM
         ezPHiu92JPA0WYKKzb7A9U8o+s7gz+k60ahYniXWPanYhvmn4c7p3NpfO0H/axj/dPbO
         GmiH3EZMBaHkCqEabx3zmPlBLPWTdmQuDtIf+42QObecJ7tfofT/FiEhY7lWUU3/CxLC
         SSuvF8ISGT+zPTbmqHWKLk7/BEbw2S0eEQV/2mI/cYUSOnRA4eVOXDYldfkH2fWVMbBF
         7XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AdwvZfXMFDkfKPHEdLjqQzbkgFcnRaFWLkdxuY2BXnQ=;
        b=ZOUk6rQcw06WaCmT4sG/d510u/k+b9ukiYcF0+XpNZPtCrRSXYHLSEePbvi+SWX1tV
         rOuY1a4dBlWy4+hxVXpq4dY2ijdrrqTptl5XMB2pliPRqYAIUXIOKtMbgvsSyzD0/O7X
         y1sSVeAlJn7qxbo32eypTvSQClbH0fgzSj34RsqEoKiEq6oQwlRL/ufi2rM5THzDEJAq
         UwB+DX8y8BK5QglQ0NPsLzflukX6ob507zwiJXXnWFQpA0dCnTKWl8lfaJW1zcSZk6U1
         +tG0DCnptemtg81e1QtyWFMtc3QAFYed9e9MXFMTC4gYm6qCeLfYhIP6fdSZW2QA/h5g
         055g==
X-Gm-Message-State: AOAM532Aizjhf5nwjTFPonF8ca9O9Z0Oa7Zi3m/8l3fbB+JVRyiCEOKQ
	zrJwC6o2VMHsD8dVjDz9jH+lfKgLQugYlQ==
X-Google-Smtp-Source: 
 ABdhPJw1FqsAOuvpHwNpVFQq2f3+vrNG04oX2keAV39DzbU0cy7dGGcszM6lTNTmwy33lvE1gXz9vA==
X-Received: by 2002:a17:902:ec04:b0:143:b9b8:827e with SMTP id
 l4-20020a170902ec0400b00143b9b8827emr2309231pld.54.1639449932336;
        Mon, 13 Dec 2021 18:45:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2b9d])
        by smtp.gmail.com with ESMTPSA id y9sm429686pjt.27.2021.12.13.18.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 18:45:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-matplotlib: Generate correctly names
 setup config file
Date: Mon, 13 Dec 2021 18:45:29 -0800
Message-Id: <20211214024529.3209225-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 02:45:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94348

The file should be called mplsetup.cfg"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-matplotlib_3.5.1.bb                 | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
index f9eb79ff1c..f8448d5f1d 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.5.1.bb
@@ -40,12 +40,12 @@ RDEPENDS:${PN} = "\
     ${PYTHON_PN}-pytz \
 "
 
-ENABLELTO:toolchain-clang:riscv64 = "echo enable_lto = False >> ${S}/setup.cfg"
-ENABLELTO:toolchain-clang:riscv32 = "echo enable_lto = False >> ${S}/setup.cfg"
-ENABLELTO:toolchain-clang:mips = "echo enable_lto = False >> ${S}/setup.cfg"
+ENABLELTO:toolchain-clang:riscv64 = "echo enable_lto = False >> ${S}/mplsetup.cfg"
+ENABLELTO:toolchain-clang:riscv32 = "echo enable_lto = False >> ${S}/mplsetup.cfg"
+ENABLELTO:toolchain-clang:mips = "echo enable_lto = False >> ${S}/mplsetup.cfg"
 do_compile:prepend() {
-    echo [libs] > ${S}/setup.cfg
-    echo system_freetype = true >> ${S}/setup.cfg
+    echo [libs] > ${S}/mplsetup.cfg
+    echo system_freetype = True >> ${S}/mplsetup.cfg
     ${ENABLELTO}
 }
 
-- 
2.34.1


