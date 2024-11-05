Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F8FD36107
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.27777.1730831949171862326
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZDmYBm2m;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e38fc62b9fso49954867b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831948; x=1731436748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ITGjFWIya4kUXYn1FWeL3WGrX63HRNSR+bSAOxQcf4=;
        b=ZDmYBm2mtkJLKA+E/TuMtnPqJbuVpx7feqVl/ACx6bSBGu83XgYSZFp9trcfdvAMfQ
         JwCGGWGIOKcTtTGTk1QTS4eMCH9cmQvEu8Vr+DPeU36HgipRjXPIswfreTFlwIgaTKPw
         3RaEtx03bJFhvW9o1CLdVVanHeKct2NeoBoYkJHNckMOp1/3Fw/ZGBolBBjrBHR4TD1Y
         LGbucLqBF/ElYFWvKrBtX6HQp98z2HehvmHU04Q+Svt0/jzaIyEo603cVBUtTmZdpAze
         /zrg+/3Ckt3eXiPc5qwyvwQJ3mQO2gt+JEVLPZwsZwgvO64WV2RhgjABeLlwbd4GsQ/H
         LgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831948; x=1731436748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ITGjFWIya4kUXYn1FWeL3WGrX63HRNSR+bSAOxQcf4=;
        b=VDhtRj53QPDaVXfM7nYLVDGuKFgvqSunIaJ+0DWHizd4cO3C48bqVSAmRAhG4VTsFq
         E+vd5a5uZMRMTBsGVR7ztrsiX645AwzJ2UOKGDnHMTM3wvK0gdwzb5TbYNBGz6wqs0nf
         Q6zdAn6uNP1v6wGDQVGkDSFwXgVWy+bGZmdsOwnW1drCXPrbSRBokbvUUgWwhT7b0RbK
         zoeM54v92DWIrAXx1xVIdDCxRG/btgRMRVdA0RSkqPo4HDGP4lR6PWC9WBL9x0KxqOrO
         oMn+HlY/R8K9aTb874oH7Km1Xn0kl3b+Salkb3bpKQBIZX1d8Hc77pk8PvzgzrMGu2c9
         TD/Q==
X-Gm-Message-State: AOJu0Yyfwd+MequXfNifxc6AIBEeCvtAmY0hSvPj22BDt7RLzCHaC++g
	XvV5sR5jtFb3JCziMPmnpFx80RcHNu1FNOVTJU2GDU08IrpQFR+w3PCZknSQ
X-Google-Smtp-Source: AGHT+IG0V0n720troy+qU9aLIsqNMmy7WZG90pf5NYiL3OAu6reCNMCGREQ5A0BBelfJqSI4xlBrcw==
X-Received: by 2002:a05:690c:315:b0:6ea:807c:bba2 with SMTP id 00721157ae682-6ea807cc08bmr102551037b3.10.1730831947860;
        Tue, 05 Nov 2024 10:39:07 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:07 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 085/161] ttf-liberation: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:26:01 -0500
Message-ID: <20241105183658.34982-87-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113600

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
index 6d7ba11e7..188064c37 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
@@ -18,5 +18,4 @@ FILES:ttf-liberation-mono  = "${datadir}/fonts/truetype/*Mono*"
 FILES:ttf-liberation-sans  = "${datadir}/fonts/truetype/*Sans*"
 FILES:ttf-liberation-serif = "${datadir}/fonts/truetype/*Serif*"
 
-SRC_URI[md5sum] = "77728078a17e39f7c242b42c3bf6feb8"
 SRC_URI[sha256sum] = "174cf27c57612971434ec8cc4a52bfd37bad8408e9b9219539c6d5113df6ff8f"
-- 
2.43.0


