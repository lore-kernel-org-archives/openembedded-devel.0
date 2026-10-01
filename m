Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04118CA5FA5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:06:50 +0000 (UTC)
Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7526.1790849202902011041
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KXUXCMck;
 spf=pass (domain: gmail.com, ip: 74.125.227.166, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d719d99dso10994795ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849202; x=1791454002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1+SGVcX3SPcHgZcOrpgV357Rno3SXcpXOC3+tbOYryY=;
        b=KXUXCMckxUkimp+ltrfnYodtFvVu+1RGPwt8Axbflwe7ZxLASErUi5xW9WMJV93pzx
         OvSTiYryY1P9ZlW8rXd3v4Cbuc9vXXKx4ITdrigpPJLs0Zc9RvwvYOM1N3dCd95W+ovL
         /HMIp966gVwlHemBHENMIAcXr3iOVgVi5VtUcklFOqhG/50muVFCHfFX2aMGr9DOL7sv
         FLPUDFigyva2518e96aYAzxn9QzGWdnsHTuBrCAbP3xKRzkX6Hfu3XuIoaGa9AX1jZaj
         dq6aWGsHrMOcJnpKpuG+hpv93cbgQcLXQOjypG2ELhk1BWdR5TXXybpR3kECtIJvTafN
         C+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849202; x=1791454002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+SGVcX3SPcHgZcOrpgV357Rno3SXcpXOC3+tbOYryY=;
        b=gFpdKtizHGv0M2EI5hS3ep1YEC+9LGyxeI5oheS8XQb5AqVMFS2R8Yy8zQzSls4qIt
         E0aIO/Sa+vNkmhdaA/JgNN69MTrgNIgeRMhpSJipn7RGV/xfQaJlJllSMC3BBmmCuFAp
         80nWRtHvDdVh7jZkblc4yF3HsNORVUSkt7qcQ6fyB5upwQTeAGkosq/rpSACya43DMVE
         IinP6Odcy/Ow0sHG6MfjMhgnGFejepkUBo4Vx0pjowQewTl1VBcZUcdC0lPAL+1EjnpQ
         K37XtKPwz6Nwlu+6YWzQGKIWLT1Y7QUC3Lnw0Jiz+26dw1LAI28UGM7a1CVghvQipz8k
         xAeA==
X-Gm-Message-State: AFq9FYL4234MB2/ZnoRZjycEK1pgTQhejrpQEbGDv5bRKW7S37KUscdD
	o27WFNZbW0I6mzR+W+dMT6ZIjATuM3bZN/X0ddS+NWvJUZhx7g8yeo/y42hEHw==
X-Gm-Gg: AYBFou2UzYRIFFe3VBBnIjBX1KK3OCks6trwJC4QNUt/Jn1qaCDclDD+hy/ZT2mXpQk
	DLib+gIfFMUxTcuEj41lOGbT6FA+nlgDvvGFt877UgtgYyT/bUGa5eMILlOCpZOIX3Qq8JbGzaV
	jW4F+of4jd7rSO2PE1GqEaRoo0DAGBbStKKX8FmGy8+3bCZRsKDTPLn+6v+3ZesDPOqFsoiMKBM
	zEsCotNvHbRyAB7X0G2AS5/Ii5SvpZa3LPF50SDvsi7S9VodhG0rIiDACA1hUw72N23aIBaQEFJ
	eklBfdyU71MuOqYzvPMdIkOg7vxG/iosL0OgbpiDAcEorzbVdM9MVGsENj9uiG0SH99hRCB8h5O
	G0ZH7xcA1CNvo49sMZebtrd2uU5vIzudGHUjh9YdOMFNLMTimtYixEbJ4WpdHup5GDMx+U3BAHt
	8CBGPYeD+eLC04ghro9KeLd1Og0wHz5zXWQ79w0uyRRskjn77prFbvjk9M/act1zAmBTqVyfQQN
	oZF2n3saU0ruvM+2eYK2ls=
X-Received: by 2002:a17:902:db08:b0:2e2:db9f:3e88 with SMTP id d9443c01a7336-2e2e4b85249mr32540985ad.52.1790849202166;
        Thu, 01 Oct 2026 03:06:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30058a6d7sm8697765ad.4.2026.10.01.03.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:06:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/11] pahole: upgrade 1.31 -> 1.32
Date: Thu,  1 Oct 2026 23:06:24 +1300
Message-ID: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 10:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130567

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=v1.32

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-devtools/pahole/{pahole_1.31.bb => pahole_1.32.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/pahole/{pahole_1.31.bb => pahole_1.32.bb} (95%)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.31.bb b/meta-oe/recipes-devtools/pahole/pahole_1.32.bb
similarity index 95%
rename from meta-oe/recipes-devtools/pahole/pahole_1.31.bb
rename to meta-oe/recipes-devtools/pahole/pahole_1.32.bb
index 62f053b6aa..331b93abf6 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.31.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.32.bb
@@ -9,7 +9,7 @@ DEPENDS = "elfutils zlib libbpf"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
 
-SRCREV = "1f2805b6eef104df3125143c949b391f6122e5b9"
+SRCREV = "fa725d687ce3a712ef296b46bc63ea57ef466014"
 SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master;tag=v${PV} \
            file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch \
            "

