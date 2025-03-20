Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476F3C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 06:42:16 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.1736.1742452934379041547
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 23:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O1nfeURO;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6fed0620395so3542047b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 23:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742452933; x=1743057733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M33IErEz20jIvCrY1HeZivDhb9MDy0ADvgppHKiPyy0=;
        b=O1nfeUROoiQvqqxC58gNodQl+Q+C94cbiHEYKrQQi1C7GY8BCKVgEtY/g4MfO0Mwio
         /bWhNZpU8qIw0i7KFeQq7hXEbkIsNvSEHbYHcdyk5NsDOtfpY/HaDj3bc34TZv2GlHfE
         k9ORJ/7P7guaRA4W4BXaeY2VCIIerCAO/zjtfq5M37e/ylahzUkWDgNzdDARDavfHkxL
         blTRSmIl6mokAMqfe35/6lVan75hCeJ5zcbTWPFGW7fZRzNOcVKNr5lAZuvDcnW9P3e+
         1UaiTllxC6m/GyTv+FrZ0ciB36qJI7r6lfFgMRYDEkjqAyR07G99JvIxkovr5AaoQijk
         XrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742452933; x=1743057733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M33IErEz20jIvCrY1HeZivDhb9MDy0ADvgppHKiPyy0=;
        b=W7P4+O+gYZ17qNfQaciFT+wGO0C6QWvcqq/Diz9MyZNY1/vG8Pmi8ZAasO2KYtnJ/2
         mn+ccAZ5DthLSx2e/WykEuKWVqaNXdBm2FbdUMar5C8psX10qzGIlqWB0Ax1rLi3SbAF
         ENFw81j6jKySTCA4kZl7z3u8eMs1EVG+hEfXiyYuJJHGEd4mfZcXVg4DsnbObek68Lb5
         4Zwj26MZbrKs6pABiTd23OXLo8z/zc9yf6KppDfXjnOBt/FVrljcxUgFS49A2AFHmx/V
         PRADFR59lqgeUEVCiCQGCeCVj+odS4GPJvdmgN6dDi0wrKOHoFbTrhvTrTRZYlmPvBqe
         iPeA==
X-Gm-Message-State: AOJu0YxBmBIkJwG/Ke+6B0RVcoEH8hxsOj203CGnvbJPcgaE03KNerMv
	VzZWAybUMRTg7QaFF/RksrJzMY2wSj7p8tR6TWGeIq4GtadxYsNPoR5CV1ak
X-Gm-Gg: ASbGncsImACOBUtQbTeruYBotGmV8FxXvLju6Y+hDgvnGeic1npJv2z7l7UTCWkLrt6
	A9Gx9hdnp4ATraLl0aBbzihpQrPv25oeGom/aV7upvALI5NWvmGbkHuXsaOCQ+hkc6yFKUVHZvL
	o0iCH1Xl5/ZQZoQz7kwBWFFAf5Mlw2fa8lACkxvcfdhnMrPuMimvu/00sGYj6eTjqqp3CabBw/c
	NcIiI9G+pAS3Ask1MZZA395Wj3ubX9AL7zh5el94RNu17mW22XE4xrkZKT+UUnC6jQ8WrBHwFLJ
	suDK4+3g+gUDIn5/PCVsbDDViW8yqpAN7re75VTRuO3seQteLw==
X-Google-Smtp-Source: AGHT+IETIzsRLOScq83PUKSyGqFXFG5wic271nkcdCfcXmYVPayISC7/ICyoj5BT5oG+RET04tr5YA==
X-Received: by 2002:a05:690c:380b:b0:6fd:a226:fb74 with SMTP id 00721157ae682-700ac58c2aemr24308187b3.4.1742452932873;
        Wed, 19 Mar 2025 23:42:12 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff3288bd3csm33678237b3.51.2025.03.19.23.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 23:42:12 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] hiawatha: upgrade 11.0 -> 11.1
Date: Thu, 20 Mar 2025 02:41:46 -0400
Message-ID: <20250320064146.3894-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 06:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116120

    Changelog: https://hiawatha.leisink.net/changelog

      mbed TLS updated to 3.1.0.
      Small bugfixes.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../hiawatha/{hiawatha_11.0.bb => hiawatha_11.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_11.0.bb => hiawatha_11.1.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.0.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.1.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_11.0.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_11.1.bb
index 51177185fa..b016d19ea6 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.0.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://hiawatha.leisink.net/files/hiawatha-${PV}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-SRC_URI[sha256sum] = "d6fffbe6938951b62f9e02b5382a810fdb83b1e1328f5333c1c733342a890b4b"
+SRC_URI[sha256sum] = "802d1cedcb9612fa1abba650fac7224b33e7410a17e0045c66a75413c9195e64"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
-- 
2.43.0


