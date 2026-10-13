Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC99CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:48:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3389.1791884908575162406
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=XkrB27jR;
 spf=pass (domain: snapchat.com, ip: 209.85.128.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so21150905e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1791884907; x=1792489707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iw9JngZwEz7qXodLwYzoRsoQYa8mvGKZSb1alYOBUNw=;
        b=XkrB27jR6N0OW51M6T6wPSUTGM68V8aW+hlf4vXok2fGavlRQFyQQAvcm3p+/pTPC5
         vbtvijWygis1jwZe7gGzIQj7is7ZHdieuyJTRv65I89XvS7rIsr5TnTIcE+Gsrxux2Mp
         qcmmDD87Rui+QtDjdiO89/cSfFaWcZW2f8Td4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884907; x=1792489707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw9JngZwEz7qXodLwYzoRsoQYa8mvGKZSb1alYOBUNw=;
        b=L6U6yQQBqhOBQacvtIg7JhuFmoBH8bchu+22MOP/X0sJj4HhRgsi584N5H4nre6bnE
         zxEb8bgqGa/sVwx55Ww5CZiYjMET7WjhZBe4iKtjwow5sUk256s9/70rsIy83BPD5Yht
         6u6s2cpF8NubZg08RNMiwdf1WFzg87yf7vSjvy1BOPkznYn7U/11onBtKWRTAHIR/31g
         wI9ZAI1IvSb58geSUFHWIIh3Lncie5WE4cobzocooqO9vg0NUv0vNL4qM289Wvul8aw3
         PI0NaRyxrOkY9GW8Zfs4t1vTFGPLDkEit7W7x3ifDFDCAKYTaBs1xmkbFie4anGoyH9e
         Kvbg==
X-Gm-Message-State: AFq9FYJ/taaoT9uQZBnub7g+gdISNshpSBtAEJXtbDM2vtSB6umvez94
	yCVOvLJjmHqldl2jSC8eSp1Ismw65Fx0e0K2GrJoNmC2bOnGFkfGMqWHNEAfPh17hygvjxaSIwc
	kjqRdFzQ=
X-Gm-Gg: AYBFou1ZmBBwiZX+Ykj5r0WMFzloKd7VELnhP41LenPjs1Z7PrY5twFT0gEIKX4tBLU
	DQruzScMEEUPAQ0DXNLu5h3MvqQ3n5jJ0+GMyxqTs33Tpe/JbyMRoMoMpIjLliTcwRM++UxRYzO
	WyQY9J7++uWCYgKdVa5BxgL4Y35OrQJB6TgvmTCf9fax4PmKgZ35AyWgc6QAbUll8MmLP6kuHmD
	9nInS/OVGdHVZm6pDgvIdoayycX2Ad/nmyVyZWIRp+3HxJ9wR3VnlVg96qSIgZnPVYpkQoiNZcT
	UT9VIEZCwLvGspvuwwmHsIB/O1kAqDmjHfNskNcvWTefyuqq80+C+z878b3CXcELQ/95dXR7OTU
	bxJ7yj1kVuRGvPw4OZzigS4C/tg2aNqAmniU9wZQDyJr08ncwoYsOBEG/MHok4UxLygcM8U6yw1
	vqsB7LDpcgbr6j1nEwcWywM2AcIvd5+dcqu5DEfcKYH6OPnyosV6IaB+H0IfCCxGewibIdDsvkh
	rrQj16/0BTo/QYkSBf9f6aDZPB5/DFflJCDzoAD6Z8=
X-Received: by 2002:a05:600c:5247:b0:4a1:6991:36d7 with SMTP id 5b1f17b1804b1-4a18e49d570mr229096475e9.10.1791884906617;
        Tue, 13 Oct 2026 02:48:26 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf3e044sm340581755e9.14.2026.10.13.02.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:48:25 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH] uutils-coreutils: improve SUMMARY
Date: Tue, 13 Oct 2026 11:47:07 +0200
Message-ID: <20261013094707.423286-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130833

From: Etienne Cordonnier <ecordonnier@snap.com>

The previous SUMMARY could be read as suggesting that this recipe is the
official GNU coreutils project. Reword it to state that uutils is a
separate, Rust reimplementation.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
index 26e494209a..76fcbc55e7 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.12.0.bb
@@ -1,6 +1,6 @@
 # Copyright (c) 2022, Snap Inc.
 # Released under the MIT license (see COPYING.MIT for the terms)
-SUMMARY = "coreutils ~ GNU coreutils (updated); implemented as universal (cross-platform) utils, written in Rust"
+SUMMARY = "Cross-platform Rust reimplementation of the GNU coreutils"
 HOMEPAGE = "https://github.com/uutils/coreutils"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e74349878141b240070458d414ab3b64"
-- 
2.43.0


