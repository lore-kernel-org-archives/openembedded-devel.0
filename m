Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1058CD98DA
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:19:15 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87400.1781338751669743557
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KuhWqIPU;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0a5354da1so14949475ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338751; x=1781943551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSGhpgx/r+al5KGPk4KiPnsL9HRZWrTip9+36pGKfiU=;
        b=KuhWqIPUxl1QfEZFNFaCtJHLRTgh2MiKrcJeeuw6XkJeYHGOZ7vJjOmD/fCxZ1ac4Y
         S0Y2okz2lcR4RGtsDDftkEVX23AfpfrD+GKeaVJV27HwsdEk7ddnz2YvTwxKU7hMtSru
         8eODjM3MlGLCAk8uqThiJeOa15XglFIIYumbwVyXGrtk8F5JvXiBXu2FEXRSqEXkl4/H
         E2tIoNHCE6xZqzLp8HUsZNqZ1i/SzTSUsYDB7zDpQLk6qBDLZvoDehoHgVIxHSlBYIlb
         orqhCqQ12hkb39jiRXZ8+7lUerJAUglsQJV7hyN1INzsakTQHtKKmSUPckcW3PogzO/s
         OP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338751; x=1781943551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zSGhpgx/r+al5KGPk4KiPnsL9HRZWrTip9+36pGKfiU=;
        b=KK5s5Igk8odqBIILh/D1kBnx4Q9n+Ts0tu57Ae7eFwJgo8vcuEi4XroAXyh2S/U8oB
         qihwB77utSJNagFR+0Ni8vBhU/0nnFLwyQeW1xe3JbtsHAgoO2yZsTVpVSFo08AodUvc
         teTAPKqLNpEK65RvDzMSfe7lFa1Y3tgVPcIOettD0InUxYnzf6Dqp1fVJeig/OfY7HLS
         0z4DdL5GMXpJMht+eTAfSHPMYdoYOMraCPmBh9aNNvm1HJ2zznE0lvnzBb0MVnx+ulAq
         6Ep6ujWaKVNBmNOyj4SWb0EEiKZHv1PPiMbq4e5aOMHb58q/WZSQv884cswB44bDMMxN
         uIsQ==
X-Gm-Message-State: AOJu0Yw6uTRYY06YTFt4uF6s61LDkivmCXkIO4QbnhuEAyL35LcEcp5W
	4HcqFDpsX6rU1vdtXAmycszICcik2P5NSrrQ+4J93esdo6Tgv978RhrWhOMeeLJx
X-Gm-Gg: Acq92OGNFY8KBOyDuNHbiTgWWrdVcp+Af4Mbokn9LJpYpNHxkO7jKjQ2h9UKlWMnt7D
	7IyCJee0addwXOYeJl1E9y6BHonmGxi4Iz2V0fsAc9EqjLxcGSopx5qzthaw0Zb9yTgtPJxOd6J
	/ZyXbR3hEz2uxkcci6mRMvZRp65UD3WAmzwy45wsnNq4vGUnTXfLqc8i/qqPXbYkJXTEuIgUIO7
	a4OEG5BYoX/clwHTsYoD3ZdZm7KOWuzz3WRCoxp2eH+bQYKhvJ4TomYFcTOiIrWdpIICApYlK7n
	p0u1AtLYMYjcFbimxQVFeQF4swBLo1Q5ntpLqpdPHwR0TiRxv/INHRcpTWUOL0MXOvDk/j8f98T
	PDMWy/B2pv58fiQz2JgUbRWa2/8yDtZup5PQ7hk9NiftFepN1U0k5xgawp3scPJ25sB9WpQGqHh
	IVt1raIhL7hueXDHPnINFA9kQmQNobfXhFcElG
X-Received: by 2002:a17:902:f70a:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2c3fb8d7676mr59909645ad.13.1781338751044;
        Sat, 13 Jun 2026 01:19:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:19:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 13/16] python3-vector: upgrade 1.8.0 -> 1.8.1
Date: Sat, 13 Jun 2026 20:18:21 +1200
Message-ID: <20260613081824.1223609-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127565

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fix: get rid of cupy<14 quick fix
- fix: _wrap_results skips momentum equivalents
- ci: bump setup-uv to maintained tag scheme
- ci: enable numba testing in 3.14t

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 9966cea909377efb4a91bfc65986feb5df2a7667)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-vector_1.8.0.bb => python3-vector_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-vector_1.8.0.bb => python3-vector_1.8.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-vector_1.8.0.bb b/meta-python/recipes-devtools/python/python3-vector_1.8.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-vector_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-vector_1.8.1.bb
index 67312c4423..b04184cc88 100644
--- a/meta-python/recipes-devtools/python/python3-vector_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-vector_1.8.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b9f683a957276148387db50971a7b3ef"
 
 DEPENDS += "python3-hatch-vcs-native"
 
-SRC_URI[sha256sum] = "58f95e9e24463851ca34176a20df2fd2e80b41d78615e5b1f7ae4bf313424ca6"
+SRC_URI[sha256sum] = "1b7658a4fbc7b593342506a1b84eff3459745b09c98c3be83ed58df31fd29b43"
 
 inherit pypi python_hatchling
 

