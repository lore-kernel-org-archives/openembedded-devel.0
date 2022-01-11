Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB37EC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 20:22:30 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.13414.1641932550637071379
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 12:22:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZNdoPg0g;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id w7so483018plp.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 12:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XTm7LVgj0hyUFrjxHXW45vlRBh/Iuu+606hA0Fhz0OA=;
        b=ZNdoPg0gqQAHh6la7BKtpuP2h2Ia2ESURh2RdEd3Bw5SkJ4A4vLb4GTJNTy++uGKEE
         HsKCtFIt6KQ4a4+62DsIGv1c8ZvzxVaJFifKITIwn4HNKyn+zf8evWJ20KCWCxuPMtdl
         oXQH7+YzntYdoCQX2FT2ErvMmm3DWAk+sZ6XnlPPFfNYx5YAQNnQ/i7Lechj4nF49pGC
         pRfx00Y1NRGae4gtY7ni3rGq48n3slM/g0dHgLhPOOVRnTuCvghJwlG1T4qXDjgcVknv
         a1JKRveeEjRTIwreOsW2Ey5zS08Y9mTH08i0X01wbUFqLUzTS5PFLRq5EKAH6/RI5VQo
         Rjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XTm7LVgj0hyUFrjxHXW45vlRBh/Iuu+606hA0Fhz0OA=;
        b=i+RqHQYWc25qR5Z7aZ0RH5kaHifLuLmHFQIzE1GGUUPs1ifpJ4sMy/GmdEsGOHbSyC
         WRnyZScTFsEsOvx5D811MFE4FXxbOJsOmW6kuCMnMym9kiUm6eVPlI8Fb6k5TWp7O/nH
         hKMZCGOFSuBoCNvSEdCjMxwCjV8O7K+7n6ElavIXPZSQZozdENq5Fsf7TS5KL7K4YEgY
         3KiGfnSIdtzVOFX8yrhUscfNOqzS3Oa77v2sFKI/OatZBFas6zSL2bHI0516E9sTyRfe
         xAv30s5C4vUVGxIkXRSEarTfTpIVppQO5E9s2fN6XH2D8UBpElnYtv9a+iQ2poyTky6J
         5Apw==
X-Gm-Message-State: AOAM533nRtC0bmt3jrBJEx34Q6GR5Dp8zC1OsIO/kab8iVONM4l1sT0D
	DZThv8WOllFSPas2LzHT8xxNLG/PlRLX4g==
X-Google-Smtp-Source: 
 ABdhPJxM0OJtuOTlq4TBDZ3gddUrMHbKYqssGUldUdBQtfbgZ5kYzIVCU4tpBKaxaiHdLZIXbPkAxQ==
X-Received: by 2002:a17:902:768b:b0:14a:147b:ce37 with SMTP id
 m11-20020a170902768b00b0014a147bce37mr6188600pll.23.1641932549922;
        Tue, 11 Jan 2022 12:22:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 v7sm2378224pjg.14.2022.01.11.12.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:22:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] influxdb: Enable network during do_compile
Date: Tue, 11 Jan 2022 12:22:25 -0800
Message-Id: <20220111202225.1526283-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111202225.1526283-1-raj.khem@gmail.com>
References: <20220111202225.1526283-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 20:22:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94759

This should actually be fixed in the package's build system to not
do the network access during compile task but go modules are invoked
during do_compile which needs to access the network.
Lets workaround it for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index b2899ec381..db453c0849 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -27,6 +27,8 @@ SRCREV = "688e697c51fd5353725da078555adbeff0363d01"
 
 inherit go-mod pkgconfig systemd update-rc.d useradd
 
+do_compile[network] = "1"
+
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system -d /var/lib/influxdb -m -s /bin/nologin influxdb"
 
-- 
2.34.1


