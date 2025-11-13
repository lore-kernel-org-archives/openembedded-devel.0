Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6EFCD4F28
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:19:55 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17877.1763014793225946533
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GiEVkQDY;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b9a98b751eso1435b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014792; x=1763619592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkUUdJU95BhLyLriAQSinGbvJKG0aGXEvtym6PtqDos=;
        b=GiEVkQDYZu9cMvUpp6WlHpoIaR6xiFRE3dfeIGcpn38HJq8RDRNo96fCsvsRVUK6Fp
         cXcPiY2orgdVV+7xpzCXhI6C1fmQtn1e6RN7Op5Fc+w+B5da4G/HAMtrLoTAY3AeAVB3
         LC8DJ73OhyuvqMWZr330rSqM4Tr3STqLfZ+Iq4gTjGpFGawE9oYU5+YGX9lIEzyNaiBa
         frRPUug3IDbJ5jf1yZVfO2r5ErPWrbuVFmX7CGvaYpq7yTzFbaywZimP8i8xWo4hhtoU
         6/vn5fuh7uC7YZJCHk/rW+5NTN+D3k8jFAhSPTXmgiG4YOECgMvIvw8rIVJGbnaXIIOu
         3jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014792; x=1763619592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZkUUdJU95BhLyLriAQSinGbvJKG0aGXEvtym6PtqDos=;
        b=ED27sS3Qg2nSVSmiBviNNGMqcyd1eIUZDQJLlfkSadPDCS3BDOwBW2XxMYxQ1Y+pnh
         WV9IOjRt8P9bHPPIxhQiLKZZgct/iQQAS9r6LHhtxhE7toJS3ClBCe2hHtZsjibwv5HD
         99SijolqhWxYuKUOiJpEdm9Q6dgx+Qr0MvqNMYyje3oNMtEjUsyYh2N4cNMhIZiStJhp
         k/q1L1Hv9NplZ4QGwZV6/LgS+Mgc8E0ywm5OIIBSXe8lS16MBQ6upzf9zMpe+1+N1jef
         biFAE3ncpT2hMDUt00Bul/VACoBl/BRluWqciQGR121vblGMwbXMfXgS4v/Wmak6CAHm
         Yu9w==
X-Gm-Message-State: AOJu0YwGS+NurOkjqcI7mN9opSclbLRQ5Yr954jwnxJ4okjtiypasAsS
	cg/Bzb/uTVdpIelynK65JE4YdTcSzUD37Tte4fn3PTS+1iN8ZXl6z8Za6+O89w==
X-Gm-Gg: ASbGnctl2PLvX4hrrwNbC+HSnn7xRdpLFuEj9lcGD5YBSKw6gE76+fWyVss0sNe9rKc
	4Erb8yFKyci0NNT/ijN0wjOVI1UCA8ZIUbX9YeTUFvnSOvKWXLa2smRfT5fIEs3v1DDwtKXR438
	CrBwUYxlpjWpcnfZkwwRcJciYXSfmVQJpchaR+dI+NEV/yIrRqZbGAc1xLf8a4f2CqBJdzLZ+oA
	8ETQUIFOWyX9wf+O0jyqfcwHHlkJODI4q4lyLZhWVEOQYFdPKNvXyGBtspvgImwzhoV/ZtxkjSz
	XTaKoConW7m+83/DjPotgXyMEVpyJDz9vknyl+18Z9edjLGWEgeW9HpBCD5bsn3Dhs+AKhSpBPI
	x3W3KKdtlj876V/GKCMCmNkEoIdzBQvGzod0Inux7LmuWxcl6l3bov2xsiAra85NeKFFuau0D3O
	3CQjem6wxV/445qw==
X-Google-Smtp-Source: AGHT+IGNizA1MaOXGcQgXu1hcIEvr2JxnNyQcPvdj3tlT7DpzA0FK8js7SuVLDgwHPUOmWB4Bdn81Q==
X-Received: by 2002:a05:6a20:9186:b0:32d:b925:4a8 with SMTP id adf61e73a8af0-35908c8d284mr8198109637.3.1763014792411;
        Wed, 12 Nov 2025 22:19:52 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:19:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 07/38] usbids: upgrade 2025.04.01 -> 2025.09.15
Date: Thu, 13 Nov 2025 19:18:42 +1300
Message-ID: <20251113061914.3756301-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121605

From: Jason Schonberg <schonm@gmail.com>

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9f4bd029e1c19dceff762ac423aeca9f10ee990c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../usbids/{usbids_2025.04.01.bb => usbids_2025.09.15.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/usbids/{usbids_2025.04.01.bb => usbids_2025.09.15.bb} (84%)

diff --git a/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb b/meta-oe/recipes-support/usbids/usbids_2025.09.15.bb
similarity index 84%
rename from meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
rename to meta-oe/recipes-support/usbids/usbids_2025.09.15.bb
index bdb5807aa6..d9c6a82e65 100644
--- a/meta-oe/recipes-support/usbids/usbids_2025.04.01.bb
+++ b/meta-oe/recipes-support/usbids/usbids_2025.09.15.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
 
 SRC_URI = "git://github.com/usbids/usbids.git;branch=master;protocol=https"
 
-# April 1, 2025
-SRCREV = "635738b64eb52d376c5d1756c265de67236c8934"
+# September 15, 2025
+SRCREV = "18b3055a9819a341ac2ff957f0b92f564d0d5d6e"
 
 S = "${WORKDIR}/git"
 

