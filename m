Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D44CF588EA
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 15:49:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22601.1776700162770782898
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 08:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c3XhqNrc;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so22376725e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 08:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776700161; x=1777304961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJM6Dj+s0t0Ia8hWNzrmNrxQM9ExB9vVDHf3a34IhIc=;
        b=c3XhqNrcPM7+ZXkLiYI7N59kDwb0K/Gg6WeG++jsel5g35ZwwXDvIQkojAVHJ63FPx
         8ICKgoyEkbtTUZ7eOFy8dWY0wZQsYB0UvjKpmQe+uNpxAAzI43EYlRPv5hKldyj7QiTK
         pF1KEJWPQXr/TCrXAKsg9s4LlLMVg0XPTilYdEQxe/e0xKfdfD1BUrz6kQR6BMm1nnOa
         czYt8ubuYyDrEZeaQstzLMPunuR1lCZDXYi5B6NBwry7+stl8jgF6NSEeNFcV+XZGZj9
         AiP5XhJj4xL2yxKsdwUYYhq6VYHuasQJE7XTuInwsyIoFxsCRHuTLT8oAW5mHgp26rQl
         jwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700161; x=1777304961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aJM6Dj+s0t0Ia8hWNzrmNrxQM9ExB9vVDHf3a34IhIc=;
        b=s6kfJjaI/x1K5/I6fZMMxdbBKP28Z7saf44vMntSjJlAD5bA3RHBKPR7my9d+tVGXD
         wcShpVa84YR+f//eKrauMSJ6C+xU773EGaOausTcKSFOwgjPoNMbF+VfyafTY3kqC1/6
         sJw5cmCRytRpD68IdH4k5tPtVaIuccZEkwss0qAPbm+rl9y5U8tA7edzHy7AoiBBrLw0
         dUk11C0OX9gKGdZwyGHFExr17WbHHBRoWZC+MlednTBGuTV90H7TAOo2wUJNzifCvZaj
         vXToWjI0u6Nu3kPBdZLQrvHZTjGaX2GX99IvJ1FaLEbuiEDpqsTHgmDqA2l4ZrJo9Ox6
         uGxQ==
X-Gm-Message-State: AOJu0Yx6ZTfQLPnOtG42FkogjmDW25rTuiAcUDPGn6XAcjgMezmgQwGd
	fvozfY4VCcDM/8zysESm2UQlHQKLZ3ew6J4LOjKxCFjZWFqNVcZf3Pj87VPyhA==
X-Gm-Gg: AeBDiet8tGnFdrceDX5Kpjl3B4lvEj7N8PDYf9W8wjnf0EwKit62o8IUQd9Ku9lkBzi
	euAq+/vfhnfBuOw0kdWDxRbW/YVDOoC1OoeN5dntBUdBhlqYFpEAl2Gn8aEC/xHSvr66N9sbrla
	hOy7VTwNDhNkaQgVkZucj5r/40FyOmoB2pX2fzgU1QpcOiYMPJ9gf3FzQe6AEmFjTTsNZ+iYbKd
	0zkGVP/tX+0EED+VFt41ttGkJB1XfGublwbOb02XgnBYdAAfHWpeCEmPy2uDgUN5r71wtHMhG6g
	kAkOiti2RPLms13rOxoGEWjSsIUqyPDGVxJTkND6DSWovEmgTx7RMdmBvao70Tna5b16Z/98ya2
	mB4lzEE5xJvi4Uu0jxc8W/T2eNk5brMAPLIP6rdnr+tL++kS2dYLQmOo6vLMbm2dZ69urvYhlZN
	qhCEOxG6EPVAvyewVcW8bR++vap2Lx+Ik=
X-Received: by 2002:a05:600c:6296:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488fb73d764mr199553145e9.1.1776700161004;
        Mon, 20 Apr 2026 08:49:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm85279255e9.9.2026.04.20.08.49.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:49:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 06/12] driverctl: fix SRC_URI
Date: Mon, 20 Apr 2026 17:49:09 +0200
Message-ID: <20260420154915.952359-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420154915.952359-1-skandigraun@gmail.com>
References: <20260420154915.952359-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 15:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126509

Anonymous fetch with ssh stopped working from gitlab apparently - switch to https.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/driverctl/driverctl_0.111.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/driverctl/driverctl_0.111.bb b/meta-oe/recipes-support/driverctl/driverctl_0.111.bb
index f5f542c541..bf80757cfc 100644
--- a/meta-oe/recipes-support/driverctl/driverctl_0.111.bb
+++ b/meta-oe/recipes-support/driverctl/driverctl_0.111.bb
@@ -7,7 +7,7 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 DEPENDS = "systemd"
 RDEPENDS:${PN} += "bash bash-completion"
 
-SRC_URI = " git://gitlab.com/driverctl/driverctl.git;branch=master"
+SRC_URI = " git://gitlab.com/driverctl/driverctl.git;protocol=https;branch=master"
 SRCREV = "fa9dce43d1a667d6e6e26895fbed01b3b04362c9"
 
 S = "${WORKDIR}/git"

