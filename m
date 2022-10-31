Return-Path: <boas.meier@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0576FA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 14:13:51 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.9630.1667225621534630653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 07:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fs48ZH8k;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: boas.meier@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 21so17656447edv.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9woBWDxG2fWe1iRGDN1WM6tsq3vu1gW26WzdGQRx4c8=;
        b=Fs48ZH8kjjDrNqmaX1UBCbQtvibHepwZJtMsr6KlcTP2/QMbdzf+Zv5RIWVgvKgTQ8
         gFpcfNzD414BPrOT0+kJ/2bHS2nh7dFsYf9d+Ux+jnBjNeOD1CdoYDhO3Oxciyfaq5fJ
         NM+Bo+BsK+ojbGMCNmY/ZRaUMtUYq5W6iJk/0XkG0ci9tvuW7O5fZdwJ38d1kYk6hHu6
         RWyFEQPksdCAtvLwEEv0I+lCG44maKC8HZtXkN4eTKQFq1jWf1R+JOHVo6nWK9imarb8
         y28s3icViuABJG8a13adT24O9J1koI6qzb++R324HplixqFxrAiZFUjpxONmKh5qbg0A
         eOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9woBWDxG2fWe1iRGDN1WM6tsq3vu1gW26WzdGQRx4c8=;
        b=dA/ZQY6I2nNmJzHtRxWx64ISjs4VMDsWniYsEG4HUZ/XU1eNVtvL0ENorEtL/gZwQL
         NjrFbV1xcbrWqZ8DPMwN9IYqGuMwTBdR06oAiVwrT4e2P57SuXPLVQETxrKz8P6cjMoS
         gI8L/H9svrj46dLO8faVtVNG/fWQr5bxErq51XHbTAxpJCdOCx06clerSbb3rqX5BXg4
         CsOhx8lMqr9pPwl15eAa/VJWlSaisICcYEo3Cmc2p+Ig6GSX4MynGXWCm99P6Nt+SBQj
         ESUEGWguKkvKPlbQCZT+07eeFgN/hpx6+jO4DL7iZ4woTN4sUmYImvxnAQpxLNaBfAt0
         93nQ==
X-Gm-Message-State: ACrzQf1bni3fit699foEiRa5dH0jfXoxFIxtHHxl4vojybyqpYgcOMXI
	VUTQ01Trfx6OV/vxCanSOLuMqCPliiU=
X-Google-Smtp-Source: AMsMyM6EMDofZzLMvi2YgmeY/FX0eflTwQGW5zQcWWu34IH2H/0rSC5MG6qE3rnPqKZhv6Qy1192bA==
X-Received: by 2002:a05:6402:2712:b0:462:3758:beca with SMTP id y18-20020a056402271200b004623758becamr13579413edd.157.1667225618649;
        Mon, 31 Oct 2022 07:13:38 -0700 (PDT)
Received: from dev.localdomain ([165.225.94.226])
        by smtp.gmail.com with ESMTPSA id ju26-20020a17090798ba00b0078d424e8c09sm3046774ejc.77.2022.10.31.07.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 07:13:34 -0700 (PDT)
From: Boas Meier <boas.meier@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Boas Meier <boas.meier@gmail.com>
Subject: [meta-oe][PATCH v4] jwt-cpp: add recipe
Date: Mon, 31 Oct 2022 15:13:07 +0100
Message-Id: <20221031141307.11705-1-boas.meier@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 14:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99376

Signed-off-by: Boas Meier <boas.meier@gmail.com>
---
 .../recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb

diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
new file mode 100644
index 000000000..8929115fd
--- /dev/null
+++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A header only library for creating and validating json web tokens in c++"
+HOMEPAGE = "https://thalhammer.github.io/jwt-cpp/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8325a5ce4414c65ffdda392e0d96a9ff"
+
+SRC_URI = "git://github.com/Thalhammer/jwt-cpp.git;branch=master;protocol=https \
+            "
+
+SRCREV = "4a537e969891dde542ad8b1a4a214955a83be29f"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "openssl"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DJWT_BUILD_EXAMPLES=OFF -DJWT_CMAKE_FILES_INSTALL_DIR=${libdir}/cmake"
-- 
2.30.2


