Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAFDCAC5BB
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 20:53:50 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.1712.1758920021258851869
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 13:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UC0e9fs/;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b07d4d24d09so507401666b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758920020; x=1759524820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Dsk2+pb6+458eHViVnU3pYcn1juywNmMVINIJqLuAc=;
        b=UC0e9fs/KJrdWnIeEZ5xxwiIU6hFHjwasx1+y6KDqQDfvnxu4y/gY3ifhv9uwVctVe
         sCffWBXlobFOVVnJTIOYk8k5vpVbczWJAb6z2bwiW8CRfbMTnGwhMaK28OQB+xcFrl/q
         RBDEP40lTta5PO3dJxrrpZ190caGMWtf9I46CLJZ2IPeLQAnwWlvjD4819Dffe1KsXB5
         e5TwMa7j5dBIjC7uBABWifvzqpomse4G97+42rBb+bo3BfC9vBGSBYbvTMCVSwad1iXY
         ML6saUmWqnKoedxj1Oqfhtmh44E5A8V7HprCPQ45/bm5cnfe2wR1mJMLdHENuJ3Zw9MF
         z3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758920020; x=1759524820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Dsk2+pb6+458eHViVnU3pYcn1juywNmMVINIJqLuAc=;
        b=fmz+Cw68ijZvkDo3S8Pp5iVaIJli5CYCUL6JUDxHZrEDyRnBc2LZGr2L62VEhqIsGQ
         F2uya0tj1u9C14QWS0DwZWl7BTHpwkwfFIpwrShV5QA/9rte13OsvvnSvvG2rVId4iN/
         SoSynuSO2Ne0mOIviO+lgS8XsqjaPzKpKC77J9r4XThMUB90bQlsYhzcV7T6DSgHzANR
         Fc/WLvft8yXfKEeMZQJeU9dU763RLY3/F3/zJXn+aZRMH87IlsWl8UaUK+I/3bPbOm/t
         uopvfKGoAbgr3lqbRx5dOIq714+8f/mgduXDQWbBfwLLwLN8LJs7uijz3FjpkhGt2Ejq
         T0aA==
X-Gm-Message-State: AOJu0Yy/A4dh7wFXFmeWQPiLp6WUxbekybFlx+qMUuQtrZtcgdbyBeFK
	EhsiWqlQonJH/VjES4ms3EfYWW3plqVssGozakyPBNKiyxuLk/5EuOQUc/Ltzg==
X-Gm-Gg: ASbGnctvCyBejOD2dDq/9WwWPRQWjZoF6i98ksdtwMQhjCzFgsGxfKPZ85yoqCsHBfx
	+WOIRkZ5y5BKhAerQI0VcjuA/zPnlP5Sa4450UHFwe9xQJincYJW3B2gMDAC0ktoz/wBwi5u8iF
	awiDwYY/FdyU98/WSfufH0ngJKozIZ77xz68qTTGxnrgfeExKJF3Jxi6QsFz5Of0zSY74TcO2ov
	5OsJs068d4hy9hjVSRJPqeQUpulJ/ypfxUDdhPxN7mXHz/wwuwojQSBJQTf1LY57mS+FKoJdwIa
	+qYyoHISrib3Piplk14eMRrKnFRozlHF6m1Hgxi3X+eXMYNSKnbhuFoUfI6czXnozBe2tven9Ro
	JeLgt4hXaKnHwHQVCNTCk
X-Google-Smtp-Source: AGHT+IHnIkLbgT/7gO50O/Sf1fRsenZw9Bb98fEL0CuLuoxqlBwwVVv6VjNvWHiR0xBr6R+Xa9Z3rA==
X-Received: by 2002:a17:907:3e0d:b0:b28:b057:3958 with SMTP id a640c23a62f3a-b34be100c78mr1000675266b.48.1758920019312;
        Fri, 26 Sep 2025 13:53:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fcde4asm432651166b.76.2025.09.26.13.53.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 13:53:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mosh: set working SRC_URI
Date: Fri, 26 Sep 2025 22:53:38 +0200
Message-ID: <20250926205338.164107-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 20:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119939

The project switched to storing their releases on Github, and
the original links stopped working.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
index bea22b18e2..d0db02e08c 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
@@ -14,13 +14,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl libutempter abseil-cpp"
 
-SRC_URI = "https://mosh.org/${BP}.tar.gz \
+GITHUB_BASE_URI = "https://github.com/mobile-shell/${BPN}/releases/"
+
+SRC_URI = "${GITHUB_BASE_URI}download/${BP}/${BP}.tar.gz \
            file://0001-configure.ac-add-support-of-protobuf-4.22.x.patch \
            "
 
 SRC_URI[sha256sum] = "872e4b134e5df29c8933dff12350785054d2fd2839b5ae6b5587b14db1465ddd"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig github-releases
 
 PACKAGE_BEFORE_PN += "${PN}-server"
 FILES:${PN}-server = "${bindir}/mosh-server"

