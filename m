Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD98C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 06:06:42 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.17101.1751436396741735170
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jul 2025 23:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CkvMh+J2;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso3703661b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 23:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751436396; x=1752041196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=teZzj0nD40NLco2yhT1//qAXb77F0i/MjcqcjIkdnUI=;
        b=CkvMh+J2rKEqn7Abarxk8/+BHhHFXNv3nezytEV+OXEI46QN1eB7kR1KpQdqmz3ABd
         K8iXHG5TmucChn0tJarjCJV362COvPAFxMBucDZb1uFQvgTPzm2KzFR48TdcxeWAw3Eh
         q/uFq2c49yaZ1bQt54pWpKcdwSGZIRpxOESgypf33365Z+/Wkmu1VaG2E7eHyu4EFFme
         6VOCJ0vOPU7HSinV+pAWxjhFftAdIx0M+wtchFYfx5KsvSYml0At+1sHK0s/jRhQHrM9
         2SE6b6TNdKOiIk16fqhtkc6KElK4Q7rWljaDh7oRQI2aEQ+nHM/fqBV6NeT37S5S8wnP
         /vIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751436396; x=1752041196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teZzj0nD40NLco2yhT1//qAXb77F0i/MjcqcjIkdnUI=;
        b=fJPEURglDxKsBY0IyRwX5NnEnOvPsHTbGPJ4bVr+grjtO/6HTpp15+idq612loqKEi
         D88TPGnKtSoBeFaRe+PWiDGEHWoNPc/xE5p4BJK5JYEonfkjOkMfktcY9+qaeDDM8EvN
         IwBcNNY0zaqQHLb79iZAC6RPl31saV7N80503pAOTEMTjplC9HdmWGTHEeOKStnAZDUb
         BESqy5TwsNb9OLtk0AbqDzA7LCcLEM3D2eXk8DJBOp9VVrnXJU1gVCsfnez7tbQDGeR1
         g18RSW0OkfdDTpe5ifaT31VHbI+ylVJO5SyHAwatpEHg+L/7kac8UZ62cfVFJHsiReyJ
         x7NA==
X-Gm-Message-State: AOJu0YzuxF8zxyZ4kZle5eLEjiQ+U36smPzgUPJCe+90tTviqgOGRZiw
	wTRi1dCCrcRCITLaotZcJa5SRF35VQ+BjHv8YUxTRNFEpbkueoUaDdyUW5Y/V1px
X-Gm-Gg: ASbGncuF+Vz3CXZd17Kewl+yIi7qwGAJab7zknrXKodNJtXDAWQT5R38s8PHiyLqYmT
	u12mCnK9WU4qT8VMvjYaBM87jSzQ9hbWI0waeSyjz44AhVzjErKsWodIIAofSnE1ny1QXN6d74b
	iybFeuxb6Vh2C7lmrZ9J6dLjDRrM//Y1TtADE8qaFCSuBpcMPsmgXO2EUh8vKeFTHzuYXcB3U+j
	ul9LRZTGSt8H/Cxtuu91T8dqhuQIxKX3FPylUXPLkE+TCoGu/vU0+ZSY45qmlMJH+8rLPsQJ5+z
	T6T2HS4vThF9hjBXnNF72AuJRqas4OqVd1oGCBssFFB+t6GrXwfdyQ==
X-Google-Smtp-Source: AGHT+IHl22vL7kagydtsYFmfDjKRWWJBkjH8DmqdquLdcELxYssNmPh1bcBT151JNZOuXI+jczE5cA==
X-Received: by 2002:a05:6a00:2eaa:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-74b50db61e6mr2140843b3a.5.1751436395649;
        Tue, 01 Jul 2025 23:06:35 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57df00asm13298345b3a.148.2025.07.01.23.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:06:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gtkwave: Add libtirpc to depends
Date: Tue,  1 Jul 2025 23:06:32 -0700
Message-ID: <20250702060632.85480-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Jul 2025 06:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118196

It was missing as the recipe is using --with-tirpc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
index f912686c41..0b87c1b21a 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
@@ -13,6 +13,7 @@ DEPENDS = " \
     gperf-native \
     gtk+3 \
     gdk-pixbuf \
+    libtirpc \
     tcl \
     tk \
     bzip2 \

