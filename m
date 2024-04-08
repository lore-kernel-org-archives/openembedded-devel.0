Return-Path: <qiaoyongchang@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB166C67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 16:43:42 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.112224.1712594612942694128
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 09:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lFZyvs79;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: qiaoyongchang@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e419d203bdso8579525ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712594612; x=1713199412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zlp2of5fIHjOmaBTf2G8L2nGq0BVK75asFzlLir1wU=;
        b=lFZyvs79edQS/GGGncOOlJYLfxZConrkhdOaUWrZMjsBeSCGrjRmWap0bC110ZoBFe
         8+ZJEpGnELXunM6ly8J2+H8d/bz0W+zuQoBMgvrV/hp5XVZktCJ7klPpYqa46u9VcvHK
         k7YlYEaB3PwthtXjUzJimTdVVe+GsGbRxaYtrSIWRt3Zyone1cdjS7xJj6oa1fEBt1vj
         qd83cpXcN5QEhRXVZnHwuKO1fEW0ZeUQiy3SGz+G/0zSAhz1kDhyPFl+lNo2q2sgTDFc
         /6+lMtrJxGnkX2Si9I82wR6R4DFzrtrpVbyp2fYMcVYuDK65cmBtl/m5rsKGxM56BW8r
         P3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712594612; x=1713199412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Zlp2of5fIHjOmaBTf2G8L2nGq0BVK75asFzlLir1wU=;
        b=BsBqwy3H8h2Vg1GX9gIW4ExM1upRsTuiD2f4RMDzBqMaKMR5TzWD0TirtwwAa+I+E3
         0dBy0oLA1KBs832sD9UDmrRXd5NXIA0J6WTgGWiKSr1Bi507dEv6Y50jCjKQLJWWCFgk
         y+rAXIu/ZmT43+YDXKTYPlBIZubotCby5WB1hJEeHKaPpjPJJp2YDwvj+QBncXu/FGz1
         YlrN6zPIOPoqCJUSKvr07NtxKUeXaS2ZLYCKTduuTutUJG5dSFVvsTE9ci9tjCCfkdaa
         8TwmAfjTTO0B/UF+ggARaYy7cjQierl4jlNf+PyR+lJQhoNdlPYqj1PmUilR1FR/5GaM
         0kfw==
X-Gm-Message-State: AOJu0Yz3ah2axq3sn+8TwT5Xg7U0K0dQ2BL9b1JTSd5LVuXzkSLwPf1g
	Izx2BxeJvNQoVjIgjAUg5RectlYjP4in38QVZBPssly6tbBtNyI0JuDNe7z/nHetK1UDUBQ=
X-Google-Smtp-Source: AGHT+IG7BioCANcLqcKhLh/yOVieQipum6FX3cPLWA+GA0QOZCfHi8boeH/4mby8Mett09M6YuwaIw==
X-Received: by 2002:a17:902:dac8:b0:1e2:8c12:aac0 with SMTP id q8-20020a170902dac800b001e28c12aac0mr11881738plx.28.1712594612044;
        Mon, 08 Apr 2024 09:43:32 -0700 (PDT)
Received: from instance-20220825-1141.vcn.oraclevcn.com ([146.56.169.81])
        by smtp.gmail.com with ESMTPSA id y11-20020a17090322cb00b001e107222eb5sm7182802plg.191.2024.04.08.09.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 09:43:31 -0700 (PDT)
From: Yongchang Qiao <qiaoyongchang@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Yongchang Qiao <qiaoyongchang@gmail.com>
Subject: [meta-filesystems][PATCH] packagegroup-meta-filesystems: Fix utils typo
Date: Mon,  8 Apr 2024 16:43:25 +0000
Message-Id: <20240408164325.112745-1-qiaoyongchang@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 16:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109870

This typo would cause all utils tools to be missing in the image when only installing packagegroup-meta-filesystems

Signed-off-by: Yongchang Qiao <qiaoyongchang@gmail.com>
---
 .../packageconfigs/packagegroup-meta-filesystems.bb           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
index 361972a45..40f851364 100644
--- a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
+++ b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
@@ -7,13 +7,13 @@ PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
     packagegroup-meta-filesystems \
     packagegroup-meta-filesystems-support \
-    packagegroup-meta-filesystems-utls \
+    packagegroup-meta-filesystems-utils \
 '
 
 RDEPENDS:packagegroup-meta-filesystems = "\
     packagegroup-meta-filesystems \
     packagegroup-meta-filesystems-support \
-    packagegroup-meta-filesystems-utls \
+    packagegroup-meta-filesystems-utils \
 "
 
 RDEPENDS:packagegroup-meta-filesystems = "\
-- 
2.34.1


