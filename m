Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B00AC27C53
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 04:44:55 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.91836.1719031488781285051
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jun 2024 21:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JicQcaCm;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7178727da84so758369a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 21:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719031488; x=1719636288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4PYm7YXGcBpkRwO26fXuCK9Efz+QEWoeH5CdXw2CfoM=;
        b=JicQcaCmPls4MqE4AAA4KLMrTPt3OYU8bBmDEjO2PA/ZUqr1jDAkN+k2BeFxfa05Fa
         llTu6bygotZ47bNjZG3Q1dnfTNNdt63NfojUqufC5B5eUgL35IU6Qdsv9rbXBhY0anGz
         /X42m75baXMsjRQDEAgPivCoKYSvnP4k5z6Hf9FaDdE/ypE1Tntn1SwBQtPzPWvVKgVW
         u8e/5J9Oa077uPRRxrd0fczgqYciE+jKTllAzlbQc6TQshL7gsPqQUYTFXCnmbU796Tw
         n0PaaHMC3OBarTb6lHP4BN29TC0Ut0/KusvRHqkPRx+tdjW68g204lyNzE4GDiGutnqG
         qsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719031488; x=1719636288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PYm7YXGcBpkRwO26fXuCK9Efz+QEWoeH5CdXw2CfoM=;
        b=rU0mP88fXC5hWM2jhHyQDLTuk7mrpmBpA0WncYgiaOvvalXY6BFCgXnglk7ihMMfJd
         7w/KfOlDGfdTYjDnlg0Hi79vqvxKfKN2UzbuQ7jmbiqujNTOCpI4wSBnE8llvS+NdarL
         LHOkmmCiHyUFgx6LvDeZlJGOC+vobm7LoVhNInk1v9jyLOe0OAnkm/tfDMmUq7QXBN7U
         mOZM6irOxOZdk3tq13JaAQGWuKpl35CbFhZDUMAE20ltnVGONKWyIhrEOCc+4fJa/WBX
         LzqGJCNiruBsUzRv+/hNyYzTY8uwDNA5BZhY8eXTvwEAH609YXkVfz0Mik8TtvOpny0S
         E5Uw==
X-Gm-Message-State: AOJu0YxaQNghSgX2sKxgv0N4YncBcMXJf3UStuJXzxI7P9GAbpNcMJ6F
	HO2AQZvUk2YGYgwidOnqQJhWlIaK6s6ChSLujAK+wsiOMM76Cbhk9BJD2A==
X-Google-Smtp-Source: AGHT+IE+hHaXVmF+8KTbr5P57sUD/CXUcw4xLeoZVj32chi976oo5eXANYwRG4bq0D0qmdXNNCEERA==
X-Received: by 2002:a05:6a20:3141:b0:1b2:b816:72e7 with SMTP id adf61e73a8af0-1bcee98a867mr139564637.58.1719031487877;
        Fri, 21 Jun 2024 21:44:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c738c1b741sm5965002a91.1.2024.06.21.21.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 21:44:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-tornado: Switch to python_setuptools_build_meta
Date: Fri, 21 Jun 2024 21:44:45 -0700
Message-ID: <20240622044445.2788531-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jun 2024 04:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110994

Support has been there for few years now [1]

[1] https://github.com/tornadoweb/tornado/commit/e71fb6e616e08838df55dddb494c96a80454f812

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
index 30b50f24f9..b8f6752f28 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI[sha256sum] = "92d3ab53183d8c50f8204a51e6f91d18a15d5ef261e84d452800d4ff6fc504e9"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 # Requires _compression which is currently located in misc
 RDEPENDS:${PN} += " \

