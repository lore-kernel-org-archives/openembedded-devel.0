Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D29C5478C
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 20:58:40 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.24569.1708635510706133263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 12:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cR9O6YEi;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5e42b4bbfa4so101264a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 12:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708635510; x=1709240310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dbo6cZQVD80HGALMspiiivf2x98Bo3GmP6va6ei1eVk=;
        b=cR9O6YEiTVVwIrLNWmkbvZ+vk7hgglZGDZXRXkVFkMqt5hx8DfgkCmRyHa+WoDrV/8
         ap89h8XMudkZ44U/3fuWcAogfDCMDCxAT7amauBCVtV31M0xN6rFDRSHEc0KIgCkwg8D
         SIt4GF7RmYjlIUV/Gkw0zZlHjhev/uPV5n1q4GQJdBQcR1RAqoU5mTcXBXUjXrXHGEKI
         e69EUsKvorY9pOOHpkBDLk//Ycsg+wZzTV1ZpFcOAK/PWViWoxYSnn4L+OnzXoa7l2CZ
         TkRwl/b2DT1kxIZaKyTxfuRJ2bybwvsCnzSn4y1T2bDy8V/oWp227uEDXgPyFyaxaIYT
         HKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708635510; x=1709240310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dbo6cZQVD80HGALMspiiivf2x98Bo3GmP6va6ei1eVk=;
        b=NC45M712adwN3aqtUP38JbgDZyZPUUMgh/jWGg3NTMMmHnnnL2en1Y7rHjpyWPS2Gz
         Hv3QeYEpAUv3XFCCbbA689ZJIBKGJ+fF74/XKDxgukQRjdlQZBIUMsLS7R+2xtjBYODG
         st9Ov+wwME3QN0qmU80R/AvdFEfiDkMdzgZHrvJtRxpeXhqN8QkewV18YvAAayllCGUF
         S3xv9ymRH2P/HxZ3+0J5k0UepuNuMPJISdZ2jxmsfO+FuASg2OzD2zEPvBHR7TrkIQ6u
         17+jmUO2WIW79ft8/qnq4XO1qovF7kWtQ0peRYzZ5a4iU30Sl+dTgbpQYJm2GgaFLUnn
         2qpQ==
X-Gm-Message-State: AOJu0YwT24ft1zvulJznLdA0a3IKlPxYH2hPzF98nwEgGG3PQ0Jv9rJH
	s/XWBWyhKph9pXscMGQ3h97q37B/kAxosEJwyk5/ahW9ySp9PZendpVXU4TYpEU=
X-Google-Smtp-Source: AGHT+IFQHV3yHHF0i6RgNA872tUwXtx22vYnCLJnMWgHH9Jtdh4OOZ8anIZaCvBxowbOUO8IRIVhnQ==
X-Received: by 2002:a05:6a21:e85:b0:19e:9bcb:9344 with SMTP id ma5-20020a056a210e8500b0019e9bcb9344mr23400128pzb.53.1708635509615;
        Thu, 22 Feb 2024 12:58:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7619])
        by smtp.gmail.com with ESMTPSA id y5-20020a62ce05000000b006e2dde36edesm11444010pfg.120.2024.02.22.12.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 12:58:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 1/4] fuse3: Add missing runtime deps for ptests
Date: Thu, 22 Feb 2024 12:58:24 -0800
Message-ID: <20240222205827.2813212-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 20:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108994

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
index 5e532ba7ed..321851da5c 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
@@ -29,8 +29,10 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-        python3-pytest \
-	bash \
+    python3-pytest \
+    python3-looseversion \
+    kernel-module-cuse \
+    bash \
 "
 
 do_install_ptest() {
-- 
2.43.2


