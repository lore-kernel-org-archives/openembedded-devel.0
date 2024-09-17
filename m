Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97ECDC3ABDF
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:04:36 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.14906.1726553071757130147
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a1+aXcui;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2055f630934so44884465ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 23:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726553071; x=1727157871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thdSzH1dIBdahXc/q5y4m3UTli4wOPWQw2HEWqi+Hc8=;
        b=a1+aXcuiVPloABdmalQsblo2qnz6+TbWCgYrg7oaHd74PMrCv6I3YHsALlCdRfWsjs
         e9f8+cYxBYXJcBHBO7fXzJ3ROtbH9P/m4brzTovo0NzSHSZj9guia3cdkrs0CXuxNqb2
         MMfwe9AnE7jMGlKtQbPFZ4A+RfkyX55kzeDVnAFz6xR/JCa/yGcOEONRC+ITRG7MHsWU
         rcUlcMjRclhjUitiPsJdLK3g+ddvuogaRmWehy5Ustp4jZMBO/AAKYxEHwOSrJV6Q7Rj
         r4Bdil4qx69pclqEIKhTIXoSkn5mUSPWpsPJc80Od33fscX2HKVj6icqGyBwSHsT2vS3
         YgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726553071; x=1727157871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thdSzH1dIBdahXc/q5y4m3UTli4wOPWQw2HEWqi+Hc8=;
        b=LZBi6/YOiVefv/b5/dTnsrpjZdtK9XqefOfX/YZqkRkD60eOo837nje0IxTvAQEpYy
         IaVOIkm+7HBuqfB+35q8SN6ifBU84nRiSjBgzoJPFiNZNPfyCGc8IQULVw4Jtw/M3e2E
         J+Z2dyjqF4R7gAt+YVHlizcEQhk+sJJaUSXmRce7/dCg1HNJ1BktsXkFDeIQYxfKYRvB
         dzp1io+uTJWOUxzmT0NtFatdXH41wl60Rfk480Y+f8DWJboAFIE9i1533nXB9/ZaPKLH
         WfQsJrpwirS1/L8UWvzZ8r+HP1q0Pi65q+UODInofKiuRsSP9Rps8tk8xd2yAa7XHicY
         hvUQ==
X-Gm-Message-State: AOJu0YxSoffGIkZnwGpxyxL1B9QYFYWMwZWKt6msXK3jQPXPfmh6lAe0
	u45U6hllN81HQxECEniSxhifudxkGg4Vt4OfjoMw8zVObkzd1SM3MmBeoRsj
X-Google-Smtp-Source: AGHT+IGX5itUsVkaiTFQvacWcRaARI7n4Rhy/bN5f8oQieLOVYBGXEGfLonfYZxoM62/6MVUdExCQA==
X-Received: by 2002:a17:903:11c6:b0:206:9640:e751 with SMTP id d9443c01a7336-2076e306856mr222156475ad.3.1726553070943;
        Mon, 16 Sep 2024 23:04:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079475df17sm44294645ad.298.2024.09.16.23.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:04:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 04/12] dav1d: Disable asm code on rv32
Date: Mon, 16 Sep 2024 23:04:16 -0700
Message-ID: <20240917060424.1692067-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917060424.1692067-1-raj.khem@gmail.com>
References: <20240917060424.1692067-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 06:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112330

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.3.bb b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.3.bb
index 43056e9a46..6b7f3090a3 100644
--- a/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.3.bb
+++ b/meta-multimedia/recipes-multimedia/dav1d/dav1d_1.4.3.bb
@@ -15,3 +15,6 @@ DEPENDS:append:x86 = " nasm-native"
 DEPENDS:append:x86-64 = " nasm-native"
 
 inherit meson pkgconfig
+
+# RVV assembler routines are not yet available for RISCV32
+EXTRA_OEMESON:append:riscv32 = " -Denable_asm=false"

