Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA8ECFA46B
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 18:47:21 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25.1763923632244437244
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 10:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jvhWETmJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477632b0621so24470175e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 10:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763923631; x=1764528431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HRL65+vDOuabE3OCz1c/i8JRK8zzzmLOMXk/aaH78t8=;
        b=jvhWETmJFhtl6M7CEOu4R1mpSE7dnBCiiBT5L7XPFc43XPjC3+yZSx/Z6oWbePwjSG
         q0fCSSMgh+bpOLn5BaVlIOsLZJrE0N8f4WfZJVayHNA9MKPkJkx+01n7zVnvI/pOV9js
         gLuLOJIDFxFv2vwJbIbqbIk4K632K/fhGSNOMUYvHJrF5UqobU/j5lzrqwm759v15tBX
         jGCxi6u2R3pyKCe8IfKNjX4yOi8N7t8F8MDgylnT/vGN2IatuaHaU53mMAyugw1in025
         qA4P4mcDbhQqqccJ+JE8Lsk4lR4+5lJMAkshbLiEzAa5tDhbMvtJZaQCOV3XaSvRhvVr
         PwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763923631; x=1764528431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRL65+vDOuabE3OCz1c/i8JRK8zzzmLOMXk/aaH78t8=;
        b=Ov1nudBD2kTQ025YmkAMDDycn/pjfdLE82Sd8Toj4NDXBP4QB/8e4c8/0GI4rM1mA3
         cn17+2Dk/7fRsKWYbVeFKrIFosh0zpjDCt6o8ik0cpdAXdLzCAq+cx3EapBYgooHp0YK
         aNBSlx2jGruhufQiiUr+Z1YpgQp8Vb951ZLZLR8Y8PtGT6R0q2eS95fvdcivENgjqdFi
         nOGlhx5DkbC3DcHt6H82TVrtJFacCW+gZCoijgs74PysXTsLNIr9RhAZlMd02R+hL5bu
         Y7a1JIuo3rxeVygkfvIlNLfKrG5GdTspO1XcNgKIJUMKSlt5GZq+ciVxKM18AAvCTVna
         oJOw==
X-Gm-Message-State: AOJu0Yy+FLATFQCIhsDycF2f5RgxLxXf2RumFiauCND6e2UlKCP/LYJO
	mUzhZxdrbI/3c6op5rxOL0r10eUrt3EB2dxS+0EaNB7TmiJNwOxAdqbspMx8/2au
X-Gm-Gg: ASbGnct43zvs919HoFVgu1te+lu+ue4Rh2vjKrtGACJQTaQQy+BuUWp+t7xO6cvKsSx
	KYX7wOI4/7N9L2PzxykPbuJDwWs5kqQLD/2f344xI21THOR6tFP6PaS4pXPHJIbuYsy3x2WvGg2
	G1ui0wGJ0LmLRmh3qqMMkza0DMAx3dfpJ7stmKdh1LFzSmCucSQ8rrhDdBc33Tib+4fT253zTa9
	YMHx1kTiAAoQk/6kASdy3SMfMkwMFU1Pg6/pPr8JKFDR6RBsFfzonIgzhRwG/YsedYicCHEhB/h
	MYcRUu+jttbzJ1GV3aUfizOUbRU90iwgxT54Tj7x/AugrMvqJcxtvqo8zzUKP2IxoHG7zw9IB0F
	vLfWXKt/WJw+NEpVvP+lktimaNVcD+I0/GpdGk/jy9JunEcFX2Pe/pv/WWNgFpp68shgTB4qfAJ
	oSFDJj2nxz
X-Google-Smtp-Source: AGHT+IE4o9OT/Zu8je7ef3QyxW7q09u1ZKWQtJv0XTOcDQHUmuIRT/XlCG2w4YoSgZ6iGVImE4WWsQ==
X-Received: by 2002:a05:600c:3551:b0:471:131f:85b7 with SMTP id 5b1f17b1804b1-477c10e2bc2mr110691345e9.15.1763923630364;
        Sun, 23 Nov 2025 10:47:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3b4eb2sm153943405e9.12.2025.11.23.10.47.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 10:47:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] libao: ignore CVE-2017-11548
Date: Sun, 23 Nov 2025 19:47:08 +0100
Message-ID: <20251123184708.3347921-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 18:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122003

Both Suse[1] and Debian[2] disputes that this is a vulnerability in libao.
Based on their investigation while an issue exists, it is not in libao, however
higher in the audio-toolchain, most likely in libmad or mpg321. There seem to
be nothing to be fixed about this in libao - ignore this CVE due to this.

[1]: https://bugzilla.suse.com/show_bug.cgi?id=1081767
[2]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870608

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
index 233b890711..42c0934b2e 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
@@ -31,3 +31,5 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 FILES:${BPN}-ckport = "${libdir}/ckport"
+
+CVE_STATUS[CVE-2017-11548] = "disputed: the referenced vulnerability is not in libao"

