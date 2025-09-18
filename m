Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE7FCAC5A8
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 09:53:41 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.10158.1758189215709014887
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 02:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TC9ETyP7;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62598fcf41aso1064113a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758189214; x=1758794014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NT+d9+BJlRcFkfGUI0lhwSRqjS2ljmbj4XmR3v/AXUk=;
        b=TC9ETyP7e9DBlQ1wFsnpfwNNvlJ1Y0ybP2J9qM+Y6zo5rH0vMgDGB2Mj3aDV/gEnmP
         tzykHU+xjlW4UpqCbGpWBwIZyZQPJ9mjlFRaphyDLkU2f6G1DBdY7SFdQBniKV2+49YR
         pToD93O+MeJeaxsycFXSm0nD8x9lVGIYpvJilhdUsjrbIzKeZEgW0xOJCjDLMYPY9MjM
         ohhiMzXKo6WFeD7STZyg6EG2xvYUJfGWD/hwX2nmRmnRvdyGADwKitfLEuKudpl+rHh+
         uD0KISURBB5Ys9upaGwZXFxSRNIfDU/XgEoOOZRVa1NLVUB30effm3cNrSDHXKBuXdWN
         oRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189214; x=1758794014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NT+d9+BJlRcFkfGUI0lhwSRqjS2ljmbj4XmR3v/AXUk=;
        b=UkeF4wL82+/EyXs74w2hyAet3xIh5OQULVNPTEhpz82qiyUdYOtvfJXEBL5qMjY7yg
         NMPU/1n/M5ov7Dp+fVXRdhYhd42WvqmRYkvjOtphgIadBUAVPJ3DoDRmIwZCujgLd1ge
         8mtmA0NX1c2r2Fl9afhqDwgHQQNos7552lbV7W5wAyoBnKxK8q0st6l2y1Ibyt8GxhRQ
         2llsLFuKW5bSa3zY698BHgnZmlXLKG+SansyRxBkN+XtQf30+ptAdvseZ33G/35UCFV6
         rcewo407OeCp6nm/SWbyjkCaOqDTh8NvRJll+etWcAWUZMsV+TvUIbEk3zdIe+EOlapo
         5ctQ==
X-Gm-Message-State: AOJu0YzeO1P2UeZtnaXV7fwIxIbUrLiW3b2r48ydXDFSHWqpe75Pv4kQ
	VCpRRDU6CWV65+7lJnb/wQwTMs0H+fHkX7/iDPq59nBoxrLutI6e+yeqHhlQhA==
X-Gm-Gg: ASbGncs3f+tS9GzT9ik9egrdNFJmFvLFrzuUn1qWMhRdILE9kfE1kHscn5gO9rSPogr
	lh/ZbqHoK5AN6pQFmYBUC91rAMtABIAg93A09rIFomJb3hgfPQIATtPyFjzQG2bnmrgfNDs6Lpd
	RDpt2lTteXlQqlcBFqeJwBq4PaqTgWBhdbRrevHqWeOpjiuXiXw0UWeE4SfnCpSTg/9voCJAJIA
	KlBQruAthXfqWAxi7tzL7pv7YNL9d7uKRsjL1w+VyeI/EbFY77ZnQHdPAtRs4mw70w9TO/IVsP3
	YlDZ7QbEQqj8Vm4sPXLa37gMG3Knb0OZKODFRLqsQ0cF8wGOOy5yeyj6mbS7e85qSyfh5AUHUgs
	/YCBjTmpNkAPu7YEdDdV/qVKDQ3NcwThwOn0aWMo=
X-Google-Smtp-Source: AGHT+IE8tWlgjB3t+rXCMNk0xPnONHBL0zt4zCkd6cEO/ZHwJhcwZRo50mDBjdnP/KqCgosCaUrgrg==
X-Received: by 2002:a05:6402:5cb:b0:61c:9852:bb9f with SMTP id 4fb4d7f45d1cf-62f83a0cca7mr5398800a12.1.1758189213804;
        Thu, 18 Sep 2025 02:53:33 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d1a89esm1168184a12.16.2025.09.18.02.53.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:53:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 01/10] bats: use baselib
Date: Thu, 18 Sep 2025 11:53:23 +0200
Message-ID: <20250918095332.3369767-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 09:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119542

From: Joe Slater <joe.slater@windriver.com>

Use sed to change scripts to reference ${baselib}.  The
former set of scripts modified was incomplete.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1cc72c41af0c6a55a10be9158a2f856b02a56282)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-test/bats/bats_1.6.1.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-test/bats/bats_1.6.1.bb b/meta-oe/recipes-test/bats/bats_1.6.1.bb
index 3dcb51972d..3f0f575c72 100644
--- a/meta-oe/recipes-test/bats/bats_1.6.1.bb
+++ b/meta-oe/recipes-test/bats/bats_1.6.1.bb
@@ -15,11 +15,12 @@ SRCREV = "1977254c2a7faa2e0af17355856f91dc471d1daa"
 
 S = "${WORKDIR}/git"
 
+# Numerous scripts assume ${baselib} == lib, which is not true.
+#
 do_configure:prepend() {
-	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats
-	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats-exec-file
-	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats-exec-test
-	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats-format-pretty
+	for f in ${S}/libexec/bats-core/* ${S}/lib/bats-core/* ; do
+		sed -i 's:\$BATS_ROOT/lib/:\$BATS_ROOT/${baselib}/:g' $f
+	done
 }
 
 do_install() {

