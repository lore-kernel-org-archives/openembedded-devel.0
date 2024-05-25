Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FAEC25B78
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 07:22:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.7120.1716621721490333890
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 May 2024 00:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=zMErJpfc;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-420180b58c3so74041875e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 May 2024 00:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716621719; x=1717226519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aJcSQViLTjySoL12aQhu7BSKhCkBY/lY/G5AfVSp5Io=;
        b=zMErJpfcHoT9J3Khvo3+fDDHvlt7MVYQ4dBgcSCQ8pscRGaNXuNiSq6LF1dHsa3dlh
         Q73Xfpsjm+0JxoGuzh0tZl9ealt4k0twtfhF7fXYTMqpSKuXsj5sZclOUXokp/L4BwID
         YTnq4Nt9uMsKc2m//P1sGWG11ZFT3i3+UOQ/SnRLST/vMaQdtk4NGhfWL7ZN7QKhQ56W
         ud40R2zQyFCjfaLBEldlFU/wHOemKWQfDFEHjkeAOMrJX6ehUGjQXx1mrQ7q9mm4xOFC
         y1Rmee03stWg8cTYko1GekqZXuwnLYROBoUz8/1bv1zGpgS43kxz05pnC9yKMXVuCJsV
         xBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716621719; x=1717226519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJcSQViLTjySoL12aQhu7BSKhCkBY/lY/G5AfVSp5Io=;
        b=lN08yJgYDhq7H92mcqcMwPLfPSx8kSPWc8m2jPVhYXQJ9AxlxHt2DQ8XnoXPXuQKCJ
         jop5a95PqiMKG5np/ZKhHGMKxfWGTTfKcufjz5cG7NpWrVnYYJRN1vm8lMz8axhOZ2Bj
         RLPb+z+4cmooNSNnHL0rVjB6eaB+PWtx6iYwRY+/JN0SLz5wFN0Tbcc817fXDLxHFoYi
         k7FtnvImDTHa7Go3zaReEK05IdVMlj0Cf3zg3UGPdVjncXU82rAmOro0VM0mwhCSEwfB
         ey8J0uF54pepwSV6k6nNCkw3HumMVdbqs+gkJxuxPhsyNLnKqde3ACKz991F/cXS+mT8
         r7mQ==
X-Gm-Message-State: AOJu0YxqZ1QRh15lV8z4Vm58C1iLK42cgsMP4FQuHEZfJxqSV7gPZjDS
	XPr6WGU76MMw01EPKWoWcEXvoIa43HGzMMn2QuVUOXMZzxYfIPOUclM7fu8MIeDJ5W4SFwhFPLx
	9
X-Google-Smtp-Source: AGHT+IGVWWw6WEtayc4m53dPJkHtaCYaPx6BJCuUYUwwmbXiSMCGMa1S84Azw8ZhAI1ja2j/FLsXug==
X-Received: by 2002:a05:600c:2282:b0:416:bc18:2a00 with SMTP id 5b1f17b1804b1-42108aba991mr34158685e9.38.1716621718674;
        Sat, 25 May 2024 00:21:58 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f1399asm72793405e9.11.2024.05.25.00.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 00:21:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Dan McGregor <dan.mcgregor@usask.ca>
Subject: [meta-oe][PATCH] libfido2: remove non-functional native and nativesdk BBCLASSEXTEND
Date: Sat, 25 May 2024 09:21:20 +0200
Message-Id: <20240525072120.2058734-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 May 2024 07:22:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110531

libfido2 depends on udev and libcbor which do not exist for native and
nativesdk targets.
Remove native & nativesdk from BBCLASSEXTEND to avoid hitting these in
world/universe builds.

Fixes these warnings (as seen on AB[0]):
  WARNING: Nothing PROVIDES 'nativesdk-udev' (but virtual:nativesdk:[...]/libfido2_1.14.0.bb DEPENDS on or otherwise requires it). Close matches:
  WARNING: Nothing PROVIDES 'nativesdk-libcbor' (but virtual:nativesdk:[...]/libfido2_1.14.0.bb DEPENDS on or otherwise requires it). Close matches:
  WARNING: Nothing PROVIDES 'libcbor-native' (but virtual:native:[...]/libfido2_1.14.0.bb DEPENDS on or otherwise requires it). Close matches:
  WARNING: Nothing PROVIDES 'udev-native' (but virtual:native:[...]/libfido2_1.14.0.bb DEPENDS on or otherwise requires it). Close matches:
  WARNING: Nothing RPROVIDES 'nativesdk-libfido2-dev' (but virtual:nativesdk:[...]/libfido2_1.14.0.bb RDEPENDS on or otherwise requires it)
  WARNING: Nothing RPROVIDES 'nativesdk-libfido2' (but virtual:nativesdk:[...]/libfido2_1.14.0.bb RDEPENDS on or otherwise requires it)

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/367/steps/12/logs/warnings

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Cc: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb b/meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb
index 08d3f4e84d..d453d0ab97 100644
--- a/meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb
+++ b/meta-oe/recipes-support/libfido2/libfido2_1.14.0.bb
@@ -21,5 +21,3 @@ EXTRA_OECMAKE = "-DUDEV_RULES_DIR=${nonarch_base_libdir}/udev/rules.d -DBUILD_EX
 PACKAGE_BEFORE_PN = "${PN}-tools"
 
 FILES:${PN}-tools = "${bindir}/fido2-*"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


