Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55758D35E4E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.27870.1730831927770135897
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lx/6s0Mj;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea7c26e195so40145707b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831927; x=1731436727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzY7vy5FCvJ4NKwYe5m63UQcSaXriBTIjIUppvj+KeU=;
        b=lx/6s0MjotzfT+h9sssbOlIKwYs7paTKXo/uHu64Z8FpIyE9rhFB8Og9U8O3b+2klA
         AHdYM9WaaH5Pb70sNJI/MNujOtt1tVXBjlds1WMovaKm0DTC0VhS2xB8dbgvMDQaV3qO
         taBiwdz/hJyaDoKrwWkls2w/AOc1RdyxKXGyMnPF6j6TbigL2ou+GcW8NIWaNxZmu+yV
         AEU8z+H4FyJgHgr/QuS31/7ICorGaJJeU0ZZrED3dip1LqlHp9GXdaFhmQcGUCl4/QOv
         V5YLAhDTqHEdNzaxSEQKoud4/QWDSeGvmeEHfOJ5xzTW3HXTD76fb5D6Y1gGyrweRj3R
         /DLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831927; x=1731436727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzY7vy5FCvJ4NKwYe5m63UQcSaXriBTIjIUppvj+KeU=;
        b=CZJ/LksCOJ2FLPIYabb/SNA+ujyJ94AXVmMEjWs3fgIqHS63S7x5F1xew1HEWm63A0
         mfNd/Q7MEpBRicRwkZAlbk75yVAdfl0jhuxpjpEdEriY1hxKtyDEu/obCEBMSLuTAj/x
         LoKNKSzq9evPqwQOlBLN6+r0vup9ylrJoJHidixKFcwlXhwQAMmmN4/QBs70aVlsLErK
         71IAVNmlhm/ChkFyAt0pMPGVxrb6yN7Ifw/UIAAh72CUnuwC6eYd7XQdFIBeCopnNBiX
         EvvtI3xn+Btve3w0/DnBshAwcL74H7l8+6q6CTL3Cu0zkpgqvZ8AVJByX6E3+9Zs77mT
         kE3Q==
X-Gm-Message-State: AOJu0YynFovpF0aCevRZTE2BFPdEjaUZUiOL1Uwed7uLFM+hbJq3JFV2
	5p83R8CNBGeoMEQk6pIjUCQHg/69DWKwZEMzC/kwRBeM1UUvgNdUfIMbNipe
X-Google-Smtp-Source: AGHT+IH+XjHpQGWroxYVA/0UkoNY8QvUPTML8pUy4swOi6hJxQC4nrS5fxOndopSN7X5Yg2xkonBMw==
X-Received: by 2002:a05:690c:6e88:b0:6ea:7afd:d901 with SMTP id 00721157ae682-6ea7afddd68mr119289297b3.18.1730831926484;
        Tue, 05 Nov 2024 10:38:46 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:46 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 059/161] sgpio: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:35 -0500
Message-ID: <20241105183658.34982-61-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113574

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
index 9b25745ed..98e22f116 100644
--- a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
+++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
@@ -6,7 +6,6 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BPN}-1.2-0.10-src.ta
            file://Makefile-error-fix.patch \
            file://0001-makefile-Add-LDFLAGS-to-linking-rule.patch \
            "
-SRC_URI[md5sum] = "a417bf68da4e9bd79a4664c11d7debd1"
 SRC_URI[sha256sum] = "9bf8c42acaa247efd9321bdb1fc2390022f0c554d77fbbd4a7363d990fc0270b"
 
 S = "${WORKDIR}/${BPN}"
-- 
2.43.0


