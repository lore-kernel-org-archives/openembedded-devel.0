Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9F4E9D3F0
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:49:48 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22038.1770216586555375762
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=g1ojKv1r;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.43, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6580ec94bcdso745267a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 06:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1770216585; x=1770821385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YNnHBe/OBPAhT2SD1BmWai+S5BPOpsiYfehSg8w/ScA=;
        b=g1ojKv1rBMjJRjts1k1wxWxamgy/54LN2JMlM50dlelEiLp6MrNVmCyyR4UosaP3Vl
         akMPfmlS6gAyaJJhXdD/kgKi+uiUiNPHATz2MbrBiZpl6jtCD6esnAuT4+sDoyAcDQ4X
         96GMXbdVVH5GsglMFrBF6v7hkFZIA9Z2WtoPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770216585; x=1770821385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNnHBe/OBPAhT2SD1BmWai+S5BPOpsiYfehSg8w/ScA=;
        b=VUnPYbgVBp8hPqG01kLJEObv5w7eqfZsn5UMmP4v2nZvOuHOsLiQzNFCoObgnif+zR
         d4IefhT/IXsaZoKjKP95XTr2l8FqC/86FKE9L/IpDtpXPc3nm5rxmJ25E+uY9ZYuQWoO
         /M1iPh0pBnxuWbknCHZMFshSpxW/A66kWjtQ2xr6fbpGdxHowr3hQZvhZlxS3CAGeDl3
         JLWsJRFTvCiTOWfFHXO1VFK/+QUZRt4VorGMt50E5vYoZLn2PwvAFVM7XPyeDKzx0B1r
         jjZypU36zf/3r+ZZEUI1ITX9Mqa25woqDxUFQ5ZivlYNAugjtHMls+d44YVXpBJHZ0+Q
         TFUQ==
X-Gm-Message-State: AOJu0YyU1ALyR6xtCng07e8vgw+ZFqdX8elAmJ5ZIqXuw/SAoGWRtbbS
	2nUNMZe5vqRD/Dr8trWt4Xbl93UvOvn5RJgiolq9OE0gHTd2gyZAp5EVdSqRdhKWHA2+Fa8R9f5
	oiuOw
X-Gm-Gg: AZuq6aIlbEH4ejQgY9IMyjEoWoyF7mY9+5FdrSc3c3+Bd2z2+HRNHcPWloy62Vm3ZGT
	8oepbjMWet0dKiLJHAMGdQGjlhbYZz4td5BCy2IQexOL+xm4ar9kc0PHoFNAkodGqAjSId3hC3Q
	bLfPaE3cazXs+OouLCEGMIsEcAR9Lcbv3T2YdW2+dgjutZ4MSW1lFBjFiqtFee9iUntd4tZFYvn
	fbkYFSB2nfM+6DIvFLUBcRWElJnYzCaoHCge1bOIuM9kdPylITtLxCQuv7k0F3AUG2DUEqHxwSV
	5x3jTVm2h5PG1vm8tsVWH+y1pRjDLgZrTywbJPiMQV5FhnxFy4vR/ctGEm7ZmpH/obqbBFrTwYt
	ORCMWov+FxZTpNfd+p7BEsgxEnkRoUprLeDGfQVRR5gemiDld2Bfk7b0Xx3szlPqapcnE+kneP/
	RONjejLjrsXtkLfpwwOs7goc9Lxzb8sFZBcnZVqioiItnrsBq+afM0Qn6ubHjEb/jkwGl/Mg/l7
	Pxze6RQ2bYH/8Bge/6pmzZe/CBJ4myZbKqxgLQFYJly/fdvyPfm
X-Received: by 2002:a17:907:980e:b0:b87:1e1:e562 with SMTP id a640c23a62f3a-b8e9f6dc46cmr136816766b.8.1770216584552;
        Wed, 04 Feb 2026 06:49:44 -0800 (PST)
Received: from adam.arnhem.chello.nl (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9feeff2bsm132889666b.42.2026.02.04.06.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:49:44 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 1/2] libtsm: upgrade 4.4.0 -> 4.4.2
Date: Wed,  4 Feb 2026 15:49:41 +0100
Message-ID: <20260204144942.2166411-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 14:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124130

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../libtsm/{libtsm_4.4.0.bb => libtsm_4.4.2.bb}               | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libtsm/{libtsm_4.4.0.bb => libtsm_4.4.2.bb} (92%)

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
similarity index 92%
rename from meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
rename to meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
index 074302bed7..8249826ce2 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.2.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "xkeyboard-config"
 
 SRC_URI = "git://github.com/kmscon/libtsm;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "0d33498a6de3619628f7802a0c76fc98c8773d5b"
+SRCREV = "b052e48cc776be1cdb940be2dcc1603457c01c96"
 
 inherit meson pkgconfig
 
@@ -31,3 +31,5 @@ EXTRA_OEMESON:append = " \
     -Dtests=false \
     -Dgtktsm=false \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.52.0


