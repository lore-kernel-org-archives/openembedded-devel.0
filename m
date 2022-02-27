Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AF2C433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 07:58:52 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.7223.1645948731480301041
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 23:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SgYQZsl3;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id z15so8358820pfe.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 23:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0qYc7zo9q4mH+VB7LGfbG7ehTTp09ga1jRkGeVXlRPU=;
        b=SgYQZsl3mY+YH8VyI5a/qJvsq6apKf8yL5VUxEBg2+wvCYOOLjf94k8MwkElU56M20
         MmtIJyhnuMjDGCIpiGh/KoaR+r3wu5jcLOKJdkh9Tho9j/AC3B35pwdsUMq3LY8ZEdoo
         Z/yYwY/dCL4E0+dQqiQ7Va2ST85C+AKTNpUjiqxmL7DRfIxM6cgJctAuYw540bCl8F72
         XSQe7OSw+zc2+B0tT1ObLvO4cXm7Yyon/RT0Up4E5SofWyRJwxBbCTU1HNYI+gwisfFM
         26hUuzBniwHABeTJsbhyDt6iXAO6R12jwOS4iLfTF2v9OZ4hIeDuh9l1wXkSqSt32f1i
         gECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0qYc7zo9q4mH+VB7LGfbG7ehTTp09ga1jRkGeVXlRPU=;
        b=fdHQpSPrMeO4EcddIY3Wrt+Y7xb8BlFkIhCrW8nLBaBDWwYV0Lnxm4HeUqoSNm1nUQ
         E+e0Xa4wC5zyvuVWaaOqSzZgbwsbEBvEUXXDMUSMRQJrx42Lb9r3+A0/PY7gQeX3Smre
         WDQkYsy2qTeW7jiRGYI6vnEzPCs1idvR9NAL0K0Ds0g71b8WdCCDaraUA5pb4hJrR3d0
         yWUCruc2YYfFfgBATpLxd4OjTVrMUeWWs5ZiKgnZfMKlaTAjdT63rAWNS70P7FUx6glB
         kvWLcHUhAARBfirOYGZcwB+sH4O7CZrYrzZeYwCK0pABjBjQw5mmiXGVsZg/cp5EUl1G
         SZ1w==
X-Gm-Message-State: AOAM531XHxdxp3rWlCb3LsDnwX6/9bBSU6tPuOQ6rtQkCqoT5U5F57tG
	yp0V631VC+WAEWhL17vuofiHFCzLu9Fjgw==
X-Google-Smtp-Source: 
 ABdhPJzAk71SEuxVLfFTxUnHTr4kComiwA/hsyfzOW48bEUqHsNyjn06QXTwp/PqKhBhf3Xz4WtuVQ==
X-Received: by 2002:a05:6a00:1810:b0:4e1:2d4f:14aa with SMTP id
 y16-20020a056a00181000b004e12d4f14aamr15906980pfa.43.1645948730697;
        Sat, 26 Feb 2022 23:58:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 a22-20020a056a000c9600b004f10137a096sm9012845pfv.50.2022.02.26.23.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 23:58:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/6] python3-apt: Point PYPA_WHEEL to custom location
Date: Sat, 26 Feb 2022 23:58:43 -0800
Message-Id: <20220227075848.610467-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Feb 2022 07:58:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95554

Standard deduction logic does not work so help the system a bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb b/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
index 6463f49bb5..183836f406 100644
--- a/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
+++ b/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
@@ -10,6 +10,8 @@ SRCREV = "6145b6484d220685edfd922d364afbf065127efe"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
+PIP_INSTALL_PACKAGE = "python_apt"
+PYPA_WHEEL = "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-0.0.0-*.whl"
 
 DEPENDS += "apt"
 RDEPENDS:${PN} += "apt python3-core"
-- 
2.35.1


