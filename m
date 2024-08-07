Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077D4C3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 11:41:59 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.31281.1723030914034779340
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 04:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d6qJcizu;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so4848695e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 04:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723030912; x=1723635712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wXN5Hlo9NsKUYROKckjCJXj/cxxUr1w8dz6MWKegNI4=;
        b=d6qJcizuxd68jQ+Hg76sRfoBED58X5CFDZMFxYLCDjMaSm/v3pSSIJ79/XelmuMvI4
         dAASxj/OZQa5afYsw5k3Z0lk4tc66bG2MtDaJKrnR0Y7JwG+eec5ymIXJUdNZo1XZ/Hl
         8jZnX9RL6wvJ2dQPn2hISOU//xHRHPw9CYRuxT/t00EYEC0mqZ3ksm+7tmKWcfC+IRIg
         iUWisLdQN+CV6wzdowG4F91d4nbCDB6PH5P5ZnPFOEnU/FwApPNeJxur+U1HAIJ4+OCs
         inptnxSg3+jzMabpP1dnca3lYWkA2w7VdskflE8M9bK4mfrTVcJNeDnA5+fpSrXeA/ok
         UBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723030912; x=1723635712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXN5Hlo9NsKUYROKckjCJXj/cxxUr1w8dz6MWKegNI4=;
        b=jrIWyniemvULth5ksz4txa80mAB704h6iD05NqQeIREYRybNHp0tM1ZG+tmG90eOPX
         7biVdcqqdSQuN6rdMkij60hGKt9bMc31ssof2bhPjZDYJeSoJU0+dx5tYBp6OLjPFQ68
         y5Zz4vfSPkT/Jo8x+S34pL0jmvhxMuufI7WWtxy9tos8qqCnOFPYyc4/X3WmtfAelRzs
         0BVFrrPWIJo8WdIBEqehT8E8UtsDNbdu4cbRx946yMCaTSLllWr3eEGv/A4CUQfp6gQG
         Nw7rhqjQTOuvh3lGB2nP/zoYpGfj3Xa9umf7D7N2O0wKGj1KWPggbgNNEhazTN/FgtQq
         vSkA==
X-Gm-Message-State: AOJu0Yx7pnS6xUI1OR9GazelmwgGOyBeFwjb7AzROP1hwl0TSxVTyr7m
	2nFD8szC5MSEo39wruS86oJQvqzJaUTqkWiR3PMoJwBMSQf9xLV+egoDVyEf
X-Google-Smtp-Source: AGHT+IEKCC/HFWzWXVmcAiJv6pIjoWtshCbx/tDD1zm+zziE+YmuYOHb3iJ/DjfDZE2yvWzfDZb2ig==
X-Received: by 2002:a05:600c:5118:b0:428:837:7015 with SMTP id 5b1f17b1804b1-429052ec5ecmr13984455e9.13.1723030911615;
        Wed, 07 Aug 2024 04:41:51 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905796a29sm25708575e9.10.2024.08.07.04.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 04:41:51 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-pykickstart: switch to PEP-517 build backend
Date: Wed,  7 Aug 2024 14:41:48 +0300
Message-Id: <20240807114148.82535-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 11:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111618

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-pykickstart-3.48-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python-pykickstart/python3-pykickstart_3.48.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
index 953068f7c..a7bd8ae43 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
@@ -5,13 +5,13 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
 
-DEPENDS = "python3"
+inherit python_setuptools_build_meta
+
 RDEPENDS:${PN} = "python3 \
                   python3-requests \
                   python3-six \
 "
 
-S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=master \
            file://0001-support-authentication-for-kickstart.patch \
            file://0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch \
@@ -22,4 +22,4 @@ SRCREV = "fa6c80c0e5c6bee29d089899a10d26e6f7f8afd8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-inherit setuptools3
+S = "${WORKDIR}/git"
-- 
2.25.1


