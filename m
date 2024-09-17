Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE245C3ABDF
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:04:46 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.14912.1726553077160409166
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JBr772n+;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-206e614953aso52497895ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 23:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726553076; x=1727157876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Egu+3Xjm8HGj1GXXJ07iXOYocBM/G7qdTbrfxlHC1jA=;
        b=JBr772n+VxmimYf7AmhkmInVrsBuFkA9LSmNXB00K89iXM2JC+8fYmTWXp6EzRkJlU
         U8LrHYTxdLaOhGJmSBk6QfGfrS+0bCFdZxsv9rjYhn135lgz18L+4g7kefV4xFZr7MX1
         dHgVmkhzPcw8Q5xbDyGcQZ6IyQMt+n/e75VQBOD8MRIBzCDnpHNmDvXWBRCDRuEN8HHo
         N+3x/gOuI9gTwngte7uqMhMYKXH/Wq3WIi1iKoNLcOsldtLFrYegasf1c0eWgWLHjFXO
         fRYSfAzwlfrh0Tm+E/458+SPYc4My2+S1pFHzw4d369QGUIlSPEz5ai9exyc1wmWX8lr
         VL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726553076; x=1727157876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Egu+3Xjm8HGj1GXXJ07iXOYocBM/G7qdTbrfxlHC1jA=;
        b=YTXGFZ575do3a+pDlSRyuMzt1e0A0DXv2Vz1APfXqDT6haYH+iiqLCzx34LlCZvJZk
         JD8ngB9FdKoyyumEccIqsj8NnJuZKGLgUIf5EgsVL1qy587GpiZUaZt2vfVcubs2VrAQ
         2h34nFB3d2Xn4tVap0HEOoGhymLqrJrtrq8AJ7ShWEetPYVjRQI+sfowGiXEW61tZBVF
         NwgZnH8UEpM8Cwxko/69oTCPTCZh1Ao4lTvn+mRU4Bqcss+P6/WbQEeBGHZfixfFF0Ng
         P4FCX+q6Nn2znFs3W03PyKPFXOGe4p/DfEGTr8rrie2GEIYqdrOu/MaQiY+1UIYGW1Z6
         J1+A==
X-Gm-Message-State: AOJu0YzwIqQzGd47tpH5FAzaUvBcA8sASPrg66WhupB54rIpaVUbbz3v
	7YN6qFr18qmcxY8EcjvYW/kkEXLl0sKXy7YJ6GsGq2sXRGYYbkJ9maxIrVKJ
X-Google-Smtp-Source: AGHT+IElJMNZjN84uEZF0h97Zsznp1HnIFpUc3cIrEmVeLayoxavCxCpXuqXHO1kRwvV69xUl8YmsQ==
X-Received: by 2002:a17:903:183:b0:207:15f9:484a with SMTP id d9443c01a7336-2076e350182mr271671825ad.15.1726553076462;
        Mon, 16 Sep 2024 23:04:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079475df17sm44294645ad.298.2024.09.16.23.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:04:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/12] opentelemetry-cpp: Link with libatomic on rv32
Date: Mon, 16 Sep 2024 23:04:22 -0700
Message-ID: <20240917060424.1692067-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917060424.1692067-1-raj.khem@gmail.com>
References: <20240917060424.1692067-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 06:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112336

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb
index c7004cc78d..1d86f1abce 100644
--- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.16.1.bb
@@ -15,6 +15,8 @@ SRCREV = "baecbb95bd63df53e0af16e87bc683967962c5f8"
 S = "${WORKDIR}/git"
 inherit cmake pkgconfig lib_package
 
+LDFLAGS:append:riscv32 = " -latomic"
+
 PACKAGECONFIG ?= "opentelemety_install otlp_api"
 
 PACKAGECONFIG[opentelemety_install]="-DOPENTELEMETRY_INSTALL=ON,-DOPENTELEMETRY_INSTALL=OFF"

