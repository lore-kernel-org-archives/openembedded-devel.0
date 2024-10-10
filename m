Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCF1CF07C7
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 08:39:58 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.38824.1728549592709164343
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 01:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fDU5n/M7;
 spf=pass (domain: konsulko.com, ip: 209.85.208.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c87c7d6ad4so817257a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728549591; x=1729154391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gxvGVBjQ+OA8PZdtiPcNQR2OzalYbL84Vu72PsHpRj4=;
        b=fDU5n/M73iQDOYgoC+YBXtkVx/SH8t9Y5uH9Tmy4V4LJ+pGnfxJ3YJKD0qVejjKSfZ
         br8wHW5HBA1Xk9dX2Yx99JQhkmyjY0Lxa4cjlayH4r7+OtjWcjhFWealIh50cs+ByMA9
         Gm/qf4Tz+k61HoLCIDM+f1raCFx9VNi5jWEQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728549591; x=1729154391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxvGVBjQ+OA8PZdtiPcNQR2OzalYbL84Vu72PsHpRj4=;
        b=otgfHozQlFQWYqU1UUtLK5lq+7GqFDvj5p+53QJ7oZFTXIMh+LQt97RPz8m0yFTnqn
         4+01PRAMYP9eKaLoLxH9CsCkNBePBcOOA0ZPRtCPmLCiMKxdRfJPHSiOeQY+oBbkmKC4
         aGl1aq7r6sdFC6OiREJVjLR9Nwy2NJrdnVAcNn4jhfyJ8cKikhYpiIGpPsP4ra6DSIxC
         AOq7fPN+xecztMPPpTngrETkcREQtgJbJEPCRSfvV8m4SpiVZ8YxuELZ+xDKiijPU0If
         /qGs8xzipNKHnnpNXe4jpgCeXst6Jxk3WtywTyZz+/0loTpOzEZwgCqbPW9joRNa+iUV
         NpHg==
X-Gm-Message-State: AOJu0YzoGSEBLof/aXQoUMx93iqkNYfzKm+nrxRmlEMvqpvE1crzfv3/
	hCAQ0cOs3bGbr4jmzO8oBW9dN5zp9mnzzHvBJSOeY1BF8l8rDx7KI7ffgZTmGQccCIYHda8fvO4
	y
X-Google-Smtp-Source: AGHT+IFjY6XZItqGG9JrK6IkROA5wOlUOq2MJj7H3GlZbaqDpo7JcEbDcOx9gdJbBFkLuvDBzcLsbQ==
X-Received: by 2002:a05:6402:27d0:b0:5c8:9515:cc1 with SMTP id 4fb4d7f45d1cf-5c91d53cfaamr4028044a12.7.1728549590720;
        Thu, 10 Oct 2024 01:39:50 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c937153939sm476047a12.47.2024.10.10.01.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:39:50 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-toolz: Upgrade 0.12.1 -> 1.0.0
Date: Thu, 10 Oct 2024 11:39:45 +0300
Message-Id: <20241010083947.7303-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 08:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112763

Upgrade to release 1.0.0:

- Test fixes for changes in recent upstream Python
- Drop Python 3.7
- Test against Python 3.13
- Update docs

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-toolz_0.12.1.bb => python3-toolz_1.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-toolz_0.12.1.bb => python3-toolz_1.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-toolz_0.12.1.bb b/meta-python/recipes-devtools/python/python3-toolz_1.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-toolz_0.12.1.bb
rename to meta-python/recipes-devtools/python/python3-toolz_1.0.0.bb
index f1763ee51..ec67a4b16 100644
--- a/meta-python/recipes-devtools/python/python3-toolz_0.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-toolz_1.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca09cab178326d18433aae982d1edf5d"
 
-SRC_URI[sha256sum] = "ecca342664893f177a13dac0e6b41cbd8ac25a358e5f215316d43e2100224f4d"
+SRC_URI[sha256sum] = "2c86e3d9a04798ac556793bced838816296a2f085017664e4995cb40a1047a02"
 
 inherit pypi setuptools3
 
-- 
2.39.5


