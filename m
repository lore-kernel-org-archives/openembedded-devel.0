Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26ABC4829B
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 16:10:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.25456.1707235854251053115
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 08:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M9japY5v;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40fc6343bd2so39451425e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707235851; x=1707840651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PwXGE5jhwlM71NbEAbChBDsNHqxB8JVeN6mBYzU5Dc=;
        b=M9japY5vDeswdW4GKGy6g958moEOGwCmecWeCTJr9laabSy4dlGtTXnviXveBPd5xY
         Hrv0PQAthSoDfbRjauwVKPy4Z2xDXC0IkzpLw5ByzhAfs2oXqI9qB5wierMewhxJYduB
         6c88UDdj+SGYEaykeC/9rViOtgL6/uI1QunPz+IrpHRDTu3aSyMcX2Ng0AyGB1utxWcv
         DfujgEFFk4Iz4CGVCq6CVrIILctoVjpjPT+OSvVUqHMpYL7gJpajudwQz2dpfXAyOBNn
         jpaZIkGPL+NdpF3dt7vwieKJj0MhSy9sdJADgfL2Z8zWENIzeFzSs/Sm+/vAn2UIcY+/
         FXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707235851; x=1707840651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PwXGE5jhwlM71NbEAbChBDsNHqxB8JVeN6mBYzU5Dc=;
        b=AeQYIzjQ0PnV0Kls8XSzwDdpYbCr8J6oboNN21d0YtGVU06ugBgo1sPp88wCevMR/Y
         a6C8qMow0s3tGXfnhDbdh5aXMopeWv3q4UeJtT2u9ZOIsg/17mU+EEpeHJKELqSovPQf
         ceYYe4C+1q6jmi9Vh9uwkEMNCM2bs3uzwlPHiRocHTwUqLbw22mtjNrMxFGQ86D4KS+m
         3MXUYcieYU6Uz9GGlFK0DKUw/A9ZxwxfuDuApcmz8XQypNtd4EZRKHQmSiKRluNEUiOQ
         9uBVcV4eVFFhiIDy2rY06eni/CQJlJxe39LtK6cubBHHrGHZyNwoNipKJeID8prEqKbT
         lfJA==
X-Gm-Message-State: AOJu0Yy5u3k+upjwxj17WviJzShdi0hQRRK/qWj+K1ERSDAOIIUAjMtq
	i7q0ftkprDnzO3IQkFMS5963mfCxkPe9/NrjuIJBLaKggXOVat47kVLEsPpg
X-Google-Smtp-Source: AGHT+IFN9KK/NMS9livt4POuS2F/AWYa/bK3GEzWVm6ZpdM4U5tdk/Lksc4+Dm+SQsqir7/Rfg1g7w==
X-Received: by 2002:a5d:4b02:0:b0:33b:2c2a:934f with SMTP id v2-20020a5d4b02000000b0033b2c2a934fmr1683938wrq.44.1707235851064;
        Tue, 06 Feb 2024 08:10:51 -0800 (PST)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d674d000000b0033b459e8f60sm2191309wrw.18.2024.02.06.08.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 08:10:50 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 2/2] proj: upgrade 9.3.0 -> 9.3.1
Date: Tue,  6 Feb 2024 17:10:44 +0100
Message-ID: <20240206161044.738085-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206161044.738085-1-peron.clem@gmail.com>
References: <20240206161044.738085-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 16:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108635

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../recipes-navigation/proj/{proj_9.3.0.bb => proj_9.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/proj/{proj_9.3.0.bb => proj_9.3.1.bb} (90%)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.3.0.bb b/meta-oe/recipes-navigation/proj/proj_9.3.1.bb
similarity index 90%
rename from meta-oe/recipes-navigation/proj/proj_9.3.0.bb
rename to meta-oe/recipes-navigation/proj/proj_9.3.1.bb
index e9a72429e..78f4287d6 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.3.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.3.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27445198ba1500f508fce2b183ce0ff"
 DEPENDS = "sqlite3 sqlite3-native"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "91a3695a004ea28db0448a34460bed4cc3b130e5c7d74339ec999efdab0e547d"
+SRC_URI[sha256sum] = "b0f919cb9e1f42f803a3e616c2b63a78e4d81ecfaed80978d570d3a5e29d10bc"
 
 inherit cmake lib_package
 
-- 
2.43.0


