Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD26DCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:14 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47653.1790553789360666759
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NCQWP/ov;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334e72so9221385ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553789; x=1791158589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6UmUMcYg4U+El9BF+cyz72fFaIR2U5rLQeTuqMFl680=;
        b=NCQWP/ovyqT03GkF+GoYtBN9E1s5DXbGGBCIhP8NcXe7MmOQkYL/3rnBxv60q6iRNA
         4wh/y61E42rrkFN378CqjfKIetwLbT5APsIOQC9t/vLtn8AQVqrcCNn+bEX6l7HFD8IU
         10Pb+UkIoc98LHxuu39czWGZueSraxALriZur7/iaDHRS2RSr3cWViyj0AYPbD25pKtq
         iyPGkUbKT3Vc1qbfv2H5EOTwq1S9VaY6hwCtd90+rLjdJJMy3kL5O58FGlBWcjRrHbVZ
         lmZVEjyf9KqGsQ6CxnjT9pBn+hXzWjKudiCqL5vt3oMZWRUE4usb11JzhjpuMnPrCdzo
         EGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553789; x=1791158589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UmUMcYg4U+El9BF+cyz72fFaIR2U5rLQeTuqMFl680=;
        b=1hliY1dC8Gt/z9Xj/X5Z7R4N9f6CUi0gUjPRvxEDi5P9zPj8TK4gqar28JEKLwWrJ6
         nO//pf/vvjdsJUThuU5hk/Nbvoj1n0nSJ/bLIdI9EqgVowq2+qz0n7mvcz0KiOQJB8w6
         qUix/FR5hXSYrjwf/oWyCKRVcTfRVsvki0b9ZD3PnPFlvubdza5xu70mXn/1oYAYTVHH
         Rl5Mv2M1mF/qM3LOzfuP3hO0MQ62VadAPR2octaCLBJaMy/zfC0hdVExO93gXiQCESgC
         5FI0zuoRaGsXXqoYdFCen4GC7sVvaA8bSSR7eZa9ofsdEfjLQlEisaRmIz7feuTRx/0p
         4RLA==
X-Gm-Message-State: AFq9FYLUM3R2l1sKnvWKS+nEKjHJ9ITYmVLmEbC8sFcDXfkV6RoCtRYb
	NCsHT3U/Wjg+wdjWTVf7RcDcsdvo2UdJWKIPoz2c4zL625t4aFX5+ZIyi8vBrg==
X-Gm-Gg: AYBFou1Wd0O/YcmrZLWQYpwmqC16eWG/crM4bDl1ypJsHEQy2mNLn5fOX7HDSchcUud
	VNgW8gURIqDOSiiv7kj4SNTZqhoDrA72NF41VWhHTHezsI39HCWsyptzXSU5leC9bEWa0iFR4x/
	eqGv9gsq+yF1WMa6xL0EwGqBf5UVgIcyVUE87bLbRcODsulUSGtAwzGcvalyO9NN1/I9C/TZB+H
	6CzG/k3oh6Lv+kVFupO0sujr3oKefQnOhBCWc3XE8erOXrkBWQngXZvd9y31PuN9TCq2yobczxo
	mldKH0zVCV8yYfB2esaPhJ264nJDn4/tCUfxjP1BRP27Rz2yZVDvnVzAjaEGYaz4VzvixaqBwR1
	nwv01mqI2Z13YNqU1+EpoiX8ybeCpmCwISzLelm/iw3j81HPFXNKg798F5npxV21cjn8sJv8mo8
	Sb1Vzbct4hJ+R7umXtcO15bSOSdXVmruzUpb9M2/QH/y8KKaD3tx1v7FxSn0XXcKrwZ4jFtpGB2
	uAXMDjRZDIQ//46nAhWEr0=
X-Received: by 2002:a17:902:d582:b0:2dd:c100:7cbe with SMTP id d9443c01a7336-2df7dc5b18fmr85436165ad.58.1790553788631;
        Sun, 27 Sep 2026 17:03:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 1/30] swagger-ui: upgrade 5.32.14 -> 5.33.0
Date: Mon, 28 Sep 2026 13:02:33 +1300
Message-ID: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130388

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.15
https://github.com/swagger-api/swagger-ui/releases/tag/v5.33.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.32.14.bb => swagger-ui_5.33.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.14.bb => swagger-ui_5.33.0.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.0.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.0.bb
index 5bb5a66021..45a3bb6d17 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.14.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "6e8ce248db64190e4113676aba996943c56f2491"
+SRCREV = "cfd4a6c3cbaeeb7c13a8bada7c754de42d78cd5b"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

