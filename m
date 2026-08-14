Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3DDC5DF74
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:32 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24408.1786747650346999763
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jtekCLgL;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1998011a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747650; x=1787352450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OsakVRrKk00bC/l5x9XAd4JpjM63QBCZkSXKKlTyEJ0=;
        b=jtekCLgLAKz8Ig+W+7wNtaQHTytchPiYKmQwx0GV9yfTSXIhOGKy5aZQTpG/huWrnT
         sxGMTjLTfglklXuSM66/oAuLTl9um8PJrJJujPJTkyDpQRdTYzTnnp3IzrrDvz+5OFLs
         PkvPQLqz/QvlZXKAIjgA+9Fw3lxELMXIZxZYiTKp6iLie0ouGMYJvg5fuvFGZ+laMJaS
         JslhUDnybfn3CC+ufkEVTokMsPXwgjMGwi8OwOrFQ6Z1Dx4g0Lwjz7SA/9txnvRN7VdS
         N0rTLBuua3tJ/zpagVE9UAMKsDcoMlUPQgh8UhvCN0y+MBywER/bxBkXMuNabpcMHvQY
         acIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747650; x=1787352450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OsakVRrKk00bC/l5x9XAd4JpjM63QBCZkSXKKlTyEJ0=;
        b=KMoINRgpSyCMgH1jLY4GfxNKaUs+amFOQp750vGqIhZMsEgfYGkuK5IdGb4irg8bmx
         0uORJoGdM3T6mmnT8yWrvQ0+A9ilrHI8IkyOK2XZHzHkAGH20lOqHBpCV3pt1te5ghJb
         GX4gRDTePmFrUK0eGqPSlFSbcQzVr+UdiyJLsgixumy1k9p8W2NN2mSRw/ZGzFgUyYjA
         NGqdvBgACWcrUvwiHBxmONuWPu7XnAD6kV7mb5j/3RLsRghflqTBGl9nvw6GwR0ZL1Ql
         eL+R9mEVZelMuTF2Da6kCdnDNZl1WSleZDPKMXBXttC3EbGXikj0F4GB3UZcuGoGBPYh
         ADTg==
X-Gm-Message-State: AOJu0YzaHEvgfOVFHtonSR9qzCIv1VQAqkVJxRwAJdwWv6+Bm5xKKNEk
	N1F7/UXh4P1/NfsPpN0z4pqxLuA4xi1WA6Ydn3QREmR9l9LmhNiCbadi4cWfdAaw
X-Gm-Gg: AR+sD11LyNa4G/nhOZ7iWLHtpOfGhNY1N6CCUpJEcXab5raBCMPIOzIWBEWg6+rBh/A
	IzEAiRRsu7eQ6wRBpdu9uXrcCa8YjTLiXbMDli6Oa/ATF5GOgI2Wj/0MoO7G/SkuQgDnDS3fJbM
	CpBwEUGc1q23HS4ww9ZBSWXXlZqDZIzEVshhSQH8jswLubMEfnplmZaATkSzD7qtFT4hRlDvXZU
	7iGxIqJwqGnbSUgOLxVQnXfH8WZZ1ZZPYf3i+kD41j0WbMdIHnP4IphYHSyX0FNn10Hu5zpgFSD
	yMHZX+x381MGzPpI96eclPP7sdhzHIb7ZhhES5gC1bi6bhQ1288z9DRm84MjASpSOJKbeKUI9o+
	ogRkSwPk+Raq5e2cLARmUDmhblecluWFcli+tE831rzJNeASSI10Ue0zG74oGP87R6emEJ1RkpG
	6wzeJsykvoZ3NlFiYXNHBKf08ltHuupKSOzptCq1Fwkhvf5tu+FQiPmsZnzrkUMSCF6TSWu94s+
	zCrEKzB2njZDfIhT/O2V/hpA7Akv0uIdCStlRX4N27IUAwPDY/8ti9DgeAi7J0LyhKNDy5Pw0lZ
	HVMtZ5L38+GceK4gg2uacwgQVw2SS721JPEoJ0NiRcVpiHxpVYfzBHGarj40Enougjlph3j4MJ1
	x1qJbnaDPDxZVzHr5GxN7iI/MB/ocNShXDsjPQxJ0JLugLQ==
