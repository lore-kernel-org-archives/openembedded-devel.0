Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22928C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 13:16:11 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.5285.1636118169860825197
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QqED5oj8;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id s24so11126563plp.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L9dpXRunL6kExB1wxPsMGlQMRu1H+zY3HPi2jckR35c=;
        b=QqED5oj8rbs0vq7izAdOdCJz2FgwCGe3Mz8OEsklC4T01AzMHJorfq/AOHp6IYbMa/
         oRoLaeDRGMPs1NyBzmH85RZIdh1s+kdCH1XbTf1V3/xZjQOpg/gabN0KxKEkE2ix1rdp
         tSlLLvPAmxULahJeIk8kdAMArJPHvfPt/ve5gses5TNECWL8EsfSOOm33hG9prlRJkN1
         7HDIHBUBubSWbPSWKmcfSVpgCIGy4qt8cUxEeIjFoVN2dkWp08AUVlMEEPaAXuqn+UMe
         TQunmA/ZrxiiP6kpG+9XojC+PYzMZxNZ8ZVvqAaB54sCQjoaBQEtpyEI1XO2BnttSy6r
         qx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L9dpXRunL6kExB1wxPsMGlQMRu1H+zY3HPi2jckR35c=;
        b=imUUjZr3CWNAWLztLcNnH4zGtfv3rXb3zbUEGJHOigpCSpAUvvIm086CYZa3odvUuH
         LxlMk5jgJ/E0fzq4MKGrt/sazhBAND3xwJdjtO9AHw8/WmGjapObOEw7CmwAKRz3XgdN
         6zn2kMaF8C2Qtn7zCLmFQHS5IBFSXb2RM6jt7A7v72fhpA7+HcPC14eaPx9wcWln686o
         Y2wcGjQzQZXg6E9vAnBCwTXmKQg6Jhr7i+xOFBEixVDDhUqV7q3J6rTeHGUH4kTluaO0
         ZaqwxAUZZv1AR6xWSaPzyrVkfQc31BbxsJ7amHApSJe7U0tivr19rlLruyhUGkU1WxBr
         AsKg==
X-Gm-Message-State: AOAM5336A3ZIbiXKJVJJDuSLPwRi1OfpqrGVtjhtdkTC4hnvOb+FAHMW
	jBBdXfRZXECECpUvP0DBYg6G3vACXUQ=
X-Google-Smtp-Source: 
 ABdhPJzSrj91Wr8oCvAhJUOBOqsuyea4Q2Tt4CFSsfejoaD8A3MVlJxwAT+0tdmC5BNuThoUQr8RUw==
X-Received: by 2002:a17:90a:7e82:: with SMTP id
 j2mr30209249pjl.165.1636118169071;
        Fri, 05 Nov 2021 06:16:09 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:1036:3e93:cc4e:1fe7])
        by smtp.gmail.com with ESMTPSA id
 c85sm7899124pfc.146.2021.11.05.06.16.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:16:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 08/10] drdb-utils: Define SRCREV_FORMAT
Date: Fri,  5 Nov 2021 06:15:55 -0700
Message-Id: 
 <4b8f554f4d19b96700ac76f3174b6f7de90573fb.1636118048.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636118048.git.akuster808@gmail.com>
References: <cover.1636118048.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 13:16:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93840

From: Andreas Weger <weger@hs-mittweida.de>

Since it uses multiple fetch URIs make it explicit to define SRCREV_FORMAT

Signed-off-by: Andreas Weger <weger@hs-mittweida.de>

Change-Id: Id1d0a1062d09f690123b2a1c06137ae5c04d7b20
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
index 5dabdd51d0..2609362994 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils \
 # v9.12.0
 SRCREV_drbd-utils = "91629a4cce49ca0d4f917fe0bffa25cfe8db3052"
 SRCREV_drbd-headers = "233006b4d26cf319638be0ef6d16ec7dee287b66"
+SRCREV_FORMAT = "drbd-utils_drbd-headers"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


