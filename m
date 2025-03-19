Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B759C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:04:30 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.6372.1742418264171836615
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kM3Yk0JH;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223a7065ff8so580185ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742418263; x=1743023063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NKfNpV0K3m96Y6V0UMULMmQYWmAk8qZrI4fHQamFuWM=;
        b=kM3Yk0JHRI4l5TKVAlzgjmV1BsxuRE9tjnJqND/R1ZDzD7nSwR+LkC/ZGwv/fLxw1F
         P4P/Cq0xYBnShXjt7nl7Fjf3/GippBq1/HhP3MgVzwh81VaohfHOnc88FwmoEqxRrU4y
         7kfwv+nBAUHPeYYbjRnT4f3JhmsL7E0oyQaGgkrCrymqic5S2OqQDWxoPyMRnEZRS00C
         c+BjvaxYrNa2fnIFQqeUXMF72t2q6e9xZzF2CDJzHr5c9FkgJAQlDAAno4MsBCOspb8Y
         QbPmKC05UsuLYuUUnvrnvK9ftXh9MwLDUaeXqKyw/P1bgR8Wl+0Qbei8cz+93miMUu78
         hKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742418263; x=1743023063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKfNpV0K3m96Y6V0UMULMmQYWmAk8qZrI4fHQamFuWM=;
        b=mBgQ3YqzX7wW8Q2SOIHwEfpMhl6EZcbk/h8cfFQrNp5yDq9tOfdrsgU/dhY00JleRn
         OAeBgEiofwqFff3rzw4HPpalzsRq2dxihR9CfR70V02RatwzepDpozI77VqqwyyLBvKp
         pJJyVhmWCmHBqcKOkSanck+oOTIG8w8PHo+oAXOlDS6/Gz1TkY7GD1JgrlxyGg75VHvh
         XBQD+mOE5+ZID7RhrKzqaTEv59J3b7yxmX28bWKBsOpazqdzJcNxd5W4Rse7+0uwx4es
         nuoUfCGTdzXO0nsALhg8dgVQMIOM2bl016w/nPJp+pureUMurqTOJEGekOmw8mwhw6Pz
         VL8g==
X-Gm-Message-State: AOJu0YwhSwkv4pLiNHZusnsKpZVehUkilI/LSTxs+BDUALJrQbgF5Rxo
	Stmo3na9VwIoSbrzF3k3NyuS7g8EvF6Et+r5w/rJo9sVDpEVPg3kFlHLQgiE
X-Gm-Gg: ASbGncvtPH2dwRZGq92vftJPSlon9FGdbjdKrVrXHtv8juAU2xkN/GNkRNsHL9qKFRf
	ELNdy8kGHsmczx+lLRFj2P+wh0ZQCFnY8AEnESRo7laS+NSWT3cMV/WkyoJf48zW+BgoGCn3ofk
	LRRKFTaAu/D3b87QZfuUVyupM0m4D4aZC4nDjFnUklx3ebosm8n7LsXEpXyqyN8LCeiPXguiHNv
	eBu8uu+7wAQ9xP74P5BYFsT1Jvnha7MMSsGuOdLrSphGL2Yla+og4wFipiyPXhbjYW8Rg3lAnbb
	Ej8wnHCzoIqd6NK9vilF3DELEuAgtHm7NKy6
X-Google-Smtp-Source: AGHT+IE4lKKzAmTQgybpL5vV5sae6UKqKt7mGqOHsU4jgQShMOjHSUBv8SI8re99d/GejubTrKsdhg==
X-Received: by 2002:a17:902:d2cf:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-2264981ba8cmr61560745ad.1.1742418263233;
        Wed, 19 Mar 2025 14:04:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371152938csm12511767b3a.12.2025.03.19.14.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:04:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/4] openl2tp: Pin to C17 std
Date: Wed, 19 Mar 2025 14:04:18 -0700
Message-ID: <20250319210421.2454856-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 21:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116110

Does not compile with C23 with GCC-15 and the last
release was long time ago.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index d66b7d2390..4e5b45891d 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -48,7 +48,7 @@ SYSTEMD_AUTO_ENABLE = "disable"
 
 DEPENDS += "libtirpc"
 CPPFLAGS += "-I${STAGING_INCDIR}/tirpc"
-CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+CFLAGS += "-I${STAGING_INCDIR}/tirpc -std=gnu17"
 LDFLAGS += "-ltirpc"
 
 PARALLEL_MAKE = ""

