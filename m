Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692A7C30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 06:56:54 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.44754.1719989813594438944
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jul 2024 23:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RsFIfDjx;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7180e5f735bso202264a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jul 2024 23:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719989813; x=1720594613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p0Y1F6zRpH2X3y2tXlAj3DX39Ho+EpVaGIL94a0GhyA=;
        b=RsFIfDjxQjidI1WuGGkhkheeWoY6Ne6idrD0nJosEbZQHKcxU73QT0m3LpSOkrQVa7
         pzjTkj2S5wt8jtvYY40UlIDBot85ma0+LcKSIbTNOGt+p6Pzr1HGqriaIssKBKgcUSsv
         bSkEFCFyNgbBw+gf3zW92RmufGyDIn6TklJ9M3M3jwVDQnxnqd/z2ojIaKXXZVjsMjHu
         3CAGaiNAYcAfEw5roceUfelL1rvBDn6FxHIdHwj5l37IpGeXDjkhqYnvbw71EuBl5vqF
         I0bhitGFp5NS60+skOutYmZqZJQJLKNCUolLqsw8oo41EcGsNkEB7lmwjz5diAMaxbFT
         XFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719989813; x=1720594613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0Y1F6zRpH2X3y2tXlAj3DX39Ho+EpVaGIL94a0GhyA=;
        b=RxfCJ04CtBqu2x5gytWTJNODY3AKYLtFy67PzGjJ003zv+RzxRXi7VotM/lOpMafQk
         Y8hUaRZghOW+tgjATbkUxUdJejbFFVNJTRxLAWhivLHhFUphPlHM1n+Y8jGqa+kL8F3p
         fjy4+2nSpTUs+G3XmWBYGrBeCxM6u/IiMmxekQToCMHB28lXvwAXmVYFRgdLMoXM341B
         OFzLOlpLs8ZF36Y8zwd1/3ZA01h8YkIKuVLL4xM3Cj+cn4SvJfteWBzFE5YpwLiAbN9B
         bdlNyEZeD02Zj/rbDcuH0oj1xWEgoPa0blAHy4Rl3SDIB/xzqTQhIHGDqTgUw60I0ccv
         C1pA==
X-Gm-Message-State: AOJu0Ywdzt28OVrlWuctLTPQd5Z0ojuD0Hjv/hnDEI6YSf+/ljwWkxOU
	q6Vs/WsHem4VjGffnqutJQqBEbXLxSSqFVC0XD9Ex3gOU5hcwjmLS44hJQ==
X-Google-Smtp-Source: AGHT+IGWZtnt6QNuO1HUGGycBPFADFLR7ZhZ11yboUKRY56q4iLk3u3v/xkD3aiHlgla/eX8gz/TvQ==
X-Received: by 2002:a05:6a21:9989:b0:1be:3546:4a92 with SMTP id adf61e73a8af0-1c0bfebaea1mr1547171637.9.1719989812527;
        Tue, 02 Jul 2024 23:56:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080205c688sm9657420b3a.5.2024.07.02.23.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 23:56:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] renderdoc: Upgrade to 1.33
Date: Tue,  2 Jul 2024 23:56:48 -0700
Message-ID: <20240703065649.3135944-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 06:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111219

License-Update: Updated copyright years.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../renderdoc/{renderdoc_1.27.bb => renderdoc_1.33.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/renderdoc/{renderdoc_1.27.bb => renderdoc_1.33.bb} (88%)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.33.bb
similarity index 88%
rename from meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
rename to meta-oe/recipes-graphics/renderdoc/renderdoc_1.33.bb
index 58f2275736..e6b59cfae2 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.33.bb
@@ -2,9 +2,9 @@ SUMMARY = "RenderDoc recipe providing renderdoccmd"
 DESCRIPTION = "RenderDoc is a frame-capture based graphics debugger"
 HOMEPAGE = "https://github.com/baldurk/renderdoc"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=36d34a46cb71546195d2b0c626a52e5d"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5536c2b72eeed14bafaf4d2a6c032b87"
 
-SRCREV = "35b13a8e8fd2a331854dba6da81a20452e142d6f"
+SRCREV = "cae289323847ce0a84a0deca4958183567eee17e"
 SRC_URI = " \
     git://github.com/baldurk/${BPN}.git;protocol=https;branch=v1.x \
 "

