Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CE7C7EE2F
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9125.1685521561469529252
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=YtMR/HHs;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-309382efe13so4016091f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521560; x=1688113560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIEQc4yxf3LExv2HJ+08H1UZ3iYHfYln7c0Ef68faXY=;
        b=YtMR/HHsyshO5zwCUK38peRS7FiorPAzqN1mT2EiBDXAJcbQ08O/EsuWZhGASfOG4P
         /u8UJ5IoJSuatkqd0PTUy9k+P01c2ZTMYn/EMlWxlbRZ4FoPRuH8+UxGTZkXzy06ifsB
         G2hUEZlL9wygr5qhMHidOoS8a21MkP1TiW/Q2h+vPhUpzBj3KTmz4klKVzg7R4YK8D6J
         OzLYVy7BzS+RfxxHP7A+ojaKb1bOQxyf+jzaFAnlBxEu0gOgzRpwwYEGAV6gP/GrDO7R
         KOxFlbK+mC/ztNHjBg7Hq4FY+ShK86joA9F2+MmoV0vhx+I2Xx9CLpadvSFK7/nMa/kS
         69mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521560; x=1688113560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIEQc4yxf3LExv2HJ+08H1UZ3iYHfYln7c0Ef68faXY=;
        b=kk8H8DJgznr0a/XNgB/xV0fgzytbDkT4QSJ7zVoRLRcWs6nVzgI1wB2H8cQsUlDB07
         zpsB7Jx46uoMF6sbU3hqUV23wUZEGCgt1wCan6IukRaYxelWmaoSeLCy71ZNR7nBGTxx
         zFT62dmh3hFGUwQ0rnrxD4A5l7lv6fA4KctyHT7b8Yc/705R0Zydcb+11XDvY9GYjG6n
         +ZuxcxH0PKiflIKKvmZm+w2/7cLGZQCsrqO2cmDj9dKURHPWGxF0I4o1G79zlsNyIkN7
         vW042DgF+K6Tlu5RDZFm/GgdiguXlQjbJLBdd4L79Waw56ACqKhbUNbTbR0vtNdpas2n
         4NFA==
X-Gm-Message-State: AC+VfDxJ2H2OmNAhM3wuvhbJ3ZO1/6V6RRAdvS5nYibD09zBW0ABzPJ3
	Rr3yfkHORUahfrIDqh7Fb8B31g==
X-Google-Smtp-Source: ACHHUZ4LdXv4n0R+q5SvqOAXL8u054/2zy9HIArqnx2JPMIDtat0c9A0O2wxmhPY1emAAB+3PJNHGw==
X-Received: by 2002:adf:fa49:0:b0:309:38af:91c6 with SMTP id y9-20020adffa49000000b0030938af91c6mr3932123wrr.68.1685521560032;
        Wed, 31 May 2023 01:26:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 049/149] python3-xlrd: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:57 +0200
Message-Id: <20230531082437.10646-50-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102976

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
index 03c18e545..5e63d3c30 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
@@ -23,6 +23,7 @@ PIP_INSTALL_DIST_PATH = "${S}/dist"
 RDEPENDS:${PN} += " \
     python3-compression \
     python3-io \
+    python3-mmap \
     python3-pprint \
     python3-shell \
 "
-- 
2.39.2


