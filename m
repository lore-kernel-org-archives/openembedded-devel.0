Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32C9D36122
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.27903.1730831957179495268
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JQuTpi25;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea7c26e195so40152887b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831956; x=1731436756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLBze+Q7VPLsMPvwWghp6p2d+Meome/qHAT5sC1zqv8=;
        b=JQuTpi25YvFDRaxoCXRC8Zwd0yUJ2p8DkSQwvkNk2C8EARrMqT8UsDW+W7h96zQb/Q
         tXo7zYuucCenB+t0J+/Kp+8ya4GIoIq527/fF6hZkdGUf9ZSTtkkkL/2eA2bAqrjhSk9
         n8xEqnuv6kV7bl66c1PLba/bLsUloA8nYmaFExW9XysLdmo0Edt5Br8SNFE4dejxqfMF
         Ty5cLre8YHTGzDQBGFLq5PeyHq9CMXA4G2s19HjQCw1nQtJxhhkDmyk+NZf+ak8/Uhv+
         pgmeRPTuc+sp+rdtLL2oj1xt3Nm0i3QD1+SPXBhd7WkIVIG9DjibDkg7BjbsemtTiRpX
         dSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831956; x=1731436756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLBze+Q7VPLsMPvwWghp6p2d+Meome/qHAT5sC1zqv8=;
        b=hiQosDtVqni8APH7/vGU7sIO6E3FcYDggntK01Kqt1eIlgnpJU+4o6I/THAvxeiXCm
         Q7+H8/zrOVgCKA9PIe6rvkuoiznNUTjuO66W2zJEt1on4C3r0jpwOFfirT//U516y7CP
         QtGRQ01HNti5mqspJVTz3x7o2IVteEOYLTClCBIk1hi62NsfI8XDixz/CwmZ+J2w2c52
         N66HFiSEFSzIaA6/DnvG+o3N9Umgv/vQSNMagk7QAi69KSaUryRCjuv8hjyRWDi+bhh3
         bTiu5yJxppvBIuMT3KQlmcn/f4dRhVTjjDS0Xj5SoM+J8zr+Xxo+pd53r7IVOuK49JAw
         oCqw==
X-Gm-Message-State: AOJu0YzE3cGMFdSwpz5Y5wjol3nav0Ia6IJXb0MW8ArghHixnIPOraB5
	EwwKZpeX6zSxHTex6tBlAd8ePYpSvbICfeWJsHelzo1jCTytd2/NpoF55mV2
X-Google-Smtp-Source: AGHT+IE1v9V2HHp9BOupdAG5A44rBMqjUDkWDwvhnRZA2hol8XYDwW/T6y5vbgqR7BtI2BpqYTulsA==
X-Received: by 2002:a05:690c:7246:b0:6dd:d0fa:159f with SMTP id 00721157ae682-6ea52525c96mr235867517b3.34.1730831955828;
        Tue, 05 Nov 2024 10:39:15 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:15 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 095/161] font-adobe-utopia-100dpi: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:11 -0500
Message-ID: <20241105183658.34982-97-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113610

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
index 8b83ba378..7c43767d2 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
@@ -16,5 +16,4 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "66fb6de561648a6dce2755621d6aea17"
 SRC_URI[sha256sum] = "d16f5e3f227cc6dd07a160a71f443559682dbc35f1c056a5385085aaec4fada5"
-- 
2.43.0


