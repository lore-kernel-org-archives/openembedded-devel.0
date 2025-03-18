Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17710C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 05:24:32 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.4746.1742275461917372847
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 22:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mfSVkfe8;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22438c356c8so89876235ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 22:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742275461; x=1742880261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wi7A41mScwnoemq/ZVBsvboPvrEqu/lr5Hf2NxFtd5Y=;
        b=mfSVkfe8YU77VPsJyb874x+oInjmkLMP6GN5+OLeGXpZTF1421y8fXi0ceYroKm1Ay
         M52ZNkrrkBfPfgGY1gheE6jO5YqY62RlQH4HUnyY4ftjaMVZch3WaikIpTI2Nce/IC7d
         WpzfQmdpsRVrhUGT0gcvd1UImK8rSma7kn269SL+NVLlQ1EY9z103N0gG494ktcnX4hp
         1Bk0ELdbu2lyuTSzAbpexUiMjP1+yzYceMhMALMvwBrw+8y3QWoPg3v4h42PSILwTwYI
         J9kEN7yX0wfVN4QrNwjUDqEUEG8QFy64cpbo3McHPsbGb/5XWB1LxvxxDcpA5QeqKhi/
         lIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742275461; x=1742880261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wi7A41mScwnoemq/ZVBsvboPvrEqu/lr5Hf2NxFtd5Y=;
        b=s0xZb+lIuKxj2yx1OZRGg5t+AzkoBv0v7mbfStOQADO70D//vX4bXoZTmywek2yr68
         2oMDyOSEcXGx1FtXqeEdnfvAATWopiLT2w1Lyh/jdPBF8o2YvIUuk1kBui74vd0+SOXi
         pydkRrs5cNQgvevKZ7hsDwai+ObVF+BzxV/4CycQR/GCntDCHTXmIL+X7Pi5J1PNqGSi
         +feuP8xJy131ZqAT7w4C4tE8ErnNuJr6/WvBaGeiM7E9a969OFLW6ze57SA2DbszbAuc
         D/f7wg+6/75LaHCyUP2xKaVgBQ84DRkq/KwMRTArnAY/Dg5b+F6cvgjH07XotHJ/7kKC
         Y7WQ==
X-Gm-Message-State: AOJu0YyFisWsuKbZJF2zOzACE8n1m3MuoevkWDkNjOmYRsiCiGXw71YL
	PsnAa7Ah1BxRvKQRjAdFDBv52E1emZWhqhOkCC9oEcVl6y2vvCm5i533mXqv
X-Gm-Gg: ASbGncvScQGyFo0H53h3bAyjje/UWnZeKbyDubHKYthno4/W4z4SIuDIHCJgaxlR9Yc
	96PcltwtAgfQVWRuRNSu5+azPPkb/Ii+wszFOx4TUa1jPRGgI2nJpvEc15k6FUxEJZpyK0bpQEC
	hLDxzd2mY6RneUF8fUZ9ysiZ1EwpYd9ri1nvqh3a338BXLAx/TfHlvk4xHzZkbb7CZCXowE1Woa
	FsAs0cabF+PYXvl+4h0D41Op8t5Quq0TqVMPfLT9Vmg87SZhwDsF/EKDEMx5CcZhrcXC33iQr0Q
	NxR94cb81ypw7/S4iZQ3W8IJ7VwiqF3R5ErN
X-Google-Smtp-Source: AGHT+IEAtF3rp4CjX7thNKfYjL/vstb3Ab1MxlB+7A2PFu2dFOO6hFTINpAeHcPq97vXi/fZ5/6BbA==
X-Received: by 2002:a17:902:c944:b0:223:54aa:6d15 with SMTP id d9443c01a7336-225e0a6c3bdmr184718265ad.12.1742275460769;
        Mon, 17 Mar 2025 22:24:20 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbfdfesm85262195ad.203.2025.03.17.22.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:24:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minifi-cpp: Bump libfmt->11.1.4 and spdlog->1.15.1
Date: Mon, 17 Mar 2025 22:24:17 -0700
Message-ID: <20250318052417.3039602-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 05:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116037

Helps compiling with clang-20

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
index d35b5d5df8..204d3c6cbf 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1.bb
@@ -46,10 +46,10 @@ SRCREV_gsl-lite = "755ba124b54914e672737acace6a9314f59e8d6f"
 SRCREV_date = "5bdb7e6f31fac909c090a46dbd9fea27b6e609a4"
 # asio: 1.29.0
 SRCREV_asio = "814f67e730e154547aea3f4d99f709cbdf1ea4a0"
-# fmt: 11.0.2
-SRCREV_fmt = "0c9fce2ffefecfdce794e1859584e25877b7b592"
-# spdlog: 1.14.1
-SRCREV_spdlog = "27cb4c76708608465c413f6d0e6b8d99a4d84302"
+# fmt: 11.1.4
+SRCREV_fmt = "123913715afeb8a437e6388b4473fcc4753e1c9a"
+# spdlog: 1.15.1
+SRCREV_spdlog = "f355b3d58f7067eee1706ff3c801c2361011f3d5"
 
 SRCREV_FORMAT .= "_expected-lite_range-v3_magic-enum_argparse_gsl-lite_date_asio_fmt_spdlog"
 

