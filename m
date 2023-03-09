Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61229C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 08:10:49 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.8319.1678349442132946231
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 00:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eXtM06ze;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id cw28so3674868edb.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 00:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678349440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zid4GaCLqDEo4vsXpmXpx2nnCp2LRwdqS+enfWdYj8I=;
        b=eXtM06zeomMYZseH0Yn3+Dp9Fpm4OJU5AVs5QOSguU2PxR70Rz+TNX7jPujJTFHt7o
         uuce4hrZH7EjLNMEy5d68m8bhAC27fP3zcOJb4/RryY0X+u/KghXnYjJ+C/BSYMd/UvX
         sVcUc+Xfz2ufJcrEPxnzawogKeqxQLw5OJULkPBHZq3kiHZtkvJs8ujTCPPwwTZrMk41
         EVXhmFNRyDQA7ml2vbPaLw9uKaYgnZyhCWymrhX9PLyG95swyRo9x71PhpY4SHiWrP6I
         cQG422aYSvHN/a6bxcwvfPIodre/caDKNjYI1QVxr3OdEYnu7hwvGyq0fbU+7lDmsGnl
         m1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678349440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zid4GaCLqDEo4vsXpmXpx2nnCp2LRwdqS+enfWdYj8I=;
        b=xs3oFq9PdGcaguXLqPIM2JH334kmkdz3aGqx6U1DAmIxWvR8QmQM2zb0/YH8x4pjIT
         9CgB1CGTtMAApFW2vzCuwHuXKvVvDinvcHmrVDLeCNp5RddFIKv7pXw4Y4c6rhSVBs9A
         5cO1NXks96LSW9g5LL5cS0lX4HOTm7D9FcbdkM26sZX1AWCja6spsh6AEzWG6YVgPdG1
         dwy7FaDr+qhW3D3wUglvoMnBUGnZyurmBDkodk1ilKcENyQy8p9nH70mfh3T1gdy60eG
         qcs1FI3SH81MJ3s3PMpBCznFxn714ZWl+95CG+bcK3pcayGOYtAeYDwCt55nVPiaXObX
         hO4Q==
X-Gm-Message-State: AO0yUKU7rfqEwlsDQS4GKi08D7zBI+Fiex0vwD3dcOYKucvhMvg6WGGT
	eNqr8krRA82BMoY+Is54lMq9AioOeJ2rFg==
X-Google-Smtp-Source: AK7set+Vf/nxMorhZ5eyaSygyYlv24OtMecyr2hUS7H90KSM9qt28qcuYdLb2Wzlgc9wKpHb7+j+tw==
X-Received: by 2002:a17:906:308e:b0:878:7a0e:5730 with SMTP id 14-20020a170906308e00b008787a0e5730mr20876270ejv.56.1678349439928;
        Thu, 09 Mar 2023 00:10:39 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id gw20-20020a170906f15400b008b7a9ff7dfdsm8435710ejb.162.2023.03.09.00.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 00:10:39 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 3/3] meta-oe/conf/layer.conf: Add PREFERRED_[R]PROVIDER_virtual/opencl-icd
Date: Thu,  9 Mar 2023 09:10:36 +0100
Message-Id: <20230309081036.3179583-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309081036.3179583-1-zboszor@gmail.com>
References: <20230309081036.3179583-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 08:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101437

Select opencl-icd-loader as the preferred provider for both
build and runtime.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index a1f50879e..aee1fa786 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -50,6 +50,8 @@ PREFERRED_RPROVIDER_libdevmapper = "lvm2"
 PREFERRED_PROVIDER_android-tools-conf ?= "android-tools-conf"
 # Configures whether coreutils or uutils-coreutils is used.
 PREFERRED_PROVIDER_coreutils = "coreutils"
+PREFERRED_PROVIDER_virtual/opencl-icd ?= "opencl-icd-loader"
+PREFERRED_RPROVIDER_virtual/opencl-icd ?= "opencl-icd-loader"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   fbset-modes \
-- 
2.39.2


