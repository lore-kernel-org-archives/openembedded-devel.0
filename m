Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806DCC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 07:36:40 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.5798.1646120199275669945
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 23:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f+U2WrzG;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id u16so13405442pfg.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 23:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5fWf+et89xVeaOJYw3uZYp2s7CtHbKmAIsCXYtyAhag=;
        b=f+U2WrzGJAuMjUe93eTYJymQdt0spV4RM8Oy/LkUHKnFEUNwKt1xMBSz5DfTwRa2mA
         7RAqqk1MYEk0WQsIgXjJml7eKg+KNqPfZXObBRtLevdw97C76UGU957uFMWtfo7Iiq8J
         +cp37RmGeV8YSW4DFSTRmjRoeWT0UwkVH/YUJMHUtg36nigmyMondxNcXfd4hNukKlQZ
         +H2OON1q3NYn2BGYLnF/iGlVQPIfBLPJ1SBNCNY92Rgkt9UT9vci+BIdsxTKSFIF7jsp
         +frlgyb5ly4KNiCTTh0FElgeibfiz9/CkPUpyfCd0lYQb9NTDmpd9ameIJe9ZwGLaX9e
         OTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5fWf+et89xVeaOJYw3uZYp2s7CtHbKmAIsCXYtyAhag=;
        b=mUxQLplRrWcPjIYEtNmEqnNA6lSuVr5Ld0zQ0ytqql6NQCSQMlYYkr0GcOcTIaFoeF
         vHmc5I4VV481i9jq5It9ZVnQluToPF4sWS7zD3by/h0sWIsU3ievI1iTqeGB7o8uH8Po
         FE3i/kcfDIaGb4nGRxnil1xLP40RHMUc19lXZByotXF/IF1XMFHocXKPTHOuSebht1Hb
         rsWnOSo5MLSRBan/0p/iX0pNBgUvJPDXKJzLwf1HKGtUqUlgGBYl+Fo/okRlpeFk3dD8
         8yOb7Nk7pMqebAevW4u4xlMR/TAP8LHpmW/Lc97Szu3VVCrerUF5Wbksfq2JaYbuI6W/
         xw7Q==
X-Gm-Message-State: AOAM5302tBzjzEmeui+wVb5JdklLf4pCQkoZQvIY0eSUoaxbVmKxTpeZ
	b5No7kjJlYrvMNzlebYUJjKjjXdALoD1Gw==
X-Google-Smtp-Source: 
 ABdhPJxSzYDT7yWem7X5OW0XTGEU2lgANs7DmP7Pfq33sa5y5ToTbc/6SGvfwsXp+NhUTVQsbFQBvw==
X-Received: by 2002:a05:6a00:2402:b0:4e1:3df2:5373 with SMTP id
 z2-20020a056a00240200b004e13df25373mr25677359pfh.40.1646120198587;
        Mon, 28 Feb 2022 23:36:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 cv15-20020a17090afd0f00b001bedcbca1a9sm902979pjb.57.2022.02.28.23.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 23:36:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] menulibre: Inherit distutils3
Date: Mon, 28 Feb 2022 23:36:36 -0800
Message-Id: <20220301073636.1923510-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 07:36:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95619

It does not work with setuptools unfortunately

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
index 3d0e55d360..db9004692b 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb
@@ -9,8 +9,7 @@ DEPENDS = " \
     intltool-native \
 "
 
-inherit setuptools3 gtk-icon-cache features_check
-
+inherit distutils3 gtk-icon-cache features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "git://github.com/bluesabre/menulibre.git;protocol=https;branch=master"
-- 
2.35.1


