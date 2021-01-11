Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.1732.1610408391875120458
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 15:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qbaNwcx6;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id iq13so479475pjb.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Jan 2021 15:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u8qV0QHUALS6s5QSdwJvWCg/BkRwvGKbalgwTN6Hmsc=;
        b=qbaNwcx6UbOmLpmA9gWWknxDrSh1F4KsVZq+/pn8Q3VD2w0w1PLcYdp0L3wEcdVSdd
         ZeNVVizWNR720luNHcs6HXiGcPLmZtPF2vy5VF1ri+9SO69FhlLaBvNRI5hnhjrQ4GFH
         PZti421ufTVUt+S9xzkVdRqXNfva6bxsu9pUwddyLBw2hC+v+i9fsR1kRT0pH9NQo6Kf
         S2tS3JT4Nd82S4R0U6W7rdDRUmPi00nOLW0hWxEog00zBRmJnmTLwzl/dP4gV/M7RAlc
         qoYDCoc6pwwNWwNIr6jlQXE48nMQh2FITqQHPDvYdRhPVIrrSBYnZRSer+iPTnkPQX54
         AJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u8qV0QHUALS6s5QSdwJvWCg/BkRwvGKbalgwTN6Hmsc=;
        b=SjvaIq7MXLaSzK6gYioUD4P7EL9zVd5LTxWWpj6tgKzSIX5axVnYLCnLtbvy0Kv22T
         CuEYODxuK8ZnN/xz+6hp9IQwgTOr325s10v1WaQBNdtTARdXYGrjT1OBB6qUoUgg5jJM
         d8hEFnFSRtJgFKg24SD+rmCIb4nC1pfEZadCfjJFdwJq2/SJSGehfgBKfzM0iMTWCndE
         5o0B64mvJWjGGo6zclfrdVMLpbmqoYTZ/qushrGaPSa4BaHKqLMWYpA6EDz7LGY7XVVq
         z/eSBSNmPUE9hRMpls5BqkMAQIzXgq7oxiU8mtIbj3bxR4r2ff1E0GeaBPMgDlxi9BPd
         BqzA==
X-Gm-Message-State: AOAM532/2RIUiIvQsUQjyQNEhEjAcSoXaXbKS6DOUVI0Srsas2lQKF2J
	3wKGaoO5Gl30WyZEpVCp/32vFKLrR5OPvQ==
X-Google-Smtp-Source: ABdhPJz9iUNqgu4kOl8qhhYKcUGizVuDc0kQkRot14hYjvgsvmRQbgywwJMxAREOSzPNMBinkPA1Lg==
X-Received: by 2002:a17:90b:1945:: with SMTP id nk5mr1344708pjb.30.1610408390462;
        Mon, 11 Jan 2021 15:39:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::248c])
        by smtp.gmail.com with ESMTPSA id 123sm883062pgf.38.2021.01.11.15.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 15:39:50 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Add new package influxdb
Date: Mon, 11 Jan 2021 15:39:47 -0800
Message-Id: <20210111233947.3893454-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2a84d669a1..ac986a5c1c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -197,6 +197,7 @@ RDEPENDS_packagegroup-meta-oe-crypto ="\
 RDEPENDS_packagegroup-meta-oe-crypto_remove_riscv32 = "botan"
 
 RDEPENDS_packagegroup-meta-oe-dbs ="\
+    influxdb \
     leveldb \
     libdbi \
     mariadb \
-- 
2.30.0

