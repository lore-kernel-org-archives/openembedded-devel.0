Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDA6C76195
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 03:14:54 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.93497.1679627688151863246
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 20:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ArjCpGJi;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id h8so2700650ede.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 20:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679627686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUndoCh5DEucPri4n6eTF+yxEE5j2NpGPogeBWTB97w=;
        b=ArjCpGJio2raLqLV8p7ao4j6BtnQdEWfE70qJzOlubrCPt4lsNT90V0vuW7mZ69Q/o
         2c9eqa1MoodGDnSO3wty3bglOhxHqxLQEnpV6/rSZEN+tQbEHchSaKYvmad8NHzLayN0
         itUfFTntjDTxca5nYFqX6lFlKFoc09B0ZdqlUn1tRk6Kk0Mv99roaygY99nNhCVyHUKP
         hHQVLkmDg9NnObL9xw4/+9ST73XT4fsoMrVAWybZBo2GH1TXOx3rhMfQ2lkwk7fK1/Jz
         /tQNo5dzjbleGlL7BMc0lBqXW3ABpirU9D2edwBrPySihEn7EQvtVbypVZyBjw+/FSQG
         MDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679627686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUndoCh5DEucPri4n6eTF+yxEE5j2NpGPogeBWTB97w=;
        b=oXuV23vmry9Y+DrCDroibjUp3U4Zkv6TC75ZchGrXUCWgCtgdOAV7dJ/NQyXXiC6mT
         Y5a7ZYWooBYYSidaq1J2mSYfK9YdrG1XyXXEzT0jUZ4yXdytFfKWxVKKp0QLoTEGDFfD
         /0PnzFL7kKL0/EadXX5KOACgpSy47av4rnEtiV1s2endvgM57R9rJ5iAjvQRVCWItGOh
         YW9ZkR2UPC6fZIU32Ohz5htQXva50fXHWAyWDtsJHhs21RKf81haxpZM81xg7lRe0Z/S
         HDCAQYs63JE29DVh7MklxqRN9sblsA2qy/0Q2VfGCnMqyqSg69eD7aTUVJJz16GCKCu5
         68Sg==
X-Gm-Message-State: AAQBX9c468j8HPvJM/5CDGez4q75ZJbLn2VAcxw/sFx2UqfDYIimUgnx
	AN0DYDl4JgjCYkk4bhNWHA0lHBLGifs=
X-Google-Smtp-Source: AKy350ZP817N3V0W8+uwzXd/zjyBjsBkM63A6qpL8aXPVMCM2hG+cjnE1MvADB4ZTvQeIgA1ThgVsQ==
X-Received: by 2002:aa7:d74b:0:b0:4fb:5607:6a24 with SMTP id a11-20020aa7d74b000000b004fb56076a24mr1490378eds.8.1679627686387;
        Thu, 23 Mar 2023 20:14:46 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id o2-20020a509b02000000b004faa1636758sm10000010edi.68.2023.03.23.20.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 20:14:45 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH v3 2/2] python3-meson-python: New recipe
Date: Fri, 24 Mar 2023 04:14:42 +0100
Message-Id: <20230324031442.1799-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324031442.1799-1-zboszor@gmail.com>
References: <174F084936A66D24.22739@lists.openembedded.org>
 <20230324031442.1799-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 03:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101702

Used by inherit python_mesonpy.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python3-meson-python_0.13.0.pre0.bb       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-meson-python_0.13.0.pre0.bb

diff --git a/meta-python/recipes-devtools/python/python3-meson-python_0.13.0.pre0.bb b/meta-python/recipes-devtools/python/python3-meson-python_0.13.0.pre0.bb
new file mode 100644
index 000000000..48e032cb9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-meson-python_0.13.0.pre0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Meson Python build backend (PEP 517)"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d580b27e67cc0892a5b005b0be114b60"
+
+DEPENDS = " \
+	meson-native ninja-native patchelf-native \
+	python3-pyproject-metadata-native \
+"
+
+PYPI_PACKAGE = "meson_python"
+
+inherit pypi python_mesonpy
+SRC_URI[sha256sum] = "8d537a0304709c31c11ffa34872a62a4c06a6a6c24fc862b7fb4306f3e881b95"
+
+DEPENDS:remove = "python3-meson-python-native"
+
+RDEPENDS:${PN} = " \
+	meson ninja patchelf \
+	python3-pyproject-metadata \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


