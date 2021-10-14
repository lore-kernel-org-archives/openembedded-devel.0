Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ABBC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:49:04 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.8988.1634215742651945708
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=O2YaLM5B;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.48, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f48.google.com with SMTP id r19so25956163lfe.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oSWh2bIF7FacMStJxgewbPBceIkLeMC9uaKSmWdTwmI=;
        b=O2YaLM5BNjhlkeV3c5AQsmaVmcu+IjpHVzPDVCe9h//TO9culW3Vbpn0i3wUheFOim
         MOpC8Zr3vLcrzgypWyEC3VesrTUL5Xlp4j9pmSCh66IUejMMIUdl8A04OGwC29r3cJpq
         eCTQsfj3uc3HHr+c7w0wBlJcXRUmUHkZrPcomSb44eyqFJY20tZqQKyN4QcCAvWnhajx
         ivPd3qbcwE658zTu7vm9KVDAR+VSoNfk64PDAs/pC70qCmTJD3Yml4Ud0OgfMDJffG3P
         juvCRTJh9H0LESuhA8qAxVpMDgQn/qz/QWFOXudO72euTpvqFA5dGUD5zXBx14j87H6j
         CscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oSWh2bIF7FacMStJxgewbPBceIkLeMC9uaKSmWdTwmI=;
        b=t+RsP0qYmExRzmOxd1TtcH3tz2YeENksXTD1Nn4h+UQbfRei0wDwzNomzadaf/08Y0
         aJ84A8dodLnTWcl1lljHOCTMQNyqxpkhY1fz9YaL5+5FsMugu/wKZEcnNFpoSsKOcwBY
         0npDZIAbxseg8oOccqWVDo2g/RcenBhkVyukg/QrHOZtQtbCyQ8thcFft/dCsdX6QHXJ
         DFQXYgi1NwQzjE9c5Bf/UtottZclEIeVPT/AHDdo+8Xvm8UNJ1HNAJlhS7Mf45EKPxgu
         D1GRPEZxxqe5AoijEXyMWsDuYgAbE0GVDKFxxtB8M6A3ogMA1oEkyz3PPWXL1hgVVDi1
         +ZmA==
X-Gm-Message-State: AOAM533y9c/wfwMSLOkfFsIBd4Xn6pcjulkcpkGf7yQiD3Kd3viX+Kuo
	7BLNvYevYBxpL2/ZlMBY8qHyWGb60JU0UcZ/
X-Google-Smtp-Source: 
 ABdhPJzzZtrFcglZBymnDMl7Ce2pn+bwUvYS2EV7+xxxYbH3gvvCauaVvWkS3kQhtHc6/X79W4ZPmw==
X-Received: by 2002:a05:6512:12d3:: with SMTP id
 p19mr4898432lfg.328.1634215735672;
        Thu, 14 Oct 2021 05:48:55 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 z22sm255981ljh.73.2021.10.14.05.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:48:55 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-jsmin: update to 3.0.0
Date: Thu, 14 Oct 2021 14:48:52 +0200
Message-Id: <20211014124852.1345370-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 12:49:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93291

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-jsmin_2.2.2.bb => python3-jsmin_3.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsmin_2.2.2.bb => python3-jsmin_3.0.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb b/meta-python/recipes-devtools/python/python3-jsmin_3.0.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-jsmin_3.0.0.bb
index 1a0578edd..7990bb014 100644
--- a/meta-python/recipes-devtools/python/python3-jsmin_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jsmin_3.0.0.bb
@@ -5,8 +5,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3a3301ce2ad647e172f4a1016c67324d"
 
 inherit setuptools3 pypi ptest
-SRC_URI[md5sum] = "00e7a3179a4591aab2ee707b3214e2fd"
-SRC_URI[sha256sum] = "b6df99b2cd1c75d9d342e4335b535789b8da9107ec748212706ef7bbe5c2553b"
+
+SRC_URI[sha256sum] = "88fc1bd6033a47c5911dbcada7d279c7a8b7ad0841909590f6a742c20c4d2e08"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


