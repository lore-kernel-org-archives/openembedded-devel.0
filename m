Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5869DC4167B
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:53:07 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.57813.1702626778117394058
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BMGWJuS/;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a1e35c2807fso41088066b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626776; x=1703231576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+tTv393kXZiAnB8d5+Zw+5kipYKThsaZQWVZ0xGRN8=;
        b=BMGWJuS/tyJJmEn2L3048RXnsflYXppyEJSO2+60j1NH/2ptBibaECPfCgdSCRvetB
         0A+pxdUVI751lIUhg3u6zSSTF7/wuhXxfWXDcEcAEptnnDOadCiLnQ4BZjqz/nBIkY2Q
         q+7yV9TmucTkPPnDNjcga3dOLuz0wyBO+A8oRnKBvSirghbSIIbbm2S2kz5J7p1zmvZS
         93TA4ZbqLCMK8QpBDPeZwK6pmf1ExGFMI2l11loERpTihyjj3HRVDM0Iw2zMqvgRQhFR
         9Bg83meLbvbqPtXxiZXp+KhIEtRuNx+gU/1I2v5Y7aug2stnn3MEAKTjGRdyOy+KLMCb
         ho/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626776; x=1703231576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+tTv393kXZiAnB8d5+Zw+5kipYKThsaZQWVZ0xGRN8=;
        b=CgtkEqVAesfMuXJ4DLDpSgnCyugBHj7egzCLCyyOomjD34VZQnR75b7lM6ARpDpdOM
         DhOcs3S7o9b48Y9L1uMWo2xpVnrlMb0ub2qaNSNCGAc4iJqr6T+lDvNXMwu+n0W8se/v
         zOAlMOH36EBLq0CozbtPIXcgr3Re+IUEtAfBQ6PNtk4hZpRY9i9MiHSa2/1Iew42NnIV
         bnezhJF1XP1ioUXzafbgG7qGG3qvduboD2MFURu1KpazqStNZqzxKlABzSzIfMmE/8xb
         /kgOFftMpfCxz/Sm0eDnos3G2CxZa70qFwK1cXYbPUZ9FkzXYXsjU5yOx70sRffiHmO2
         GBYw==
X-Gm-Message-State: AOJu0Yw6LhibF8NVHwNLZleavtMfpwWyu1+eTSd/OpnYivo+rzeKfE3X
	lqzqADl7RXaQmrj7fuuPBi8S3RKD9kU=
X-Google-Smtp-Source: AGHT+IEQI7l2uLiFm4NXOtEC90q+iGJWOqz+LOq5bCTNJYXQzO+87cQhbKOLvh3ySPKCGdqgCl8nDg==
X-Received: by 2002:a17:906:dc:b0:a18:7929:f64a with SMTP id 28-20020a17090600dc00b00a187929f64amr6050653eji.19.1702626776384;
        Thu, 14 Dec 2023 23:52:56 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/20] libplist: fix python 3.12 compatibility
Date: Fri, 15 Dec 2023 08:52:37 +0100
Message-Id: <20231215075239.3049865-18-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107511

Ticket:
https://github.com/libimobiledevice/libplist/issues/247

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb | 4 ++++
 meta-oe/recipes-extended/libimobiledevice/libplist_git.bb   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
index f636990f8..3eefda733 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
@@ -22,6 +22,10 @@ CVE_STATUS_LIBLIST = " \
     CVE-2017-5836 \
 "
 
+do_configure:prepend() {
+    rm ${S}/m4/ax_python_devel.m4
+}
+
 do_install:append () {
     if [ -e ${D}${libdir}/python*/site-packages/plist/_plist.so ]; then
         chrpath -d ${D}${libdir}/python*/site-packages/plist/_plist.so
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
index f8e7f98df..0142bcbaf 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
@@ -23,6 +23,10 @@ CVE_STATUS_LIBLIST = " \
     CVE-2017-5836 \
 "
 
+do_configure:prepend() {
+    rm ${S}/m4/ax_python_devel.m4
+}
+
 do_install:append () {
     if [ -e ${D}${libdir}/python*/site-packages/plist/_plist.so ]; then
         chrpath -d ${D}${libdir}/python*/site-packages/plist/_plist.so
-- 
2.39.2


