Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736C6CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:07:10 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.724.1778648714938161614
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 22:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GtPRa1ai;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so3427277a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 22:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778648714; x=1779253514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXWEPdMXIKrI+3EX58k2FLXzDEkjzOYpnqF+XVpnlEk=;
        b=GtPRa1aiF+2WhLpPfjTh0B6KVSk/ikEOYfkiH1NdFOyg1F9rlbcrDsVq5YBM00pyVQ
         Nsq99s7m7ETApZ9hxLakUdZcpCJeSE2DFuyTQpzG66x5O/SBwp6W/sMJaVSLzLCA3iZK
         HBtDQkqMHVE2N2HHXvjZH2IldrmiK39WxZuvl1ex3ur8r2KzosAxPvyQ4jLUPcM4DAC/
         VS5CyBaNFwQwkNimu9wPrV2ZjdwPm6l2l/tDM3C9+/O8m1FushfaqzdhL8gcI0Uzasb+
         E8ZKMi9HpX4XuNkGmv10EzJ6AUlVGi9BApRPsfkyFL3wrNrxW5rcO+MQ6KYITjrTCyWX
         2OTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648714; x=1779253514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SXWEPdMXIKrI+3EX58k2FLXzDEkjzOYpnqF+XVpnlEk=;
        b=AS7yAhg5UUUpkz40FS/7VYrUqBdFvxZ1mt17KgjC8QIvi6uPVtAaoHcE28kBwGbzn8
         pX3xXVWzeOCJpUB2/pmkRKdD8yRBL2FARrRqjpYaINjyoYWPUD7X7nE2nnTZi8ZzUEjZ
         AaD6neS4dzdwu8vJs2His1L4a0ZQzFXxvT0Jbl8RkGvCNlFQDRRHST0HYDFXBWfNPO3t
         xI0DjrIuVujPem6XDleMAprC7yaAaB1rH57bH3FAYydEMk0vk1JzrIWLsZOUEWYpD0K4
         z8q8G77LllK5n68fTCK0+as7b9isXpSWqazu28wqc8v2Lus8GbBxH8Qm59BsqkDSYT6O
         P3Iw==
X-Gm-Message-State: AOJu0YwNlm3J9obr/V9F2gt7EuEBLJ7g+q+TksXrl7OGrWNM373TJ/aw
	UhMMJbiXWgUgbhZiYLtnFFO3dIMbQibnGZQuVwjw/J9dzug9QN2gVXb/GNnkaSSP
X-Gm-Gg: Acq92OEu+2THCja9cZR7JM9AKesFkjXPOOQ4ZpPbS0U5l+rBsLx6+qWk/SmQHDEQDVG
	nc9CS5WyBnLhmBt+MqWr9DQ9fu8duQfamPj4JTVT0JT5E4btldN17/LGajSiIrbHmwo4jvHrCX0
	yaRLJk20FHSOYrEALaSUZC+s1X6eKxnvU8IL2vA0C4DA66RCxIX7snNYWTm4osDpgKySD2cFelg
	TlUCe1hNZ3buOzDlp/vQ79wv6N0aCylezq75eexWRgRPAA+YcN7BAu45FaUg+G0UyWDirhPPMFL
	3UG3D2QCO6i7QYw6/UD+EN+DqQqeOk2byZ5AEtRjIanD3okjMcLSlkGa/r/rJ+j3yo+knlxbjTC
	VFngiDds5yXtvm6EovlGQ9eSDzHIAXDVNs/f8khPDVY6Yuc9jrT+CiXnBn/55CDRPLOYp+i3+5p
	bSfmQe6VaX+5Xsu0nfBWxjXpcLIaMnHKf8kXeD
X-Received: by 2002:a17:90b:5590:b0:35f:b288:8e4c with SMTP id 98e67ed59e1d1-368f7990c63mr1254407a91.15.1778648714045;
        Tue, 12 May 2026 22:05:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eddf5c58sm1696900a91.1.2026.05.12.22.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:05:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 8/8] nanomsg: upgrade 1.2.1 -> 1.2.2
Date: Wed, 13 May 2026 17:04:49 +1200
Message-ID: <20260513050450.3515182-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
References: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 05:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126951

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/nanomsg/nanomsg/releases/tag/1.2.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nanomsg/{nanomsg_1.2.1.bb => nanomsg_1.2.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.2.1.bb => nanomsg_1.2.2.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
rename to meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb
index c250ea8779..04cffe8791 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=587b3fd7fd291e418ff4d2b8f3904755"
 SECTION = "libs/networking"
 
 SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master"
-SRCREV = "fc3f684a80151a3319446fc96083a9ff384ee4fe"
+SRCREV = "ccd7f20c1b756f7041598383baffcdc326246db7"
 
 S = "${WORKDIR}/git"
 

