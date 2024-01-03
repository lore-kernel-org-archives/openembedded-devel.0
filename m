Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E27C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 14:57:35 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.19108.1704293850271501554
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jan 2024 06:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JSayVnST;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-336c5b5c163so333427f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 06:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704293848; x=1704898648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WXdTRzL1etNnB6ihsM9gGR0ydbLnYPtg9vlnnSE0jwk=;
        b=JSayVnSTGuIgYaemxU6mA49gyhAa4ZXnL/mEpXedrUmVJ8U11D5ZMV5CjpXtMN4D3H
         9B7Bc5Lx+M+qe9vkf5FIt9hVsXTUMlmnkP6zfqOdiG0VS0KI+PLi2WNFZ3xbZvcroPkA
         jGZ9OsdMwdd33vJHNrEqEinPHDzBdTBPtV90Tfbi8GcwpiORh54/SYu012sUZMLIOgIG
         x0xHPCI1ik4+qHyW2RkGR8gw5iag/tcTMf5BJdiJ22MQlueX2AWl1WbEzJdJAAFdBMYL
         k+0bLuxBRvFPoyWcpCs1+NdHclCI+pPSRMVsJDc+foky5RrhOTgWN8oKz3PzvsBv+2QM
         FUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293848; x=1704898648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXdTRzL1etNnB6ihsM9gGR0ydbLnYPtg9vlnnSE0jwk=;
        b=KOHBYZVj7Tx/EERPhfQM9h7QY4IX2oZgLoxhE9Bu7ipCy3qHb3nWm1TPyN/SOInLp+
         vEZlO9KvESd1mfwoh6KtEinoDibhHzZjO4bIN+i2Cw5M9GLUFx//XICVYRdQi6mNi03E
         LTFyU9+1BlNMFYsuGaAskugu0qBBjPs8oy7yHJFT7rFzWyNfPLLu5Wo4HBABs62xTxbn
         wZDH4WvQjSzpBc3i+AVimb9YHIiOt7+9pdU3d1be1OjGbtl2s59LrgF8dci66pi0oZg3
         qGjqxa68WuK1D9gp76AXLck8eIOyR9y7040SI9nD1zaeVUi+WUEZDD8+WEh+mmQP+YyT
         oxsA==
X-Gm-Message-State: AOJu0Yx3CRwmXfV8Bo3tKWVcC4s29GwVC5lckPVsg7mNepcLwPrI7NqV
	uFzjpOx0lOGjB11ZwTw2Gmaox2TZD5vtUT0+
X-Google-Smtp-Source: AGHT+IEaEKj5ILdNagLQacZGeWh6PFTHTuom7/DjZDAVDHVdSOOtCCD4/d0Zg5jfySXSRjznt4g7NQ==
X-Received: by 2002:a05:6000:1151:b0:336:68c1:36fa with SMTP id d17-20020a056000115100b0033668c136famr753361wrx.5.1704293848234;
        Wed, 03 Jan 2024 06:57:28 -0800 (PST)
Received: from localhost.localdomain (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id w10-20020adfec4a000000b00336670abdcasm30788967wrn.40.2024.01.03.06.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:57:27 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-oe][master][kirkstone][PATCH] layer.conf: Add libdevmapper-native PREFERRED_RPROVIDER
Date: Wed,  3 Jan 2024 14:57:03 +0000
Message-ID: <20240103145703.443173-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 14:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108032

The libdevmapper recipe don't provide any package and is only
there to resolve circular dependencies [1].
We already have the libdevmapper PREFERRED_RPROVIDER but the native
it's missing.

Fixes:
| NOTE: Multiple providers are available for runtime libdevmapper-native (libdevmapper-native, lvm2-native)
| Consider defining a PREFERRED_RPROVIDER entry to match libdevmapper-native

[1] https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/lvm2?id=3f64779eae2d8312f569bee863f90ec4f8176e6c

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-oe/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 0ca7d7d7d..a0c644a2f 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -47,6 +47,7 @@ LAYERSERIES_COMPAT_openembedded-layer = "kirkstone"
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 PREFERRED_RPROVIDER_libdevmapper = "lvm2"
+PREFERRED_RPROVIDER_libdevmapper-native = "lvm2-native"
 PREFERRED_PROVIDER_android-tools-conf ?= "android-tools-conf"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-- 
2.43.0


