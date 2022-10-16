Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809AAC4332F
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 23:37:49 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.35274.1665963464966628856
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Oct 2022 16:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=dU32/UW3;
 spf=pass (domain: underview.tech, ip: 209.85.222.195, mailfrom: vince@underview.tech)
Received: by mail-qk1-f195.google.com with SMTP id o2so5737374qkk.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Oct 2022 16:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPAljFoT4qRZqvpPIFVN9Bv4EQ6Gx4lehwGn1cJ6/H8=;
        b=dU32/UW3kMAvmVcDVEQNzefMrA6bMIUDFHffb8XCJ0RFBSNvqQnlF2pEuU06hCPYWI
         UE1079fVPpBGtnNOnAyvLo59nimHIIZ8dbY7pbBZBTi+qJpr6B7cJO0Iyni+mmoCp3LK
         lXbMLpPle5QDnYPJi0vXjNJrR9YT5TAzh48bC4EQ5SqpSgJfI+NNJUhPZZf12jNrXefK
         d2Ms2/jiDu7LEiccbM1tRRbT0GRadQ2wKc/WK9fatBFJbbOqyB27nJ9YsP5WhPsRHlkA
         bZ/Wihxtf/Bsz2R3QdRxum+nznbu6uXhA/xcUPLkNr07PhfGJfQFyin0+4Zon3OC9lHE
         ztwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPAljFoT4qRZqvpPIFVN9Bv4EQ6Gx4lehwGn1cJ6/H8=;
        b=hsuh2ryJFxQ/KB/bmRFlxlzbuij+/d7y/zIuzAx2reVPDmVChQeH+HTuQ/SGBH2uwQ
         F5q3rdpkr1PslkYUvJ1T608FtYOo3TtQKqsHFbLX2hmqUJXhCjpsDCUbictt4PVbEZXJ
         0giMavXJNpq7V6uN3T+Kae5R7bPxP+UD4OOcyBTbo6kFwstwnUTxqEnz0zFelnZPfcgU
         HZb54TuRYBmF9CM9Ap0+YWUHkaT4lAsNEY4FJFfC/uKGYuEEJlDNI5Rxy2qLKb8PymcP
         XwoC1D+IISgF3dZ54lX8a2j6d2eyVFnFVpEP9+icwbVNv/61xLIb6eNgnUSPECSW3bT0
         Rtjg==
X-Gm-Message-State: ACrzQf0IJpgHRnEUhoYUdMocmCplemF88mCmorpQofN1jZ8j7g3l31uu
	ZAvIiylQwF3uN6T/TOZxTGSZTbimI208qK0nChQ4RQ==
X-Google-Smtp-Source: AMsMyM5is/krjNowfkJgttGHSOTRBGe1X5IwD2/1u9cTlSDfL/2tM8qs7WowMp1UEHlf5VecG9qjSA==
X-Received: by 2002:a05:620a:3712:b0:6ee:cece:c779 with SMTP id de18-20020a05620a371200b006eececec779mr5787467qkb.727.1665963463626;
        Sun, 16 Oct 2022 16:37:43 -0700 (PDT)
Received: from vince-ubuntu.attlocal.net (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.gmail.com with ESMTPSA id h15-20020a05620a244f00b006cebda00630sm8288774qkn.60.2022.10.16.16.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 16:37:42 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-devel@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH] linux-firmware: package amdgpu firmware
Date: Sun, 16 Oct 2022 18:37:20 -0500
Message-Id: <20221016233720.79979-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Oct 2022 23:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99183

Add packages for the firmware required by amdgpu kernel driver.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../linux-firmware/linux-firmware_20220913.bb        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
index 45c9d0e861..bf15e53472 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220913.bb
@@ -228,6 +228,7 @@ do_install() {
 PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-mt7601u-license ${PN}-mt7601u \
              ${PN}-radeon-license ${PN}-radeon \
+             ${PN}-amdgpu-license ${PN}-amdgpu \
              ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
              ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
@@ -428,6 +429,17 @@ FILES:${PN}-radeon = " \
 
 RDEPENDS:${PN}-radeon += "${PN}-radeon-license"
 
+# For amdgpu
+LICENSE:${PN}-amdgpu = "Firmware-amdgpu"
+LICENSE:${PN}-amdgpu-license = "Firmware-amdgpu"
+
+FILES:${PN}-amdgpu-license = "${nonarch_base_libdir}/firmware/LICENSE.amdgpu"
+FILES:${PN}-amdgpu = " \
+  ${nonarch_base_libdir}/firmware/amdgpu \
+"
+
+RDEPENDS:${PN}-amdgpu += "${PN}-amdgpu-license"
+
 # For lontium
 LICENSE:${PN}-lt9611uxc = "Firmware-Lontium"
 
-- 
2.34.1


