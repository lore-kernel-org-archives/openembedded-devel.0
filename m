Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A68CA6019
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 10:05:24 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4452.1791540314999050797
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=l2voTRZV;
 spf=pass (domain: konsulko.com, ip: 209.85.218.43, mailfrom: scott.murray@konsulko.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso849839066b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 03:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791540313; x=1792145113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VkLE+5Y5fdo4oE4aHAWx5DcpfuQjf4dQbWSRyi0DLG0=;
        b=l2voTRZVkU8EGpGyoY+pnGTmUsp+OF/qyn664YQGVgnkBFa3uosZ0fXWZm3N7n8jLo
         yZB68CnPDVZUhY+6HXE2NA2xXiv6+vk4PknYg7jpCs36CgBLEk4xIWvPKLDabb93irE8
         W9ulyfFPX/WbPt9rnO4Ivv7l0Z395lZotkyeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540313; x=1792145113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VkLE+5Y5fdo4oE4aHAWx5DcpfuQjf4dQbWSRyi0DLG0=;
        b=HHGXVp9D5G6s2IbeS9krHr9KtC4J9noXQSzLJ4x0Ko0hIol97IAPPGAO8GVZF7eDYl
         57CtqesBuu1Ht4ZkDrDGTS9JtybLeUd8xyBVKYuhIqGpncX7m1Bu1dTxv4CUULZQAdDf
         7R7oL49oGqxwV8CJkkv9Q9cW/rqlHGtnUnQI/j3J+wy7BD9oiFC3GJEJJqusA8OXVLeI
         lZhigL3f/kBcEklbu9xYARoQpocr1ukMEZSlpdN92e+ni3kHXd4BqzUDTySXr1BnSjBm
         U4Zxxul5NIF/EtDpDm7xgK+Tj2ARtfo7cuHNAnfUadZBYZhtBH9cLtC7eKxPHjYMEopI
         JfSg==
X-Gm-Message-State: AFq9FYJq2kivcHoU/5715puxYRIytXq1HcCpxsQl/ZVuN7nv2/utJAiu
	LpCBEBAOuQzNF4cdrMKeBe1ro5PDG8WTVF0fFhcekk5X028cRIM67F0JkZE3q7BnEPmSc/Qs95/
	sbfkHU6vFtw==
X-Gm-Gg: AYBFou0DLxl2WBP++I74QHPdJvCoM1sD7R6pYcfsG+XH99hOagkliojjtfJbzV8FZnh
	yYUzJsQ2m4hqAbf2KWn6NMdUR80WACijouXsB+kZrvoxAiwFTiFoDT47kWpzMirWF8Tdbnc4Wa0
	h6TeB1jVAQk6eZVeVOvEKS4wVpP6SOFVRR+wChpqB2i3WLTvEiC+PAB3q0+sNqDX3pNtfRSgSlN
	4myI7RsSUv4TerIENAbKcQARBQmf6ZRlzFo1z0i0m1HayPp0urf+2iS7QSsqGkYCx7GuCE7Ns4J
	ZWA3Ly8WrOGuM+02B4zhde7TajWR0RX597+w1u+dvE91+PZ/w57iZwLXdjIV+DyQOlkaxOgY+aX
	/O0fXSWpUEjCYZVIMvrCHC2XS8qGDg8XEPNDfE2vKoafi0zxbvmOrinmoYtUNw/ddda+OWrEGFm
	RT9wc6s2rjzLjGbggxX0LWxjEVEjR01KxZHaqxFNvUexht6LEu446DEw9tXpXg9bYLcYFutiJYP
	IF96aTV1xDWF6vOIGKel5cPYNsTQYBMq6/mgJGQ518M5xPB1S5GRA1ySXIrOEzT19tma2uC5Ag=
X-Received: by 2002:a17:907:7f94:b0:c2e:34b7:8899 with SMTP id a640c23a62f3a-c31aa0790f5mr139816666b.30.1791540311293;
        Fri, 09 Oct 2026 03:05:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acf232sm3079996f8f.47.2026.10.09.03.05.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:05:10 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-dateutil: Add PYPI_PACKAGE_SDIST
Date: Fri,  9 Oct 2026 13:04:56 +0300
Message-ID: <2232b4251396c3bced4d71981a119b0482273deb.1791537542.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791537542.git.scott.murray@konsulko.com>
References: <cover.1791537542.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130684

Add PYPI_PACKAGE_SDIST definition to work with pypi.bbclass update.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
index dd3f55edf9..291fef5880 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://0001-drop-the-six-dependency.patch"
 SRC_URI[sha256sum] = "78e73e19c63f5b20ffa567001531680d939dc042bf7850431877645523c66709"
 
 PYPI_PACKAGE = "python-dateutil"
+PYPI_PACKAGE_SDIST = "python-dateutil"
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
-- 
2.47.3


