Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF70F588FB
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 15:49:28 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22986.1776700166844922374
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 08:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zz/JKBUG;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so46583765e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 08:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776700165; x=1777304965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=As9U52z7X4VTVADeSiyqijQu/myouRjsMTopHcjuBkk=;
        b=Zz/JKBUG89XO70zpHPJa21AyjanEXIgwn9dVsvdG2vbPyy1QczpFd/TZkkDv46wiIW
         r4XsS2fdODTZ5eGFLBB0GhNAuhchmt6/2NVxuFDn9LmYvNvGygWQD/QHcjNLxQiEZsp2
         +yBbBBbSlrRaQedkHM75bhejznW+Y6tSzaF4jJBnpHfVhcjX3HqwfeAr0QGvyYk/h8Nn
         tcMzgb5mfEDOcc3b6qqZ4Dj4Zt7DpmQCMeJWpuNb6EXCw/3DBMPk6DX/dk7bCUzjakQC
         V0tIktVAArwZI3G2YUuVNUMykioiyNWxlilG6z+RYkYWb9vuw/c9l1arHpfJjMk3XZs0
         JpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700165; x=1777304965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=As9U52z7X4VTVADeSiyqijQu/myouRjsMTopHcjuBkk=;
        b=W40GwoSBTJBPPoaLDeSs+tG9YnxAw5J1kj7o0i7G6jPSzZJ4nWdOuorfBSTiEKGr1l
         DQv6nO5a512JtQx3Cg44HyliFeWsF5iu1V5HOg892hULyp3r4KYJCwfzwnGL7J5Hl+C/
         OWnEOmZD1VI8osRyg/l9YSJbhAT/sLrCENLqZS9CnScNJ5jPlrFtIXbs2Im3ekf4eua8
         ySi5GvngNhXjdU9gGbxkadpindDfmuJVKuUz3Fyn89DFzm77qS6vYQULll1r8YFUbvlg
         JP7Rovsw8oFCe+1MwqGRU/KL7tGoZp10W6yvZAsDw7NZ6T14ZzdWeW1l6bBuKbJaZzih
         mBSQ==
X-Gm-Message-State: AOJu0Yzli7MmUh6FzeoaRxZ1ekjk+0+gy0NGHjzFHzYGrVnuzRloFNGx
	prQbvtPbTCHN4uSGFHU3wXpAH3PXbcnevNMeiW9ClLTPDa2tu1BmtqLy7WZXqQ==
X-Gm-Gg: AeBDies9+rU1njvQbg3cqn4V5/0zv7X6PpRvXlaOSIfK02hjExiGgCPxm/XupdQVgAx
	Ji1E7afm26JavtzjHHLmrNLQsbEkHcj9T6mmVAJknhImQ2ZMOgntIl7srjnsxChgDms9znflZRd
	vVtcHIurE4x+musvx2Ha5erkx/t3gEnviXgxVORMneu7YnzLH02DX2824GB4+G6AphDiBkfPYnf
	1hePh/e/BaxwNGhYDRrOZiXIeRHx+J37tY8WLguoV4+jjqapbxAMtX9znYYq4lNLOOLx5vSlF1Q
	mXyYdDSk5eAb5I+dylyXAvLH9iw9vSEDEMNCzrPZjsmy70bsMANmWOxmNCS5ZcLghGI5/DKPpwt
	nfXxI/PI7Hw+mvh6ok5T4YQejRrMvCO87eHJLAIsSlUefIn3wDdi+2M/ogrWv08aDEl3hq7Alxf
	5ybNyGGJoHLNSrdHKoqTjXoS05yALNk3Q=
X-Received: by 2002:a05:600c:3546:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-488fb7880camr207273295e9.23.1776700165167;
        Mon, 20 Apr 2026 08:49:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm85279255e9.9.2026.04.20.08.49.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:49:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 11/12] unicode-ucd: fix license hash (again)
Date: Mon, 20 Apr 2026 17:49:14 +0200
Message-ID: <20260420154915.952359-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420154915.952359-1-skandigraun@gmail.com>
References: <20260420154915.952359-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 15:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126514

The unicode license changed slightly once again (copyright year updated),
which makes the do_fetch task to fall back to a mirror.

Update the hashes.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index b5ebf2fc7e..db351eca92 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/ucd-license-v3.txt;md5=ea17640caddb659394df50e5db6efd69"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/ucd-license-v4.txt;md5=3049f4ad14be1ebf8c80a93d9d32b2d6"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
-    https://www.unicode.org/license.txt;downloadfilename=ucd-license-v3.txt;name=ucd-license \
+    https://www.unicode.org/license.txt;downloadfilename=ucd-license-v4.txt;name=ucd-license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
-SRC_URI[ucd-license.sha256sum] = "abf84f74dea2812799e1dbef7f0581adf7db244881e4febb8684f441568da0ad"
+SRC_URI[ucd-license.sha256sum] = "e7a93b009565cfce55919a381437ac4db883e9da2126fa28b91d12732bc53d96"
 
 inherit allarch
 

