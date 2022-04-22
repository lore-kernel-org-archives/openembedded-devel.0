Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B799CC3A59F
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:00 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.6187.1650618272117558099
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Apr 2022 02:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HmsNMnQY;
 spf=pass (domain: linaro.org, ip: 209.85.167.49,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id w19so13145486lfu.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Apr 2022 02:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=psgVzb7CE2Rjuh4dmGK1/3GmhC+DO9yzrDV4/kc8kb0=;
        b=HmsNMnQYZDZmJ5XjMlXOl436CElamPJuqzi37+QKGeNwg4OC7QtBbI3PHutmWTj3N9
         0UYt4JBaN8FrWnhC8A9+DjghNZsaUUtoOmO2D+R95tI1eprisXamD78C/6cqC8c4lMhq
         YUyw699g//FSG4eJ/87IK8Azo556unc25/FgtMiDQGsMAArDEtqaeo2RVFEvych6XhWX
         PXKZdiLSKb7m8BBDRMoxhgsElq8h1QkTUQbq/lizkLLFdVtdDI8/215W8lmVDx3GwfLk
         gVsNj8inKY/ICsPU24n7s8Wha90RStqplzlCbEBLjCH/xDwEKsUmimztu4nA1MVKjoou
         4XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=psgVzb7CE2Rjuh4dmGK1/3GmhC+DO9yzrDV4/kc8kb0=;
        b=ec8ems57YI8Vbl8/XmWcXockN+0602IIM+GSCDpUzoV8FHQ8OEH2UtzSUKOYYex5y9
         gi5F2A7KXSdmKesG8J6rCBj8Z0t+PPCIZZZk+SG2zvDVqZ1xbpS3vbgWLQ/g8z6Sfe8r
         F6mf+/SAfcO/vzsiBaNUT8qGFUFPxIhQ9lFdMJ/bVZC7B+kawuneT3rUSM9ZNJQhPdOX
         FBdQBnGG9uJgWtfDKMS465DwDIktd1+Wo1pDzPKj9yNevZ1F45lBSjqLcDNd2A9gStDh
         J+XLp2TpnTkbelO+7dwdxv8SLFdryJy3ptG24f50/JIindYrmDgghtq/z9y6DO2o0bTl
         Spcg==
X-Gm-Message-State: AOAM532fBxrd7J5bKoc7kMKbC1kiCicKzbzYM6foxBGsJeJepwad5bg8
	8OAX4D86jth1CULtZUFNVSVi4acffrYyVg==
X-Google-Smtp-Source: 
 ABdhPJz4MxQR5c7WWSGQCvfNHDvqDHN1tFW56tnFRaWUFixIt0qK3voVdNF7CuStIcwGoG23Oz4IMw==
X-Received: by 2002:a05:6512:2241:b0:471:b984:12f4 with SMTP id
 i1-20020a056512224100b00471b98412f4mr2375420lfu.577.1650618269969;
        Fri, 22 Apr 2022 02:04:29 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 o24-20020a2e9b58000000b0024db34e3df6sm150802ljj.97.2022.04.22.02.04.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 02:04:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gpsd: add gps-utils-python to PACKAGES
Date: Fri, 22 Apr 2022 12:04:29 +0300
Message-Id: <20220422090429.454510-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96732

Manual application of the patch adding gps-utils-python somehow ended up
with the new package name being missing from PACKAGES. Add it back.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
index 8d270ec58ff9..98f7511b1d30 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -79,7 +79,7 @@ do_install:append() {
     fi
 }
 
-PACKAGES =+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
+PACKAGES =+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils gps-utils-python"
 
 RPROVIDES:${PN}-dbg += "python-pygps-dbg"
 
-- 
2.30.2


