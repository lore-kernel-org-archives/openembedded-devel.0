Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B5AEA8544
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 19:11:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46470.1772997090490356460
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 12:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OVFH3fhe;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso17765795e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 12:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772997089; x=1773601889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DIEZMWQvr+R3bP+AFJK7CNP3Ptp1NEIduF7ezo0uy/A=;
        b=OVFH3fhewzPo4PZZ8TW6bcGtg6CfRyO+MGkUVftBKdeh6qNBLIyLgxrdt5ekoo09NO
         HpBPOsgQeVs0tWHfWz4cKhn42PIsuSnkAjlDM/6eA/n9L6e6hS47eBSK48iMx9whhJJb
         X/Xx2jr3Vwx7ozFZ2kcUZ4I5LHNexoEG8o21/LIIKbuyVmJ20r8QsTdkd+LBr2CtOY6T
         oPxO/gXvyKTW6hcDFZBP0AUeCwXDZSrn1YBlk2SoBby+uyiZO2Rc8NQdyKdCFMTXOwlu
         oQLWCNTJbtWxZ+iiBnnctCP7OGO1/Kl6pVpgQfoq4z5fLn6fv6C9klGhMzd4mPPVGFIK
         OxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772997089; x=1773601889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIEZMWQvr+R3bP+AFJK7CNP3Ptp1NEIduF7ezo0uy/A=;
        b=CXcg/CwQIacrHesXiKwEjBK9Ok5jS9ja750pqyYjGg5RkAlO1cTA6ZFASad4+hTEmv
         WI0A8X46EqjwBYtOO7W3+Mp7MrtFucQ7Rq5TGKlzz0YjUCedBtsbBv3jjegrfi6+gIR8
         mXTN1dVa5v7BTjeV8jSaXSi5YBPdPZJwqU050tj7wn3CONOq5SMzPOAcghukwPcIFrAW
         N2fiuRYV+Vp95Umx59R0n+YfhVt01y46uTa5yf++G26CrEh3zCWryXSxXFSuSlXT5556
         QIHQMNJkoup9mAZ10L2iYeYcb+wujZmUo7PVzmWF2J7kgjtaXFyDdsdheMGETMaUk+FD
         o/Eg==
X-Gm-Message-State: AOJu0YysYOqAmSRcINeQAhNoXYhL2sEX/JNQwJF0wimNC3dBNh7vMo0M
	LYhk0anfLUlUbQHqNiJxh6hvzuhcjU+H8Qk3bmKOhi1BMtd9++R+a/1mgP444w==
X-Gm-Gg: ATEYQzw2J4CiRa8R07A5qAlJDUDCJkMn3Jx3HhJSdbk73bXU02GO6VecVplP5c44wBy
	u+gtgeMqZ6bfZPaxnI7fYzdsuc0pfW+OXcKRItouK0YMDUy0xqrTRq7N4v4R5WGxTTOMri2uctY
	nDuyn8+AX6tDm0PrT2oPrR+AetUV+vR8S3X0fnBJ7Zv90AC9Pe+1h5z4/TFVcalKiWgTI8iJCkJ
	REMJTo6F8djXMKWWE4vx0yRMAbHx8gqBGu3WWlkl+1mKQrni2RPMDkDiIu/WLclHC2evOLzafse
	9xkJ25EKoGLYCCNQ420P89gDVNSjh9oJhKhQp+a+5U/DikX9IJ5xlGOXVt4UYlFhdzPc8NNoboZ
	0FDKMl7LIx3iAH0LokcmWhY67RHhAg4dsrBk5CI0AObLkRfVUCzvOFL3BwmgVONepmC6WQNVCTC
	KXFdkPW0+7xQaZ8y2a9qQO
X-Received: by 2002:a05:600c:4ecd:b0:485:3c2d:d02b with SMTP id 5b1f17b1804b1-4853c2dd2e5mr5593785e9.22.1772997088783;
        Sun, 08 Mar 2026 12:11:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8da01sm21336727f8f.1.2026.03.08.12.11.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 12:11:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] redis: remove unneeded CVE_STATUS tags
Date: Sun,  8 Mar 2026 20:11:27 +0100
Message-ID: <20260308191127.28671-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 19:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124949

These CVEs were ignored because they were tracked by NVD using
incorrect version information. Since then this information seems
to be reflected correctly, it is not needed to ignore them explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_8.0.6.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-oe/recipes-extended/redis/redis_8.0.6.bb b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
index 6787f42350..9a947c075d 100644
--- a/meta-oe/recipes-extended/redis/redis_8.0.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
@@ -20,12 +20,7 @@ SRC_URI[sha256sum] = "6d0a9913887a4972536f9da226f1575859c34d86354129163260a5f9c6
 
 RPROVIDES:${PN} = "virtual-redis"
 
-CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
-CVE_STATUS[CVE-2025-27151] = "cpe-incorrect: the used version already contains the fix"
 CVE_STATUS[CVE-2025-46686] = "disputed: upstream rejected because mitigating it would affect other functionality"
-CVE_STATUS[CVE-2025-46817] = "cpe-incorrect: the used version already contains the fix"
-CVE_STATUS[CVE-2025-46818] = "cpe-incorrect: the used version already contains the fix"
-CVE_STATUS[CVE-2025-46819] = "cpe-incorrect: the used version already contains the fix"
 
 inherit pkgconfig update-rc.d systemd useradd
 

