Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA17C7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:31:02 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.9136.1685521859429994715
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=mBeM6y/P;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f6d01d390bso56310505e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521858; x=1688113858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAMN+5mk0eAXCxDM4rCRgFfYFQTM1oOY8gq+6fodvWw=;
        b=mBeM6y/PBrATrZEpHsZE5S1ay4rjXJywOuQTIaV3Vlb22sdwypsFnF+TSISpIlxMqQ
         ndmgqamMOAi4Rf2gkC3mgmZznsYBWUH6k8qeludIrpN9zbmwLQXhi8OUCXGvGtQfQH6T
         84hDZdW1WyxWSE098JvxloQbwaLp6BlGM5jwePdc5gfv7qmPlMdvzwRJeH89iccjpqgM
         uxOZm+Yl95YnrUMq728GSr9hsXImzZsMGtUY68Rq3CBaW/NDKs8HQpJ/PmS+BguNZfCa
         VDXE98ubxplvZQSPI99eaPGBDPMrm+A4hUtF8V5NR924NGW1skIna/WVbmK19p9j0A5n
         5JCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521858; x=1688113858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAMN+5mk0eAXCxDM4rCRgFfYFQTM1oOY8gq+6fodvWw=;
        b=hzpI6gjzUGy1eLMgYsJ4KBt5RZRcUjUwsTSmd3ymDWlHd5K7unK0tvXA4VBqe7b1kC
         e4PNvzGPcwFssjEoH7y2fdhUxR2qLTTHLg2ptYvkgvtDYMyQU8F/42T3xHPh0t9YKf6D
         aErR+O7mtEMQ0aRuoz1W/jUdFydj7zZjiOcoH3a1tdR9PdUktgZ3WbI+MmyyqBcXEsgA
         uPTPf1J03zKFigoRf0hpNRAtNasVjQNWZqj9v5wEiBq/BTMs+PlKc1PpSiNdGwgBc/De
         KvaYGRUBiFi2dAmfrS07FWlksd3NZA30AmSznX9mcA68J7rAsDqWtcVnNIwpmVDKASrR
         COIA==
X-Gm-Message-State: AC+VfDzMQffo582CqU+zG74Lu+MBGBxZXUIjxFgZ74LO4Xb8q86wL35a
	io4LwdpQLj0uIYeYMex+ZvGj8IANZIiOSbmGbsc=
X-Google-Smtp-Source: ACHHUZ6jU+LU8203NV/8stNpi1Im5uEKO6u2YeEm0O2e6tvGA5GXGlBqMo/W+lpcGkzxNgD1H9PKVw==
X-Received: by 2002:a1c:7704:0:b0:3f6:735:69e7 with SMTP id t4-20020a1c7704000000b003f6073569e7mr4806883wmi.36.1685521857940;
        Wed, 31 May 2023 01:30:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id t16-20020a1c7710000000b003f604793989sm23338288wmi.18.2023.05.31.01.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:30:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 094/149] python3-netaddr: add missing run-time dependencies
Date: Wed, 31 May 2023 10:29:09 +0200
Message-Id: <20230531083004.11083-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531083004.11083-1-brgl@bgdev.pl>
References: <20230531083004.11083-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103021

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb b/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
index f3d378a59..5ba006691 100644
--- a/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-netaddr_0.8.0.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "d6cc57c7a07b1d9d2e917aa8b36ae8ce61c35ba3fcd1b83ca31c5a0ee2
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
+    python3-io \
     python3-pprint \
     python3-xml \
 "
-- 
2.39.2


