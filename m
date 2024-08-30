Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B141CA101B
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 22:13:41 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.3509.1725056013944729545
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Aug 2024 15:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EGoyS/8b;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-42bbc70caa4so8644795e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 15:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725056012; x=1725660812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ByjgvAjdgomV4ltufL+cewgr6SK/FIs0RprI3BhyhHo=;
        b=EGoyS/8bZU4TS+Z6nP/EIwzv5zSpuVpjl2LsqY0oOQawz94v6djtmkFUHhp58knocq
         U0EiVdA/wZ2I8ofO4qxlJjms4lc96kBMT7YM4DYz5v5KbjSVAaAYAkBUDfCmYjkQ5ExL
         kKXQ4DmJXP45oif9vXz0h4b6KK8W2OGnbA1U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725056012; x=1725660812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByjgvAjdgomV4ltufL+cewgr6SK/FIs0RprI3BhyhHo=;
        b=tO2BjzoS/EY8CfyoOwTj3pUh/I+ed8gBR/uEq5w2fLdZ/agahXJfyWBuemC58dUqAr
         PZJKueotn+LByndARSoaJhTHvkxR55teIzo+PMFoQwpX3PouXOTN5fYPfNsT+Qi10b0+
         eQlEaR3Ktrac5zhCsWz2sl3s3mlhgFOiGgYIcnn/9W9ct3M4ROaJ5Izz+YkE48+25x9q
         2r8reOioiL+02Os6yAIhQTaDhlHZhSZYGPdJQk5EjeQPSZGMVR3fCeYxGBQ3dRlNFnpD
         q+QyiqD0a8gP7o55ZGtkk4YKnxJB2YaKwf7wMY0IFNIFbBKeG/ntzwIeNol+CfnAQph6
         /UpQ==
X-Gm-Message-State: AOJu0Yw+Jephv06sPwK9MOQWq2uan/DIWJC2xoCARXfxxkiNUjJBd+jk
	QEV5GBJoBUSr7O7VhaKsHA41E2Wk9cpEYIzenqL8V3KnmsicY/bu7u+niyQdtcb1/0TMQIdhuXg
	dYge5zA==
X-Google-Smtp-Source: AGHT+IFKwNZvWDMpZnMHpHFaoiKPyalFpAZRk5dKhteZ5aPmwX4UmVsJJIUzO1y9uNQoQLtSDMtROw==
X-Received: by 2002:a05:600c:354b:b0:42b:afa7:804e with SMTP id 5b1f17b1804b1-42bb01ae418mr57513345e9.3.1725056011564;
        Fri, 30 Aug 2024 15:13:31 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df100csm57825945e9.20.2024.08.30.15.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 15:13:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-initramfs][PATCH] klibc: fix debug pkgs reproducibility
Date: Sat, 31 Aug 2024 00:13:03 +0200
Message-Id: <20240830221302.1429274-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 22:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112059

From: Yoann Congal <yoann.congal@smile.fr>

Debug packages of klibc-based recipe contains reference to TMPDIR and
fail to build since "buildpaths" is a ERROR_QA: For example, from [0]:
stdio: ERROR: kexec-tools-klibc-2.0.18+git-r0 do_package_qa: QA Issue: File /usr/sbin/.debug/kexec in package kexec-tools-klibc-dbg contains reference to TMPDIR
stdio: ERROR: kexecboot-klibc-0.6+git-r0 do_package_qa: QA Issue: File /usr/bin/.debug/kexecboot in package kexecboot-klibc-dbg contains reference to TMPDIR [buildpaths]
stdio: ERROR: ubi-utils-klibc-2.0.2-r0 do_package_qa: QA Issue: File /usr/sbin/.debug/ubirename in package ubi-utils-klibc-dbg contains reference to TMPDIR

Fix this by adding DEBUG_PREFIX_MAP to the klibc build CFLAGS to rewrite
these paths in a reproducible way.

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/40

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-initramfs/classes/klibc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index 202d132d94..ca50a3d431 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -9,7 +9,7 @@ CC:append:armv7ve = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE
 CC:append:armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 
 # klcc uses own optimizations by default. See klcc(1) man file.
-export CFLAGS="${TUNE_CCARGS}"
+export CFLAGS="${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}"
 export CPPFLAGS="${TUNE_CCARGS}"
 export LDFLAGS="${TUNE_CCARGS}"
 

