Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7228C369D0
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:52:06 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.10255.1744977116712808886
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OKXK8XGU;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acae7e7587dso268082966b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744977115; x=1745581915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4i0L8JKm5ChMJZ671WCi6xi9cA0ClRqzQkYuf8capqQ=;
        b=OKXK8XGUt5sOy+io1nB1o91UVirGjrKOWSiKU965+19Nv0nONnfux59VslVOpWieA1
         gRdU/aXcnSP1Rm8DuAq1ERuHKSrM5VIw6lCdh3mHdBdQ4LFOVZG0YPyo7tbfiPR30eJV
         cguoIAMP9rIUbJHQwgFGncMK7fyMAweYCcsHIyp10VQ0j1Vo6CyNs/I2F10cAdfwlcBX
         fmBUx1VDG9mCwZBaM8FUt8LvIIs8RqvLsHuubXSBWQtPpwQqF/QqzcthRj+yC7fLEuMt
         7tXCFnFW0MrRT68dBzFc1TLXg8s3dMVtFpen9t9xrZbwlQW5ENdBOLDGSOzsKigfulus
         9I5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977115; x=1745581915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4i0L8JKm5ChMJZ671WCi6xi9cA0ClRqzQkYuf8capqQ=;
        b=JsPLYeZMbrFpSNB7iH8aUZtLSUOoiOPUsVjq+aK3vNGBT/JV1XOGPZmtFfc6V+j7E3
         baajVRw5ultC71Bs8ZhPMN1hD/8tglFkaJgzJGlGvMrzVm5sTWpXXTgdlUPqD2wzDPaf
         NjEnpH4kJja9tdQLYHWv9BeaWLdrqHKARKNDCSjjDWQ1AR4mGQhzBm6/QXpUWLluO4n5
         xXazBmVeMLqnKutMtLgWHaKh03BtYF1lsWEr+EKTvduQMrwiUo40/NCqKhpCrGLhuSB5
         PcqcA19bOf/MpMm0FcNZ8jXEusoIuxcu2PiyY+5FDXOOKNll3GVuogd0Hrg+gyEguTyu
         YEEw==
X-Gm-Message-State: AOJu0YwRzWyMnMpBgCoFXaonQwapu6gUNOksd3T/Pa5GPg3U/2b5vdNj
	ae6bwpYQ+11Lh3hBnxRP7MrKBCxlS2vUwf9rpCkZV4687XzLz8m8
X-Gm-Gg: ASbGnct4bR2elhhCVrcEQ7Nby0FrdKULyHV46Qc8WDp7uPL9icji8jPxEm2jAz5VZuf
	ROv576HV124xB2dboh0t3R6T4rqbh/6OM6lRwNwmbgymmrb2Yj8pV3cG08tQB9RVM74k65NFi4U
	2cQeBXoKdEeXuVSM9zJZLs4/v5oLyLwIBQOieULZw17SPuXcKy4npqzwYMI2WP3HRnDAP+vcevt
	emQsKt7rfWjRhlaN7hcwioBPcghtcthD9CntWwM/NqN6Ic16/YWXyH/XVMJw+pQhP5/bHOmIQii
	Xa/iuubWUFqghoJDF1B+6oTgj9lH937wv7+sklfcnlpXgftm5x5kmeXFeThBadoAlfsD6pq0BEK
	rnO3UH1diwPZLuBzaR55hYPIfif2y/R4GqpsEkAcdknDEoeHoC+Dw
X-Google-Smtp-Source: AGHT+IFlOKmY5NWTdGWgqtUF83pLD3IViezQ32kfEGAl9bsqmvgc34xJmgmZ/3FRz+qzc9UL4IhiqA==
X-Received: by 2002:a17:907:3fa1:b0:abf:6f87:c720 with SMTP id a640c23a62f3a-acb74b505e8mr184978866b.29.1744977114741;
        Fri, 18 Apr 2025 04:51:54 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1.fritz.box (host-79-22-125-209.retail.telecomitalia.it. [79.22.125.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efa5c5asm109718166b.166.2025.04.18.04.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:51:54 -0700 (PDT)
From: alb3rt0.m3rciai@gmail.com
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	amerciai <alb3rt0.m3rciai@gmail.com>
Subject: [meta-oe][scarthgap][PATCH v2 0/5] can-utils: Upgrade 2023.03 -> 2025.01
Date: Fri, 18 Apr 2025 13:51:36 +0200
Message-Id: <20250418115141.150272-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116957

From: amerciai <alb3rt0.m3rciai@gmail.com>

Upgrade can-utils from 2023.03 to 2025.01
- adds support for CAN XL including VCIDs (Linux v6.9+)
  https://github.com/linux-can/can-utils/pull/504

Changes in v2:
  Add can-utils to cover letter title

Khem Raj (2):
  can-utils: Fix build regression on musl
  can-utils: Fix build regression on musl

Ricardo Simoes (2):
  can-utils: Upgrade 2023.03 -> 2025.01
  can-utils: Split mcp251fd* into sub-package

amerciai (1):
  Remove can-utils_2023.03

 ...ime.h-for-timespec-struct-definition.patch | 28 +++++++++++
 ...-utils_2023.03.bb => can-utils_2025.01.bb} | 48 ++++++++++++++-----
 2 files changed, 64 insertions(+), 12 deletions(-)
 create mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-Include-time.h-for-timespec-struct-definition.patch
 rename meta-oe/recipes-extended/socketcan/{can-utils_2023.03.bb => can-utils_2025.01.bb} (63%)

-- 
2.34.1


