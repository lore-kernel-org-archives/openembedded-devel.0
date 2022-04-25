Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57937C6371D
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:15 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.34701.1650913849614013103
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 12:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VRQVsEhc;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id h12so24365573plf.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 12:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BJsDpqko/FTQUIBau5YqVLmHfW59IIXA4kCGC4RcKbk=;
        b=VRQVsEhcjPoz1pv+KAMpIWsqFPtLQuLiaYBa6P+Yp5GVNfIhehbKltf3CkGCx5ioDD
         Vr9IalpZPrHvrZyzFBJDtY1GOChNOLOuBbepLZAalihyVq4ZRVRjKGP2UcRg2khh/9ph
         8xZFZ6DPyzBzI6UZtZOyZl4ZxsJUu/4SjtYTBDRAN/KI/iGMKaaxpQONG3r7UPKUShlG
         4w7EvqnL5JTJsg2JLv2i9SelrtnP5D8FZevhMlN3vlkNYpaGBAYOddxXOkI2E76bWVi+
         fxF683qHvyp7rMWLMW8yZqQzq4/Ry9nwk18XC686li6kcYoVrvRyQalC4xp/4XdL3fox
         Ij2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BJsDpqko/FTQUIBau5YqVLmHfW59IIXA4kCGC4RcKbk=;
        b=Tu4eiqm6IlyZu76J/flLMDOf37s3l927LCwgQ9vQmCf1Ke2H3OgsNNkL/Zxt6Md8uf
         KiGrAN4z/RqiwTTxK4L9AxQeonWq0JsG4lQvzOgwELesvSosiMHJeo82j1zHHTAc9Jbx
         /BfL8jrdUpyeOcQ+c/S5/jJNd7FCG+ltd3N6JkDR3C3ZYSV3tof+f138ZKx1Ovy+xrQV
         F+Ui59vWx4A+eOidDLwOmETL1mx2ag81c3hgDA5W5UdEymOFyY5vm1p19cVjPwRst8KI
         v32dHLAwjqeUnnagNO8gXVAGz/vWeA3XNyFvzDfM/Q3B+8HXvIYx0LKNxr1sHPmXlwrY
         dkyg==
X-Gm-Message-State: AOAM530P2rV7bEa00FNLgeyDNdClKcH40Ba7v2pQx9mlSt3lc/qMMVzu
	kdlprORI8H0jHQM0pujRB3SJvsf42BnQdQ==
X-Google-Smtp-Source: 
 ABdhPJwNRFb7KpE3nYxWVBDZt2T8HxntWA9/63DvXdsVynb2D/Ib2az96MpWmxStLGimPdERYKuI4A==
X-Received: by 2002:a17:90b:314b:b0:1d2:a346:7204 with SMTP id
 ip11-20020a17090b314b00b001d2a3467204mr32572599pjb.57.1650913848924;
        Mon, 25 Apr 2022 12:10:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 m13-20020a62a20d000000b004fe0ce6d7a1sm12602565pff.193.2022.04.25.12.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 12:10:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] lirc: install systemd units only when using
 systemd distro feature
Date: Mon, 25 Apr 2022 12:10:44 -0700
Message-Id: <20220425191045.2455121-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96783

These files are not needed when init system is not systemd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.36.0


