Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E41BC48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 17:39:46 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.298.1708364383753608815
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 09:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZMcGqSWd;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d7354ba334so41590115ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708364383; x=1708969183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxPLRcdBEpjf91JEKm4tZHg5GLvXkDYo2/MGQfSIzN4=;
        b=ZMcGqSWdeELoGlrl6vQqHOC0e8wOGj6GoTriLOhv0Cp6PtwxxCyBYk86wvYKnHk3FX
         4tQ7x3PibgNNJA3RoDBdtBPcgHqfANNTFck9DbtS3JWowEClkbM7QIhRM729mWBSVznM
         RFZf0pIpRFqmfqAT4Wh5FF5wHMLf2UPscHayE05FwDLFf4sCGjRnt7jALEvrx18sw72q
         xN0g2Ce731kULsNS7MqYQPOJvS0wyfgOOhQOd+HA6Mo6oeJukdOHFgr6HH6eAtTP47L4
         29E2igqz4GOP4fphLEB8IAk4IzEyOJjWIwsQEg6A5UZollU8ySIL1ptR7ARHCEVIYVhV
         ph9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708364383; x=1708969183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxPLRcdBEpjf91JEKm4tZHg5GLvXkDYo2/MGQfSIzN4=;
        b=UqjTpUtxQkYeo8F9HVLyQNtlv1SmPyrntpL4bgeX6/oiomjL2ixA9AKANrNNlZYI5p
         nZrMTkWnlx4k+reKGbr/6y0RutXCSy2B97xFVDROk1j1XJLIyIfvno/iij5Is5U/sD59
         c4aC8QUPGsDp/qA9WF5KWds49zFb+PTDpoU/3oz2WpjfSCFMpnKTCbyThbsch+Js4p1B
         OxlP7FVH93FVmxGYLFOXtt1as6fyKHofySIL2Kg3nnZNPmHbBIeHGhZ40FlOpG9vzelj
         KGQeuAzeRdrY4cSDvJRja3rwyp6UsgBg5ZWdgaPDCYdFvXZMFgxf7sB9hx3xpy4Jxf0o
         roCQ==
X-Gm-Message-State: AOJu0YyLRyY4z/CUtFe3XGk7BFr7xgK5eSkcYPj273nIIL7NnzttluQ5
	MmFy1CPwoY14TQ34lsSaeguBHp+S451pUAEsEABFd41k0Hw3FYHq2jW6EYdW
X-Google-Smtp-Source: AGHT+IFwOv4M/FEsSeQCEN/caGmJtgHOGO6zx6Ozpuayhh3Fh3IYF4TPAd5o5zXh+N5+lbsU5ICLaQ==
X-Received: by 2002:a17:903:1cd:b0:1db:4f26:1506 with SMTP id e13-20020a17090301cd00b001db4f261506mr15399688plh.35.1708364382672;
        Mon, 19 Feb 2024 09:39:42 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id kr7-20020a170903080700b001d739667fc3sm4683455plb.207.2024.02.19.09.39.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 09:39:42 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-meson-python: move to oe-core
Date: Mon, 19 Feb 2024 09:39:06 -0800
Message-Id: <d2f0095463f7a014f29119343d2d60532e24cc09.1708364156.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708364156.git.tim.orling@konsulko.com>
References: <cover.1708364156.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 17:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108874

As part of the move of python_mesonpy.bbclass to oe-core.

python3-numpy in oe-core declares "mesonpy" as the build-backend in
pyproject.toml.

This is part of an overall move to replace usage of setuptools3.bbclass.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-meson-python_0.15.0.bb     | 23 -------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-meson-python_0.15.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-meson-python_0.15.0.bb b/meta-python/recipes-devtools/python/python3-meson-python_0.15.0.bb
deleted file mode 100644
index c4b01a3832..0000000000
--- a/meta-python/recipes-devtools/python/python3-meson-python_0.15.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Meson Python build backend (PEP 517)"
-HOMEPAGE = "https://github.com/mesonbuild/meson-python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d580b27e67cc0892a5b005b0be114b60"
-
-DEPENDS = " \
-	meson-native ninja-native patchelf-native \
-	python3-pyproject-metadata-native \
-"
-
-PYPI_PACKAGE = "meson_python"
-
-inherit pypi python_mesonpy
-SRC_URI[sha256sum] = "fddb73eecd49e89c1c41c87937cd89c2d0b65a1c63ba28238681d4bd9484d26f"
-
-DEPENDS:remove:class-native = "python3-meson-python-native"
-
-RDEPENDS:${PN} = " \
-	meson ninja patchelf \
-	python3-pyproject-metadata \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


