Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AF0CCD184
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 05:12:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.683.1760764326287040031
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 22:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cBKPJMR5;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47112a73785so19347085e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 22:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760764325; x=1761369125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sq7w0MTsBfWVVOhf4lorSp7UJUcepkPRAuKPdhtkbTU=;
        b=cBKPJMR5YEM732BXAQjDdVLiC4kUzfMyKjsxCgvCfnD5SR/1pQDRJuu2TMGHNxZBSI
         +MqfsNhdP0uYzgO6me/icEEqpBEBzvvpUMBmgrQku0tadm5cyaxWhBRe5FiyfUEO4JNj
         eMTy5qN6YiI0DRcuQVJwwcvH7fe0Ix3qSBCaIUTjbKd4KcgZspt2PuWlGDDnLUuyxcHG
         26GgLVnxAnaK6Pv8mJDa/VMczFpZX+3WQazaFxbqj7p7CWtjY/JK9wmyX7eVWZnyZ0FF
         eszJcAAHNazX8XEWmuuChfPcnxKF+mvu7rWNZ9vqJVoFHMdTMxrBLH+8ZsTDPQjliIs5
         ftkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760764325; x=1761369125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sq7w0MTsBfWVVOhf4lorSp7UJUcepkPRAuKPdhtkbTU=;
        b=NK4FAFdqdrc2j5iJ0NpAJNbdbBaqIRskcTaM/2YiG8UEmyIKOyTpdG0wnvmX7PFoqY
         eLnr8jD3Vr6EXThJRyEi0VulIrMjRVCF+0oAuWF4jPdnO7z8BUdNt9stz2GrbpCuzDs6
         sQIV++fe/g4kCxyqHL/KbAz1hl0saSi09ca8tYrERpWZVY2Kmphkt1QRb8kfnn9pzrAL
         ruIfpNYXETxbrYPqB0p/lcC8ejYbwXYfnTxtVIHIMvqcIRDlXqaZ4ZfJpNh4gpPFI1Fd
         bLcyEtH3JQQmUzDgVHBqaQRuj5yq/MupcJ9OiolYnDMJg7bgfAIowEsk5nE/JgMKqsHx
         /5aQ==
X-Gm-Message-State: AOJu0Yw+HXK4jrQKL2J7mcxm3uBM8d8wCvPzpTZ+1BjZnQrSRU6rhCWS
	+r92YQ+A+UK/eaHE0+7wsxVQ/ihtg4km88W+1NwSod0lc7SuN8NghPdiBb1muA==
X-Gm-Gg: ASbGncvp989LBzmR7SoMbxvVeCQmaJz91XysKvy2Tp09HxZQbZ0P0DxZc6QNAU8J+iw
	xs4wnjt1ju8ThHYtWrI/0kUFoRPJ+Zoy0CLJ6tLQnheyBoRddJTlsidk3HrZ67s9YnFiIamR58+
	vVFVsqRnzHOImAjlO4EeQ6VgI0lX2WU4zLg7qTuyQOyHadoU3+PaEkg5YDa41CBjiBLWd+wa7VE
	SbXbflSqTpFNVseNRhWwfkQ6Qi0+W2Qtz0GpAZWDGxONvMBg6Y71WW4g2TGMZjfB1JzEvmAiVXX
	/F8kvzc2Uw/FDAkyWEGixkCR+4lgYyZRiBrrjQDdlWf1Nk3RNN6EHHqI84MMXNoZ4JCLPEqzcxR
	0lN08iMWiorhaFml2X8Cmu0HxHuSyh18hX2JdMQgNlEyO5WSCnL0k/vzZbvmsBrXgcs1bS5WqwA
	==
X-Google-Smtp-Source: AGHT+IHPnykGfa/Fofkg8CG9M/nE+CPuwh9P1T0nMbcLph2z71oQmmPliuD1s0f0vGk6eej+oz+Jcw==
X-Received: by 2002:a05:600c:34d0:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-471179122aamr45173655e9.25.1760764324479;
        Fri, 17 Oct 2025 22:12:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c82b8sm114368565e9.15.2025.10.17.22.12.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 22:12:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] libteam: Add missing dependencies revealed by ptests
Date: Sat, 18 Oct 2025 07:12:03 +0200
Message-ID: <20251018051203.3180887-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 05:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120780

From: Khem Raj <raj.khem@gmail.com>

Fixes ptests provided kernel has team driver enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit df35bef3ae6411900efdfc3ea5ade23820e9af2f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libteam/libteam_1.31.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libteam/libteam_1.31.bb b/meta-oe/recipes-support/libteam/libteam_1.31.bb
index ad84389013..c8397e002c 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.31.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.31.bb
@@ -34,7 +34,13 @@ FILES:${PN}-utils = "${bindir}/bond2team \
 "
 
 RDEPENDS:${PN}-utils = "bash"
-RDEPENDS:${PN}-ptest = "python3-core"
+RDEPENDS:${PN}-ptest = "python3-core libteam-utils"
+# Ensure kernel has these mods enabled features/net/team/team.scc
+RRECOMMENDS:${PN} += "kernel-module-team kernel-module-team-mode-activebackup \
+                      kernel-module-team-mode-broadcast \
+                      kernel-module-team-mode-loadbalance \
+                      kernel-module-team-mode-random \
+                      kernel-module-team-mode-roundrobin"
 
 do_install_ptest() {
 	install ${S}/scripts/team_basic_test.py ${D}${PTEST_PATH}/

