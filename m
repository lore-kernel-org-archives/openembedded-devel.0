Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59108C61DA7
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 13:02:40 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.101346.1674824553459995994
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jan 2023 05:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DPE+O3aU;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id j17so8067722lfr.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DyvR5hX5VoP1LvAiwx7ijG6e67Ww3K+tuAoFtRC4aAI=;
        b=DPE+O3aUUstf0+CtDDH4WtQRJrplNXpvVSFg1e7zpYyArOFr7ddl1CGrIoZGP6wxJB
         IVqVd4KQPdoGi5szY2oijN2CjDez6MDrjEDBljYQ+SbCD6+7sWZHpAwvIY3Xbnr9NoVv
         bFMWnBw3CNt8SujbiAfLEnRB7Ng02+K+TgAHhv8jeatmK2XVKtvcLh5VPqJqaXUXNIzr
         uMEnL3FdDWNukan0d6UH2oYlCRYBqQfAvi14LA2TXdoMuBc2WsZEX377R0OEplZp+Ri3
         k54spJIFJJrnyrZ7088Tu2UlUueymZR7bS8oiHXYanR0VJim+9+xmb3KlJHmc0cIef/M
         Rutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyvR5hX5VoP1LvAiwx7ijG6e67Ww3K+tuAoFtRC4aAI=;
        b=aoiqNhw6uHDLfRZ2k/doigQ0CxG/HZs6DxY7F0V8BF23L1t8IizUcO1+D0SL112KQG
         QgHqLoG1HtVUNoLHFsMWrprv8lpDOCW3NSuUxaxptYjojZzufVGO9xZrPyWWZZHHUsor
         UaQ0AIWyjkxd0bTDga03VndWJVS+ooyTMv9aCXjh7TQtNowPeVNd5HyM5AnECKf4+3vQ
         COcjgXVC96QseLkO8pNfZevbuHfEXXsjdMijd71E4xkLk3KCSkrH2B1z33cltcqGlXR3
         DC90Tvw2ce+OBZJOza1V/pKscUJG8mr19WgYWJNjkWlafNSKqEC5IbwJ5XFD65IvGPcv
         A7Ww==
X-Gm-Message-State: AFqh2krZo32Z3C4L/ldSrXZqO25RgocPAUT4r6KQWXnStk6wugKAHFoP
	JtcKn46xLlGjOaRm05qumQVf3cjoIxM=
X-Google-Smtp-Source: AMrXdXt4eCswtCaWLEUudVtDLZIlaHtO0+TOvABhMoRuK37VtA+F9z0smDjd9GYRRqTytDUNRkPPlg==
X-Received: by 2002:a05:6512:318a:b0:4b5:5bc1:678c with SMTP id i10-20020a056512318a00b004b55bc1678cmr13546619lfe.21.1674824551510;
        Fri, 27 Jan 2023 05:02:31 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m15-20020a056000024f00b002bfae16ee2fsm4155676wrz.111.2023.01.27.05.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 05:02:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/6] mm-common: fix Upstream-Status formatting
Date: Fri, 27 Jan 2023 14:02:20 +0100
Message-Id: <20230127130225.1280161-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 13:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100816

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...1-meson.build-do-not-ask-for-python-installation-versi.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.patch b/meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.patch
index 7d1dbc6ee4..4866a5fbe0 100644
--- a/meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.patch
+++ b/meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.patch
@@ -11,7 +11,7 @@ just ask for python3 executable.
 
 | meson.build:9:0: ERROR: <ExternalProgram 'python3' -> ['<...>/recipe-sysroot-native/usr/bin/python3-native/python3']> is not a valid python or it is missing setuptools
 
-Upstream-Status:  Inappropriate [OE specific]
+Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 
-- 
2.39.1


