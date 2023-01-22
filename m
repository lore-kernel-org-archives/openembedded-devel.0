Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CDAC25B4E
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 15:34:53 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.20191.1674401688136954331
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jan 2023 07:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oCrsI4Mt;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-15ff0a1f735so3307550fac.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 07:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6a2pQBRHvKRArzjqqgMa/YO+bY6QhYnDRbNQjOgbWZA=;
        b=oCrsI4Mte3r9LQEUt08osrXnLD36YyZlOE7NNI0ssUqT93cV9BdF7QzhRsHCFPeaWc
         DaSgXQnHpMpKQqa/BVN79ozDgZ+090KXzu//8/6b5XOTBSQCkYWkKDpEPRCYu2mPyebh
         3Ln52no/Xi8/xpnPRRSQeZotfqoD3MaFxmjE23Ac3A+JMs9jVQ6t9FWCRauIThGnbUXo
         C+wJr4of3ASxtz2HzIu+Zkda50E7BEyJ2zpP62q2f1MP9q5RmXFYx7eNU8oYzlC+IPTp
         rFE6d69U9FaLzdRP7TXxwV959Fea6xD5PUcMW2kPHQmhZEw0ydlPEm3OA+WayHcrdCeQ
         DEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6a2pQBRHvKRArzjqqgMa/YO+bY6QhYnDRbNQjOgbWZA=;
        b=WY9i7iDr5lHIM6caYjqfmv1sYXoIXM6d3rchG+7Z8Ahg5wO7Ug+78yKP2dUSbU4ABw
         BNmGVnt89s5aZIlOaruSRaNNjP2WcU8oxgVA7OL4YyBOH5jQ/oTG0E0gNknnzLa3/Gsj
         EWKVo9keuNiQ0Z5o37avT+V7J3qaEfqbQDkcBjfc3DP/Lc65prlE9ar6S5MNN6MZZu9d
         11cRsJm0DpeH2zfULZkU17N+rETbfWNySElaVGc9iLDYKucSlp0OWsWGhhf/yaVvdx56
         zsE0jGxzTGexpLvpT5WlieCDC2JAX27wDEVrOz4ZtXjyhAZUR9Cpiq2a97I68Rzlkt5z
         hPNQ==
X-Gm-Message-State: AFqh2ko5VWHPjMa3NKTv51kz86KYW92VUv4swvg5vqsxgAh4PMYyHk40
	Po3crjnD2jEhsh1CPn7tv0atx3l6tx4=
X-Google-Smtp-Source: AMrXdXuJAA4I//SVdl6EQZUA5SEB2EaQP4yDHsyCQh2bZ1GVQEwr03w1GE91zAVYgh9O6fejHKMm/A==
X-Received: by 2002:a05:6870:c1cb:b0:15f:1abc:290d with SMTP id i11-20020a056870c1cb00b0015f1abc290dmr13226844oad.41.1674401688320;
        Sun, 22 Jan 2023 07:34:48 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:97e4:131:65d9:88d9])
        by smtp.gmail.com with ESMTPSA id fo42-20020a0568709a2a00b0014f9cc82421sm9228112oab.33.2023.01.22.07.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 07:34:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 6/6] strongswan: upgrade 5.9.8 -> 5.9.9
Date: Sun, 22 Jan 2023 10:34:42 -0500
Message-Id: <20230122153442.213094-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230122153442.213094-1-akuster808@gmail.com>
References: <20230122153442.213094-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 15:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100707

From: Yi Zhao <yi.zhao@windriver.com>

Changelog:
https://github.com/strongswan/strongswan/releases/tag/5.9.9

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6cca42d726c333b5955c6f4e46395b9578efce2e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../strongswan/{strongswan_5.9.8.bb => strongswan_5.9.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.8.bb => strongswan_5.9.9.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.8.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.9.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.8.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.9.bb
index 266d43aa6f..a11cd5a6cc 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.8.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.9.bb
@@ -11,7 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            "
 
-SRC_URI[sha256sum] = "d3303a43c0bd7b75a12b64855e8edcb53696f06190364f26d1533bde1f2e453c"
+SRC_URI[sha256sum] = "5e16580998834658c17cebfb31dd637e728669cf2fdd325460234a4643b8d81d"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


