Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AC7CAC5B0
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 09:53:41 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.9928.1758189220927192038
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 02:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NSuE/t0P;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62f0702ef0dso3609413a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758189219; x=1758794019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElSvR3sWluMUXYocubfyTBVRTXwANnyipqmpFBGTT+Q=;
        b=NSuE/t0P9uyBeFmTy2mWJxH4JfNfAvU6BcpXvOt7pmj8egyyoXcD3mhZPdTQcxd+Lp
         REn9I6XAZllVkk2ifErHgC7QhV7pmY+X57TbNYf7nry/EAWgvY2Xbgv3eRhKcoKkH9Go
         HTOaw5ifNWNfwxocf3DL3KH9FwHRbv+HVI8+67OBqQHxwr0PusEfLh6Fl6apJgzbAMQX
         UQsvL+O3dcYdA/jxDBpmqf1fMteWHFSckEV7TNGs01KaUOUVHkeaG8u2r8MmakXTsR/c
         RL56LL4nX06g2/kIgA3kJMd8rJg6qVZp1V/RIItjzFCn/+WaFCC3cHGTiF4wfPPAFt0Q
         faWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189219; x=1758794019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElSvR3sWluMUXYocubfyTBVRTXwANnyipqmpFBGTT+Q=;
        b=i7j7WYPqzGKZDzTVG5JMuAbILNpvMAkhQKqU56UvOYWEdhuF5eDuXgeqUaXgiYus+P
         F4Cab7Eu7pdep0Ig/b+IICPXCBZWhVmQxAbOCxRmHvj4XOTT+a5qQPdUid7GlkFxGAS9
         ZRHWs5skhqNy24J+fxfDiwdKwHNIqupD7l8OqDPOGQVBjrf5j0u4PgXej+Tn7p+qnBFZ
         RsPrJtGMVkjn6pHPDedQAQ9cOGC/meyyuiTXGNHxsPRwAZbFQbuhX0zg0IkmXf9LAotE
         oJzQMUV1S5kFGeO7frw3hWo1B6fCqhF5f5JJIbf+u8fKIYXRJuFa7zwkCJLiKgONcrxh
         M3TQ==
X-Gm-Message-State: AOJu0YxpCn0m6Z1XxblgUaPlKmMsfvq/h0FmxVO55QwXFwYA7rDVnjzj
	LtELVLofzljqbe8WBPzcaAr2igPHeBGa+uSdtP8tIBIldoyi2m564ond3Jmxrw==
X-Gm-Gg: ASbGncvZDhKZQMDMdmxhSvqkTDGFsWZ9+ypcPF07MhAeDkOsYyNGbO3K14ubG0Osl9t
	3JCmo4ntoREsmBzTmUrOB1hd127zrSXiEMg3ZiP27JPPw3qX6VOO7JHiD07X2ua/1ZgLAWwmBfd
	Xz2+KeJxALjUf7ZUQANNSHcqGyolNRmMb6gpR+GlpnluRRauHyURmAbHy536gVazYGzPPFYvWw+
	Dv9w4ANX70NraDoVXaI/Rcj0Y/ok7XB8/7mE3NNwdDfm+RpPo25CA/tgxQCUM8vb8Ouph4eJsBq
	3EtF3C3k1h2TEPLnHZL45mMjCiuQQKk1bF5WEiqTh207rX6Q/ppIpXZR4IJgmVNsmM06FJzuLX9
	YiMKn2j4X5ypIEH4gpr8T4NXcWMsWx5Pkj+eZymE=
X-Google-Smtp-Source: AGHT+IGrOpJPLIoMm/W4AK8PA5g+yMS/1qZJWOBKdpo70EEW6Lt1NlfoqqR6rFIieatmYIaSRDdiNA==
X-Received: by 2002:a17:907:9612:b0:b10:ecc6:5d8d with SMTP id a640c23a62f3a-b1fac9c9b84mr292340066b.26.1758189218972;
        Thu, 18 Sep 2025 02:53:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d1a89esm1168184a12.16.2025.09.18.02.53.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:53:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 09/10] cukinia: Fix license field
Date: Thu, 18 Sep 2025 11:53:31 +0200
Message-ID: <20250918095332.3369767-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918095332.3369767-1-skandigraun@gmail.com>
References: <20250918095332.3369767-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 09:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119550

From: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>

The recipe currently indicates that the cukinia package is licensed
under both GPLv3 AND Apache 2.0 licenses, but the upstream specifies
using it under GPLv3 OR Apache 2.0 license, is user's choice.

Signed-off-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cb8908b91ead37c5d74b44f949c12c33354956a7)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
index 2b5b923e47..fd7b91f1d8 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Linux firmware validation framework"
 DESCRIPTION = "Cukinia is designed to help Linux-based embedded firmware \
 developers run simple system-level validation tests on their firmware." 
 HOMEPAGE = "https://github.com/savoirfairelinux/cukinia"
-LICENSE = "GPL-3.0-only & Apache-2.0"
+LICENSE = "GPL-3.0-only | Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"

