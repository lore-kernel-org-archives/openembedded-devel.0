Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF466C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 03:53:37 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.58417.1742874812149718178
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Mar 2025 20:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QmeOpiaW;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22403cbb47fso97519825ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 20:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742874811; x=1743479611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/G8ITAcCl0a4JhERSGFAqfVNucVAoNn769hk3nMQHPo=;
        b=QmeOpiaWGda1ywb7UT4f/rBXhBazgro6JV9Gaq7krRzA9xWuHVznEuOpx9je/hBt/r
         McgeoZSzC9guNhR93JIXVN5KDijpyCYpdGRuvdYVb4Kho06PU+jlCl5rKmRnRiW9Rb0D
         hebJKqGr+x9x+08MSN39uKHQm9xo0u4JWjNz6lqejv9Vq7sZzZXsZfqnAAn7yVBhfYJf
         55YWuMGepZmmiV+yILyU0WqBQQTpDYyJR8gb8hHI9G4zHwD1PJ0UXD3AcxnxDL2xqeWn
         75pSqjzZd1dk0sHN1lPf3aToAW0811uUrhU2E+aL4+hIeveB9xglc+2m8lnZcFZvxaPz
         hzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742874811; x=1743479611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/G8ITAcCl0a4JhERSGFAqfVNucVAoNn769hk3nMQHPo=;
        b=Uoc+wuCyZSrgnhRjzOMDffUI8bKmj/q2d4pdqJsPbLVpyW9FUFT+NYuM6T4jtcbvzc
         EK1QrEodw4pt0hdnhyFtW1el1Kr7M0BcVg/wIko0QkVZvGtrLOmLGqoR55yArC/vxK1/
         LbKN8HJzeJ07kjKDUxGAkeVXwqwVzgURIBe7EIKSv1qIsmjiP3f/grIvkiN59Ee/7QMi
         at6th/Jd4we8PKYTaHaRAsHkDOTl07pdxdgZq1PebEV/q1s1BGrRNaS8YYRU7VQ03qMa
         /65Yk8B7dArkMJf95PKl2xNxv+8nDjXn57krMOLzEb0/ySimSDxnrbm2Eb6upvULmO2S
         jKUw==
X-Gm-Message-State: AOJu0YzrpCNfNHVU5hcmyFdWknT/25FdpB6M+rUSjaT/1lcb4/3Ay1PT
	wJrgIogigYYC4JGxnm7q2mkCmgVs+07nqHk7cjO3dze0eIaUcyHIpbyqyHNs
X-Gm-Gg: ASbGncs+8Do2nymnpqp81FECDTB3xm8GE1L/uXVkvqJyqg3JCT69A6B7RJulx+ySERr
	sjJxpk0YY3otSTBAqFyQA9sIM2zv92HGHis38L5Y9ycecnwpVxYG9xOe2fX4qwN7iuL/IKOdatF
	xCtEh7Gtl8v41FofNI3d4qXoR4erxbuWgaNB0UCPPWtbuJdPXU7cWJgpuIjCfiwOoHoMSXMf33f
	HQSEaBIbzO6OLZFJbDExZp8D8D2FUUQysXGu/kX39tMV88U/18LAOMDplZgdYEQALHbV5I1rKJ2
	uSVIV4g4ugrZw9hatABAm1uFmCYsfdc6LFPS
X-Google-Smtp-Source: AGHT+IEEZO/mfyW/mnaNMJ5bdWygQI3BSZFKEL1lwf1QrZdcq8aqOsqnELBi9jDYW8xQ2UeWk4l0Yw==
X-Received: by 2002:a05:6a00:a90:b0:736:339b:8296 with SMTP id d2e1a72fcca58-73905a02c3cmr24851713b3a.18.1742874810941;
        Mon, 24 Mar 2025 20:53:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390614ba19sm8830079b3a.123.2025.03.24.20.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 20:53:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] pipewire: Deduce branch name from PV
Date: Mon, 24 Mar 2025 20:53:28 -0700
Message-ID: <20250325035328.1501961-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 03:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116217

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc:Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
index 2bd7739433..122f8fc4ec 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.4.1.bb
@@ -13,7 +13,8 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "dbus ncurses"
 
 SRCREV = "2eb8cf5dc780ca22b94545f1254497a428c412f5"
-SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https"
+BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
+SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https"
 
 S = "${WORKDIR}/git"
 

