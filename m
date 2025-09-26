Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A85CCAC5B8
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 21:08:40 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.2077.1758920911086005458
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 14:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GAtDJewA;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b30ead58e0cso476548166b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758920909; x=1759525709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=76GMHj1SMdAvyL5wmbo2iagIhdCvYxV3GRBgFzZFDIU=;
        b=GAtDJewAAxwYhVLG2xuBJ9+MLdedBNKO7r2wmEE50cjNpUVc9dvzQ3+qBDD/K9gBWz
         vL/VG791GvlJ19FewIEMSumew4t0azJGECpgADwYFq9/6yaPajnP7fIEqYzZA6fRV5yX
         nRPJU9mym8FIy1r02ZxSiH13+Ja8mUa/XaTcBzm+8EiaYDKldmdLIN3JXvEF9uOd3Ol/
         KYGyK9GG+YV7wCvbkJg6la5MmQ6N23Av3LuZWLPlwEcAq1P4QLTL8txub+0YPLxDwyWu
         S7AP/qhz/D1MMqlB2GYpvnOKnRvAnQHkBzzhPbT2zU5qp5Fbc+h50EBfTWMRWZcf55vC
         EDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758920909; x=1759525709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76GMHj1SMdAvyL5wmbo2iagIhdCvYxV3GRBgFzZFDIU=;
        b=CUoulFzP2mPRtkKBYxSJiT/klz6cnbLlJhNT7NNp4K+vpz91uzunLyUr53dwPKZhur
         3ghExGkl5z+p4y+Rb40/573st3fxlpCXEx9hr7EVHR6UJA6ZQ8rdMmq6TxXGbKNR4MB7
         PA6+UMXtFi6sGOTfxQrzuv0NkrTEWkKBrcMMGasa6hKZw5yFrPOvBFf2GI8NbatJeLD3
         2iB80Fdr/91ZQFMS5bGSaUZ59fsCRhE/zntEa1xG66DlyOQIgUPXk8X80KJAwkW1/27X
         a/dYXFMYpz8LLaS/hRujnREYiYqlm2HOaJMeCip8MEXigzm8aQ333JxQecvhQaoadXjp
         4ETQ==
X-Gm-Message-State: AOJu0YyDHkUGRMuznU39lAK2Ts0qs3UmvXp/FOcL9XKrRho8/rUxGiZt
	cK6aRCufSMYpyJrA4ipWrEDS6Jr2IRBvFaKRRjlzp9V1QL6PfNIHvfu6fbuKAA==
X-Gm-Gg: ASbGnct7kfdCpQwMdDo7GibbHU19GPn6vjnZJdMWX5DzL5lNv+Ouwb9/XsnLwep3KQl
	L6yZ6oJwhjFdIH6KNwjuq76Y7t2Q+V6sSORmdMQZCRY07KKkAJTzQLB0YCJ4CSi4vL97SFLLrFu
	zEjzc58tVlW3+kbIo5rCqtx+q6bImVelt7ez1GMYcrysjgC+RlHV2gehbnDT/QTedVmvsGHyNdp
	JOr8lXaprWylZByil3JVn0/5bvTn6yqZutrcdg1Ck/hIJGgGE/VZ42oOYeHOxdr4EVVcKJh5PUw
	ykqGYRRsEc3n1UHgdZNal/rU8Itp8AV8xiXdSMtT3h50Hh+SCOrEzT0jHABiF6H0VO0MS1kSf+7
	4xSXEKcyQKsj2RtHp8qwc
X-Google-Smtp-Source: AGHT+IFNv6dt63r9yl8a5X1q+zTBZyV6Fo+CpG6X2cyhVLMvx4kcMFKM1DBm0V1rvKUkXMi2wuf6kw==
X-Received: by 2002:a17:907:3f0d:b0:b31:31b8:dacd with SMTP id a640c23a62f3a-b34b74ee10fmr1032246966b.17.1758920909343;
        Fri, 26 Sep 2025 14:08:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f6904sm423607766b.66.2025.09.26.14.08.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 14:08:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] mosh: set working SRC_URI
Date: Fri, 26 Sep 2025 23:08:28 +0200
Message-ID: <20250926210828.169854-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 21:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119943

The project switched to storing their releases on Github, and
the original links stopped working.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
index 693ec12d3c..62fb5444a4 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
@@ -14,13 +14,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter abseil-cpp"
 
-SRC_URI = "https://mosh.org/${BP}.tar.gz \
+GITHUB_BASE_URI = "https://github.com/mobile-shell/${BPN}/releases/"
+SRC_URI = "${GITHUB_BASE_URI}download/${BP}/${BP}.tar.gz \
            file://0001-configure.ac-add-support-of-protobuf-4.22.x.patch \
            "
 
 SRC_URI[sha256sum] = "872e4b134e5df29c8933dff12350785054d2fd2839b5ae6b5587b14db1465ddd"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig github-releases
 
 PACKAGE_BEFORE_PN += "${PN}-server"
 FILES:${PN}-server = "${bindir}/mosh-server"

