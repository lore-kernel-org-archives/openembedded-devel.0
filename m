Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BD4C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 09:23:54 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.8310.1645694634505387513
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:23:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Td89m/4a;
 spf=pass (domain: mvista.com, ip: 209.85.216.48,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso5166486pju.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OHNStWAofRRx+h9oz13eHxAqsU9fdSW+eQarZxI5xN4=;
        b=Td89m/4aYmflmWlSCasJaqB5ydSWBd/ezOaxl0pBjca2G1lhSLmGv91exSyDTEYY/0
         Z4fiqzTIpcdEqhkmJVGP9Ms3kpnvWKmCOFp3BQ+t74ykpUanJk0AbHltTdAch+dGiizr
         +PiuSPXH5w+7Y1TCr96rW6h5YsDUqXJ79OnzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OHNStWAofRRx+h9oz13eHxAqsU9fdSW+eQarZxI5xN4=;
        b=hBCNK38ErFOnlkXBfHmRR7bZfG7OsL1Wx4u2EuMzsZ0hsF7SDzPUeUzK3d+I8eLIrN
         FGkYQOjg8lCEQtl/A3jUFAF/Cfa1cM6q6ESb5LSiNWesOJPJXswMgvXu/HGwULnyx7AM
         lDoprJ/2NW9qTWQFfQbsi1E7lG9VnEwo+uC1Z/y7bq23SP+kCAYN6iT6d2Z7/XeyY2eB
         ontGKdCFrTisZX9gQQnrMQ9aefjUSFR8sudXoMho3NtT1cXkACrvimzEi2P2JCbWpsQY
         QoZS8MZI4k6RO9njNnTA3xqLeD/Yi6Amh3OgcCnWdF/SN11gPJTPjNWL9wd7sCxTTj1h
         z18Q==
X-Gm-Message-State: AOAM5335F53LH3pXu78deLvPzgFL8oP7MNLMFm19WCX3o3QohrNWSQB+
	gYXfl8avKL0c9YYM73gFDkN4zpIeO+FhTg==
X-Google-Smtp-Source: 
 ABdhPJy4HGK3rWioVv7m1uIHw60gevCawUp2LacOE6fPPmPoJbn7KsJ6Awh/GcTbOREuiPgp7VPbTw==
X-Received: by 2002:a17:902:e949:b0:14b:1f32:e926 with SMTP id
 b9-20020a170902e94900b0014b1f32e926mr1712460pll.170.1645694633769;
        Thu, 24 Feb 2022 01:23:53 -0800 (PST)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a17090a4e8a00b001bc778f4ea5sm5432962pjh.57.2022.02.24.01.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 01:23:53 -0800 (PST)
Received: by red (sSMTP sendmail emulation); Thu, 24 Feb 2022 04:23:51 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-java][PATCH 1/5] Switch compat to kirkstone
Date: Thu, 24 Feb 2022 04:23:35 -0500
Message-Id: <20220224092339.2711524-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220224092339.2711524-1-jpuhlman@mvista.com>
References: <20220224092339.2711524-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 09:23:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95504

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 7791178..2e2ce16 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "dunfell gatesgarth hardknott honister"
+LAYERSERIES_COMPAT_meta-java = "kirkstone"
 LAYERDEPENDS_meta-java += "openembedded-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.33.0


