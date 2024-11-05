Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD6BD2C10C
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.19621.1730817421977513126
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gsruSGfk;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ea15a72087so44033907b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817421; x=1731422221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvNWm0fnny50jOrOSyVpaOpLYJhmqQvEfAQ7fauqjnc=;
        b=gsruSGfkLEX7xaiUkDdMAlJ3S1oYn5gkGFXxEeWmOBoXqExcP2XaxLpTuKn7m3MCj0
         gM1Pqy9kpMj3V6yvFJnjtU0mXIPpQKRLImsO7n67wxjWZPV/R1Q5ZPAA3m6uTBItLYoP
         WZhmpFauXULZ1pIddJRM56HB++/HwKJbfnk/dpr56f/4hb7pyl3sXvC+hrSBFN7nezxD
         FMx7cxUvIokcv68rzp+K6oQIxcAAXpIrEokpuVv1WdY//GWd6/cqo3wQLau/GLcEDeiN
         bv9N7wnLivjt4NmOinb2l9Qz2gdLUkd5Fbtru0usr6Wmonth0n5PPYhyAyWSCA0UyHOf
         kp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817421; x=1731422221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvNWm0fnny50jOrOSyVpaOpLYJhmqQvEfAQ7fauqjnc=;
        b=To6G4sWAQP8WllaB5SABMJ64z1rgX5gtnGCw2+O5kT5EZiat1u29n0x5dUnwiNVRjW
         aLDiolO3b1EDRFBxzshHDUuGN3ahSysPc9ToAFNuWqlyUsNNeeww0Gauun412AOkDHQT
         Cazg18XXUmVcZwEhi2Mi2pF+0B5K8JRyMmorvdNqCK+//mNvj+MpsmTRsYRtWM2e1i52
         yaHHx5iYp6WJ41BsdGdQjeqnT8PDp0g+MvMwvwD/kqM3yHzXYp4nd+1p7SSsQKeCXuKG
         OKdd9/Eb2vGEn0ollxMSAGYLwziYzLzdDygd9/fJN+5PiyuFrrTkCrrAAEL8bMF6AbXT
         ZbEA==
X-Gm-Message-State: AOJu0YxfpgGBZqDmm82N6gL8ibCRVcpkbMpanzli9MxdudCUn5XXzvCI
	fygMfw98bSPoJ6porcPL4I1DkAGhlBkhlWxLigJYDm8T30Uz+oXGOkfq5w==
X-Google-Smtp-Source: AGHT+IFbvQp33bXklt9h8GErISrDW1YzwIqgLMFdrPdTG2i/dm9sksP1HHPAxqr3lqI9LU6TdwzaIQ==
X-Received: by 2002:a05:690c:6410:b0:6e5:af24:92fa with SMTP id 00721157ae682-6ea523cc89fmr206168917b3.21.1730817420933;
        Tue, 05 Nov 2024 06:37:00 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 48/90] polkit: Update Upstream-Status of a merged patch
Date: Tue,  5 Nov 2024 09:35:13 -0500
Message-ID: <20241105143638.2301245-49-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113466

From: Yoann Congal <yoann.congal@smile.fr>

https://github.com/polkit-org/polkit/pull/497 was merged as
https://github.com/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa8677416c1aefc2

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../meson-build-Support-openembedded-OS-for-PAM-config.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch
index cc396dfa3b..445f2fbdb0 100644
--- a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch
+++ b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch
@@ -14,7 +14,7 @@ NB: This is also the same config as Debian but its not mentioned in the
 code.
 
 Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-Upstream-Status: Submitted [https://github.com/polkit-org/polkit/pull/497]
+Upstream-Status: Backport [https://github.com/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa8677416c1aefc2]
 ---
  meson.build       | 2 +-
  meson_options.txt | 2 +-
-- 
2.43.0


