Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA53ED767CE
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:41:37 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.12750.1730382090270151298
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 06:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ig3WwYtT;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso120608966b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730382089; x=1730986889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WI0wNMblKB3N5rdjA4IUSTQoxr2S2ZosVUEaEQ5NJjA=;
        b=ig3WwYtTVFu+apqGlGGlMoRSDljUxGvPjcpai8+4VomK/7GNnb1JW/xfMqNceG4WJ3
         qzM/xd0QZrbhrTDDCT/v5qP+hKmZkqsr5iUm5jDdCAPa1x8ptSK9YqeplgDTiZbtHc9V
         In2X2FMWy4H7/GGlarMFL04hKbZSfQjjmNh2jjEWSen1YTnMnscxKdr/E4SfHG8oVP1I
         7nO/wvqMZKBVzaQ905D5Sq7WmxhIuoPScaWDqoaXOZVrFdPUnrLO/NRqUuW3o78CEWJx
         tlXGPFFuDNbrh/WWZsPIlAL0fGvuNxzlHsdt2mMEa4W9dTB4Q3yq2J49I8k3S7yG1qfv
         jvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382089; x=1730986889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WI0wNMblKB3N5rdjA4IUSTQoxr2S2ZosVUEaEQ5NJjA=;
        b=Y5+mczP8ga1mIvMweLVP7a83i9+gI5kUTr0s1SMmh/8EaOz0m9xCheU5+tLvEBozEU
         ZK/WNNm6+F1F8Wqkq0S0plhMYPf1SwBdvy3gHOcwZ46ueIUV2VyeIWTvCbvyAFj7JG+W
         uiO/8mMGO/K+ZeNc0j2aRRmAwbIxVSIspNd2ZZgIZyY2OexcksMZygPb5X6gLaq7Vb3Q
         kMYrnn7AyGFv5Xe3RwllINCkzMalKUMkAq/6mb9mYYC599mRDYOANMwunjH5lDzO8GzF
         bBgL7e4rmG+SLtRKnPuWkgpWB7bqSYpWD2vQOVKyO9vhe9ThAQ2Pr+8UM3ECFv4LCQN+
         w8rA==
X-Gm-Message-State: AOJu0YzW9Sv8J+33X3PvIbsJXq/RarSuTPv8zIb3ZbBDuEDfPWs9+qjY
	u5kO79Ic5bxX2KCnpfjpfF9zaDYppu/rzcIizt52PuW5RVXPWs8dD9ft9g==
X-Google-Smtp-Source: AGHT+IGZqxHzZeVmMy4+BH3u4w2ST9dfzChiHaIggbkBbWiEOyENDH/+HKUOhCFe8nRqDw0fh+HQyg==
X-Received: by 2002:a17:907:74b:b0:a99:37f5:de59 with SMTP id a640c23a62f3a-a9de619182amr1737168166b.53.1730382088481;
        Thu, 31 Oct 2024 06:41:28 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564940e9sm71879166b.12.2024.10.31.06.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:41:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [master-next][meta-oe][PATCH 05/11] python3-pykickstart: drop unnecessary FILESEXTRAPATHS
Date: Thu, 31 Oct 2024 14:41:08 +0100
Message-ID: <20241031134114.2791747-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031134114.2791747-1-martin.jansa@gmail.com>
References: <20241031134114.2791747-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 13:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113362

* 'files' was always in default FILESPATH, no need to add it again with FILESEXTRAPATHS

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python-pykickstart/python3-pykickstart_3.48.bb               | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
index a7bd8ae437..9e074bddcf 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://fedoraproject.org/wiki/pykickstart"
 LICENSE = "GPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
 inherit python_setuptools_build_meta
 
-- 
2.47.0


