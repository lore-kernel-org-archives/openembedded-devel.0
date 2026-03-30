Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F1CFB3D07
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:09 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48197.1774867144933684844
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gaQV1VRv;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35d96be7c13so1262920a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867144; x=1775471944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sq8N28vsFVBk/K1yuqW3MOgISKJIXEijq7rihNP5eNI=;
        b=gaQV1VRvcbU1unmry+cPeyao7HfKJF+M8gaGu6EXe1h+BfnJasPG9A8lOVH7eADy/u
         nGJmDSoppC3SEIEEquGXg10JEMBba6NzPNPkVARDoMb7ZOHrKCe9N7tp9U5gmVgJ35TG
         WBsDm+usWpoesOhrXG1Nebn8Jhe1LehBrVZishkUWONvJ7T2qu8bLn5z1hZWQygSTHqZ
         uvm7gLRYrrg5wK3qYxNUJR+H1la1JrTkwSYL6hN1lSuQ3zGuNZUxIRooBuYV7kw4jbL9
         Rj3HNknhtAgg3ujEmfWaVvsnejooRnn+2xWmIeDrqxVgGTWn8pSeroqrKj/K+NVvgacB
         0scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867144; x=1775471944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq8N28vsFVBk/K1yuqW3MOgISKJIXEijq7rihNP5eNI=;
        b=T7raE+mBhKywvmm4GYtc3+QnDe/db7hpoevtBS8W/V0yLBteM427zhg0Awqe2TzW/0
         3kZWy2e51iDpZO9AAk/ggGloih096DjzJEnBb4Bd0UvClfQvYkalI5zppbwQYZWpGbF6
         V6EHeX8n1dvNh26RSY5J41F8lpdQyF/1T5wh18yzpekBaye4dLywt/d9F1Qozu+RTiGh
         boi1QyXnJ9QfNfeJbe489Iw7tw2KJjrAEntnqS7oTEwIzceeiYc104WcAj494rtxdmcs
         sMqIZmIvwh5meGB2he+8K+UEpYoISLmxlmty2HqksqbS6Lt4gbM9zkTPrbVKqjajhhOR
         mSCw==
X-Gm-Message-State: AOJu0YyC9H5E13YAm2SfwABnuHS2KY1heDLNZNdIHIuHL0w30NFpB0Dc
	e3ACINP4yU4hOz4qcWV+6GxrUrbas6H/KabFKAe+YrIeFjOxLlulVHBBY42X4Q==
X-Gm-Gg: ATEYQzxI4bJigVT6XLS3WZ6vtRrYMaNP1kI3Un9Hp+xE+WI/Y7vs4blSM5VKktWPhOX
	ANmIhMeJIsBpnMEJ83XYI2fr9ngp1rGMw7RlJ8dTGmhT1pQMYxLges53zcyhwchXYCnm7dzV3Iz
	M0hov4/5hBIcVtZluEa32dyLYnMOVDjZ5TxAxNUf8SAJ1JNZPuz4dvNNZ3VpI2Y8Npb6MW35JqO
	nZFkUUXMmrsD7y59gaV6bZjfSs5GIVG15Q86lEhM5kfDcUYya4+H+99NxsRusAXiX3NAM1lv9pT
	WZIyGeCPKKGRwTacY0EVCW+1ag9ZbTS5Vi827H5i0jVZ1URXUe8GucwlKXCTkAdiIfK1jTK7pL3
	wElhQM4HL6+vpvhb8Q2zrUu2bzdVPYqmph12oS2pT9444DurJvCAZ2xQODs8C5Rp+KHln27xoQs
	UFeJKT3YR6JiwWWkWUUkRf6DSc6EYaSCSoyn+/kmV2X+JHaQ==
X-Received: by 2002:a17:90b:1e12:b0:35b:a44f:b80 with SMTP id 98e67ed59e1d1-35c30b82dc7mr9161997a91.1.1774867144082;
        Mon, 30 Mar 2026 03:39:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 1/19] iwd: update 3.10 -> 3.11
Date: Mon, 30 Mar 2026 23:38:28 +1300
Message-ID: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125844

From: Markus Volk <f_l_k@t-online.de>

ver 3.11:
	Fix issue with interface registration before acquiring name.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ac9041ed3e3a5205047089676ac32ffddb85b936)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_3.10.bb => iwd_3.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_3.10.bb => iwd_3.11.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.10.bb b/meta-oe/recipes-connectivity/iwd/iwd_3.11.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/iwd/iwd_3.10.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_3.11.bb
index f52472adf8..c4956fb22c 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.10.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.11.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            file://iwd \ 
            "
-SRC_URI[sha256sum] = "640bff22540e1714f71772a83123aff6f810b7eb9d7d6df1e10fb2695beb5115"
+SRC_URI[sha256sum] = "85730e79de05978e26e44b958fd11e2ebb45424ca181f8db7a8daf25fc2226ea"
 
 inherit autotools manpages pkgconfig python3native systemd update-rc.d
 

