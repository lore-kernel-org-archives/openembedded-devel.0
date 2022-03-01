Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A49CC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 20:34:06 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.2316.1646166845638651551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aS3eV+Pj;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id e2so2019120pls.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OZava0Xz7kv1ReTyp/Tp8Jyk9U68o4tEY3Fut3X5Xr0=;
        b=aS3eV+PjbhuR+U2R1wjbu98jj25MdMYd8lLFI+tjJWlBh4JChV20rsCR8kZpYQUL1R
         JL44ZvtWgkf2zDLz0wTkdK8fiE5TbpXSr8wFqPvRgNNTKkMtb0I7Wz4K6jidpLXuyeXN
         orazWWv9JcH1ZinadoWjuceaoFDcg0SVBm3ysE5aYrdBqQ8iaLepX3ELsaYNTrzxmIW4
         627aJwrqERxvHUnapUbULyF/5gjvvAPFH5PBSAjaIV/SGVfDXPxO4/jA/RBVVYn/2PGY
         LmDH/dKz013pFOD+NTirjZRSh4aygSlQWO/rhZu7mrJwzzuWF8kQPcGHwvyD3xKm6gDB
         mJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OZava0Xz7kv1ReTyp/Tp8Jyk9U68o4tEY3Fut3X5Xr0=;
        b=IvudyjHaZML2RaGWTEjQol7M2Tsv1qybNW2I/2DmQ5CYz9RlKVVWWGaw8sUo2AMq2r
         5WgGXSkz4Vpd41+4vN1E0ectbag6Y987P2A5AL2A3YoB7bfylYHg3imFaOKRix9lvKiZ
         IwrLt4t8RLKhxuMFluL1KcYjlJZcHOLuyFu2xb8Ac+qfFrJaPENnh6zPTOBbCj/vpfjG
         4q3d/cKQQiV4jb8O3sPrp2IgxuWhQsLazxiXG20gtRqS/iyHeu5Y9erdw2iueBxm7lLS
         V8x04xrg3lBxiDF3cYeAIv8N7IcNXSBwj8muj80oix8SZsqy8pyXH80/Odo6ySVsF1EK
         xF6A==
X-Gm-Message-State: AOAM531XbEhM+xSGBKQP4tpLeCDiWToiGJgbUwV23UTjqUTRcN42Yw/W
	C85Xcd/nb3FVB59ij8cgTWsQ6SeK+Js=
X-Google-Smtp-Source: 
 ABdhPJwR2xeqThP+nJtJYPwWrMs1I+QPLgGE/kPf9g3rgznBv30O8oAhdjOraUfuh7mhDR2F/fNlXw==
X-Received: by 2002:a17:902:eb8b:b0:151:60f4:84e5 with SMTP id
 q11-20020a170902eb8b00b0015160f484e5mr13882748plg.134.1646166844678;
        Tue, 01 Mar 2022 12:34:04 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a17090ad20600b001b8d01566ccsm2896968pju.8.2022.03.01.12.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 12:34:04 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 4/9] python3-pkconfig: inherit poetry_core
Date: Tue,  1 Mar 2022 12:33:49 -0800
Message-Id: <20220301203354.3839755-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301203354.3839755-1-tim.orling@konsulko.com>
References: <20220301203354.3839755-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 20:34:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95651

Use PEP-517 build-backend instead of setuptools3.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
index 2d68a78e37..c5a74796a0 100644
--- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
@@ -10,7 +10,7 @@ RDEPENDS:${PN} = "pkgconfig \
                  ${PYTHON_PN}-shell \
                  "
 
-inherit pypi setuptools3
+inherit pypi poetry_core
 
 BBCLASSEXTEND = "native"
 
-- 
2.30.2


