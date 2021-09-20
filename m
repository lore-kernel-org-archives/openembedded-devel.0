Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.845.1632170523063704852
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Sep 2021 13:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n9puxEgg;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id y28so71161642lfb.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Sep 2021 13:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fJzNBsR3aOf26vnVcqq3etAzho359J3mOQBJZSqYPGE=;
        b=n9puxEggeNk6jcC0D/M5oNNfwloQaMTHnzIYQ2Fwa+UcCWD2G9MdzRq17jRF+47d4m
         LYYhajZ+Vv4RnDSzsfHqUQooZeCHE+8wPOo3ms5sov9PWvs/R6hTefQaNW/HRQrsGqk7
         CAxk3+uHZuouDPjwr1TKr5LKF+Tf6O19gB6JH8D4TADVEwkuDGs6OgqXUlwH2n15EY2b
         mNGAw6Qort8zPfdiDa9yVRumYfA/kdzRj3Fsf8vTl1/VgAEwUJGvoU509K0vrYgvLT8D
         CmGkoZT+I5HJVCImPvB9V0v1K3khlTnVkGMo1l0ScKpWF6Nb7GlXD00LOpJRu0fBoLOy
         EhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fJzNBsR3aOf26vnVcqq3etAzho359J3mOQBJZSqYPGE=;
        b=ZpzY13R0XpcK4fe0dZqLp9uSMDkw1/TGHEz0Xzk8s+YIklWBy1oBPzV1/BOZd6ydM4
         g+hC05kmSdf+V8d7lYd5QFY00SUYxmpsgdr7hhecpIAvvpqx81mXHkwSeoVOtyunL09G
         1McHFykqCdA94WGaFfP97XD/LFsfIG9YHgszQNXf+ecnwJY/AiP0VSSfsnGWxKNJ0+Ph
         PAZdUtbwtcTRNcXbWYA9LZSvoFbP5XW6LjJQUn/rNw11/ztd8Q42qDxVahM3prhRVmVo
         zSNPHHrd5SzcdN38tu9mvo4ssvrNC5xdusUg78MCV9ntL9mXXWPy87RwVaUwCCiSZDVx
         PV/Q==
X-Gm-Message-State: AOAM530HWih4IDQVdI2ufPQi0wjX2OlB+xAjjzAsnHmwRUsmNA8beQk9
	4C95rx/JdYfnNO2wIc5B7KOIbhYQZmDgpg==
X-Google-Smtp-Source: ABdhPJxZEFY6XDnuOXDCDGjd+BqW2NIWQqbs2gtwPXMCW3wc8Imv9oIEp6EsBiYtuQ2Ylj72R14ijA==
X-Received: by 2002:a2e:6808:: with SMTP id c8mr24561305lja.70.1632170520969;
        Mon, 20 Sep 2021 13:42:00 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id n26sm1350919lfe.72.2021.09.20.13.42.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:42:00 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCH 1/2] openjdk7: Use bb.parse.vars_from_file()
Date: Mon, 20 Sep 2021 22:41:22 +0200
Message-Id: <20210920204123.1449479-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bb.parse.BBHandler.vars_from_file() was removed in:
https://git.openembedded.org/bitbake/commit/?id=aaa5292ef96ea27f505bc5c5a4b1eb4f497ed061

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 61b62b9..0435233 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -4,7 +4,7 @@ LICENSE  = "GPL-2.0-with-classpath-exception"
 PRIORITY = "optional"
 SECTION  = "libs"
 
-ICEDTEA_VERSION = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE', False),d)[1].split("-")[1] or '1.0'}"
+ICEDTEA_VERSION = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1].split("-")[1] or '1.0'}"
 
 S = "${WORKDIR}/${ICEDTEA}"
 
