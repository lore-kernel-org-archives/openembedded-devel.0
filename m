Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68661C3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 10:00:57 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.39271.1722420051809340106
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Jul 2024 03:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bl7sECPj;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7abf92f57bso715838466b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Jul 2024 03:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722420050; x=1723024850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dBG3igAh5B9GhSF/0HLZpK4sIsgxrFIvuYvcYMDRVYo=;
        b=Bl7sECPjDkCC3xwbgwyltmmWuCyaIwAm75UzFDuT9PdrRhQSsElZ0Onszpvcc/H6n0
         fd9CcByweyoGKePz0DaFZBHGR+A00iRI6QUmFCkyPrVg1akT3Kkco3qnqvNgnJTO96QC
         c6p3DUMskLEHoNHq5Ty3bhg2mhmgDxNexXZxw3PDjMaSe8tYJ4sDy9ehSHUBSQWQHM0U
         Sxkl8U6uSs+6pbRbjbk95ZST7MZygWzWjpUSIR+SebOn0xVtGGuczXs6phEk/wQqRTBg
         gCTy63VJiaaooOcH81wiiIEeYWpuTkGfb21cEGy1ILeevPv3Cnlb6UCTLfzaHl1UiJyU
         kpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722420050; x=1723024850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBG3igAh5B9GhSF/0HLZpK4sIsgxrFIvuYvcYMDRVYo=;
        b=KRyae/c/RoNBeHwE6MIIF99uUNHTxizEqYboyKO6oi4v0qK06zhvgA6XeAKj4R/RQF
         xAlv2DWfuB+8EVGajyLHQKArClnWq6gCmXmtz8hYecd8UW58NgkEVeNj6+doPQ+/CIK/
         NectfwFAdCPhWziTKX0BJ2/4Fhr7mGH0f/BGMQLGobTEVJ/OgB7zWp8OFFpkECDnJXFA
         KlhoHqf+5IBFvyr/PtXveE9HKIsB6012KtYH2fnTyb+KtLTvVOdUlo4pHw3PT1i8UERo
         vvri3yhYMPaDYM49Ct4VuMP7TqeiJnU274ic7TbEVNUI/e2kv3HE1RF2PeYVgoP78vf5
         kp6w==
X-Gm-Message-State: AOJu0YxWZHI5k5v8SIVArH5BUgp8LyyzrSGHyx5/KsXk/co1qkngRlW1
	S3psmku7CYFI7kbJ9Gg7SylLurbfMdrp0dB8Uq9TJ0OwO7cxBawK24SJNqDk
X-Google-Smtp-Source: AGHT+IHFMTb0ZhzRjThMdCQSkTNofn7sveIHRMpP/fhWO+4o6zK2XGT9M51azMvl5s3YtgB0ioQ/7g==
X-Received: by 2002:a17:906:d260:b0:a7a:aa35:408c with SMTP id a640c23a62f3a-a7d3ff55b80mr1001166566b.8.1722420047805;
        Wed, 31 Jul 2024 03:00:47 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab52d46sm743869066b.80.2024.07.31.03.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 03:00:47 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] tayga: Fix contains reference to TMPDIR [buildpaths] warning
Date: Wed, 31 Jul 2024 13:00:37 +0300
Message-Id: <20240731100037.63887-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Jul 2024 10:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111485

WARNING: tayga-0.9.2-r0 do_package_qa: QA Issue: File /usr/sbin/.debug/tayga in package tayga-dbg contains reference to TMPDIR [buildpaths]

Make sure that the OE provided CFLAGS are passed to the compiler.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb b/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
index f6b58559d..f36435c8e 100644
--- a/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
+++ b/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
@@ -12,6 +12,8 @@ SRC_URI[sha256sum] = "2b1f7927a9d2dcff9095aff3c271924b052ccfd2faca9588b277431a44
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "tayga.service"
 
+EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"
+
 do_install:append() {
   install -m 0644 ${UNPACKDIR}/tayga.conf ${D}${sysconfdir}/tayga.conf
   install -d ${D}${systemd_unitdir}/system/
@@ -19,3 +21,4 @@ do_install:append() {
 }
 
 inherit autotools systemd
+
-- 
2.25.1


