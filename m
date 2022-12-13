Return-Path: <roger@norberthealth.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C53C4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 10:31:06 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.70276.1670927458736333050
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Dec 2022 02:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norberthealth-com.20210112.gappssmtp.com header.s=20210112 header.b=6x6jvdwe;
 spf=pass (domain: norberthealth.com, ip: 209.85.166.172, mailfrom: roger@norberthealth.com)
Received: by mail-il1-f172.google.com with SMTP id d10so67477ilc.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 02:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcgjDVFBRJDcHxW39bZkMrrm/qMD2CAw5r1JtTvYpH4=;
        b=6x6jvdweqx32fFKKG7mTgg7hLlYlPEYRmns5seYwA9tU6Z6JxbDmopESDYKdI1NhiY
         Lu/VtPAz82E/5HDINCBIZjVqK0dXe/lyOJhslxBooCffzJ8BTvnxooOUd9poC9GaLQiD
         9lkwUSQNoNlBcbVUQeQFj9KKh10EiQeKxauLoO2yvTVfboiz81yqx5ZY0uDPThnjj21d
         H3TW8KvjArkfDpr5w/LsSaZ8ogqtrLfUyYphiG2oyWZzWge+d/1a0QYLYLXEJ8qLzWGY
         Katu45QPIgnfXuq/apPXLpXoxROMIXXcx+zz8TAf9tyF5s4CLoKszgdUyX0GzA99b2Rd
         y54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcgjDVFBRJDcHxW39bZkMrrm/qMD2CAw5r1JtTvYpH4=;
        b=BMLtp4s15FXSHwnqtMaXK6weWIKv4s79dsPNc7r6n9osX8RZpH6VwvoSg/4j0N3q3Z
         QWSP+U+XEByiEF/eXAE07JTdeFerZXLaQnh6cVtj5KEnbxrkBCp0O46fRy75DOs8aZoo
         DZ1kmNgqbGacBo0uY6fJjCIyThL0dp2y0VYkLR2abeM7FdYcs6hdVRahTKnQt70tmjFj
         VTt7q4PlMUjGnpv9aAAUyk39TCL5N+f2d6S93weg3wzK8c+7xAiRPc9+9MSTWbSbTsXA
         O/pTOOQMZxX2EYgYSCWaFp9SYUsD2VQwERb9t2BGDvPLs/5aQDn6IG7piJQRVBc6kbvC
         eofw==
X-Gm-Message-State: ANoB5plQVIDniZGEaTjDVXmOoqK/m7T6rfjynPtIUBRSAY5vlyv+2tdb
	hNERqLJy2nZUlIAC0HvZV173C13IkgNgmmpUXMOwqWAg
X-Google-Smtp-Source: AA0mqf72A/YTr71kIAf4utoWlPs70vViVvdiTdiov2jxUrgrU3hurpJ31DyZ4bJSlejsofrQINOtbQ==
X-Received: by 2002:a92:c9c4:0:b0:303:8c18:1283 with SMTP id k4-20020a92c9c4000000b003038c181283mr10426031ilq.31.1670927457768;
        Tue, 13 Dec 2022 02:30:57 -0800 (PST)
Received: from roger-build-machine.us-central1-a.c.qa-pipelines.internal (246.143.225.35.bc.googleusercontent.com. [35.225.143.246])
        by smtp.gmail.com with ESMTPSA id m18-20020a92cad2000000b0030249f369f7sm3617117ilq.82.2022.12.13.02.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 02:30:57 -0800 (PST)
From: Roger Knecht <roger@norberthealth.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Roger Knecht <roger@norberthealth.com>
Subject: [meta-python][PATCH v2] python3-rapidjson: add recipe
Date: Tue, 13 Dec 2022 10:29:42 +0000
Message-Id: <20221213102942.45198-1-roger@norberthealth.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 10:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100070

Add a recipe for the python bindings of the rapidjson library.

Signed-off-by: Roger Knecht <roger@norberthealth.com>
---
v2:
- Removed Git submodule fetch
- Use rapidjson library from meta-oe recipe instead of Git submodule

 .../python/python3-rapidjson_1.9.bb           | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb
new file mode 100644
index 000000000..8b50aabb7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.9.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Python wrapper around rapidjson"
+HOMEPAGE = "https://github.com/python-rapidjson/python-rapidjson"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4daf3929156304df67003c33274a98bd"
+
+SRC_URI = "git://github.com/python-rapidjson/python-rapidjson.git;protocol=https;branch=master"
+SRCREV = "8f4ab8e197ca30c03726b675ae7cce6ac9d6622e"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+SETUPTOOLS_BUILD_ARGS += " --rj-include-dir=${RECIPE_SYSROOT}${includedir}"
+
+DEPENDS += " \
+    rapidjson \
+"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-core \
+"
-- 
2.17.1