X-Received: by 2002:a17:90b:2e4c:b0:390:b41a:b92a with SMTP id 98e67ed59e1d1-3933bd0d632mr11069138a91.4.1786747649592;
        Fri, 14 Aug 2026 15:47:29 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 090/109] open62541: upgrade 1.5.4 -> 1.5.6
Date: Fri, 14 Aug 2026 15:45:16 -0700
Message-ID: <20260814224539.1523174-90-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129154

Same 1.5 release branch; bump SRCREV_opcua to the v1.5.6 tag's commit.
The mdnsd submodule dependency also moved forward to its current
master commit (upstream's .gitmodules for this repo now points at
troglobit/mdnsd, but Pro/mdnsd carries the same commit history so the
existing fetch URL still resolves it) - update SRCREV_mdnsd and its
LIC_FILES_CHKSUM md5 (BSD-3-Clause text unchanged in substance, just
reworded/re-wrapped with an added copyright holder name).
SRCREV_ua-nodeset and SRCREV_mqtt-c are unchanged.

Build-verified with a full cleansstate rebuild.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../opcua/{open62541_1.5.4.bb => open62541_1.5.6.bb}      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-protocols/opcua/{open62541_1.5.4.bb => open62541_1.5.6.bb} (90%)

diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.5.4.bb b/meta-networking/recipes-protocols/opcua/open62541_1.5.6.bb
similarity index 90%
rename from meta-networking/recipes-protocols/opcua/open62541_1.5.4.bb
rename to meta-networking/recipes-protocols/opcua/open62541_1.5.6.bb
index 2f4b763118..adb500c954 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.5.4.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.5.6.bb
@@ -3,19 +3,19 @@ HOMEPAGE = "https://github.com/open62541/open62541.git"
 LICENSE = "BSD-3-Clause AND MIT AND MPL-2.0"
 LIC_FILES_CHKSUM = "\
     file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad \
-    file://deps/mdnsd/LICENSE;md5=3bb4047dc4095cd7336de3e2a9be94f0 \
+    file://deps/mdnsd/LICENSE;md5=499b4033f2cdae5ae544018b57f81007 \
     file://deps/mqtt-c/LICENSE;md5=9226377baf0b79174c89a1ab55592456 \
 "
 
 SRCREV_FORMAT = "opcua_mdnsd_ua-nodeset_mqtt-c"
-SRCREV_opcua = "dfd44a234645ed29cc6d190048bc8ae80c5454cd"
-SRCREV_mdnsd = "488d24fb9d427aec77df180268f0291eeee7fb8b"
+SRCREV_opcua = "cd69ed6f6a4d46966f67794e23a7b7b331f7d402"
+SRCREV_mdnsd = "c1be962b37e4b952625d9b0a873e5ca619b1a35a"
 SRCREV_ua-nodeset = "257db9ad98ee7ba4b67d3500b54bfc9d744a36af"
 SRCREV_mqtt-c = "0f4c34c8cc00b16cfee094745d68b8cdbaecd8e0"
 
 SRC_URI = " \
     git://github.com/open62541/open62541.git;name=opcua;branch=1.5;protocol=https \
-    git://github.com/Pro/mdnsd.git;name=mdnsd;protocol=https;branch=master;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/mdnsd \
+    git://github.com/troglobit/mdnsd.git;name=mdnsd;protocol=https;branch=master;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/mdnsd \
     git://github.com/OPCFoundation/UA-Nodeset;name=ua-nodeset;protocol=https;branch=latest;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/ua-nodeset \
     git://github.com/LiamBindle/MQTT-C.git;name=mqtt-c;protocol=https;branch=master;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/mqtt-c \
 "

