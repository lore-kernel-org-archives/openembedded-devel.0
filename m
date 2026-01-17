Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC409C98323
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 11:48:19 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6902.1768650498773263369
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 03:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ws01KOwu;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso24214285e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 03:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768650497; x=1769255297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tMsQhneWKLC1ip57UAFao6iLyrNHoXRHpvIklrFtxhk=;
        b=Ws01KOwu/NnR59yDeeRsFG3lkPHI5FN0Pca1iXSW0DfwHdI3Q+ZzZpzqAHMJfCAlXq
         ZNpwOgT+PV1waM3Hz7bmuqvRmrSXpqH6FwfkdIWijckwU8CdSxiUMiG8QMV7CNzBXS50
         Ts01/+hooHpj65NSiyCrCfPUHIuB/2NOLlhfWO8uKLKjRcaoHyYy7/7KOihq9n2NBCgr
         tVbKT/JzY68an09BvuWDOrCUq6y/zhZEFwZaX3sxL/iL+zBJC/R0WE0n6ok8zIvkm8js
         nAn5w+sEs+YWy/Rj2FhuLGtsLBT29fjrGVOae/CRtrGGslE59rA6mPwv4rPxJALt8dmr
         ndSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768650497; x=1769255297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMsQhneWKLC1ip57UAFao6iLyrNHoXRHpvIklrFtxhk=;
        b=mpuZxlHnH35Keqt4Lpl9HoVQtpUzxod76UwdhV208kodse8b9e8lBU9/aK2gIs7hyf
         nyd3iayODXoz3vJ0+KdltTiIByfp/nEBQIFQd9cF1Y0zBEiX0VCiaAB93jcKB2da6CFb
         7MuuXji9ca/9j/J1B4Td1sk6vhsaX7dD8dVbrBqyTGS9xQmifel+19f3SVSiIWNavxB9
         1WrHssSHGloCwbULGUHrU5DhW8aIMj2RPAez7nrTm1l/uaOwQgdQsByO1bjzuVo7388K
         IjkiWSjcHQEhNfkW4UgI+61t0lcaz1frZiJgPlPmaxEXihZ0X2yDSIZBDyewTfFpnrfW
         pDHQ==
X-Gm-Message-State: AOJu0Ywgu66MY2z6DG5RPcwenct+qdrly2Ab7Wya+xE5tPOOmVNmzs9k
	b7mDxg4fsQU3QVEYMZ2A8YsO92e8RmKlJ1miqJRPDmt4cUyXypCqRprMCFbCRw==
X-Gm-Gg: AY/fxX5h3sx435OH5G2cOj/cZXabVbR4Mo9WyR18c3FuFImMuyuGlSmzS/goEtECPtz
	W7B4+sHRNkZElja21l5pdfvozcJEtgtoYCtX8kZkDIK4iIEAZ8GTYWxw/wigiPL0pCytKc1EIlY
	JJlNeMzZ/STovqQcks8cVr6j7DttYF7gIu1Ei+aGhsiHY6RDu6Dw2flwtQLbpmgvzwwmAA0sUGQ
	tgoaKfoWcvrIYm256HVCuDdNn3tfypsVy3RfyfYW1pfotc6s+SG+pGR/y/aeF3KSptn6pCsP6wa
	nEAHuFCQeL2a1Fp39J1gi+nZ0OPUGhuCQ51ivvpAie8NMNgvYRGNObaYKTo622Sals013XX7dES
	H+7WRNEZbdyKRlAR3UKn9bmlw1liqWjyEGOjMvFT9gY+L5KU3j95cZGLQ9oEpN1lkMGkXj93kxo
	EZZg5xhSgPdz2llTVuWEA=
X-Received: by 2002:a05:600c:1f12:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-4801e2f9110mr63112775e9.3.1768650496838;
        Sat, 17 Jan 2026 03:48:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e886829sm89717245e9.8.2026.01.17.03.48.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 03:48:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 1/4] python3-croniter: upgrade 1.3.4 -> 1.3.5
Date: Sat, 17 Jan 2026 12:48:12 +0100
Message-ID: <20260117114815.782230-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 11:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123553

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 94f564fc96e8754d11fe9932dd4c44076592ed1c)

Changelog:
Add Python 3.10 support.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-croniter_1.3.4.bb => python3-croniter_1.3.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.3.4.bb => python3-croniter_1.3.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.3.4.bb b/meta-python/recipes-devtools/python/python3-croniter_1.3.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.3.4.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.3.5.bb
index 4158dbe7c4..92962c0f45 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.3.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "3169365916834be654c2cac57ea14d710e742f8eb8a5fce804f6ce548da80bf2"
+SRC_URI[sha256sum] = "7592fc0e8a00d82af98dfa2768b75983b6fb4c2adc8f6d0d7c931a715b7cefee"
 
 inherit pypi setuptools3
 

