Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93336C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 20:25:25 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.18822.1744230319644761314
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 13:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Va1L1SQG;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f666c94285so1056247b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744230318; x=1744835118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BGbacHWzaBCfqGuM/5727ytOLFHwb2vUFQqpKs8eN0s=;
        b=Va1L1SQGKYkbs/no1tw2sStAijj8nMYqHj14A28khj3fgYaZY2f3NjYkI0hU+BUlPl
         R+v5K6BZwb48qnswEqubSv56D8wbxRl4pw4KncRpIeNZGf5hIYqBUSmLMG+TvrIZ8jL4
         jJMMkEHVGnn4+WuTTZUJ4Rbl03l043yTOgZsYV/oxYsaj0vNMvbljeaOos5UHl2F4vyl
         leVG/F9u13haC35UuoBdGEkMPgRHDdSFekJROgyXjiEiXrY4cb9rtQ/c6WBkWZdppVsm
         nl4jDQ8sUEDzEkMdhn6Mkc0LwfnhbLWisRiAGm6Vs3OauftiySbwcNCJqloXFkaYTUsp
         UdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744230318; x=1744835118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGbacHWzaBCfqGuM/5727ytOLFHwb2vUFQqpKs8eN0s=;
        b=xKYhZ5C5T6NMDb96hfHeMOjld0af3nIelYdxrX1PeYWt8GLiUCUkutwSeIA0/F6GdS
         UgwpK/r+cKhIeO6MFqFyMlP9gH0K6UHOVW1VYwBHGJViaZVTl+c1jFlWusjESlEdQ7uW
         cWarHM1F54cVBO4KGMqsGqksv8HtvHKEQbvmnTyFs3il9BL1Fzb9rvsJT9n5xIFCmZsp
         I71x+Pq+qks/Zfl6yJrMOIs0DSyPsgAAgCZVcOhd0XA0jnoNUzca9+Jdx99dGOOcEMfl
         SZ3ED3QMpg2AMOZMQD26VVx8lMD45qSq9XJmzGgPhKHkZbNo2hmMQk02XqqUPtFKuhnQ
         Ej8Q==
X-Gm-Message-State: AOJu0YxKrxdni46cFSNt6IR+a2WiE0CbPY35Ro1d/7Uzr67Wy0RQp9mK
	0CJh8duGt6MToyahQ+fBiJOwwcfedCimKYVfw1DE9wQqSww8kWvyX5eswAcJ
X-Gm-Gg: ASbGncvTt9OXbeLFY/Fxm3GNJrMymWCVpAdIko7/nFhQBQsoMnNI20IczS21kPHlx7l
	n36tQGQo1DquA+QyDze1ZzAWL5P83vqvd+XlA1B2WO/KVipxSI7fJHOt4FvXzcuiKn1fbV2Q9zf
	G5baBYWjV44HpDXr4Px34n0prJHGymzGGiMN9EUCnFgIjvrp8pv2Ixi1JSaekp+updit0+TXYCG
	2mniFpg8GIZyv8ck7Blcz0SlV9akAR8OCB98zzv97lm+kEhWfHVEEkDWjuDo7xjSmwusIl1a5ol
	4Qhd/7x79XcLbnx8Ga5ePcAqVSIEplfuha8xjJ/pjr4mYw==
X-Google-Smtp-Source: AGHT+IFBo62qrDouzoJ8oiAf2ANPCtfqoLf4o2p/B7sUGHMOpGQmcN5RX6ViVP2yEvgoR6xzNxjK0Q==
X-Received: by 2002:a05:690c:4441:b0:6f7:56f7:239a with SMTP id 00721157ae682-70549e487femr2521327b3.5.1744230317747;
        Wed, 09 Apr 2025 13:25:17 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7053e39ce35sm4277647b3.94.2025.04.09.13.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:25:17 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-gnome][PATCH] Fix warning : lack of whitespace around assignment
Date: Wed,  9 Apr 2025 16:25:06 -0400
Message-ID: <20250409202506.235676-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 20:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116745

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-gnome/recipes-graphics/clutter/clutter-gst-3.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0.inc
index 1329f7fc50..ce6f3c521f 100644
--- a/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta-gnome/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -13,7 +13,7 @@ REQUIRED_DISTRO_FEATURES ?= "opengl"
 # Needed for introspection.m4
 EXTRA_AUTORECONF += "-I m4"
 
-export GST_PLUGIN_SCANNER_1_0="${S}/gst-plugin-scanner-dummy"
+export GST_PLUGIN_SCANNER_1_0 = "${S}/gst-plugin-scanner-dummy"
 
 SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch"
 
-- 
2.43.0


