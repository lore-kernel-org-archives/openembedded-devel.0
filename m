Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070CECEE332
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 17:06:43 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.22446.1728493600215778447
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 10:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EQ6uNYAo;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so8024605e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728493597; x=1729098397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fe8l8JC/cwb2XKqo8awc19OO//xvyaeBQgEvPmn6g7k=;
        b=EQ6uNYAo17JyXzCQN/NnyKeYR8ALjPlILSdKDiL4h5uShv615I+qiJMrsAQK0xOSSo
         9ySCLY3mcSZzZCficj3pVmtjmW0Gc3KaLnrTAcRCWBbCkbNXMe3oOISZ4tt2zQAVRs5L
         +3l02FmPzWZZdbXzmtOJ+kDGguw11h4Eor1Y+XzzXnY8Aw9TyYvuHpV6aD6vtaSBsQlF
         wVM6gTn6pTtERFqrOAIwZCKOEl9o7xRNl2fB0G3podQ8ff19PPl8vx4da3wdcArNaVnv
         z05abcNOuAkALGQ9gnRs9yUmlOPhYMD+XPl4tlLpnhwmS/XFWbaj+GavVObRUfzQr24f
         +EIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728493597; x=1729098397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fe8l8JC/cwb2XKqo8awc19OO//xvyaeBQgEvPmn6g7k=;
        b=xLqcqo28oiT0oEiMrLsLx9sCfwsB1iarOGgSLr78J1o2lDozJ7LARuEOqtoS0qtHP6
         hQImR+aXO2J38ks+qc0ULprgK25DJrQcuLwqnpLWbir6mCzX4kCG8dBcaBvzSiehFr7D
         Ofx5Fj5rNjb88RjQBkIAXFNPeHWUBeZC2LAFMZtvxgNgaL4VK09AD1049eRq1QtD+tox
         qkzGiuNDVpTPeQtICJvY3ZuyRn5TyNSsPx5PqMhpH0flkuZXxwEK95gsrj+bsB+yoFxm
         PJZSSrMyNymb0iFlt0k9R5KvU99Rff74+zQdClC4tTCHZEi8zfnMouYU6NfR5tCejLWr
         svaQ==
X-Gm-Message-State: AOJu0YzcJmrH9c3817Yr5+SSIVd7u1+X2pDlzIQmVkJKlaVqXkoMDbLQ
	VkeKrtNGAnYFWvjet2pBc2Vqe7x18zhu2d1tm32Dmw5rJlZmapzvZUKSLoFlb7IJS6KoMqH35Wz
	q
X-Google-Smtp-Source: AGHT+IFafAyG8a2PAxEZLYVbl82bMiehgakFTWHOeaGWDcy+W8eUlT/mHSMGZj+w/msBixu7gOxYNg==
X-Received: by 2002:a05:6512:2809:b0:536:741a:6bad with SMTP id 2adb3069b0e04-539c489253bmr2255824e87.12.1728493597414;
        Wed, 09 Oct 2024 10:06:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec1259sm1573402e87.23.2024.10.09.10.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 10:06:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <pkj@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] libdevmapper: Inherit nopackages
Date: Wed,  9 Oct 2024 20:06:35 +0300
Message-Id: <20241009170635.1192005-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 17:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112734

From: Peter Kjellerstedt <pkj@axis.com>

This fixes errors from buildhistory changes where packages-split would
be empty.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 90f96e053ad3eefa7693d9748efdfbfa72d7dcfd)
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
index be558ce1d218..3b4439c3ae06 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
@@ -5,6 +5,8 @@ require lvm2.inc
 
 DEPENDS += "autoconf-archive-native"
 
+inherit nopackages
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install() {
-- 
2.39.5


