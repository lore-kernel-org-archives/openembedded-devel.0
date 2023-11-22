Return-Path: <aj.bagwell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5451EC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 13:58:39 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.19804.1700661518675758997
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Nov 2023 05:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RtW2C9Cu;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: aj.bagwell@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3316a4bc37dso3579420f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 05:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700661517; x=1701266317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nr8Jy6v91E25EcfH+QDFg1Gdes4kT+JB2+Iyqep9SSQ=;
        b=RtW2C9CuPMPRdFqZc/2TqBkFyG4W+qsiJkW/Y1zec+F7aV9yafUKlEiHiqXK+r3q86
         xJDoUTNmICBXaZQKrRji6Z5mi6SEH7Cavm9KRO5ixk7Fpxgx6T2lzA8JcjJ/dUHgCy4w
         BpPz8Kgyfp5SQOQg8qS/JyDgJd6TJo+NPk51IXsjZExiIOve2MRzIfZKqTLAOrZ2Qjdh
         4+n3ICDpL1EFcBj43DP3ABKPwdATZS+fY9PIoyBIs//P/btypYc1gNLdF+x7sazSVKBY
         w4AmzISy9HxPGbtKaNxRnJwvxtxc2bY/2+V8Ut5kYr2bBWHYNh+5P0jqSRrIT3OWpQZP
         oQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700661517; x=1701266317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nr8Jy6v91E25EcfH+QDFg1Gdes4kT+JB2+Iyqep9SSQ=;
        b=Ra+TLNrO+iIiSsyUoIpKmvn/1TBf8OCnPOlt9MwF7CjJ1AsTsyrEXpxYTVr5YbO1bz
         20glDRsrSnBWPva+A7Y6I93wM5r5uhS87Zb1vKG4uVC+NL84DLrPE4Qchw8UPWdYB83e
         cqi9OBj5rcOf6zLJn09yQPAyAdxGlyfEl5SfTjnG/PMXUPn3DNUwYGxe0ESvOrGcogac
         Wx39r/9h/5Z0Tk3l4BoQAGk6m+LZx/L+QMsZxjL0RlW6Hmt2YfBWen4r53BNTJOG+N9A
         ydIvxJ30b9m8iZsFUx6GIA43eJZodJ8sGwa8kqdQu3sl8LsuVdTTE3zU6RnKar4U/x7M
         HC2g==
X-Gm-Message-State: AOJu0YyNj9wBwgALcblDifjBWkN1DNUrVs1pdAFkWru1zS7JxrOKRfZo
	Ht83qf8FSyWYQcPmJg+KbSNWueVLQeMIYQ==
X-Google-Smtp-Source: AGHT+IEbS8CEutlLIG0V/hvFuSfk2m6ffDprjA+Mw89Zl2bJYanW+eqsa18lCKb3d1bn5C8BJ+3y0A==
X-Received: by 2002:a05:6000:2c3:b0:331:3c88:6fcd with SMTP id o3-20020a05600002c300b003313c886fcdmr2075594wry.53.1700661516448;
        Wed, 22 Nov 2023 05:58:36 -0800 (PST)
Received: from CMM-M72QQGW76M.cable.virginm.net (cpc92720-cmbg20-2-0-cust203.5-4.cable.virginm.net. [82.21.82.204])
        by smtp.gmail.com with ESMTPSA id d4-20020a5d4f84000000b0032d96dd703bsm17264736wru.70.2023.11.22.05.58.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 05:58:36 -0800 (PST)
From: AJ Bagwell <aj.bagwell@gmail.com>
X-Google-Original-From: AJ Bagwell <anthony.bagwell@hivehome.com>
To: openembedded-devel@lists.openembedded.org
Cc: AJ Bagwell <anthony.bagwell@hivehome.com>
Subject: [meta-java][PATCH] layer.conf: Mark as compatible with nanbield
Date: Wed, 22 Nov 2023 13:58:14 +0000
Message-Id: <20231122135814.73695-1-anthony.bagwell@hivehome.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 13:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107012

Signed-off-by: AJ Bagwell <anthony.bagwell@hivehome.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index c571df5..fb8590e 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "mickledore"
+LAYERSERIES_COMPAT_meta-java = "mickledore nanbield"
 LAYERDEPENDS_meta-java += "openembedded-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.39.3 (Apple Git-145)


