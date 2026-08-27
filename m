Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E10FC61DBD
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 02:53:54 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28400.1787799229249236221
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 19:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jy9h3E/y;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so1782337b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 19:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787799229; x=1788404029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QnWQnG1VGO2eodi1xZx0m1vQDlv5+6EZBlIVar5cL7g=;
        b=jy9h3E/yrHBwZjfUjE9UxOvfuXYsT0gR3tVR6gFvZEUbPOJ99FAowyTvK74gjTCrPK
         jgI61t5OFgrQPujPZ4paBnFd6ugFwbt0jx8vmsZZ8Q1s+G/W/cAlDwNJEq6Qf0xYtUvK
         s1axfJZzzJLO5hCazancJc1jtOBKMnsX+aKBKEoiBjoo2P8nPp/+BYO+glZysDUuMfIH
         EljPZCyO+VWOIj70tqQwzmylRMKLkH3fiCmPaONGVMod6Tzv4qiQ9HU2gsfsJMM9qEic
         V0bCJO1KrQNLBUcWrpkqYJyv3nuDQx6EGOmFI057pP3svVxloI79E4QYu+2ZrNTzKSxL
         YAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799229; x=1788404029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QnWQnG1VGO2eodi1xZx0m1vQDlv5+6EZBlIVar5cL7g=;
        b=fUAcMHEahcddEXlS0LRiR4oTgaYlpnCEJk2MWvp6hHRM2i9P+GwUZM/bQHHuhRSC0i
         XPh8/baDjqUGIbOnxzzA5oRYhFnh/wl6wVvnNCG5qFM1BIzoS60KokLqWtCmRHFMrqFS
         zlrSwQ0zOhx0KWsl44UhDUEYJGGZF7h6Q773jjKkrtTIRajtytf/BQeCxcoQ4Y+LBJl7
         G+vfmafvgWxo4UQ1OaS6i9J4p5heTmdBom2n7LGCxi+iVEbg62EA9okDhWZV4Mwa7wNP
         gqIfsD4wAS0G4KBSp1xktRMNMvFkKj6urxMOs67wu4MlfSPnxYs70rZkBJeC8RggRDcu
         F/QA==
X-Gm-Message-State: AFuF++k+sVV1vPGKOa26JT9F05qp7IWg3pVDvaL7ctGoKqaALJvTy362
	xUsqeGofHYtYhrXxsgSIw1syRjm/Glp0KzRym31APwqbQQ1TEu92bcxf2lAdPA==
X-Gm-Gg: AR+sD12RhjumwiRUwvujsXj6lX9AyAAW28InuNu8Ngq6bTvGfCNKAr436TFT4jYxPSQ
	PQMLhDyIICPJJAlKgyGIlyNZM/a1cmPPK5YTfX8QvWtYkipxeo3w3Gu8h+UdAxO42md0sRhlaE/
	GAQJRDSQlOTkhIIQ+XGE+7egIz2kTfE7pPZamnLQzzdfmqOvc2dGRNqN2/cdv6/1BPYdXDfeaic
	75MuLmE6ZXYF3VCSS0G+NE7cxOShASfBOmQ6YSqZofddtmfrMTUMPQhDlDY9+tfRlao3M2aGzTZ
	MErrGWUFFFv6+S1go3rgNFTPdzo79vhiyzuhaOoWV/AArEjDHk6heJ45I/81vtkYqYBv/mcVWxr
	LRYt3QDREdmMr0kM+Bd3Irn4AggRYtdAvhzoBYhW9G6y8lyDDJvSOb6s5EHXhgnt2jouJxWq85I
	xluiFNZNTdwUjrzlfdMU6BbIZ6rIokibiqH0/Q8KHfV1zAAQMYv6IxD8lD7pCnWnO26YIsLYdDg
	Fx3qFZpAqU=
X-Received: by 2002:a05:6a00:4f92:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-85371fa599amr20096205b3a.4.1787799228584;
        Wed, 26 Aug 2026 19:53:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8556db7ab0esm5787b3a.48.2026.08.26.19.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:53:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 7/11] aravis: add UPSTREAM_CHECK variables
Date: Thu, 27 Aug 2026 14:53:19 +1200
Message-ID: <20260827025323.1433982-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
References: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 02:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129527

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version aravis
...
INFO: Current version: 0.8.36
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/aravis/aravis_0.8.36.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.36.bb b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.36.bb
index 97883d3d15..0af3b9bad4 100644
--- a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.36.bb
+++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.36.bb
@@ -18,6 +18,9 @@ DEPENDS += "\
 SRC_URI = "https://github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "246deaa0042a387ff1bc00332d0fb80537ce14abde2c28d1a54c91f17adc51bf"
 
+UPSTREAM_CHECK_URI = "https://github.com/AravisProject/aravis/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+
 EXTRA_OEMESON += "-Dtests=false"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'

