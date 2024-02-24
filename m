Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0448C54E41
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 08:42:51 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.15630.1708764170249972357
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Feb 2024 00:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OiQdh6AU;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-564e4df00f3so1947165a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Feb 2024 00:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708764169; x=1709368969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ExSiI/3OSLbVQf/RBljHdCEjnHF3CGPl5kLAN3a/zg=;
        b=OiQdh6AUIBzsyvYtWabLSKHhOy2j/FQUeKaXNBsBZqJROhvZ2ZIikVI3k2H67QGRWH
         ZrnuL7eh7pmXI64xwjooVwEa6dzEC7ZpIV8yvGtrJKSZC5mBgKY1G2D6TK7WNPC2aSuB
         LdbtWVzE7KBTIFoLhoN39pGfA/FzF/zwZUsNGpjJCOIxeCDWi87DsHa0jhFoKAN4alQW
         i86UFNfysI5bmgYBTOyjcP1EnaBsgZqbrJDe/dWW2RA71hahOr/4Gzkr8aEdxiHMCK6O
         aiTAnLxdgb4TVNiMZ1o+gcMxnYJHc4lNkvCYzDSq17ZFnR3raHGBwuk7+XTactK65pAw
         fuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708764169; x=1709368969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ExSiI/3OSLbVQf/RBljHdCEjnHF3CGPl5kLAN3a/zg=;
        b=hiFnHOaJamr/w+gGBOlvjbIZ1e1SkXSw/+xj1zokF0SDTauzld3qwqDjoJaW3OY/Kg
         b2xA1VpB+Gb7EBk09GnEBbCdkCMhbGWBL1bZIAvAVWrA2EaWuDRqQvP+JyT++pM6Ak71
         f/V3/nCQavkaMDlvCwyQovBYL0bRsW57Zpw02RmL8chpdUCn0DKOuln3+RLJyaRSZFwZ
         4ypAxyvLEfnEwrSAM3zNeuO6/PBWT54jYc/fSU1oJQ9X2HJzv7isPzoXpDzBp0AK0UBD
         qDhoXPGF82aLlt2Ffa1yLNnSoNONOGrAR/hVAYI+oV+r6sDtnzT3nMwzfxtKiEuvgoEo
         od9w==
X-Gm-Message-State: AOJu0YzGsWzxj7xOvLCU9SqQJ4CA7VkysI9jqDdCiGCFxQjPDywVxjZY
	vP/atE+9FDSvBOye7giGEvaa6yCOn+yoKFSEgDUd7uKPFTxIFxmJ4Qkdnj1G
X-Google-Smtp-Source: AGHT+IFoGeS/IWyjD38cQ16TvKpusOKey+S+VwjYkO0pxD3k/8KocAPuTecyrCnbmcnw8xa6fsffmw==
X-Received: by 2002:aa7:d355:0:b0:565:9bdb:2265 with SMTP id m21-20020aa7d355000000b005659bdb2265mr877665edr.7.1708764168446;
        Sat, 24 Feb 2024 00:42:48 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id fi7-20020a056402550700b005648d0eebdbsm337379edb.96.2024.02.24.00.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 00:42:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: behzadshaheryar@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-openembedded][PATCH 1/2] snort3: drop SRCPV from PV
Date: Sat, 24 Feb 2024 09:42:38 +0100
Message-ID: <20240224084239.121470-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Feb 2024 08:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109023

* as other recipes did in:
  https://git.openembedded.org/meta-openembedded/commit/?id=21f956598ddb1bb08855fbc9a3293acf957154d1

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-networking/recipes-connectivity/snort/snort3_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort3_git.bb b/meta-networking/recipes-connectivity/snort/snort3_git.bb
index 4bc2395fae..e9c37c8346 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_git.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_git.bb
@@ -5,7 +5,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
-PV = "3+git${SRCPV}"
+PV = "3+git"
 
 DEPENDS = "flex-native hwloc libdaq libdnet libpcap libpcre libtirpc libunwind luajit zlib"
 
-- 
2.43.2


