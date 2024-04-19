Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04DCC4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 21:28:42 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.5202.1713562118292051176
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Apr 2024 14:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QNSZGswL;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6eddff25e4eso2144820b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 14:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713562117; x=1714166917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5y68XpjuO0InRz+tu2myr4IOQnU1rIglP5uHsQtt/LY=;
        b=QNSZGswL7v5CGY3rNwYWBnbZJZdBCRCx2qr6xZ18zn8kUCZRYtz8GsDP6fgMvUHuyM
         nXdtPLP4NAE+5kUMzuDMJcI/CZATt0Z/ZOIeyNyIMiCBB3ZPzK16aTDsB+dsUVi21u30
         4sdNhSTRAje8F0MUAVN34alg0xRRLHougFvWlo0R8SqJqDDRctBn5njQHxpsNELrKPy1
         gzqygZdWNYUxbN5WNpyt9L0kzHAHzLELvuKKFHVaJG4/0V+xWnPoBGE0Gzfsj2q+cJai
         RCjwZ/qrvtY0LYKhGpVgXFC1E9J7lK6Ivwvp/7IJGIutAWQKSMTAgBDOvsN3S3zsgZkM
         /56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713562117; x=1714166917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5y68XpjuO0InRz+tu2myr4IOQnU1rIglP5uHsQtt/LY=;
        b=eSpvF/QyUFeaKDWEjzvDauEAcJ7bBBQFtHwjto8cQNrucgibLFkoWJWEZzsurAmXf7
         0vKiQRhSsfijwYJzeJyXgt7mFQ7EHWk3joi5jUVx6fSsaJEe2hh34TpKbVlg/I4GXr9i
         i320TXoMWScpPtWyEgfhdn2vsoQdcjL+aVsJS0rAefQ2B/zpxTiwbNPpARpebbWuejwV
         +OB/icY65fVHfWc0vvSXZccigzbXT+GIuLyNxBX8rdNMjhDw8fecjh/wtFE7Be8JOBYY
         vf5IOBjg7HsT2ur6e7ZmfUryCnRDNNfN43uWnK/R3VZOE0WgTDBwNr6uYwkYDbxZ2d/u
         Avig==
X-Gm-Message-State: AOJu0Yx1LiL96aH+J0t39A1QmJQf9kiZ+tVopouvrvBH83cYYaacCxnx
	6wZZ4u9HltzDCAGJQL4daFuGDCKxiNJsnEJTgtIQUBKxQ8bZBPg2QHLpqb0g
X-Google-Smtp-Source: AGHT+IEa/EM+RieflSvt1ZGlW8sn/kMiYkvOSsTilEMv/GDlw0efTxqNbpNuGs+gyWRpaQMwhzEZEQ==
X-Received: by 2002:a05:6a00:2449:b0:6e6:5396:ce43 with SMTP id d9-20020a056a00244900b006e65396ce43mr4905041pfj.7.1713562117270;
        Fri, 19 Apr 2024 14:28:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::62f6])
        by smtp.gmail.com with ESMTPSA id v2-20020aa78082000000b006eab6ac1f83sm3707887pff.0.2024.04.19.14.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 14:28:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-traitlets: Upgrade to 5.14.3
Date: Fri, 19 Apr 2024 14:28:34 -0700
Message-ID: <20240419212834.1908420-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 21:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110072

Bring https://github.com/ipython/traitlets/pull/903
on top of 5.14.2 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...{python3-traitlets_5.14.2.bb => python3-traitlets_5.14.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.14.2.bb => python3-traitlets_5.14.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.14.2.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.14.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.14.2.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.14.3.bb
index af5a2f3fbf..5142e92a04 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.14.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ipython/traitlets"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13bed0ee6f46a6f6dbf1f9f9572f250a"
 
-SRC_URI[sha256sum] = "8cdd83c040dab7d1dee822678e5f5d100b514f7b72b01615b26fc5718916fdf9"
+SRC_URI[sha256sum] = "9ed0579d3502c94b4b3732ac120375cda96f923114522847de4b3bb98b96b6b7"
 
 inherit pypi python_hatchling ptest
 
-- 
2.44.0


