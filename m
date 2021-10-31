Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A479C433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 10:14:05 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.29064.1635675244657070230
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 03:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GiVztnKU;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id r4so53658578edi.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s944LQsg3JofzUlOtXWWJGzt1Y4P9ZCVoQ/126Ucvxw=;
        b=GiVztnKU0RHQn4MEQ6BvhnuLg99vTEh6blFh9d693zpAlS9ehhobW1gpGqEuhKaWsY
         38l08MJePpgs70wMp3MQXRYI9mgS93dn4QAMG8DI5OIeQ7Atv0QvpCVWCDnmhSSIPmMZ
         iFn4HePf/z7le08CnOocKxHH5SYAVdKgoLTifgfZ7j8zqFaWZckuo1DvGjuWi+gbr713
         bwa3thqVkQ97KHReVDrAtxZUgbtQpCmQ6CygdIXTQi6MEU0sA6vQKRvPFxJTxYLbTQyG
         JFY5W5vGGH13wogUXBEV/VRNdBM8+6mzEmpOVkwiDCFIDOYF2dBuICEtFWEBA52Tt/p+
         vsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s944LQsg3JofzUlOtXWWJGzt1Y4P9ZCVoQ/126Ucvxw=;
        b=VNfWRRBlyjgCEiPXlWljtVrU3WrdLI7B7MX4PdCZ8vVwnf46AAy7AXsB9EJzuqAmuA
         hDO/CI0fDc7u/GfCJilIZynpGNyGsydvW54oEVUWrKsv2KeeUunxsMnllEEcx0Krk1Tl
         lY24qUv9EKZAAflAV17BHHJpw654ncH1hH3u9yqLlLzk3nAZndJ2L/5iTbkAq1XO142W
         CFIUZQkqSfJ5RgQzNwM3JxeOotjtAbsWrkKcCFKyPyleVLzPahRDecMmz5feuk+kUHiC
         AtixZJWWZtsRGAh3hOWL9Bo+PbajbFEZa1UGPUlks3V9opSSjJwQeBywS879WHt+RIGf
         +pEw==
X-Gm-Message-State: AOAM530bzo5UH54xvT0BrjSi5xYpmWp35R+eW5QmmCGzqpFSgl+GBfGO
	jri59Bhy8s3c0tavgNARWqQFJZrIzIs=
X-Google-Smtp-Source: 
 ABdhPJwSpbrOEbmy34bzT6Jd5u/j2sturAZCjk7M3Ep9wQYvQA9GVpTz4IS8dcWADqcdJ0R05qG7Vg==
X-Received: by 2002:a05:6402:4415:: with SMTP id
 y21mr5615624eda.213.1635675242365;
        Sun, 31 Oct 2021 03:14:02 -0700 (PDT)
Received: from localhost.localdomain (78-20-166-56.access.telenet.be.
 [78.20.166.56])
        by smtp.googlemail.com with ESMTPSA id
 r5sm6725535edy.86.2021.10.31.03.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 03:14:01 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: Using the github.com release +
 upstream_check.
Date: Sun, 31 Oct 2021 11:13:29 +0100
Message-Id: <20211031101329.2718739-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Oct 2021 10:14:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93680

* Moved to the release archives instead of git.
* Added the UPSTREAM_CHECK_URI.

Note that the latest version of netdata is 1.31.0.
But this one doesn't compile on Linux in cross compilation.
The next version should have the fix.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_1.22.1.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.22.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.22.1.bb
index fb4d27294..fb643be61 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.22.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.22.1.bb
@@ -5,8 +5,8 @@ DESCRIPTION = "Netdata is high-fidelity infrastructure monitoring and troublesho
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-SRC_URI = "git://github.com/netdata/netdata.git;protocol=https"
-SRCREV = "1be9200ba8e11dc81a2101d85a2725137d43f766"
+SRC_URI = "https://github.com/netdata/netdata/releases/download/v${PV}/netdata-v${PV}.tar.gz"
+SRC_URI[sha256sum] = "f169c8615a6823448c2f1923c87c286d798132ea29d26f366e96d26e0aec3697"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
@@ -14,7 +14,9 @@ SRC_URI += "file://netdata.conf"
 # file for providing systemd service support
 SRC_URI += "file://netdata.service"
 
-S = "${WORKDIR}/git"
+UPSTREAM_CHECK_URI = "https://github.com/netdata/netdata/releases"
+
+S = "${WORKDIR}/netdata-v${PV}"
 
 DEPENDS += "zlib util-linux libuv"
 
-- 
2.25.1


