Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF70CC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 03:49:59 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.6355.1647488999390511866
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 20:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fRShtYKg;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id i11so2759925plr.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Mar 2022 20:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VN8+SvkFC6AS+3fIxsjwetY3DtS6dCcDGvZRRPMGDx4=;
        b=fRShtYKgs/qZloUr1iq7RsFhUNAKVZCdQZkvqnsHEtT2CvBbgrDNoheLNGMmgviULK
         KPKx1z8DDALkpOkMTKMR+Bs+v0+P+8GxXYhQraIcO6g/CSAhMjKE10hag8cC9yiv/Ma1
         6/muTA6fvzojBv14XvPV8V3O40gVaWFSDqxKPvCplf2oQZ0iRVhnx6pV9nqJD6uHEnWE
         SzYnMdfHEebNjpWWVxlNlWtA4v99cKC4Ny+XXKJQQ6P1i9VV9ML++5FjbmYUeX3i3N2F
         O3VyCWRy6917v8HJNjho8wDPM6IFsbkIjj67wwlcoD9dB9CG7FDZbbE6QnbDOEMxcwHI
         Mp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VN8+SvkFC6AS+3fIxsjwetY3DtS6dCcDGvZRRPMGDx4=;
        b=N8sT9QuSmza9bvJr4JkPeady3150AfqVXr+PzXm/Yor84xf8Uv/dXUp6bvWAli1bzi
         jyPSnzXQZHxWvGJe8toVkINP83Co9TCe4Od9g1Gc/YwqNz3pr9U2IR4FrwXa067is1/e
         kWFDs+WEshyh5eP8KE/0wIy1hNVIBLBnDoCMc7zKcGVr46GTBEj3/rtOh26PGR6UsL+a
         xjePB9OOSQVim+OqIQN+Tan9FbtDJkptnhJMmfX1WmV2wIUGkgpgNATe8hgjNa/U1j8y
         LvsuC4Ekgj98EkpwKCTjp+0BAbaX8VDnpPWMwDq8qUn1KpMiQEfivfRGjblecFvxna0D
         oLVA==
X-Gm-Message-State: AOAM531INpXEgZhx768nalFxTac6YTUShosGlAQfJV7ylB0OAXE/MBVw
	8qz9EnFgsTw6lRVZj57AUFnLIFeP+uGLGg==
X-Google-Smtp-Source: 
 ABdhPJxsV6ajTUuZYiGZKUIY/VZa9bBRVWhJy1diME7UdpPsvmoCYTTFeX7k3t7pqEGLH39AH5UNMQ==
X-Received: by 2002:a17:90a:ab89:b0:1bc:71a7:f93a with SMTP id
 n9-20020a17090aab8900b001bc71a7f93amr3044319pjq.111.1647488998685;
        Wed, 16 Mar 2022 20:49:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 w12-20020a056a0014cc00b004f790cdbf9dsm5262665pfu.183.2022.03.16.20.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 20:49:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pytest-runner: Remove
Date: Wed, 16 Mar 2022 20:49:53 -0700
Message-Id: <20220317034953.2517843-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317034953.2517843-1-raj.khem@gmail.com>
References: <20220317034953.2517843-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 03:49:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96033

Moved to oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb     |  1 -
 .../python/python3-pytest-runner_5.3.1.bb         | 15 ---------------
 2 files changed, 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index e285692f47..207ab36034 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -341,7 +341,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pytest-helpers-namespace \
     python3-pytest-html \
     python3-pytest-metadata \
-    python3-pytest-runner \
     python3-pytest-tempdir \
     python3-pytest-timeout \
     python3-pytest-xdist \
diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
deleted file mode 100644
index fed2d91140..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Invoke py.test as distutils command with dependency resolution"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
-
-SRC_URI[sha256sum] = "0fce5b8dc68760f353979d99fdd6b3ad46330b6b1837e2077a89ebcf204aac91"
-
-inherit pypi setuptools_build_meta
-
-DEPENDS += " \
-    ${PYTHON_PN}-setuptools-scm-native"
-
-RDEPENDS:${PN} = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json \
-                  ${PYTHON_PN}-io"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


