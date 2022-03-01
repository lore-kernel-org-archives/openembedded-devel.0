Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAB6C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 09:34:20 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.6348.1646127258796747610
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DDomyEyX;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id i11so25875392lfu.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 01:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=V2In9mZTxXwdGvqOctKJ2MmAhaORMicdA3e2rjPflDY=;
        b=DDomyEyXekHnheTQCSB8bcb+4Z8nxG2+jCqxflIswUoqFIQM4/ThipHAWF5XWW+jv5
         RLGIeIDo4E279j74TSG7s3oNY97expyagLowczjXKFzUwyvob78aLIHoiYumxcAto59A
         x7+Wyo/n0tKKtoG2cz0QujgSsPMXPAqD1W5+HH0XJa7oWd7aYUVxeA1dMoerp7WXjyIv
         asKIymxnBB0rJeNiuA2o2dWsiILI7zpunuf3dlFhomK6iPNS8nw6AkwTEvfDQdgsXjgg
         4W5G6AkkMT48yeB909ZPwu5n8ObJdq1SODG/ROpC7oiWi8f5hCYNWitj1NO5E6XgHnpa
         nAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V2In9mZTxXwdGvqOctKJ2MmAhaORMicdA3e2rjPflDY=;
        b=mY67pscMoBXpVUvP+aiQM4aRwbEU1ZSmNCvd8teu3A2tS4HDMECp6WucXZqN+8i4lM
         MHmYtQliTz2u2xlBjN+Bsh6XcSTKGgV3tAsgGZzTbCrdExP6mYMd+51MTaeYyU6uCW36
         33UofRRZv2zLBmVnAVBx1C8dm7jBChXNK5F+IxSiZf+7TS9+OVXlrcmFmU1fReKzczzP
         JjoQ2nogpBN2MYafzizx/WoW2N5mA/URGlRos/oxf+jOZlL2g3/ccO+j4wmKn8DgsC6u
         57qVoxSLgkRVA46jHuY/e4IUY5So+U/nAUmEbIxKptlbiG9mFBMu0OTh3xdYcwPNO5JD
         zEfw==
X-Gm-Message-State: AOAM530qT1XS9UQfm+9UFlXTiZl2D1wVM9Mi6Ao4xgKLMjTIqVdzbOfs
	+3wvsMP5vbcSAxEO1zYaYmXcoOpyiks=
X-Google-Smtp-Source: 
 ABdhPJz71/Ll0FOjgv+3I4lrk6mqwCno03SdUX7ZxQ/tF0YEdryPwVgUrrd/QNaNBTiIRINpdVQDBw==
X-Received: by 2002:a19:ad0a:0:b0:443:dc0d:b3ca with SMTP id
 t10-20020a19ad0a000000b00443dc0db3camr16085656lfc.239.1646127256753;
        Tue, 01 Mar 2022 01:34:16 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 4-20020ac24824000000b00443afc86517sm1395932lft.152.2022.03.01.01.34.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 01:34:16 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/3] python3-qface: add recipe
Date: Tue,  1 Mar 2022 09:33:55 +0000
Message-Id: <20220301093355.2746877-3-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301093355.2746877-1-samuli.piippo@qt.io>
References: <20220301093355.2746877-1-samuli.piippo@qt.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 09:34:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95623

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 .../python/python3-qface_2.0.6.bb             | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-qface_2.0.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-qface_2.0.6.bb b/meta-python/recipes-devtools/python/python3-qface_2.0.6.bb
new file mode 100644
index 000000000..6b47564ff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-qface_2.0.6.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A generator framework based on a common modern IDL"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eee61e10a40b0e3045ee5965bcd9a8b5"
+
+SRC_URI[sha256sum] = "87ce8ce7123ae57d91ac903c6c330a99273e7f4665a0ab88e6a17f9c98143a68"
+
+inherit pypi setuptools_build_meta
+
+DEPS = "\
+    python3-jinja2 \
+    python3-click \
+    python3-pyyaml \
+    python3-pytest \
+    python3-six \
+    python3-path \
+    python3-antrl4-runtime \
+    python3-watchdog \
+    python3-markupsafe \
+    python3-setuptools \
+"
+DEPENDS += "${DEPS}"
+RDEPENDS:${PN} += "${DEPS}"
+
+BBCLASSEXTEND = "nativesdk native"
-- 
2.25.1


