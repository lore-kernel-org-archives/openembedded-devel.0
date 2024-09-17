Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A651C3ABDB
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:04:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.14910.1726553075523641933
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hRZdLVwt;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2055a3f80a4so34924355ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 23:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726553075; x=1727157875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqTlS+or4uBvJBZLBaKy2QysBQ0SvY0Xe/r+/SOr+nU=;
        b=hRZdLVwtEn10ADoZrt++RcVj7OOi+m0RUukgpJ4g+BZEduHZltOd3JjFHpjK2aO9pr
         H10kncotSlizucklylkGg37fOLWBuONsUA/xedYwFZNMOA2UR8PbMjS6x+6uEM2Me2BL
         W9eszr8W9RLO1VAQ4n4HWxSEKW+5YqCAhigzFGIiZThQOrQg7fPA6TmNLxZd8/vOCKOK
         dPPwI8258heyTasNAHocQTtLnv7n+qcvymToflk/Tm0cX8ZlgoOsgjXNLmx5SFb4wTux
         2eqNNuJEQqEIwrOlpWhvtYy7hDEcvygNnIOFqEiLD7b4/j/EoxBubaAj1imQEhcvSxvO
         pa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726553075; x=1727157875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqTlS+or4uBvJBZLBaKy2QysBQ0SvY0Xe/r+/SOr+nU=;
        b=tYFlBFILuxSWDUu1UrPYPa2h0hF8hpbY683njt1U2tfh2aiUyy5WyOZSHBFSFLIBkY
         YHO4yfGaNEkszvKvzBAvc0tg/GBwEesxLNTXyQF+thtR1bchff5ZvkiMlQXUMl053CW3
         tZV77bRvYysFDm/RoThbTr8rUQUBMuC8rVcWypP8yPk/hNR+O2sFwzwlNbp2do6VXH5C
         hbARAgnT4BAph6Dnint3oqusTgC19y5DhIuOTDEL04ioYdyQLzDOYHBZtDw6nxL2gN5w
         TbS03de1yilLbIiRBXABVN8/mUpO5Xg1jBKVXvXyML85RI+6xrcf9pNwjth9adA8G+wk
         2hNw==
X-Gm-Message-State: AOJu0YyOuw2iP50NdtK4gWrwoHAGvwGx05JrsDixvWJZOq9qUXjjjJ06
	xVCrs8H+MealdcJKORkO4CGWd+0tjtCowcDB2Dkwn9fdedaDZckKCqFnjxUh
X-Google-Smtp-Source: AGHT+IFHF/Fp5zFqQRmxm3WadINJGELVVOIf81RbHfiBhAVwrLwSbVtRbUNXsHVGnS4G9ek8m19+bA==
X-Received: by 2002:a17:903:32c3:b0:206:a3a9:197e with SMTP id d9443c01a7336-2076e31b8afmr305843045ad.4.1726553074822;
        Mon, 16 Sep 2024 23:04:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079475df17sm44294645ad.298.2024.09.16.23.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:04:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/12] transmission: Link with libatomic on riscv32
Date: Mon, 16 Sep 2024 23:04:20 -0700
Message-ID: <20240917060424.1692067-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917060424.1692067-1-raj.khem@gmail.com>
References: <20240917060424.1692067-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 06:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112334

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
index 7b68cb0613..199a7c6d6f 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
@@ -19,6 +19,8 @@ S = "${WORKDIR}/git"
 
 inherit cmake gettext update-rc.d pkgconfig systemd mime-xdg
 
+LDFLAGS:append:riscv32 = " -latomic"
+
 PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
                  ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 

