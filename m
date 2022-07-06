Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CE4C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 12:01:03 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.5350.1657108854427821437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 05:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LTI+w8wE;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id j3so1522672pfb.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 05:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SwCiwIpgZXjArj3+Vxges8j6eROaL/Y7Wk/MpYLdMGA=;
        b=LTI+w8wEhNkMKdg7Adu+jkOb/MC+FvjEzUFlS29sWmQa+o7qLE68yDr3zhVMDlcZxj
         h/tATAQjREop8QQpPQlwbTvzCG9OJgczGWzAxm+taZ5Kj6q0RQNS7i8UcgIiI2/trML9
         yg7BH6Nlpufy8E4qIRTio4MIWduNGPSaSg+24+hi3vx9ir48copZqcIEFBio59I1c253
         fcQYXnxjxnrKAv61DlnZT6wVW0yFxMWsZilkf2Br3jBMnWT3vU9f1Z6GU92E5TTsz6WM
         c1MZoF+28jkxwnzEB1y4PjNfFNIACqzt43esLbFGtBITsfuzGzZZQAJ7Lfts7joVfmn4
         9E3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SwCiwIpgZXjArj3+Vxges8j6eROaL/Y7Wk/MpYLdMGA=;
        b=P8VI+h2VKebh2VL3G8c8TyZoaQi5/Zt3d+6MencQ1Iu3TFeW8rGN6gk7K3M6mtzVE7
         Xp5hEI5KRS2qKs62DpYZxSRYNTtObecNqVgKkUcDqhixeIqzWbNbG9Vx4tfAvmNgKRXu
         yLD7oUNsaTlBDJ3+b0kH6/bAZ6z1qOfTFHDRwBzooZnKkuPlHZXqyYJQFDwscwlcPBV6
         wnepV1O05QNUJG3ohvOqjTZRa0vuohIGBJ9muwp6RiEGqkRpuUc+8OuYOECLmkbY5hVF
         IjJUEgMOoN1nfg4o4gayUldQRtpZgcE495r3Iskn1kwUYJwUdA5mIWaU/rrEqkDordxK
         KI8w==
X-Gm-Message-State: AJIora+KNiHRmDVL47+miBeC58kGyvGnNochsorAJR5Z+KxwYjLTZYTz
	gGxF/2GygV6NnlMsLhCAvyz5p12M82XxWA==
X-Google-Smtp-Source: 
 AGRyM1vRN/rndqGSrAOpZHDmne6eqigqvPulsQNS82ILfxj1/3FTx4PKBaUc8e5accYuXdxQZ3upTQ==
X-Received: by 2002:a05:6a00:8c7:b0:528:1aa1:5283 with SMTP id
 s7-20020a056a0008c700b005281aa15283mr33557594pfu.81.1657108853396;
        Wed, 06 Jul 2022 05:00:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 oa14-20020a17090b1bce00b001efa205dcf2sm2919411pjb.54.2022.07.06.05.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 05:00:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libspiro: Add recipe
Date: Wed,  6 Jul 2022 05:00:49 -0700
Message-Id: <20220706120050.1461724-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Jul 2022 12:01:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97730

Needed by recent fontforge

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fontforge/libspiro_20200505.bb                 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/libspiro_20200505.bb

diff --git a/meta-oe/recipes-graphics/fontforge/libspiro_20200505.bb b/meta-oe/recipes-graphics/fontforge/libspiro_20200505.bb
new file mode 100644
index 0000000000..c885a00c5b
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/libspiro_20200505.bb
@@ -0,0 +1,14 @@
+# Copyright (C) 2022 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "LibSpiro is an adaptation of Spiro formula and functions into a sharable library"
+HOMEPAGE = "https://github.com/fontforge/libspiro"
+LICENSE = "GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "https://github.com/fontforge/libspiro/releases/download/20200505/libspiro-dist-20200505.tar.gz"
+SRC_URI[sha256sum] = "06c69a1e8dcbcabcf009fd96fd90b1a244d0257246e376c2c4d57c4ea4af0e49"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
2.37.0


