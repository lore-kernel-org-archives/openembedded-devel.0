Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5B9C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 09:24:04 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.8164.1645694644009128101
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Yo8xl/KK;
 spf=pass (domain: mvista.com, ip: 209.85.210.181,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id d17so1392397pfl.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vW9NuywGlYLuYUvMzhMUBGgxRV3H7snIA+VYdNsAN30=;
        b=Yo8xl/KKgI6e93FSb/3n1vw+7pxjSfpLpTi8E//IxfG8dOtQIPT2Bs09LTGyoKcuGF
         AQa9aRCKJu3I926Fk7c8uQYfAco5bqVN7euTrn4R4NNuc0rWSDoC5ObhYqddVsoNMebD
         +0ZNKpbs1vIeNjtVH59CFECCXAE15fYaEaQFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vW9NuywGlYLuYUvMzhMUBGgxRV3H7snIA+VYdNsAN30=;
        b=s4xkzeI7Z6IPymDY+3QVL1lvQz/LuBu3XW0WlJwm+p3B/px8uys//9NOMH5u8CHqaK
         jtqaIsAl90r2ubS0TfVntfZmaVMPCxab5+JpPMfKTkSuJB4dHuc6TY2OV59WrVmy/a8i
         ZheWwQc8DxmtpgDQ7fD45YVW6TrA+dvTSCEesZIeuXkkdJNy+Xqs7h7IBo1Kgsk+1kGm
         J0ZuCeVsWcVRyUF/aC2jIx/whJW6pDSbf93sV/jXt4VCgBfpU/FsXSQufSqh/Yb5pKHk
         WUVDiYIn66fGyiV34f8T3sMrTrzXlu2HJxDCDaMXvWN3Fyso6wmugv0yv0YHvidQdOJU
         CEbQ==
X-Gm-Message-State: AOAM531NguUC6M8h3kI7rn0X91Ry+pyaN3nkzBvY6GW1dSKDrgk/QL1i
	07XP3NEiINR7aYPobuViWgc7nM/fH5lprA==
X-Google-Smtp-Source: 
 ABdhPJzb5yM+iu58iXedJT0lr7quOStfMLPO/IOfOCtkwPyUwYZiCdZ6skbgIMHsEJ5fTw832BIrVQ==
X-Received: by 2002:a05:6a00:130e:b0:4f3:9654:266d with SMTP id
 j14-20020a056a00130e00b004f39654266dmr1948647pfu.59.1645694643348;
        Thu, 24 Feb 2022 01:24:03 -0800 (PST)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 q92-20020a17090a1b6500b001bc169e26aasm7971871pjq.2.2022.02.24.01.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 01:24:03 -0800 (PST)
Received: by red (sSMTP sendmail emulation); Thu, 24 Feb 2022 04:24:01 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-java][PATCH 4/5] commons-configuration: update variable names
Date: Thu, 24 Feb 2022 04:23:38 -0500
Message-Id: <20220224092339.2711524-5-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220224092339.2711524-1-jpuhlman@mvista.com>
References: <20220224092339.2711524-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 09:24:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95507

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 recipes-core/jakarta-commons/commons-configuration_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jakarta-commons/commons-configuration_1.5.bb b/recipes-core/jakarta-commons/commons-configuration_1.5.bb
index 4c2bce1..b0dad4a 100644
--- a/recipes-core/jakarta-commons/commons-configuration_1.5.bb
+++ b/recipes-core/jakarta-commons/commons-configuration_1.5.bb
@@ -9,7 +9,7 @@ SRC_URI = " \
 	   http://ftp.hosting-studio.de/pub/linux/apache/ant/source/apache-ant-1.7.1-src.tar.bz2;name=ant \
           "
 
-PNBLACKLIST[commons-configuration] ?= "BROKEN: indirectly depends on broken 'xom'"
+SKIP_RECIPE[commons-configuration] ?= "BROKEN: indirectly depends on broken 'xom'"
 
 DEPENDS += "commons-logging commons-collections3 commons-beanutils commons-codec commons-digester commons-jxpath commons-lang servlet2.4"
 RDEPENDS:${PN} = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libcommons-codec-java libcommons-digester-java libcommons-jxpath-java libcommons-lang-java libservlet2.4-java"
-- 
2.33.0


