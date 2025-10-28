Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A658FCCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 12:54:48 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.7937.1761656086155725091
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 05:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mhB+sL05;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: marc.ferland@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-421851bcb25so3687397f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761656084; x=1762260884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUcaT9A+lzF4/nIWLBOWT9P9jzuFKCSUMR93y2Jhj+M=;
        b=mhB+sL0583Oz2MjiAk3bFtesOnFeV+IN3EyZjmBiYawZIAcSbCGf5upneeXLk0KWCq
         SNqE9dFrYib3zwq0Dvar8OKyE/pNlVQULyM8Z+Xgv87obEZhocjxtXeXmRw0GQ3aqTxW
         l+ColkLU94bAYcKIefGBaLlC3m/LvVikHeN5vqpf88fWJ6wBUmMCs0Jjb0mq+mJYPiri
         loGRd1FCbKr6WDm5H+brJSk4HqMtAJ/fVRM0KMSZrG+vlPRyiByNX772X+t05l5UJzup
         0Ng9C3GHVj1/wnnEAb1BcYcls471bwiDV14l4IZJSHCDR8hLpN6ouWAVFZg37DyPTaZP
         o5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761656084; x=1762260884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUcaT9A+lzF4/nIWLBOWT9P9jzuFKCSUMR93y2Jhj+M=;
        b=QgbjVVFREVLol6/pS0naZoxWkXvC0kjbI/sCGI17EBHCZAKP4/v/pr9RjxaxISZRdP
         p4gkibOHkn8ZMmNETVG+aUXfyuGkdD8WmWWAGBHJ8aAuYCFJ0oYlbxicb9Jt7A8PVK6N
         LSXhGrj8MSRCmHfL5vgCdPY7njjyObZd6x2DLh+fcXGIu7GgsRIfWN0x0MmFUck/Eb3e
         i2VqiJJ516N5eq8QiOwWlKHvt75wyAITZfpxNUzMR05UwGLoQ+IDuVbtMbIQ+UKPkzCh
         EYaa/8u3UcErAuGJU5gtZivdcBWs4BSXUYglI1ADyUDGiH/ZntSgz2zYLeNfZjCI+/bQ
         cO6w==
X-Gm-Message-State: AOJu0YzShU54rFKIlUprRy24yS2fN3D7BKUJDgtzZfqxYLvl8jNLbfYu
	0f70C1UIDse05ANH7hWFUwrRl2HKyqnt+jVetmtbZSeQdktEFm+i7sPu4UXlGA==
X-Gm-Gg: ASbGncvuhRGgIUqYCAOroGYrYiQDh4MU1LAeaIpiOFX3NaubX40Z5brJJkg59eVjldj
	MTB+jdvsSaXXFYSSoaGKlOGC/NvU7suIRMBRBCZ5mX9OASK4x2vlXO5E4Qi+xhbGKnWMmELXkY1
	COawcP4qOWVdTgmpOhh5aJ0TPjoMMWMo4CRJF6tuC6q+frvnPND7ZIMu1ojpSVILvSOkPQeR7zb
	fUiXv/y3Zy5yYwUW7Bh4yHopR400DIelcwhESF4iuNDXArbmZ457y7PvX64IYrfWNcgvqlnyOWi
	MZ9SBZ11R8u6bVqytB9koD/xxLQticFvofzNgAkJeaX8JC+Q6rKd9HYvSQ0l03H7rw6b1qzu4QI
	58eLU+9FFiSGUBQjFvNV+GRnw3Szuhzo9A5JDBjgCtt/njCysG2VGcEQZ7NzIeAS65eHESI3xiK
	UqSPOIAiMvP6tNqd0oADPVpWZyb7D3BeNIr5YBnpie3EPxco/3PJkk11FgKGbAHn0DY2YHqe5wH
	2TxINrVV9rawVe4NSfiAh/aTQQ=
X-Google-Smtp-Source: AGHT+IF5rIVuqMK8YiWmWjfuS86q+lsY1ABzWpRpRZtGxRYyMTcmI84tc+s3GX8k0Y3/t6UqHgvBgQ==
X-Received: by 2002:a05:6000:186d:b0:3ee:155e:f61f with SMTP id ffacd0b85a97d-429a7e52e69mr2726571f8f.8.1761656084127;
        Tue, 28 Oct 2025 05:54:44 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429952db839sm21015305f8f.34.2025.10.28.05.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 05:54:43 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [meta-oe][PATCHv2 2/3] freerdp3: fix typo WITH_ADD --> WITH_AAD
Date: Tue, 28 Oct 2025 08:54:35 -0400
Message-Id: <20251028125436.2426288-2-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251028125436.2426288-1-marc.ferland@sonatest.com>
References: <20251028125436.2426288-1-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 12:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121089

From: Marc Ferland <marc.ferland@sonatest.com>

The WITH_ADD option does not exist. What was probably meant is
WITH_AAD (Azure AD auth).

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
index ace07798e0..ae87bd0925 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG ??= " \
 EXTRA_OECMAKE = " \
     -DRDTK_FORCE_STATIC_BUILD=ON \
     -DUWAC_FORCE_STATIC_BUILD=ON \
-    -DWITH_ADD=ON \
+    -DWITH_AAD=ON \
     -DWITH_BINARY_VERSIONING=ON \
     -DWITH_CHANNELS=ON \
     -DWITH_CLIENT_CHANNELS=ON \
-- 
2.34.1


