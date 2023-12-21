Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7240EC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 18:55:30 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.2128.1703184923388440469
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 10:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7b3b819f8a3so55990339f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 10:55:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703184922; x=1703789722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hdSRuJ/n4zntmKo/wId+q7GpEH4FZIsihOR3uCU68o=;
        b=XVVOZ6Esb28+NP+7DYmorZRfSrFr9e5hRmFOK975Y8lZ/4Wrf+ZrcF4cKLIdiWi3Ro
         slpaMqyn/FRZmgMUgK9f2IcT8BzCx4kVJEGg7xqSfYumIPs/h4H+M5fC+wEBWijaHGY7
         x/tfJg/QjQ2dMvQEZpd5rszVNq4T5WXqPr+Trm9FnnGQDBkBLGDkEybRAFGva1q1EGDF
         PtIr6EzFu+suZ02odNbmt/Rnh/OeANy9U8/Y6ukrrzRFZBDW/eclF98UUSIwFoQiZbPA
         040xtjG5bUNy3lU1jN0dKpl/MKJ9eQDL9zjYbA796nBFi+dbIzgCh6j7W23tHxPYfVVe
         gxlw==
X-Gm-Message-State: AOJu0Yw5Fk1X2A+u2Dkl+NDCOH3GPiqVnOn76/bVRCQ+JFEVJB+RX+Dv
	kUHuUPmJlCYI87cpIbbUSnJoKI4rfPKy7w==
X-Google-Smtp-Source: AGHT+IE9ieQihGU6J/pRw2hjQN9RgnIG8vmTfGuX8cp+etR7//I3Xc8zb1RjtmanldEp8VMkvpt9hQ==
X-Received: by 2002:a5e:8904:0:b0:7b7:c118:6f74 with SMTP id k4-20020a5e8904000000b007b7c1186f74mr205217ioj.24.1703184921750;
        Thu, 21 Dec 2023 10:55:21 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id x7-20020a026f07000000b0046ce587aedbsm610876jab.164.2023.12.21.10.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 10:55:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-pyroute2: update to version 0.7.10
Date: Thu, 21 Dec 2023 18:55:13 +0000
Message-Id: <20231221185513.3930632-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 18:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107736

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-pyroute2_0.7.9.bb => python3-pyroute2_0.7.10.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.7.9.bb => python3-pyroute2_0.7.10.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb
index 9365a330e..6b340a18c 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.7.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.7.10.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
                     file://LICENSE.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache-2.0;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "b69d82f140b0774317d7ba40f6c5fa1d755098ba3f3eb619982d16e750dc631a"
+SRC_URI[sha256sum] = "cc2f90aad1517cb0b301041f678cc8d3c3427c26e53f15c78c93c67928d89a02"
 
 inherit setuptools3 pypi ptest
 
-- 
2.34.1


