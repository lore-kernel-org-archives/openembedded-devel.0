Return-Path: <sofiane.hamam@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7FDC36018
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 16:32:22 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.52537.1744043539635357971
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 09:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rvjknKJ5;
 spf=pass (domain: smile.fr, ip: 209.85.208.48, mailfrom: sofiane.hamam@smile.fr)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so7047751a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744043538; x=1744648338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBcUE/KBHuiOZjo1kzN+NMCuRfKfBwqaHamZGS7fQFE=;
        b=rvjknKJ5JTOv1BjUQoE4B1VpPBirhW9td3HFkS08QnMrav0mku+XrDmJ1gm4RaQT5i
         QGEYjH3gFHYuQNVnnJ5FeTEPtgZ2BkAvdcIiNvbjEwCcePHdEW+O+GjKWA6/h1/v4XyS
         9R8c5Jk26WBQCWxMguxY2mWUuu2wHHmcLlR8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744043538; x=1744648338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBcUE/KBHuiOZjo1kzN+NMCuRfKfBwqaHamZGS7fQFE=;
        b=lPc6gNYGu93OiyvEK4NM3FoodWcztDxaah5gRkmmE1q/EOI4vJNPas1npHvWQDokbn
         sTC2N2FFFzItHYMs5ND6mSHRkBbyWhIvEjLG5F0F5I4FH+L1Syorw91Y6DegQvG8Nmzc
         BdydpSuhp54dZYdueX9Mf0DVV6ox1eZpD++uJ2ecjw5gXHZoc71zN7wzLFQ3bE5+2/xp
         SZd1yHMl0LTZAgjfFtM7eyqYoIsyBuDpE2DhV+kLPFH+KWP3+kaq2lgu4wo6LjLt2nwP
         ucta/If0gjLaWbSPQhAydhiSVcYyTtGyhmJpDu0vu13Ya0eMCWfq31QLCfrQPQaA01Fo
         4sJQ==
X-Gm-Message-State: AOJu0YyGQQ0a1dcpEcPIAGXVmtJvAwVUEKiz9J4o03msEeyEJSSTEz6x
	AIULFbwQmi+q+bpmw6JraJwWyS/ypYXTTdzR1Cci48MgkUi/yKf1OqyCiXgZuagq4dyBkTJUw/p
	+
X-Gm-Gg: ASbGncuog8Qvyu79IS6wh/M4Zm0R11gG6TOmqqYyaQBAU9WL7Qbw9MNRVy5frYfwcJE
	cIQVev1up+93NXuLlQDirPZOgj3fmQfvNyLcYr6E7hxDP8XqPhGznhtuOWz1aTEUnF72TJ2HGWm
	kbCS1w0KOIG5qTxDm9nkQvn0NCRIb3Z5wl+xiSpfr6J+Igb/fUlRfUsSAHcVFT68oC/p5bV3GFY
	2HuyPQPQQCgouwq0kteWTwGdPoG+Ltk3gAw5AsgT4VTMMPJ36NmbJzvjk85aLP+uKkdCpGKJfra
	Ar/eTy8QBrJYLeVglA6q4BiIni733T/WSbItt7YzCR+ru2RHjhjzpY71am7uZ1mj1M4=
X-Google-Smtp-Source: AGHT+IFhUfA75b9FEKomY0olx+gIK848yLU5VkrlfvkFx16U8zDYacsWqIhiDFMj04uEldJ748sXRw==
X-Received: by 2002:a17:906:7955:b0:ac4:2ac:3c2e with SMTP id a640c23a62f3a-ac7d6e9fe1cmr1284554466b.54.1744043537854;
        Mon, 07 Apr 2025 09:32:17 -0700 (PDT)
Received: from FRSMI25-BPYTOP.. ([213.248.108.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f2e9sm778334566b.91.2025.04.07.09.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:32:17 -0700 (PDT)
From: Sofiane HAMAM <sofiane.hamam@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Sofiane HAMAM <sofiane.hamam@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 2/2] reproducibility: Remove OpenOCD from non reproducible list
Date: Mon,  7 Apr 2025 18:31:58 +0200
Message-ID: <20250407163158.3346593-2-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407163158.3346593-1-sofiane.hamam@smile.fr>
References: <20250407163158.3346593-1-sofiane.hamam@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 16:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116676

OpenOCD non reproducible build has been fixed.
See commit : 60d88818646dc418c3b505ea8b2e24c9a7e48ef0
Remove OpenOCD from the known non reproducibles.

Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/conf/include/non-repro-meta-oe.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/non-repro-meta-oe.inc
index b012c4931..c8c628eea 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -98,8 +98,6 @@ KNOWN_NON_REPRO_META_OE = " \
     nbench-byte-src \
     nspr-staticdev \
     obconf-locale-es \
-    openocd \
-    openocd-dbg \
     pcp \
     pcp-dev \
     pcp-doc \

