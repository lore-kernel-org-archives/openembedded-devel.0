Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93872C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:35 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.4326.1634338595034670446
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=PyqovlVk;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id n8so47476487lfk.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T8r7WIipq/7fOtrYBs26IY1YvZHt0rR99f8zy1GU3SY=;
        b=PyqovlVkWZixdvF0No1Nb3PxqA9mNV06n/ScaNcHCM7tdcQoEQqM1SLqK8hzSMm/Qz
         Bbi4LbWwrwwL+B4/FcwidKgppRaPL0cD9UrTFYOjdgZ1mK8pYqaIxGt7fGup4Bk4HlRo
         6BWIbUvXSCXKbrOQu5vpB6XpYisi6+kU2dTc04jFXzW98JrPHi/Ewj/8a/tDIvaVpA+6
         2uaE8BVUmgjp3mSKNMp9gJIJCyZVk53DXf+TzXM9qmhe+7x0B9xJrKjp7ruGK29T1KAe
         DM3WZfkqYm0Xss/ebUwviH20tUNKH0Ibkr48bkSkhzPyZGCuSegz5ZrKGqIMCkQygwl/
         4Bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T8r7WIipq/7fOtrYBs26IY1YvZHt0rR99f8zy1GU3SY=;
        b=jM4QrPf1Q2kTAtN6Eu7cEQt71kXGgyY/0++q5KTGwK/klQI9vAPxyiSW381cOhO8n3
         bTo1mro+6SzAv8/FBiRcIVcTHUMm13LAaTdDtqVg5fLo2R0oS6iAprkh215/b16PAeg2
         V/onA29lXaNWTo2qw0kAoKkROW2BDgSkFZuieBosjXSMfrYZrUJNwkkJ2ORb1+KNx/aF
         8OyF2rzKy9pIi+T13u6Lgr62H9CFJ65VOnY7C7/KIvnvFCTD7CAWmnIes6PEeb1vHYwo
         MZPUTn9YWzW6PRh1Zd0dry7HnEatoLY4Trw+chw0GCTxBY5b+IReLSGmBRAwADBq5vkb
         f9Xg==
X-Gm-Message-State: AOAM532rqWjpt5Y/Rs06dJ//WsPaU3I8IS9zhV9z81MoD7lxuC3SW7jk
	a6ycFiT5d34r93WDdz+EBcIfAO5wIy0JzHuP
X-Google-Smtp-Source: 
 ABdhPJxKu38sK6PwPJ4DcRbW7xkVNxyatBXw9c0WhyWF/Si/JepIQ+OtZCbgKNypbs9BGOE7LQsDUA==
X-Received: by 2002:a2e:3902:: with SMTP id g2mr15603709lja.321.1634338593024;
        Fri, 15 Oct 2021 15:56:33 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 p8sm657041lft.242.2021.10.15.15.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:32 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-msm: update to 0.9.0
Date: Sat, 16 Oct 2021 00:56:31 +0200
Message-Id: <20211015225631.4163041-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93361

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-msm_0.8.8.bb => python3-msm_0.9.0.bb}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msm_0.8.8.bb => python3-msm_0.9.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb b/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
rename to meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
index 848b25dae..c0ac9e0dc 100644
--- a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
+++ b/meta-python/recipes-devtools/python/python3-msm_0.9.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-manager"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[md5sum] = "cf1fc0d1d86af68003cae53c71ec6288"
-SRC_URI[sha256sum] = "a502aee54917cd394217b31c977a1ba3d9541a0120e0a045c49fd77b328e4a29"
+SRC_URI[sha256sum] = "3fbed593800aa669f0af2f01edfc3b54de46e995e0bdf03c5ea3693bdeab8735"
 
 inherit pypi setuptools3
 
-- 
2.25.1


