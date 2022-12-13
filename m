Return-Path: <roger@norberthealth.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BD3C4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 13:23:07 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web11.73191.1670937781455097358
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Dec 2022 05:23:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norberthealth-com.20210112.gappssmtp.com header.s=20210112 header.b=zq4MpspE;
 spf=pass (domain: norberthealth.com, ip: 209.85.166.178, mailfrom: roger@norberthealth.com)
Received: by mail-il1-f178.google.com with SMTP id i25so4954144ila.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 05:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km7MEbM1Xu33shrbewr5tSWVUVsxeHije8tzMAXmExE=;
        b=zq4MpspEUaSqygdp/rV5S8mfm80DyIJmdF6sqmrxMMrpGaWoppYli6096bB7GVoYxl
         dnVKhZFYbHlBazNpp11X7eUL9ZWhP1VrnaE7xMA5Mtigu1r8Vdd1dnIh7EWmRAslChQL
         hgLCxEiFHOe7AWxG+0Hc3biN3HKCWdkMEVUfdo+SrlXghACmHga/OBo52k2BHbknkd1E
         X/9YVGdLvLjEghJ4suI2wLRjYbAPGAOBLQQeJ2XYRrpiCGcVgpmkSQASXY0UMH5759WM
         66iuI9hmRBwuvj0OnlqzWQ+eUuthsFcfMyNx8kLdKD6AaOLMSWLJla7rwf3mu1XmJWXM
         v4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=km7MEbM1Xu33shrbewr5tSWVUVsxeHije8tzMAXmExE=;
        b=n4SmemC90IX+2sWHzvUiH9wtfhqw9Lkp0Qkz2ejpH0xWSkiVSyMD1E9ZLDp/qbakUR
         MxFp2IzG2WDRT/AHS2NjTNDrxrLD79vbwMhv1DFnvCypyWF/s1/lFkNaKNSb0eW9Jjai
         PVKGCK79zKD3xOb//II3Ddv/AGIH0Fb0cdM2wILNq38an/meL7JpFrAb7yOpJ9Sk4krT
         4B4x3UjAbgRRlqBHPUI9GoNZDoGND3iaO8g7m1OpDAOk2Dd0pReDqYpfaPsUlQEs2tDA
         Z+V9W5sipnPjVNsxfBlOaXn2jCQek75CiDIk2kzft/ubZq/JHB2iTI+AoQniiSAFJAML
         gHug==
X-Gm-Message-State: ANoB5pllFN8wXpIdIE2ZmMu+89V6OLRWYv5DJL2Idfg9lwakYXvh2jmC
	GL+KLe8oFfkfPkBFxI7E9n2QJNfp1ST0YpyB/F9xSQ==
X-Google-Smtp-Source: AA0mqf63G8QYe3gZn8l8ZxqaOZv52lvcA+Ou7LGEu6QtUPSdOUWgdNTfvjndaFuT/CO4SD1h92Stzg==
X-Received: by 2002:a92:ca89:0:b0:300:ed0e:30bf with SMTP id t9-20020a92ca89000000b00300ed0e30bfmr10436795ilo.14.1670937780456;
        Tue, 13 Dec 2022 05:23:00 -0800 (PST)
Received: from roger-build-machine.us-central1-a.c.qa-pipelines.internal (246.143.225.35.bc.googleusercontent.com. [35.225.143.246])
        by smtp.gmail.com with ESMTPSA id r5-20020a92d985000000b002ff2774edecsm3777876iln.56.2022.12.13.05.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 05:23:00 -0800 (PST)
From: Roger Knecht <roger@norberthealth.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Justin Bronder <jsbronder@cold-front.org>,
	Roger Knecht <roger@norberthealth.com>
Subject: [meta-oe][dunfell][PATCH] yaml-cpp: dunfell backport
Date: Tue, 13 Dec 2022 13:22:44 +0000
Message-Id: <20221213132244.22529-1-roger@norberthealth.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 13:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100071

Backport yaml-cpp 0.7.0 to Dunfell

Signed-off-by: Roger Knecht <roger@norberthealth.com>
---
 .../recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb

diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
new file mode 100644
index 000000000..d3984abe8
--- /dev/null
+++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "yaml-cpp parser and emitter library"
+DESCRIPTION = "yaml-cpp is a YAML parser and emitter in C++ matching the YAML 1.2 spec."
+HOMEPAGE = "https://github.com/jbeder/yaml-cpp"
+SECTION = "devel"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"
+
+# yaml-cpp releases are stored as archive files in github.
+# download the exact revision of release
+SRC_URI = "git://github.com/jbeder/yaml-cpp.git;branch=master;protocol=https"
+SRCREV = "0579ae3d976091d7d664aa9d2527e0d0cff25763"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DYAML_CPP_BUILD_TESTS=OFF -DYAML_BUILD_SHARED_LIBS=ON -DYAML_CPP_BUILD_TOOLS=OFF"
-- 
2.17.1


