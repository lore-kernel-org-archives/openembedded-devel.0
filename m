Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11F3C44536
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 08:43:37 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32951.1769071409113050131
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 00:43:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bcWvQdbF;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso5291105e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 00:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769071407; x=1769676207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kotTaqrlL4ooKN/+Yw4ShSaYyf06wR2vrkU6SqC0hrA=;
        b=bcWvQdbFfQlGgeKpN9xsBMWTC8mofBtNC74qlFNiT7uKYn7dyeDJl4ctn367kjzV3k
         CIUIfm/D8soSnB3RuFFHoMZ1rwZJhRaNUcXPI5wTAf6Rw7GMSQrfHsxlc5WL3S9C3k0r
         ThhBMSSUseblVd12/6C/wLV+smXQ3PVVSzsgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769071407; x=1769676207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kotTaqrlL4ooKN/+Yw4ShSaYyf06wR2vrkU6SqC0hrA=;
        b=JnpXKOPSSCe3MzDwgg2VFhIwmjNMjMJ1Bns24X1JoC5xZ37X/DZZi61+gG9xka/7wv
         Q5jVp8B8LF6lZtDbAwqlQUtMUrGx0EJ9Cz+ytMsIRueqIvj7thD10UdKqyaJyJ5NMjqE
         7VEglcOPWdDjpcvZsDEvqjTFQBer+LXebwx8z2rKnz4blFXQPCziK9PYeqJGCdqTYOuI
         cVjpE6uo1X6O24rjVBzwxW+DXRq+D/m0xeVhojLJkIdCpIuc6hKvwr6/jrdhmjUG207M
         fOegam1xz17L3U4xknTFzpTtJNQE9giUAZa9mOddpnlUZU3G9KNPAlaqi/M9BBv2Im9G
         ME3w==
X-Gm-Message-State: AOJu0Ywozvuo+dnM1tmrTiGqz2GTWJ1VFYwoPLp3JLJPbEoNEyC+oE3d
	npIcLNUvJ+18EG18aDcdkSabx922SiUSYZE8TDI/EOP1+ZhiZQ74UR/lFb9BTdEvacCerHUvLPC
	ari4Y
X-Gm-Gg: AZuq6aLaX+AOZ9FTHXM0kqOWp0a97oB9Ta/SKluIoN4yu1upKpWpW2VTPh5mr8lo7Ok
	ZB53rs5OtFcVPVWO9p8aw7ZErpvOKh1fHGD5zvZMW3ECNljFTRAGDXf7K0twBqBqT2IkpacqCze
	4F8GEJFXbOUankRwBPSzWLp7Q3K6E2O62CdTMrBiMOeZ4STboqkXoC7jWsZYEnSCvq4lhiP2m5X
	fz7XRWaQtTFKQ4mjdTWOroXcXyNflOEuXCxuoBrtt90VE4D3e1FGTuJ69RGCiaVtOnqGQRwh9Kz
	rJYhPv2SpULwPUog5swJ3pDlL59Drhpf0kyiWYFly8CA7nsE3E1yRe0MmCz9QwwsPR5/QMHHil0
	SUOeI+XQlwtvu1wWfCwNc9oBW0VSKt8GAC9GBVHP6sVvITP4b60sz64W19yYI2zVBBwBF0F9zwk
	Fx8ngVyirEmrEWOFVriM/WjOW6GWC2vPkncRY=
X-Received: by 2002:a05:600c:c178:b0:477:a977:b8c5 with SMTP id 5b1f17b1804b1-4801e34cd0emr310178635e9.31.1769071406453;
        Thu, 22 Jan 2026 00:43:26 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804252b02dsm47163605e9.5.2026.01.22.00.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 00:43:26 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-soupsieve: Upgrade 2.8.2 -> 2.8.3
Date: Thu, 22 Jan 2026 10:43:21 +0200
Message-ID: <20260122084323.1892117-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 08:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123730

Upgrade to release 2.8.3:

- FIX: Fix inefficient attribute pattern.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-soupsieve_2.8.2.bb => python3-soupsieve_2.8.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.8.2.bb => python3-soupsieve_2.8.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.8.2.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.8.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.8.2.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.8.3.bb
index 63b5d3b2e7..11a2b5e103 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.8.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "78a66b0fdee2ab40b7199dc3e747ee6c6e231899feeaae0b9b98a353afd48fd8"
+SRC_URI[sha256sum] = "3267f1eeea4251fb42728b6dfb746edc9acaffc4a45b27e19450b676586e8349"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3


