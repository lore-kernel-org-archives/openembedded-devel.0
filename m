Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E18C7EE37
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:32 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.9134.1685521585262485000
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=eOhqLxIk;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.54, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f4d80bac38so6136099e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521583; x=1688113583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mN0n+oEEj82ZKlUrcvNEX/0VWQmd+lX7N51pww5y1Mk=;
        b=eOhqLxIk9uC0X3F/Zdb8fBL7IXdH5Eutcb8wNbXJXzNdIda8xbM/IN5QIWmyHS3ElL
         8Cgv6j3wW4ht3WLCaV26S1wqVtVGcCCPoSk0k916z8TEYwhbr/gVwor965XsQCxVgveK
         YMUttu6haHGhsL9b8rTaJ6iuxdLBDlpR+j17FCzWvasetRJ3NhUaHmQfte5MKTdtDH2W
         oV0M4SjSTsUKT5cpFNUj8vf8AvJoNudDfSvlzb4gwVb27p+zcQHuXXX+CJ3bge2piM4W
         VrrMC+YPGQ6PIzFvIltxYm4Wmx1iB0GknYRdSw+ti1psuVFchV9zVrVvCjyMSvzHrbaj
         NrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521583; x=1688113583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mN0n+oEEj82ZKlUrcvNEX/0VWQmd+lX7N51pww5y1Mk=;
        b=d5gdee5bmGxw6ZaOMsJvOuouHGi1TVXiA4Hr5RuNgLEUu/ORUv1S7fTzqa0bMSSxGb
         zsvXFzpM8W5vU5h5Yp8Y689DU5uT8z4Cd0gFGGhTxcmh+C63J0lrNT26BdPpiLaP01Tv
         M9pj8JlD8MObNNdPruYtPdgRNy1SZRtDf6ZlN492lUu+BCU0hVPJdTLzbmIscnyx0/9G
         NC57u4WsuUE12XohprxECcum+UrA93jv/WZGFXsK+0RJBQdD4x+Z1bea6GhYqZenk3jh
         ku4gFQQwBypXCwsAK52QuKlshPLGG0qH3K8CMgNncF7lZnL2dhwxXBXKCsp76D9XbZoZ
         9NJg==
X-Gm-Message-State: AC+VfDznJnbsb/IyM9qweh3lfujuZ+AB8DiDYMUlG+X4/hsSam+oz6DF
	kBuZoy7e3CSIjHplsROsVGWkXyQuLr1fbwFdCFA=
X-Google-Smtp-Source: ACHHUZ6w7XELT0tjSwi/aUyCZ3PfxtIm7QrLYA22tQqBWayezSTR1hsWLLyXYzICzqXPwr55xU3uWA==
X-Received: by 2002:ac2:5dcc:0:b0:4f3:a0f5:92e5 with SMTP id x12-20020ac25dcc000000b004f3a0f592e5mr1915063lfq.31.1685521583523;
        Wed, 31 May 2023 01:26:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 069/149] python3-pyproj: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:17 +0200
Message-Id: <20230531082437.10646-70-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102996

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-pyproj_3.5.0.bb       | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
index 0285e33aa..918911b66 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
@@ -10,7 +10,13 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "9859d1591c1863414d875ae0759e72c2cffc01ab989dc64137fbac572cc81bf6"
 
-RDEPENDS:${PN} = "python3-certifi"
+RDEPENDS:${PN} = " \
+    python3-certifi \
+    python3-compression \
+    python3-json \
+    python3-logging \
+    python3-profile \
+"
 
 export PROJ_INCDIR = "${STAGING_INCDIR}"
 export PROJ_LIBDIR = "${STAGING_LIBDIR}"
-- 
2.39.2


