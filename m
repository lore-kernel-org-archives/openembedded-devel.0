Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F474EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 07:38:57 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.53685.1688456330100517336
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jul 2023 00:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=EqTeyg06;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b7ffab7ff1so29816545ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 00:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688456329; x=1691048329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/tmYmXt6kEoPYAfX0H7J+ZnOnpwCfUc6wvpkdvgSBL4=;
        b=EqTeyg06SwCahRszg/VCd+cWon+yK0pmO+7rSPHcSGaakPmcToIycCD4BayRfXvY6t
         QBF9ua9n4yrtKptqEuvTQw9waO/DWoDVd5RdsrbHteLJSfD4ZVmcABXeMrrfBVmUgbZz
         yqcOK+orDn7mz1LHQcPNodtN5SX7mlZPM+8Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688456329; x=1691048329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tmYmXt6kEoPYAfX0H7J+ZnOnpwCfUc6wvpkdvgSBL4=;
        b=AFmhprtiyav+lux02okVzu2CE/VTRdrYsaV9CkxHA87L5v9fvZCnbiwAC2X/0uY/09
         SQWL3UlYkCkjmZQHPYeaiLKVqhiOVriVybyv0dorl8HOUi9ZsbLYeCSIeSxSUuabLj8s
         Gq2wm7+rYP3cS+zf2UrEVe/XrFFR3O8Ends8yvt7+VPLVIgSzSL4PGKftJZ4oUlkigQy
         zsj60o+/ABg+uol8/wt30vnuD6QW6EeIGaKkcLm+s16/emOS4TI3TPv8IsoUYiMvn4Pw
         LuGD5gXf3JXaxFlBfR0b/YWi1D0c02iX58dfWTZ6cJfXYWAysfGdJoTxZJrTyqHMmgMh
         Tn6g==
X-Gm-Message-State: ABy/qLYiVYThp8NoTQ+dvbEv9Skvrjt8B5mBoB6gBKFp09I6aO0OUFYu
	cZ4oXvL1Yt3LHlBhvj6Ul4BJ8JnODXtFHURIwdQ=
X-Google-Smtp-Source: APBJJlHvsK13b62FvJvz7EeMQ9BWLZRuFty59YpaVp+zIgtIzJDpDx1Nc6H8xatzJEbmeiF35VyIwQ==
X-Received: by 2002:a17:903:1206:b0:1b8:76d1:bdcf with SMTP id l6-20020a170903120600b001b876d1bdcfmr8664424plh.23.1688456328956;
        Tue, 04 Jul 2023 00:38:48 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c27:7dda:723f:1e5:4fc9:2921])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902bccb00b001a0448731c2sm16472424pls.47.2023.07.04.00.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 00:38:48 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] c-ares: Correction for CVE-2022-4904
Date: Tue,  4 Jul 2023 13:08:33 +0530
Message-Id: <20230704073833.765396-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 07:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103656

From: Vijay Anusuri <vanusuri@mvista.com>

Correction of CVE number inside the patch

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch b/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
index 0a0e8f0b6..fb0aee372 100644
--- a/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
+++ b/meta-oe/recipes-support/c-ares/c-ares/CVE-2022-4904.patch
@@ -20,10 +20,11 @@ fixes #496
 
 Fix By: @hopper-vul
 
-CVE: CVE-2022-4415
+CVE: CVE-2022-4904
 Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/9903253c347f9e0bffd285ae3829aef251cc852d]
 
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
 ---
  src/lib/ares_init.c    | 4 ++++
  test/ares-test-init.cc | 2 ++
-- 
2.25.1


