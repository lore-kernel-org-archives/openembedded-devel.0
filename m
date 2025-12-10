Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8884D3E763
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:49:23 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2029.1765388960884483497
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZwTYxdr7;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so46069b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 09:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765388960; x=1765993760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRwZHaAe0e/kVdvaA8LG/7rGK0ack5f4lqejzg1Ir+Y=;
        b=ZwTYxdr7n3RicnpUrXYLzdeWJgpY0lTGSzFfSoB0XxWgTkvmUTuHYnWjph8oWGRecY
         xkb0wk4h4NK8pn8i3MwhYcp777IwjVw4lu70wZV/6+ZCqCKR7r794lrdGlFpm2RNAA2J
         PnOo+PYrVpvWMBwUHYIvi4JBnamFBR4nsaPubSlGhovaZB0pqO+NrL8RvzunfEvSLX4l
         Q18xSIpguEt9Z/uX4H6V7Ay4HOmmPKzvYoSREN30Q2NyHcwwEFPs5MUb1osmePCvv7YJ
         jOsEhMSsOgT+cFMc73zMe3ch4FmffCRq0ISi+u2PK+Jeg3VVdRdIwFhUaWrcrQ4Od8Ve
         SEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765388960; x=1765993760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WRwZHaAe0e/kVdvaA8LG/7rGK0ack5f4lqejzg1Ir+Y=;
        b=pB+QlVtnnVX+IS/IJf300jmGGhNlvVMCnEPR1TJRtFUnIsgEo/+WAr2shskZg+iSSA
         2ndFJGoMkYEZFFCCPF+MrNqN/qAOJhDnUmUafvGdp/bCltvmaxjZKI82jTsLEbGBZUSH
         VeA89pOX6GLnCBquu8bQJ380aslBGCZgQwDzyYQuVehGDCiKqyG22SGasokM/No/pSvz
         rqezAPL2vb0yIQkDl03KP8M7lq6UjN/A5dmvDej4M91mciEEvLarZ41IaCa3MLwGbGza
         z+Oh8UNs2HWhdUve1thS3GSOWfxUZM5V/g1ph2dl0tnhwQeXJrG+AyXN+uaQOrZ6PKT4
         /OsQ==
X-Gm-Message-State: AOJu0YwmUMOq7aowM7r6dp/8px7lgY5+SnWpvHDYRr5A49JitJx2baeF
	2dp/owqxYe/ni6ZI8PLHy3XkFN098pr4edoFPMU7MY8fh+RXytABMQQVDdopRHKm
X-Gm-Gg: ASbGnctxFSz+RJbrFUkxv0ZSnvC3p9QO+HH8As/gvYxGUFZCAV7k+8jiYsNjO7vWMf/
	yL1uRWgdaqCuO5VhuZYPN/n5HTKNPpBC6nx3V6i50JN/L85oNGh0Nw0lZWQsLYv8hr9hILh1euG
	vW08QAsLKPFjRLOlD40inEotnPvzRSZ+RHVs9AohLghjQKQ9qTtGSUW8MxTM5QAjIBtGSc7fKuf
	ii6l+LEOsoYPUzad/RpI0nBC5/WECoSiutFQHbgJXg7LX5y4sCZ3/gLXx+XeKHe2EQFi2QSVyK8
	r/zTW/0i6FrljBvpHHzAYzkafYg0lr1MMDucAhQI969w++7AOCpXT+pSbGlo/gu+RsRw1p4ocwZ
	IrDCS5/+07ha46Qy2dvXdPdpC2Wa66YblIC3iusR60OLHgFNzSp95TcI/wcxuigYCIZGOHcNfxY
	SR8gVCt79p8jzr/VI7ZF5X7nkJeuP6s6jepA==
X-Google-Smtp-Source: AGHT+IEHHKFbYZYXkhO0kBdcrkbJy6JlloDhk2pJaLMl2tdnQFnmvm1z6Gh5IbCH+p4zIv4+OKwuew==
X-Received: by 2002:a05:6a20:7290:b0:366:14b2:30d with SMTP id adf61e73a8af0-366e31ab8demr3315390637.64.1765388959961;
        Wed, 10 Dec 2025 09:49:19 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c264211cbsm124658a12.11.2025.12.10.09.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:49:19 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 08/10] nftables: remove python dependency from main package
Date: Wed, 10 Dec 2025 23:18:45 +0530
Message-ID: <20251210174847.2828731-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
References: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 17:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122574

From: Peter Marko <peter.marko@siemens.com>

The recipe splits python code to nftables-python package, however
setuptools classes add the dependency to main package.
Since nftables-python package already has python3-core explicit
dependency, remove it from the main package.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 331126a6d0a48ebcf12069df554b3abacaeb512a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
index a2c6ce0e23..5ae9fc609d 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
@@ -42,6 +42,8 @@ inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python_setuptools
 PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'python', '${PN}-python', '', d)}"
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS:${PN}-python = "python3-core python3-json ${PN}"
+# setuptools3-base.bbclass adds this to main package, but this recipe is moving it to python sub-package
+RDEPENDS:${PN}:remove:class-target = "python3-core"
 
 # Explicitly define do_configure, do_compile and do_install because both autotools and setuptools3
 # have EXPORT_FUNCTIONS do_configure do_compile do_install

