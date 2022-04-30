Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2139CC4332F
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:21 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.26021.1651346352858302491
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=guOJvmVe;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d15so9711418plh.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Zokm3uSUsy9PK1oyYerLvwQ1TwxknvGTKMHXvHH8kEM=;
        b=guOJvmVeE8LakOK1t141YOx87cNWpp1QvokX/ZAzisNHGhwd3cQ01nCtCArvxzTxre
         EKIQcCjfX/agG3xvJkN+n4gGYL2v3PjcggpkqC0+GNMH0+VAmycsFZO/9QUE8lW2R667
         VJYMRb3q2d50H+xXCweiLK3yJ9Z4+QRD1Y6Z4DTU5Xyl2oBw3PozvNnOTJiFCUAGPvWm
         zVmAW1qXyvrmitDCBhudkiFNiaOrG7VCscBO0bNktzPWeLjEkgFMCX/TlugzGLaT1uyw
         oWNXin6//USDTcPbTcxxiK1U8TdK8jKVNg6s+JAfzkI6qJP4mjeI7b3YFa52j+gaVrM5
         EgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zokm3uSUsy9PK1oyYerLvwQ1TwxknvGTKMHXvHH8kEM=;
        b=06x6AQEdj+yPeg8iGvJDN9hAV8BFgj5pGAZj36eSAR3iL5dNkiaXPUEGMWFcnM6OTQ
         tpK3Gi8BmCc/dG5E1vW5HF2763tZ89ZDxdQ85RLR0uDkbYGu/KfI7Rt2D/Zy0x967E3n
         K8oPs6g7e6U5QdG1Yj0Idl3GBVQICdALxe68KnZWVaVH4Bx11LMWv++QLPVv7o8U6X8y
         3/ZBX0TLlEEMdXODflZhmbXy/JEm1zTQiKSlZicplvG+HKou7C43i8gpRSk1e6jT6Ie1
         InmrLxtFNY5Gq/IHmcZA63jx4e3/TijuCfP9BaZtMI4WUyQCAPBCIbbi1kZJO+Dgxksp
         B4QA==
X-Gm-Message-State: AOAM533yn+Gs9QMp/LFTBPnT2SCjdaf6C4yOqhqM6IBr1PgdfVDP/9q3
	H9+IHHntZsObbszMxuCh+Gktk70sh0Uc4Q==
X-Google-Smtp-Source: 
 ABdhPJy5mlkTB2jBl3pXZqIZuwoUaeLjn1Kzbg901TxaqwmCxdf14wBIlCtspEQXpE+Zt7a8vZxItA==
X-Received: by 2002:a17:902:b789:b0:15b:5d52:7542 with SMTP id
 e9-20020a170902b78900b0015b5d527542mr5037408pls.26.1651346352099;
        Sat, 30 Apr 2022 12:19:12 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.19.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:19:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 29/39] lirc: install systemd units only when using systemd
 distro feature
Date: Sat, 30 Apr 2022 12:18:09 -0700
Message-Id: 
 <9ac7d46c42ca6f5f11f55babdffe197d285915ea.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96896

From: Khem Raj <raj.khem@gmail.com>

These files are not needed when init system is not systemd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f0d0034e26934852a8d92176f87b4dfc4c7c2438)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb  | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
index c8929b75a3..f2b751928a 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
@@ -68,12 +68,14 @@ do_install:append() {
 
     install -m 0755 -d ${D}${sysconfdir}
     install -m 0755 -d ${D}${sysconfdir}/lirc
-    install -m 0755 -d ${D}${systemd_unitdir}/system
     install -m 0755 -d ${D}${libdir}/tmpfiles.d
     install -m 0644 ${WORKDIR}/lircd.conf ${D}${sysconfdir}/lirc/
     install -m 0644 ${WORKDIR}/lirc_options.conf ${D}${sysconfdir}/lirc/
-    install -m 0644 ${WORKDIR}/lircd.service ${D}${systemd_unitdir}/system/
-    install -m 0755 ${WORKDIR}/lircexec.init ${D}${systemd_unitdir}/system/
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -m 0755 -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/lircd.service ${D}${systemd_unitdir}/system/
+        install -m 0755 ${WORKDIR}/lircexec.init ${D}${systemd_unitdir}/system/
+    fi
     install -m 0644 ${WORKDIR}/lirc.tmpfiles ${D}${libdir}/tmpfiles.d/lirc.conf
     rm -rf ${D}${libdir}/lirc/plugins/*.la
     rmdir ${D}/var/run/lirc ${D}/var/run
-- 
2.25.1


