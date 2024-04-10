Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFA4CD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 23:04:32 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.4523.1712790264120405092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 16:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dpptshjj;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ecee5c08e6so6869635b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 16:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712790263; x=1713395063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ye+MGN465omU6xxqDA+2v3YkO3l1ggVrdI/50ZLHVM=;
        b=dpptshjjmEvayVizNo1UAVWMyPkQaeq9Da7Kye7lvkOMc/mz+F164VDmKvEzwWE362
         Oivv4La6LrbHR/0FkrB2aFYaVLdmGlUmIMIr6H0rdCCOy6KWRjTZ+oIYdnYz91dP7rL/
         RTbrTYG7KeC2KcBh8cpqM2x7VWtVBKZaOjtiarXurCpBspGx26ZgEi4uKU8XhU1P49D9
         LVUp8CTfUGHVRHomW+FbFvnn3VQ4xcSMvE+p0w3iOiqtVtoF5O5RlPYtq9B4qmWekBbT
         WZsALg2v7qR6PIBPdAM34PdiBp+O9UtO/sg+E8baDfP8m3Lila8GGGuwAcZlTBYOAV4h
         MfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712790263; x=1713395063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ye+MGN465omU6xxqDA+2v3YkO3l1ggVrdI/50ZLHVM=;
        b=bTn1ZZuop8DauLKwfHxSzXiV0N9j70+BzRTjsC0CzJUTPq1jbURmEFT+alzBh51k95
         qGJuDY02jMHUzENiuEpUXs/r8vqx8XsDCDruQLnHfoEdnEo0KDqRDV9LohWtlZJNMsM4
         W3/f7yFQkRguvva4dG1wfMm+AWWdEvj3UBeIAGY+/DtHkhosdXGR1JfSj7jnFflxPQpa
         XQfc37p4efPnWiYqnMnXZ/hOMzJosTufFZctDDnIMjaG3YqFKVIbR6KLFNlkbKHvtMlE
         CXDIHBHhf+Gf5V+7TS6ZlvAgo/VwzZhSyoxueHUfMpaK2tJkAptusXQ8T4buasAa2ult
         qGcg==
X-Gm-Message-State: AOJu0YyetjPoQ323yDX84S0CgMFAAE9KBqMGcx3yyciPXYOJ/VaQah45
	v+BblBoo01rAw9sa6eCxjEYnEPYuy/GaTbFl3Am9x6SpIPZg7hWi/sk9tdxw
X-Google-Smtp-Source: AGHT+IEEVbxTrwtZsAlhftcrrVPDsydefd7xkvsxXvz0eYm0jSvn/jy3kRtQsBoDViitfW/fLItW4Q==
X-Received: by 2002:a05:6a20:2584:b0:1a9:5136:13ba with SMTP id k4-20020a056a20258400b001a9513613bamr4570439pzd.14.1712790263141;
        Wed, 10 Apr 2024 16:04:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id m19-20020a056a00081300b006e6c74eac34sm166293pfk.151.2024.04.10.16.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 16:04:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-flexparser,python3-flexcache: Add recipes
Date: Wed, 10 Apr 2024 16:04:20 -0700
Message-ID: <20240410230421.2359482-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 23:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109915

These will be needed by python3-pint in upcoming release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-flexcache_0.3.bb  | 10 ++++++++++
 .../recipes-devtools/python/python3-flexparser_0.3.bb | 11 +++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flexparser_0.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
new file mode 100644
index 0000000000..509a6a42eb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flexcache_0.3.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Saves and loads to the cache a transformed versions of a source object."
+HOMEPAGE = "https://github.com/hgrecco/flexcache"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=32f547dac365c355d2cdbcd7ebea9144"
+DEPENDS += "python3-setuptools-scm-native"
+SRC_URI[sha256sum] = "18743bd5a0621bfe2cf8d519e4c3bfdf57a269c15d1ced3fb4b64e0ff4600656"
+
+inherit pypi python_setuptools_build_meta
+PYPI_PACKAGE = "flexcache"
+RDEPENDS:${PN} = "python3-typing-extensions"
diff --git a/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb b/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb
new file mode 100644
index 0000000000..fb94235f05
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Parsing made fun ... using typing."
+HOMEPAGE = "https://github.com/hgrecco/flexparser"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=32f547dac365c355d2cdbcd7ebea9144"
+
+DEPENDS += "python3-setuptools-scm-native"
+SRC_URI[sha256sum] = "692e7524d9e14b2b1231b772b091d7d6296951deb383f5a67bfbd0ecb0b9fa9a"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "flexparser"
-- 
2.44.0


