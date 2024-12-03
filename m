Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E940EE74ADA
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 21:00:36 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.30723.1733258750083166528
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 12:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XFE8P0kL;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: ethan.twardy@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-84435dbda4bso8578439f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 12:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733258749; x=1733863549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QqWg9zlqyQZX+MjhRQd63bGt+ea4ci/2pQrUjbKnQLo=;
        b=XFE8P0kLitovbIcVYN0oJkW/7elIkYGpMNHTERJG01P5KZK/GZoVRiXj+3M4iVWFpr
         dUlxjEoDDKpdWaDT0CHVWF6iH0N+mYDrjr+ufLAZMBfZ9scp6Y3d6OkeAvzROkwJEWYP
         qSf1O+OADSOmp0o0uceaM6RtGCcJmgcmQrCnQAAEnu5P4FiKLL5d73qcZu7UcEQ8Htyp
         V2noeV+dKl26xz0rTx2vCFOxGOd65EJh5hfO4Su4fR0JfrUpDwUll7zYeoQsDQTU/LmD
         LJ+IAVBOvSOV2YHWpmumSLzWHTJqOjoYdyNPPY+xB1ymqzjDSrEvG8f0c8yZoO9j8+/u
         LLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733258749; x=1733863549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqWg9zlqyQZX+MjhRQd63bGt+ea4ci/2pQrUjbKnQLo=;
        b=stMTcsEgtd5cnWtSqVS6plXWLMLO4DSPoEsJxh+gzvxJJV2pePYDd9lG5ix+rLwpsN
         wpAIp+sFOH2uIQplElUKOkX8RNwuiLvBYxjw8766voeseMDcplAeHA6McNhjTxN3aEAN
         /Vv97No2dViq0vc5GFBig4lIKQuPagLjjIPDL/uemk4R/td/G1HUo5AmKBq5w/xbji3/
         PPY4YjOTiWQcdLkUghtD5cPqHB4vhZLLZPzSMBG/5Aw05qBFO2wtAiV0D/3heXo/wMUx
         DminBSS3UG6zd6ksYDb+Az/be9J6g6Iez3ZVO4dHb/rjxGY8ITVVT18ydeTnH8y+uDJI
         Toxw==
X-Gm-Message-State: AOJu0Yxudkh9VSXJ4ZIP8HT2hrpMebGkI3g/ENRzz0zpu08PwmWkAthB
	9pxU7v86Kl7RHraXFgtDXaplr+t29Lfwi60RdmmaLfrA5dW1wqD9JD06eA==
X-Gm-Gg: ASbGncskFsUSDVaKzhIRikRaNzkBKhwa/4+wyz0wN/3fFV7VQHJtDQ0nOtnU0nhkl1G
	U7+G69dDsm5RUxojGbuMiRqxX3bGut7ExFySCmSmfNwDrNgnVfVLD+5okVxCKXuI39DJRtHbhPH
	xLZHmvlhyp05DiUGkf5IDaI6/zkhT3Xl0CQWukjyuGLsj1GBgyeE2HhWjGDqzgsSKXUVkCt6Pfl
	aSglEhyRzNBkw89wFU4mK3Cg1kq/ra7MqT6YqS3R/+5rAmB+F4yRPTKTJnKMuRcJjoE55oepbHd
	p5nJ0akGnUr0tueb71J0jruMeSlqxLww0muctTVb8Uxy
X-Google-Smtp-Source: AGHT+IEOFOC40kO6Ze+/u1tSBnESHByMbyzRjAPS2SB9km5S6aMrGd3YPnkbfB82cOgzoy12lYXHDA==
X-Received: by 2002:a05:6602:2566:b0:82c:ec0f:a081 with SMTP id ca18e2360f4ac-84401589a7fmr1844718439f.4.1733258749007;
        Tue, 03 Dec 2024 12:45:49 -0800 (PST)
Received: from localhost.localdomain (h135-135-92-85.ashwwi.broadband.dynamic.tds.net. [135.135.92.85])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84405e95c86sm271115939f.5.2024.12.03.12.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 12:45:48 -0800 (PST)
From: "AmateurECE" <ethan.twardy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Ethan D. Twardy" <ethan.twardy@gmail.com>
Subject: [meta-multimedia][scarthgap][PATCH] pipewire: Add glib-2.0-native dep for bluez5
Date: Tue,  3 Dec 2024 14:45:10 -0600
Message-ID: <20241203204510.3259045-1-ethan.twardy@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 21:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114190

The SPA plugins for bluez depend on D-Bus bindings generated using
gdbus-codegen at build time. Some PACKAGECONFIG combinations appear to
pull this in accidentally. Add an explicit dependency to ensure that
it's in the sysroot when PACKAGECONFIG contains bluez5.

Signed-off-by: Ethan D. Twardy <ethan.twardy@gmail.com>

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
index c8ac04d59..1c51fcc15 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.5.bb
@@ -96,7 +96,7 @@ PACKAGECONFIG:class-target ??= " \
 # as being in conflict.
 PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib udev,,pipewire-alsa pipewire-alsa-card-profile"
 PACKAGECONFIG[avahi] = "-Davahi=enabled,-Davahi=disabled,avahi"
-PACKAGECONFIG[bluez] = "-Dbluez5=enabled,-Dbluez5=disabled,bluez5 sbc"
+PACKAGECONFIG[bluez] = "-Dbluez5=enabled,-Dbluez5=disabled,bluez5 sbc glib-2.0-native"
 PACKAGECONFIG[bluez-aac] = "-Dbluez5-codec-aac=enabled,-Dbluez5-codec-aac=disabled,fdk-aac"
 PACKAGECONFIG[bluez-opus] = "-Dbluez5-codec-opus=enabled,-Dbluez5-codec-opus=disabled,libopus"
 PACKAGECONFIG[bluez-lc3] = "-Dbluez5-codec-lc3=enabled,-Dbluez5-codec-lc3=disabled,liblc3"

base-commit: b8d1a14f7f3b76457c36752202ea7ae5881b6654
-- 
2.45.2


