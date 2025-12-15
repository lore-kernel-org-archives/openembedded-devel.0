Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E6DD5B875
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 22:52:00 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8047.1765839114402754800
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 14:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YtAnYmHz;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so7578067a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 14:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765839112; x=1766443912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TMlWHRDZbOyUlmykA2vvxIfxrI7+LA9GoXNWdijGSQ=;
        b=YtAnYmHzWdSWBLJPQzj02d0EF5/ay2lKbAfyn0NV1lK++HUznUTj8VraXkGm7/C3F9
         hiGUIHiQaZVVl/zCLxfo/xqgSkS4k1E4x1isic6WBbPB9dFU70g1aYorNyLSQLk6Fv8S
         ZMMUe+d0GrfLaVDcQyodJV5x2GMxnLRLAjmbnnM+2P3EtdDFnAoJgna2WpPU9grDJv/K
         QP9uXIQmYbFXviR4MssJgvnLedPArk9+2WVa1oSYh8qmnCWRN1zd5YgGMnQqOakDr5lN
         TyXekqqhaeAUCDqocXI1WnCwK6a6aeYw2rM4JHAt6xELTTKjYKHzReqdW79VzqMGGyXJ
         5a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765839112; x=1766443912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9TMlWHRDZbOyUlmykA2vvxIfxrI7+LA9GoXNWdijGSQ=;
        b=uluh1emUlGlIc+mgdHnDOINYCoLLQmOv8RkaLvQ0NS3hUf0zX1Ks1Dlxv1win3m/wJ
         ecSwA5MPHbeeBoCKpNjCwvQXZY4zuWV450zVZyzDb97aYd2r5BVA4Cr4vD1YJylqY2/t
         Ym49f/vS2RbbTFtpEDPbFS0lxLWiu0kW5ouAfsXmRyJyQH7HUBzsYRSJIYPDdOHkigjD
         Fajb3CoUwaQ1bb8GXxWX1YUdco9a9D5gH7AcAkpKr+EYUK++uSN43p7swXQbmIVf7Tc9
         vDbKAtnKgBSEwZWSSSZ3SefWsxzCEklol3MqCyBcrs1K8S8mPmlbzJy0XcpDipBFPkia
         X61w==
X-Gm-Message-State: AOJu0YwKDOoQl08/woz1gIZ8mZZLwkZBIHFu7Z/nciW3n+z8PSrq5shX
	Xh29ji4RzjbIcoVM/BFNDK3TerDqD6O41rsehzXjhWiFQbgUnLndRyR1vygeBQ==
X-Gm-Gg: AY/fxX7/nxnlFHFeMnVjmceR7yWNdU+xGA9442/UaQKAjEIlYvxFBzz+R48KkF8SrH3
	j0Sc4JERhr+DvFERPscPr3z/4ct9nw+PyGR7eBbIjyg9l5Sk7pDXa0DCVMFDRVwv0WRIUVByCTU
	PzPnEUvcyP7g4BisYm7KGfh6n70OaJXUnzu1VaiD2pN/H9DcYF/sUkMj5CxPdgwP70TjdmX9LO2
	NfnIpIYPzCITISo8p77uDMwTnalrxg69DDNfZq+O4P9U2agIa4B17mg2w8MqFOXjvOjdX3PcOYw
	pLpOcGQJ2NVi4GEmtTvQS1ri5rUwRM7wcU2XdSlSZ2H93ACHLSrfkCwHHfBQQ9lTYCwQY+jgCHQ
	VIbbkVuwdYXbzhrLq/X9pg63HyUYS18VkBEMdybN+HcJiMl2G1a3n5SLgBsR2TC6mv+DvTbFRO+
	mUlKAFHQRsaQ6W1KeSIAj140Vwu8umWAcbJsHme2UKSRx86jWGAXsCN9B7QYiS0v6OfvrHJ/TYB
	7I=
X-Google-Smtp-Source: AGHT+IEHqGwBi1T0hCjZd7tdvlIcZ9fk7yk2j62MEd6MIZdgI53wVXci1+c8oE03sN+aQT8H316mYA==
X-Received: by 2002:a05:6402:51cc:b0:649:c709:d217 with SMTP id 4fb4d7f45d1cf-649c709d6c3mr6804914a12.14.1765839112071;
        Mon, 15 Dec 2025 14:51:52 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498204fbb3sm14464617a12.8.2025.12.15.14.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 14:51:51 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/5] python3-aiohttp: add BBCLASSEXTEND: native and nativesdk to the recipe
Date: Mon, 15 Dec 2025 23:51:19 +0100
Message-ID: <20251215225122.2243816-3-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215225122.2243816-2-t.f.g.geelen@gmail.com>
References: <20251215225122.2243816-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 22:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122671

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
index ca188911c9..5419db3535 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
@@ -23,3 +23,5 @@ RDEPENDS:${PN} = "\
 "
 
 CFLAGS:append:toolchain-gcc:arm = " -flax-vector-conversions"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


