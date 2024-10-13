Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B56CF2576
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 12:57:36 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.31046.1728824246573876216
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 05:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cL6hty+I;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e2908e8d45eso2852236276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 05:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728824245; x=1729429045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwR/bZ2wQcYUkwmGtPp7Dnsxc9wndn8Wm8rpSIIVUVw=;
        b=cL6hty+IOrTKsf+4r970z8KEwpU+/eUDhq63vRFUDM1xKGkjK86JBTMjVNYj/k3mkP
         rj3Y3CIFW2VgtFOHU0CTrOB+Q9CUp/oEH9NvYy0Sy4T/uyaflQz1c2QnYVVW5ejA6WS+
         sFr7lX8FC/ZFs9Snr81nw3HWbgkVE1aMPXuDSulyBAxv4BKi2KjPpRI9Ldp+TqOwICRR
         iCvBNAI40f4YeZb+q9HcobpBWc0iY9uxLEQyX0VlnesVJ019kY/WckdbW7gX9mejELcC
         GjvaWredJI/yhpYOXP8RyI1F7QW8oIoD9VvuyJNGZHHztDPuhN33ugre/FjM2BrRk4fX
         Pffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728824245; x=1729429045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwR/bZ2wQcYUkwmGtPp7Dnsxc9wndn8Wm8rpSIIVUVw=;
        b=jncOxcRnXPV1Lek1JCvGtKDIJn0iWa8XWUT+A7JEPrrR9tvwb7gALLRFHl6+31xp4w
         Djr7yoHfQEIrMfq9Wo1zFwZ2VsJO7B2eZfU0YhmYUYdFlFY9HPgIIEOcNmpkx5iUn+l8
         NdqxZoqk19N/wA3xYX4d30c6RQlEHE4CaeCI5/88iIF/+EyR6bI826ExpIEcNlqjDBvQ
         PnKOxmPTSgqW+4G9CvfOOA7srGXUH0deydb/5eFrvWY9zRWBBwd5QbzrlOeyUwozkKYO
         tQeQ6U88HES6cn7udzpbqHjj5japkPeBxE4YlKJA9vtueGzCWyLaVLgKEU+O2YY+CwHA
         HDjw==
X-Gm-Message-State: AOJu0Yy6MqNs+a1w0rotRgih/MKgww64jv2LZmbTtYVvA8a7ybuU3LRF
	9+zxPFYjwg8fd30IgeJz5k/uFSxpfPst3ev74uA3Fq0BNk4WN8a+hT9f+A==
X-Google-Smtp-Source: AGHT+IHa5veBOYFQl/FoYRM7z4susH2GpRTyQYF8dmjYg6v2TKC0camg/e/JvzaVouNUCWJ0M2Qzmg==
X-Received: by 2002:a5b:c4c:0:b0:e29:2168:23b3 with SMTP id 3f1490d57ef6-e29216826c7mr4506112276.50.1728824245449;
        Sun, 13 Oct 2024 05:57:25 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332b611acsm12138047b3.24.2024.10.13.05.57.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 05:57:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: fix build when systemd is enabled.
Date: Sun, 13 Oct 2024 08:57:24 -0400
Message-ID: <20241013125724.3423485-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 12:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112837

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-security/audit/audit_4.0.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_4.0.2.bb b/meta-oe/recipes-security/audit/audit_4.0.2.bb
index 6bb8a2c703..4f1507923a 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.2.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.2.bb
@@ -93,7 +93,13 @@ do_install:append() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -D -m 0755 ${UNPACKDIR}/auditd ${D}/etc/init.d/auditd
+    fi
+
+    if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         rm -rf ${D}${libdir}/systemd
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${B}/init.d/auditd.service      ${D}${systemd_unitdir}/system/
+        install -m 0644 ${B}/init.d/audit-rules.service ${D}${systemd_unitdir}/system/
     fi
 
     # Create /var/spool/audit directory for audisp-remote
-- 
2.43.0


