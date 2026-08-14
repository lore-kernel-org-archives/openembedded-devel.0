Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BABC5DF77
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:50 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24383.1786747602743574670
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Zm8pDafU;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d049069377so16744935ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747602; x=1787352402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNMywwVbIPwoTFRkaYSNjrWCId6At1HDWznbh1FcI7w=;
        b=Zm8pDafU8Mf+i5YtVsPHEyiT1CEaZp3esUoFn1Dhqi8Movti5tijmykMS3NhaTXCy8
         LtuFD9l9cGOsBMPER8QFbAYce+BBoVZh71pKa3nQWGy8O2wy1+BSmTWRrvNxtZghpw8x
         K+Gz98vIRVqoLOO5+aTASpMpCOGLvSouuFlCZLOZp8h9IrjN7Z7k+AKrHKhn2cgP9z2v
         8Sw3UuCYfeysvLpRRHQ7O/OuBqI2NaU0iSC7exW951hpI8+FAmWUfqLQprgl+w+DlvIs
         OtrQZA5UhWiW3euDl8ivn+kJHcfWURaGF7rEv9pVoHNfZ7fCAbgLr3h4lN+UfyIa2V1E
         wzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747602; x=1787352402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNMywwVbIPwoTFRkaYSNjrWCId6At1HDWznbh1FcI7w=;
        b=hOjQStvDSB68Qi3ChOUTfkWBmSTgwqqYWoplgPxU0pSHX7tQCxGA+ZoRL32Ry0G9dv
         QO54wbyKDztuA+81Aa+9meXNeFh/AVvz3E80tQoNTje9m5qybZJvRzL0+cd6VQvVSJzB
         0h0qDPoKnFW3z9x0yJJUCADtgmkO28RF6yTMDzCOrkiAzfAfoa78EdCqGFfme3KvQHc5
         up4a+hqF3WgU/AZ45bbyw1madSfXF5jPigMTI9vweTBGnwgAglEvVftFn/cTu0uhC4eR
         iNvSCK93PbcH55lBRp7JF/Q+rE0SV2LosDoNd0aVZB56CQLWNjjwCiBqmxwzLXYLLRUS
         vI9g==
X-Gm-Message-State: AOJu0YzYUmAJl+3qhYcWxWdOpyOarrgxqK6eSvDPaekAqr6e7IVwbU1c
	KZ55ybaU1CqlExYLBw6y8t4nHlICXHtC2GF6dKW8y4qi1D/4MdmydU0AYkmz+kVI
X-Gm-Gg: AR+sD11eU/ECL2S2zwOAA6sHXkhecA54fJe+hsJNH4ArDrOVIK/fwEBtlNTp3Rg+wuH
	ygKp4kZlZapiSBv5ov47Maob1AYHhbvF2+9z2FRi0ncw4+J8g9lkYZMU350XwNOoMpT0mhiQ9oo
	K1N41jc/s4f0V02b8lia5/LOryvDby5+JdsYiJXEKTz/xdSdqy47Be++jcx3xqYOk0eSsNrcj2C
	pI7j3ZBG+fjmJFCUZLv9rg5ZuR4yWggby2H76f7JFMUTNiXOtcxx6gHevbicvk+QhiD6BTzyg+J
	du8Dy3EOu56net3BbIerboP5s9NtU5IYwDqDJrn6CiLBupqD1YDDbdObH6mNKy6W06V+Wo0jTrK
	nxqlU9LQStzI8W5CoMqNYhuJiaXvW3SWvvTMPbBvBsQowv6jGoAPw2DLS9xF1xXZD/uDX/LKWsz
	4fDdV9Gs69jzb42D/JgtxPlY6KHqRmN0RE+qtBMYdX+VrAIqd7ZVdLtqWuZp7uSda0NdtolZW1a
	vFZ4FUWnO3RnUeJI/KnBnTRKOu7djRvxUEfd8NVkyZD+CX9XJb7SU8/UFZXRQ7kwJGgUvL3mXZG
	qqqJcxZFMWgDWrcgPD9gcOdJxPIZ2geCFxfd5NCoY4UDnBsbd9ocuS2d6ECt3xX7Z0plTZR8err
	Idbjojr5U61x+CTD4Z806JyZ/XqaemdJO0o+Noa9C2fsagA==
X-Received: by 2002:a17:90b:2810:b0:392:7f74:58c9 with SMTP id 98e67ed59e1d1-3933b8f4527mr10269146a91.15.1786747602036;
        Fri, 14 Aug 2026 15:46:42 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 053/109] pocketpy: upgrade 2.1.3 -> 2.1.8
Date: Fri, 14 Aug 2026 15:44:39 -0700
Message-ID: <20260814224539.1523174-53-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129117

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../pocketpy/{pocketpy_2.1.3.bb => pocketpy_2.1.8.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.1.3.bb => pocketpy_2.1.8.bb} (89%)

diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.3.bb b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
similarity index 89%
rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.3.bb
rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
index 1fc0d0eacb..910deba386 100644
--- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.3.bb
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.8.bb
@@ -11,10 +11,10 @@ HOMEPAGE = "https://pocketpy.dev/"
 BUGTRACKER = "https://github.com/pocketpy/pocketpy/issues"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c292beb20a17db07c359b0cc2c039027"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=224889df377610675315e194ac59276c"
 
 SRC_URI = "git://github.com/pocketpy/pocketpy.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "e39e63191f004b61902ae3293317bd1e61f791f4"
+SRCREV = "a2f16e5f1f5fcc3b3d2cc1bdacfc3a027dfe2d76"
 
 
 inherit cmake

