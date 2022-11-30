Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F89C4708A
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 07:19:22 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.5176.1669792759468277035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 23:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oIoW2fQL;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so1085099pjp.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 23:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMIKAEFIQvSTs6HMu89exyJDjLI16zi/c499Jw+BQi0=;
        b=oIoW2fQLEgUoL/zrxMB6dp3KPBnZhB4y82lsfamGseYmbJJ4rvGZFCX7BwM/TsKAFZ
         CL9LhshLr8W/q7K2XKZOPryiNvoY5S4V21wLuZTkZaEZ/sWF0YISLYnShMqaDyyAbPe3
         gjSCjOKz09mXIqnn36PR0E9rhsVUcHH3s45RvZEtr5QNzOn4gfn5ndipmqYJtYEGMnES
         wx2vDQAqeFnyDIci9aM0RcRus+aQ8HQV/ywYEzI4jH3/pqDa0waEaMrVrxoVqtDg12NU
         Xj0ovAknR0QPKxPOmBFl5hC42OJetNbNxmuMsI2lWqjFRdmaLBoe4okBz+LtYLhksHUN
         6ZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMIKAEFIQvSTs6HMu89exyJDjLI16zi/c499Jw+BQi0=;
        b=0an2u+dszin4L9qsylm+K1DEjy6Qh6QY1s6rAWDJigpCQU54xP8f59AW8S4J5k4MGc
         2luFsaVtBokMV8RX0BOY6ndiqLJ0GT9wkgRrYFKhMHmLdphXsNPvBLi9kQ5yveYGfJrj
         kol/gkci5MQSQw0Dstym4E84C9uvc9SuyBBrfK/xsqfyADiJt1B/Y+z/4XlKNaj71Ves
         lfnPa9d1pZ/KXnSX5F/QnFyJgfnQhYZsfHi3X9onEXo6qx7Nc0a3lFDsyyz94NPGehAt
         brw7UcfPYR5aaQDEuDMkPhh9NeMyvR/+qlI4K0OeGq3dUdEKbfLASsjdVMDBCYPH/NnV
         OkAg==
X-Gm-Message-State: ANoB5pnGdCTxkFRLF33le8DJjGPsKtN096QiZb3VrKcHRXDLoyhGFRDi
	UZlyYQfuya0d1V0Uew0YJwDK9OJo5P4=
X-Google-Smtp-Source: AA0mqf6iddgvthY+9fBESd8V7o7Zdu8Rzgbt5GxJZ31WfYSF6apq3ceiQpF4MJN9woMt/XlHc5dOsA==
X-Received: by 2002:a17:90a:598a:b0:219:1747:f193 with SMTP id l10-20020a17090a598a00b002191747f193mr22725674pji.180.1669792758597;
        Tue, 29 Nov 2022 23:19:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b00189812a5397sm577447plb.180.2022.11.29.23.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 23:19:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 04/10] python3-pyproj: Export PROJ_DIR
Date: Tue, 29 Nov 2022 23:19:07 -0800
Message-Id: <20221130071913.1805812-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130071913.1805812-1-raj.khem@gmail.com>
References: <20221130071913.1805812-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 07:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99861

point PROJ_DIR to staged proj-native which can be used during cross build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyproj_3.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.4.0.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.4.0.bb
index 62eceb2c09..a15a05ea2b 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.4.0.bb
@@ -14,3 +14,4 @@ RDEPENDS:${PN} = "${PYTHON_PN}-certifi proj"
 
 export PROJ_INCDIR = "${STAGING_INCDIR}"
 export PROJ_LIBDIR = "${STAGING_LIBDIR}"
+export PROJ_DIR = "${STAGING_BINDIR_NATIVE}/.."
-- 
2.38.1


