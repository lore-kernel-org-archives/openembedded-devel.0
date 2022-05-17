Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62379C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 05:49:30 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web08.3882.1652766563555800085
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 22:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T1IHwnq0;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id y19so20552060ljd.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 22:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QhmDQZUjPq0z/TVc4M5+7MN5CIgyTlt64k29WNXdfEU=;
        b=T1IHwnq0Hic+mjHGjmbCHchcegFKLaCmaHIDSrcJIoourWVoGktpfZBrhV7IJP/D6p
         IHWmHT+gkJ1Fd8ArTAnrkovE1Iveong0VfEidXsvxfC03Z+Ss1Y9fzN6ThhggVyXOJfo
         MKkCnYc4jpOEXaDbS7jlERfXjxM8csH1kmBryPiWB1gle5C/Z1lGjDxuIm1UXQVGvew3
         2zzDEclIzaXd2caBNbD2jmI7lZ5GRoEXFLddljcIvCe1aEwIK4+SFkdN1LMNbr3yqy1y
         tp36FK7OADRi0k6XJi4G4og37+y40h3EnfmrBZmLPXnvV0/XbYTdeJfM/a2YPdGrftae
         k+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QhmDQZUjPq0z/TVc4M5+7MN5CIgyTlt64k29WNXdfEU=;
        b=XPD8kAu68h86ukx4ISB5rE5h0fNdBXCnJ0lWXEJGs+2eY5vxn17eAwIqKY7sbxYQyH
         OQnu5BZ5yeJvhLJj3untH5xwAZ+EKVdg9zRa6xNLCzDNIH38ciCwexnfc8tXM2/+Pekh
         euTLzXquOFHESHx0kQyYKNE+N4+6KRwd+rEvejp/qUdKwl2m+NbT53H90Vr6GtCLZHpY
         +xiQFP4vPEgFHDnrVLH5aRILnOHU98tR4ypd8D26hEON/UMrBaH1M1BiQ9nP+9f5V4Fg
         hjCbF0b7A7rfBDLhWZub6XvHcPe9GGZvJ1PvjrxXb9UOPiZenDx/GiBihCn9NgMnSaTI
         QB5Q==
X-Gm-Message-State: AOAM5333/3vAsQ3ecqwgLy+3YDNjbyo3vqYmjdTHMlBVfuFQsobHdDRI
	MSYWJ25c354okWM143tbVykEQtd5nWI=
X-Google-Smtp-Source: 
 ABdhPJyw/xGX5660+W4cw91AehM1oeYAxYvZ2LqXfKJRHN6KrQ5SOufXI6C5OiPdvqj1uEjtLFd4/w==
X-Received: by 2002:a2e:8648:0:b0:24f:33f9:93b with SMTP id
 i8-20020a2e8648000000b0024f33f9093bmr13352504ljj.502.1652766561092;
        Mon, 16 May 2022 22:49:21 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 r8-20020a19ac48000000b0047255d211d8sm1482210lfc.263.2022.05.16.22.49.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 22:49:20 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-qface: upgrade 2.0.7 -> 2.0.8
Date: Tue, 17 May 2022 05:49:04 +0000
Message-Id: <20220517054904.945946-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 May 2022 05:49:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97151

Adds compatibility with antlr4 version 4.10.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 .../python/{python3-qface_2.0.7.bb => python3-qface_2.0.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qface_2.0.7.bb => python3-qface_2.0.8.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-qface_2.0.7.bb b/meta-python/recipes-devtools/python/python3-qface_2.0.8.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-qface_2.0.7.bb
rename to meta-python/recipes-devtools/python/python3-qface_2.0.8.bb
index c42b91fcd..47a34d44b 100644
--- a/meta-python/recipes-devtools/python/python3-qface_2.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-qface_2.0.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "A generator framework based on a common modern IDL"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eee61e10a40b0e3045ee5965bcd9a8b5"
 
-SRC_URI[sha256sum] = "fae48ba129c55da8445580eb711905c03911c4250761c0cd53c67e33495b0cee"
+SRC_URI[sha256sum] = "eccee7dbc4290c5a4e394df8d527f39148e0de0ff22c6b260f48c48f12b3beb4"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


