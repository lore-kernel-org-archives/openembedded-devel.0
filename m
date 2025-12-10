Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC85D3C530
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:04:22 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14126.1765368259050009861
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hd59+8JS;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso7710897b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 04:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765368258; x=1765973058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ISqLQDEKnzXS/cnwk62OtaTALjnpPMzcmxsQZqtK82o=;
        b=Hd59+8JSxvJIiqzPQvbsf2kI3TPZh5UaSqcWk2Vh6snMhiU053gestfAaHSsnyTo7H
         Cdr5kDRYtg9lL/S4k3f9rmAp9O/B42XArFjGnH+dRzr1NXFds3WLHF89xj5NWuVxGb2Z
         VEuTSUomAhnq41GspSwhwIClaZXrB9cqyN8T0j+GyaibGRlB2a/KghD0KQOCAWa1LI54
         OxXQceNo7YrTnY0IZBmXZL/CxJoJ9ESk1DSEhBAZ3dkt+D6a7yCq5ipo4P0XJ0yequx8
         JmewokvHCuwjj06molYVYoHOm5RI2A05horThX7AijQEPm9JBnM0QsclOJiJK45WOCwO
         v2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765368258; x=1765973058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISqLQDEKnzXS/cnwk62OtaTALjnpPMzcmxsQZqtK82o=;
        b=Oog9Li5XrqJrgTWtKJi83kL7Uf3AZwvv84WnsFIV4tE+W5Ws1zWI6vVtl0UdaA7+sy
         IUGaMxOdBiIXkUXrvOdGULcMTxcyLE4/enhZDo5QnmPFlp22KJvfyuUfNnoJ+FBBoC+L
         /CsPPCAth4tqeHWzhz09eG3agyZBAAC0ft6c80HtacT2/6HxIWb62PINyuoeIBmc4klf
         50WsmyxJgPsuJA6AZzWTSSN9IvK7mW9he8Gm3/W+xu0aQvpTts7nyp6TE0xcwbcAGxWX
         j25XHmOkJHKomEDYZz4+3ESY7y3HJEmAinXy0f+rLESWm39FgZvKbWQdqmRdsxmY4fKA
         NvoQ==
X-Gm-Message-State: AOJu0YxFxHxV3CQRaavEDXzowzX2Y06utO1DTi9wDKsNJdaQH6RSCUo+
	NTFbQpe/LFDclEmmblUfYMZL4Zzrt8T1Skp2iARHe74V5GgVQYq8spb4QLpVig==
X-Gm-Gg: ASbGncv+8uWOu1zP4Q2Bn4EvLfblyz/1+dUYb1+wlWH1blgzrU84K3V8J7uJlVB77XJ
	JYytG9wRC5vXBy7BY4AUPVdvxyMHVz5PkRL6R1teMz5KZixKLEZalqZxXzfzG5hZBovTnEH8HbA
	98zOkMHSDWtGcMWaHf2Yr4HYzEuFIzMhyo/y6sbAHolUUe5LE7xUMlBBB6g2dQ2x6YHuKX9lMDZ
	CESN0RFWY9mzXLs6p3q9ve8SjJz+ttSi8VV0FczT8yk8FQs6f8oyPyRX8koAp+maZRiw84GJyTb
	YjiIvScKFrW/YFZQMQduTt6+iFUp4pdEoAgp+rqCj6vdOn+Y6jbbrUve4ighDycD2ZlWdKq/jyl
	Su07liMrvW4Cb7mX5hpqjChTv6E/UI0Alzr9cFLw0WE8NWGtBttgiw2sqYd0/fMrnXPRTg/XMUR
	cZJnxqC8Cm9USajje2abGYtg==
X-Google-Smtp-Source: AGHT+IHamxL74GFHUWANDVvD7pFQWmlX31TT0TvKWj0qJOz3ZLifW0RRt8zMtWX+bRRwIaWZSbSCAg==
X-Received: by 2002:a05:6a20:6a2a:b0:35c:fd6d:b1f0 with SMTP id adf61e73a8af0-366e1c4a5a5mr2258750637.40.1765368257964;
        Wed, 10 Dec 2025 04:04:17 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf686b3bad4sm17767759a12.10.2025.12.10.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:04:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 01/43] lvm2: upgrade 2.03.36 -> 2.03.37
Date: Thu, 11 Dec 2025 01:03:15 +1300
Message-ID: <20251210120402.4179289-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 12:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122505

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Changelog:
Mostly bugfix release, with most focus on dmeventd, persitent reservations,
lvmdevices, and improvement in tests.

* Improvements in dmeventd thread safety, shutdown times and more.
* Many fixes and improvements for persistent reservations.
* Support output in list mode for all lvmconfig --typeconfig types with --list.
* Fix deadlock in lvmdbusd on SIGINT in lvm shell mode.
* And many more.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 22af3b81a78b5e56b0e293ec860e4649f66ec158)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 09ee410614..ccefa206b6 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "c8b7a765cbd731af32964adaf921f9e19d56a048"
-PV = "2.03.36"
+SRCREV = "d34fc799fd86538756ba56b37e1ab56ab1b75d13"
+PV = "2.03.37"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 

