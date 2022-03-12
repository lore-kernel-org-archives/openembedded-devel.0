Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B9EC433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 08:56:10 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.3183.1647075370279346132
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 00:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rlovna7a;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id m2so9636949pll.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 00:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i/XfbRgTOnzDwysX2MkR567WRtKOs8q427nd03CmvBo=;
        b=Rlovna7a6dW9ialMc+iSqgn8duiWPUnh7l7+9hims3CjS/zaXcMfc8h62zpMN8ko7Q
         J/yfxUSfa7GdblXXeeXD1wS5919N/KZA+MpG/nP9oeJaGlwkO+Kh6aDq9BnLg8efW47K
         nJMN2eSmUatop3lqQ0g6hNkJD1rE0r/xUthPPCK8/pDydq0g4sFWvzSqmfCkidlC1e/q
         oTVpexSMV69zdBlSeJu0yFmSoRDLU2O1zKjwHTbfhOVziupO1Pk5ruvyFhCQ9k3Rtbmr
         xIFdT1BZz97Fs64Nf7qcmXq3K0jvLd3UTR5dMHISPFFl8GcrKDL4Mear6U1xSdlFy1PZ
         pkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i/XfbRgTOnzDwysX2MkR567WRtKOs8q427nd03CmvBo=;
        b=u4kl/Bn8y8HhgMHwvjWFsECELP+wjt93yAyh/TcTW6XG+pJv4N5UG7mkxSswNhdQxP
         st5FoD+LHBkJxYn7OUaNb7HXVHh+PYCuFEfIBEPbyj9RTeXgTuXTetX/KdaOBONDLHiV
         Rll3AyP8EGp3msY5opDRIebUenWsBGw5xeWAZ5RFYJwKtppN3j5yxEzDlcfzberKP5tg
         OsSbgB3eoE8nXmJuRTVEbAwmlHEQnUnj7hev4bgr05nnfHlQvyP8Cc0vDySKNxW6+VHS
         4EJIaJwnb09EJ5XtyUY9FEDlLd+ymQ9W7sYltvMxDmNb1Aj4GqBv845tadxHznJqp2UY
         4aLw==
X-Gm-Message-State: AOAM531Nb3/5ibN0SYPRLvhWElmoizwtDojcJvPri6xvLDEDTk35Yuqq
	c+vrItYqKM/m6tUVD4GiVyth+WuXuyGYfQ==
X-Google-Smtp-Source: 
 ABdhPJySDsA8xBX+LHCgfdb6DIC2L+1G1t7vw9ipFF8PT68zWE2WEKne13Svt7tFwg6fXgPI6yLYgg==
X-Received: by 2002:a17:90a:394b:b0:1bf:459f:b54f with SMTP id
 n11-20020a17090a394b00b001bf459fb54fmr25666815pjf.117.1647075369517;
        Sat, 12 Mar 2022 00:56:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 y20-20020aa78054000000b004f6f267dcc9sm12709108pfm.187.2022.03.12.00.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 00:56:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] poetry_core.bbclass: adjust for
 pip_install_wheel.bbclass -> python_pep517.bbclass rename
Date: Sat, 12 Mar 2022 00:56:07 -0800
Message-Id: <20220312085607.1129037-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Mar 2022 08:56:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95962

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/classes/poetry_core.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/classes/poetry_core.bbclass b/meta-python/classes/poetry_core.bbclass
index fb37c78c78..77ccb0228b 100644
--- a/meta-python/classes/poetry_core.bbclass
+++ b/meta-python/classes/poetry_core.bbclass
@@ -1,4 +1,4 @@
-inherit pip_install_wheel python3native setuptools3-base
+inherit python_pep517 python3native setuptools3-base
 
 DEPENDS += "python3-poetry-core-native"
 
-- 
2.35.1


