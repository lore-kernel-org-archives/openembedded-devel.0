Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAAACA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 11:05:04 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.13724.1757675099375560984
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Sep 2025 04:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WdbGHG1M;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62ec7fe6e35so3356598a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Sep 2025 04:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757675097; x=1758279897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=i0ls+t9xChx021j53QPoSWQFVUJThP4Ovz+OLxCw6Yk=;
        b=WdbGHG1Mf9qsNe7dKNl2C6hLVeAKfBfZ/72QjVJ/OFEsFNv6ugSySt01M61MC7D1TH
         jJe7VL4blqxufP/UB7yU3rb7KUWcUjyVUmIhZ4ws9WEquwz9zSFzyZi4fzN1yaemFDQJ
         hZM/Uttcb3rr2yUgmAJNFlnzC5LOM1wfjxr+riNUY4nC71jyH6hsRmZKj8TUY0NNNhtM
         7CFeYReEI9KgK17bFAMeo53jj8QBDD5ZzsBkSmOKKxgq6Ms/avk4ynCpwsHR1Hs2/E+s
         PRAX97/Zxknv2kwnoiV0qAWPexz23/9Ybrx/Zdv4oHu2Gu3tKfP4c6KKMXwdV6/lGtXS
         LqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675097; x=1758279897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i0ls+t9xChx021j53QPoSWQFVUJThP4Ovz+OLxCw6Yk=;
        b=FV/XBmOnNmW4tq/C+mqN6F7C0wZvCaiUWZxdJjvsM9knuYea2q9FkARr1OV2EhTjyA
         QcDl2qQfoLJPMCe3WP4UT2zJ5AJr2QkiFtFpCxEJwhsLabR9k0ibOdHwSWkMdhi5M/zq
         jeURvMw6fdl4jjEskesIM6P2q2JPSP0PIgeuvT7gXj4o5JmrncPNrpc9FvxixZ7egdgi
         5V9MpLFW1oy35drHsCRpJooiZ2nOs2IBzHLjDk0OFJLDBnaZccXttGUTLiPddtCsDIUz
         rVlLSDg8z42fhewr5Uh/5Pai8NlDHq/YCGsHDfqLVTDFVtQyhEu3IUEHb/ZuW/7hxD13
         MmEg==
X-Gm-Message-State: AOJu0Yw5eGUmoSb7TL7rvBoowR3dG3NS7p2xPA2Vlj6c7Pg/xqsx4kVm
	HKvwQuHWmuep5vwnHZNjHanPtnKlvdY6IdvbfTafH5CbHLnk1KiQMdI0g0maEw==
X-Gm-Gg: ASbGncu0AKUOIx8zeeXPbKK7r8+1SIrlVMg0Ox5lM0lKc5FkP4ivsZJ7BFkKsWVoDxo
	/kVtoQk8S4cWCxuHJizWl4kVN35JNMwrEUDtE9UdsKbjGuppa7wd6i/mdPf1USh3VXpYPNHEiyd
	W/D3p6QWxeoM2ZmjB4Qynps7iWNlDwhah2d1xh83Oy+KKZ7KiX1vYtnPxRdjf8HlDR25L7IVcWU
	owzAzZhSHyntyJ+GZ1tCjzBA++ArdzOu8QtAiChuVPyQnChZA7uXD9ND+70Wy627jjlpvQ4EHVF
	H6bltwsGw+I9LEJCIeMZAVF1kBPk/9NH+qXq2dzlgrmZtoaDZ12FAZ1x7/GQyBACKfXZI1hIfNL
	WaQUwxFtxgTUiCI8yZVsc
X-Google-Smtp-Source: AGHT+IFV3buey/cII/89FBnQGN5l+FHRhPHrZPvuzlOBIFLUdyP+z+3OVhhKml62usMNhZbOv0wJvQ==
X-Received: by 2002:a17:907:3c8d:b0:aff:2ed7:5f11 with SMTP id a640c23a62f3a-b07c3572bd2mr244433566b.24.1757675097199;
        Fri, 12 Sep 2025 04:04:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da4c5sm340578466b.21.2025.09.12.04.04.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:04:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] libchamplain: don't compile for 32-bit targets
Date: Fri, 12 Sep 2025 13:04:55 +0200
Message-ID: <20250912110455.258549-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Sep 2025 11:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119377

The recipe can't be compiled for 32-bit targets currently, due to
GTimeVal usage - see bug report in the project[1].

Remove the 32-bit targets from the compatibility list until it is
fixed.

[1]: https://gitlab.gnome.org/GNOME/libchamplain/-/issues/61

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libchamplain/libchamplain_0.12.21.bb              | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
index b7c587d25f..fbfa35927e 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
@@ -10,4 +10,13 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 SRCREV = "941560af497148588783db991e8135f52a82574d"
 SRC_URI = "git://github.com/gnome/libchamplain.git;branch=master;protocol=https"
 
-
+# Compilation fails on 32-bit targets, due to GTimeVal usage, which assumes that
+# time_t is always long, which is not always the case. 
+# See bugreport:
+# https://gitlab.gnome.org/GNOME/libchamplain/-/issues/61
+COMPATIBLE_HOST:armv4 = "null"
+COMPATIBLE_HOST:armv5 = "null"
+COMPATIBLE_HOST:armv7 = "null"
+COMPATIBLE_HOST:armv7e = "null"
+COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST:x86 = "null"

