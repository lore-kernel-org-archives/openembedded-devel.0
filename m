Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E850C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 22:22:00 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.1425.1646086917097059565
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ESc8Mz52;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 132so12781499pga.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JDj91XuUfxXv2Qs96HSJuqU0tVYMUKeOpjUB0u2SZvg=;
        b=ESc8Mz52dHLf+Xbvmj4x+MdjIGEDSHRbavrdt2jOfgd6oUB0xmzDqKO1xnxsq/NP/U
         LNr4LOJ0I3QeaPBWonw/5036TnB/cYuW8GBuyrgVYiJ6eJmXoMCzISiGPtlWbCy18VRw
         Cu5sSefOZjXLwUcVDQwNQpx43wD7GFQx+4ojSEfimgW8UnErNo9l9wBCtM+dlp8GL/vc
         buK2Jh9jziVBwevSf/uQT8SoFpg6tbNQD85zzxayH/NS0FbKhSJP6hlMPGGSuIrgzVBo
         UN/Om4No0de3eB6er04LryfQFlv+l7FBG6oj3fZD5LVEVGqX4oLEo7jKByQ1dFAxr1Ge
         sq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JDj91XuUfxXv2Qs96HSJuqU0tVYMUKeOpjUB0u2SZvg=;
        b=h+hRCEE5Gvjfh4JCrimtyBBlYoH5A0Syipaud0T0jfy8W1dGQfWoozUR82Zw39egX7
         tSSS/OwnGoas+VrJIgIZFEZdjj1CXsXl4YHnVGVZEiDq0oNJU5/Lgk2nY0h6TKDQbuT9
         LcOe5wKbWZW/z6rQIylywIQnLZumIM98sPG69j58ZeNLc3leP1qTs/FiIVeEaoHZmBG3
         6S++GL2jPpAzFyAiJRwi+e8V2b8qlyjgjGCbb3+GDqjJyYkDzDIp/NxMMgCP1VUGDGTM
         IEe/DRpimzenpoAeWl9O0QKe0qXmsZL1IqmjQ+V7iqO7qAOCCJY5kYUAA3ib5zwgTYEc
         zGnA==
X-Gm-Message-State: AOAM5307fJ+PXZw9hRKyEg6OREQgOpTQPdvoVOeqNgHwQw1ZMG7o/EFt
	29fv7jUZ9SttMa/YP1SbGzMhR7vnqom66A==
X-Google-Smtp-Source: 
 ABdhPJyLA0CTvGNIyrLdqG10aU6dziu/xv6IIW+yzVb0oJYRBNYDiwkLxJHLvyxN/x/IKzXA4vTCww==
X-Received: by 2002:a05:6a00:1307:b0:4b0:b1c:6fd9 with SMTP id
 j7-20020a056a00130700b004b00b1c6fd9mr24030228pfu.27.1646086916310;
        Mon, 28 Feb 2022 14:21:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 o17-20020a056a0015d100b004e1c11d833fsm15430992pfu.90.2022.02.28.14.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 14:21:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/3] python3-scapy: Define custom PYPA_WHEEL
Date: Mon, 28 Feb 2022 14:21:52 -0800
Message-Id: <20220228222154.210195-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 22:22:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95598

Standard defaults are not able to guess it right, so aid it a bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
index d318c27c5a..3a1f102dc9 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
@@ -25,6 +25,8 @@ S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
 
 inherit setuptools3 ptest
+PIP_INSTALL_PACKAGE = "scapy"
+PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
 
 do_install:append() {
         mv ${D}${bindir}/scapy ${D}${bindir}/scapy3
-- 
2.35.1


