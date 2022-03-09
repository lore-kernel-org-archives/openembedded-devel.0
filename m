Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E02C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 19:05:46 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.590.1646852745953842753
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 11:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bN1stpn4;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id q29so1783467pgn.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 11:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AOSxW+VKodeMY1yesFhvNYcKzLCBuKONXYn/WqSTBxM=;
        b=bN1stpn4UMZQkS8Bwkme3BKPF0TBDDzXY3duaUP2Qeb3G1eA2aMDQbqfwD2dmHWrA5
         qcTccJDD7saLdK1fFhjq6KC9FmcgJ/JdqVsB/ja4+J/NzyZQbR+YeLMojZe2Jff6Ew9y
         49owxwcvJxtZTGjA84AMg9Ic4SRTwv9raTEY8dSXz+sLbWjYYGSjzTkpMXVMtrcskJPP
         9Fx+Hfh6wmpyCsHG9wD6fuDGRAnkAwbPF9JI+W9230Z61bUGB4O+boS2Fynk0LBoAa81
         /aeJU37B13Iv7KHJsu7LJTwlXDHLMnc7fTnOhBd3+lmA+lGkuFB0ARJuRK4EDKf+FwhR
         GmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AOSxW+VKodeMY1yesFhvNYcKzLCBuKONXYn/WqSTBxM=;
        b=v4tRDHGIa043AF2RP9MNnxQ+R+EHzp+YerhEus7Dy26nqC1N3xD2iwb6+IVZq1MIhS
         wPWL4uX4n0d78rD645MIPM+hgUoSE4CbvpqI5uio4JdS4KZ213Pjd89VTwHfs1iChfXo
         JeHTvKZi4SplOQDIhkKM50Hu53kQU0IwFxqSnoPFKmOL0IXNyLb0j84jxPbqxEYZ8+wR
         Z00tY1FLbIX10TkR3djl89/Sz2MVq3kUOLxxJCe5fPuLao/4IPkxSdsG8cw1dtMqzLC0
         +KknFKYul1xExCCNnIKKFhRVP8AJiBcBqVdfSuXOxWzbdGHDvmi+VHzvpr1Q0ZzbVn+H
         eaKA==
X-Gm-Message-State: AOAM531879rU2TdM51dQ8/r72mYvwo5Ka+xdwqdmEszIehrFoVWkNkqj
	8TB6nZAzQGWZhyGmibx1x1AjiWOmR37/+g==
X-Google-Smtp-Source: 
 ABdhPJyBN0vzmZrEoV1Mc57kj0e6dNOKsGzUapO+b+UpmvoU2BN6+ALovywHnPX+hfXmosi+hAv8pA==
X-Received: by 2002:a05:6a00:b8c:b0:4f7:2d21:4530 with SMTP id
 g12-20020a056a000b8c00b004f72d214530mr829561pfj.85.1646852745135;
        Wed, 09 Mar 2022 11:05:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 14-20020a17090a01ce00b001bfbffc1331sm1063540pjd.46.2022.03.09.11.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 11:05:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] Revert "python3-smbus: fix wheel build"
Date: Wed,  9 Mar 2022 11:05:42 -0800
Message-Id: <20220309190543.664728-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 19:05:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95910

This reverts commit b7042fabd1a6930da1d24967720326d2e3a3ca39.
---
 meta-python/recipes-devtools/python/python3-smbus_4.3.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
index 3e14736b2d..b305a128a2 100644
--- a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
@@ -13,6 +13,4 @@ S = "${WORKDIR}/i2c-tools-${PV}"
 
 inherit setuptools3
 
-PIP_INSTALL_PACKAGE = "smbus"
-PYPA_WHEEL = "${B}/py-smbus/dist/smbus-*-*.whl"
 SETUPTOOLS_SETUP_PATH = "${S}/py-smbus"
-- 
2.35.1


