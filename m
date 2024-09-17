Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE856C35FE7
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:04:36 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.14903.1726553069605084519
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XLGAhvbS;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2055f630934so44884215ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 23:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726553069; x=1727157869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOGx+m8yvpXpkqI6Bj5aEbnD3eSjJ678DabjPW+foO8=;
        b=XLGAhvbSPUQYls0TVQ4XKQdXQ3/Ztp4kTDIzWmeu8D8H7W4UlwZVBLKmLUgsin+6ip
         iPi2LeD7eKWlTk08SKHKpxKrT+0fkG8TT35i5o+0cNJn962aUeqPrBoBAXdJJh7lEPcS
         O87qduJXU0l33vUVjt46+OHzs/Pg05MIp425UyaQKR2f/1c3UsTP71zM2/l0hykX3bLN
         +aGHhZ91MIYlMkr6kBDfPAyB3D5MZOD2dexDmgxywcHBgNmKB6PFTKQ/xdB2zsQ10AvA
         5ic2bBNtZgIrTZxGe9a9f9Mkdr8JihCB1zn6i61RlSFKbGzMjLaQ9CDi/gkXOLuS28K5
         UJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726553069; x=1727157869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOGx+m8yvpXpkqI6Bj5aEbnD3eSjJ678DabjPW+foO8=;
        b=myEedjewzcJsJTjbq4K5DkdBQGTRFfAFy6AV0yWusHyerH3pcGTdsYrAIYunTvtexL
         j4pp1SFsPSFptwqktzxUxHjHyt6UtJAp9frslYx+E8YOlAEDgTZmgqT/BaVS5uQNm4mr
         4BOkGuVeAVhj1X3VVRQ5lJ6ScA8icBxMMf8tck52sWMSbsC3Gfanl1RyD8FX8OGCGMmt
         urPEmWuYPcK8FcPUdFK9YbIR98xoZEr2VtMHQAlrTq/vnMLdSq2XqXHYNBv0i9OiJ348
         VrE+Bx/eNMMrvGv/zZv7KVRjHYUu49tYa139X0VVw9/fz70oceWFETVYg9bDgchSlDCn
         gSjA==
X-Gm-Message-State: AOJu0YzxW1fFeCYUhPrNGkSetVVv66M4d1PLK8rj06N8ywGayiVEV/3d
	Uv0lsf0vzWyEMvJZiNBAD/8peaMLAAEPxZKKHU2q86zQn0ZbxJXG8kPRIHVj
X-Google-Smtp-Source: AGHT+IGFWWdVO25iAGOSFNla7QX76oi88MFc+Eh7xiEDiUicQ0ZfhJ0o5kP4qELt83ZwHkJU+fRGFQ==
X-Received: by 2002:a17:902:db03:b0:206:bdb7:7637 with SMTP id d9443c01a7336-2076e3eaba3mr269781345ad.48.1726553068712;
        Mon, 16 Sep 2024 23:04:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079475df17sm44294645ad.298.2024.09.16.23.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:04:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/12] highway: Disable RVV on RISCV-32
Date: Mon, 16 Sep 2024 23:04:14 -0700
Message-ID: <20240917060424.1692067-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917060424.1692067-1-raj.khem@gmail.com>
References: <20240917060424.1692067-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 06:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112328

RISCV support in highway is assuming RVV and RISCV64
however, there is RISCV32 which perhaps does not
have RVV yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/highway/highway_1.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/highway/highway_1.2.0.bb b/meta-oe/recipes-extended/highway/highway_1.2.0.bb
index 5d74941245..020116d864 100644
--- a/meta-oe/recipes-extended/highway/highway_1.2.0.bb
+++ b/meta-oe/recipes-extended/highway/highway_1.2.0.bb
@@ -12,6 +12,9 @@ SRCREV = "457c891775a7397bdb0376bb1031e6e027af1c48"
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = "-DBUILD_TESTING=0 -DCMAKE_BUILD_TYPE=Release"
+# RVV is enabled by default and highway cmake system assumes that RISCV64 = RISCV
+EXTRA_OECMAKE:append:riscv32 = " -DHWY_CMAKE_RVV=OFF"
+
 CXXFLAGS:append:arm = " -mfp16-format=ieee"
 # Option not supported with clang and its default format for __fp16 anyway with clang
 CXXFLAGS:remove:toolchain-clang = "-mfp16-format=ieee"

