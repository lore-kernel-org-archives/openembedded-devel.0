Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAF0C5320E
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 06:19:22 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.142239.1723789161973488120
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 23:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q62dwTqC;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-710cad5778fso1427772b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 23:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723789161; x=1724393961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPTqltY352ru/htW3E3l3vpmKRKm0JFUlO4DO4NzT58=;
        b=Q62dwTqCWPUgdkaY0hnvd5waM3vP275y0nTWFHd6s264I3E6v86E0Xv0wND/57QoLQ
         fpwZkp/1IV4lcRSTkjN4kt7p6jtfWcZ6pVgPLSOtOpO6VsdPViIagHugnNSG03zLT9p/
         PZpDGK7Wg5vq9t2lRFnhvkTmlOBCpnSU+JXHeONw6GE2DkpjJOf06H/jcX0FZy2JzOK3
         RdAqPEcBFGifPGwfHVx/FXJLEKYuMGXzZQ3gOr0QCAYdQS+Hvc+Cli+W+psuxToKvcln
         1/59emTAjlTDM4PWJ4tAmDzOMXCfssw8IyMLiArHVwc5XMkZucTtJvZaJd+sVKo1EmG/
         ZnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723789161; x=1724393961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPTqltY352ru/htW3E3l3vpmKRKm0JFUlO4DO4NzT58=;
        b=ocsSgwkVN80XcWT5Zu+8AzJ2pgsBb1L+jTy6roPjOU8q869N/8XCAo6aEPh7WtqYoH
         uc5/c0VRvcG3dg+bI4oz8R1axGay3X43O4CHWArXjmLSSt/FMVGFde8P3qPD1B0Xis+g
         c25mQs3qCdlrhtaSsII4MD2k3X5XEi3q8BA8bNzXlcc8kWp4hMPZnJsW94miMCS+ulmf
         /JwFI4WRW7ycxrlbAiEEk8eYt2lPePQ6eLr/Jh7n0x9k1KSnpFlkuJVkWegnvcFoGL2Y
         m6uDtudvUyiPkHM/4Qpng11nZu991Ruxo5olM6q8IG6bLby1tHlzc402eaVMG/UqSpT3
         U3Hw==
X-Gm-Message-State: AOJu0YyNBpn7MqSGmCWbARoB0YsuEAcR8M22wc1zSB9iH6VS0A/m5iaK
	wbUfrQ3BN110cGKiD6Fps+hD4cghgIhkftSX2kLaRrFv4Cr+JaOv3eARzA==
X-Google-Smtp-Source: AGHT+IGklTWBUSmnsnM8dXu0Xe1V5SahjJk8+w3GJXok8ygW1w3jgpZvQpK1v4oInNh4a2vUOU7rqA==
X-Received: by 2002:a05:6a00:3d01:b0:710:58ef:1746 with SMTP id d2e1a72fcca58-713c4b8f7fcmr2657656b3a.0.1723789161193;
        Thu, 15 Aug 2024 23:19:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af1be5asm2022940b3a.176.2024.08.15.23.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 23:19:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/6] ndisc: Remove buildpaths from binaries
Date: Thu, 15 Aug 2024 23:19:13 -0700
Message-ID: <20240816061915.2095711-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816061915.2095711-1-raj.khem@gmail.com>
References: <20240816061915.2095711-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Aug 2024 06:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111832

configure emits its arguments into binaries via PACKAGE_CONFIGURE_INVOCATION
therefore edit the paths from this in generated config.h before it gets into
binaries.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
index a827e7f42a..fb00b83516 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb
@@ -27,6 +27,10 @@ do_configure:prepend() {
     ${S}/autogen.sh
 }
 
+do_configure:append() {
+    sed -i -e 's|${WORKDIR}|<scrubbed>|g' ${B}/config.h
+}
+
 do_install:append () {
     rm -rf ${D}${localstatedir}
     # Enable SUID bit for applications that need it

