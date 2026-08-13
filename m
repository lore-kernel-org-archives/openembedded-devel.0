Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD557C5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:38 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28116.1786651773512479477
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hydVCQXw;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbedf318752so157472a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651773; x=1787256573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FM69sVzQQK+FRLZF5chTNBBy+GtsLTIOEfg2Q9WUIDY=;
        b=hydVCQXw5VcaBs1N4YIKtGESG4vkivXfJ+s7rN/1n9fGbapxim+vqNYE5MZhnL8YbK
         CvOQX6Jjd79LDoSSXcSaqDbYQfc38PQCCzdXdAuVYDJtjh7pp98aVHURi2ACj4kOopPP
         GFS/lQ8FfDD/nr6GkOq4xr1l4kTSX3EELqsZZOB5X+PCuCGqqyZpN4jYypqThyEnOWUw
         FzHL/J2ORGeiG+LjrD4EQJt7KgU5eZ/9OY0zLe4WX0/8BS8HPMGtRxY0SmJidNx85rF8
         bSXoqb3zxre72wMmbGPHArddXuB2kBT6J4rzH7lxC2dvx1KFsTVLNDnF3BmrsX9R5lo+
         3DIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651773; x=1787256573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FM69sVzQQK+FRLZF5chTNBBy+GtsLTIOEfg2Q9WUIDY=;
        b=KYIcUIBMJ6eT5HoiN4/zwVTaMxxFGovwYM/am+ve0iylGI5IcvU9aLKSNGrL1mN9ki
         8r0wUhSeIZhopavuK+BBSdKjkp3O0JfKn++9TywTn2xd3KF2kEpHxysdgfZNluRxdRZj
         DWOIkoctlu2IEaTnkA7wTXFu4hDhN5FV/FMHf1hliBRlVkZpz9e27IfVhU3IG2q6sfZ+
         DRzuLCIUyqOWmzVeI/GVEbdJur/yms3wXkRi+ofNMjc5YnVaZ5560ZtwwlLrXX+LJkVe
         TQ1M9F+hQay11LYCYhlNzaGCg/EYNsHc4h8Y6sPCG4FY2gtolWfyjXRyoP4hm5djU4Hu
         s7Aw==
X-Gm-Message-State: AOJu0YxMRGML35UxJhYaZ7thWxzPG+N6Rkg/oQlGA650UeRDQfyvrz+8
	yEEBKKCEZGhl+JGgk3Ml7GwSLtDz2a4gIopGRqtYX3T0jC7nozZuaCxIA6W7Yj7x
X-Gm-Gg: AR+sD13gfFTiDXQrWMLo2Vm6iHfrB+aZqu0uSvs3SxvQVN0tJ9ALae4EMWH2TLdAKgZ
	jXZE2lBA2pV91mxROYORamRumbjh2xXW9t+ZyqDzi9rvRkQxk/auShvdIYvHkp6EJT+xWLFHLUH
	W2d0Ym2e22JCUcZibkeqWO/moFBlJp6xZk1sD549dThJA6R4Tzznl96kql1dbeuFa6N70HkKlnB
	/2aSUZ1ITW/y65KtqEKO9i/loECUko3lfbirHpgJdkNczujGQNNKVtwbkMMmMbt91zByc2iEwDZ
	BWXeWL6sMOt8CM8Lg8/g1f+dFv/3V97pOPd+nsB2MxD6fBaA/u6Tz0A4lMqUOUZcrWLKn+yt6H6
	aNbxlUEyNo8uP3YKwoOry9FjiY1QROwiQMbgFc1288Q7Z3hkHNEcv9aCnmn0MineKX2nqavHKwa
	oPhHPcUi4NdzrxQK9s8NF0p8/P/FFK07pp/3d+eB20IuJHEGxqiQVbO8Gm4ahyhuZlQOmzqODle
	6PSmSOcoPRsVTCvuOTy1WAy0PPC/JtrqpSxksRIXCZ/Ok26a1cwOqUo8hUbW2rD8J0LmNyGA4wy
	mDm8Eu94vKcUE42PNJh7DzRvH0sHVwYJfc05TZ9sg6h8KdD5F4+M0mVX9vn1dLV4RDrRkFMh82p
	v22Efhpvwc4JqaQjb46Uj2XwBk2P9ekRGcUa9CMjUdmEkmtUI6/saEQUa
X-Received: by 2002:a05:6a21:b94:b0:3c4:3767:adb2 with SMTP id adf61e73a8af0-3cc719fe496mr446945637.1.1786651772779;
        Thu, 13 Aug 2026 13:09:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 30/80] python3-huey: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:44 -0700
Message-ID: <20260813200834.1302829-30-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128974

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-huey_3.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-huey_3.3.2.bb b/meta-python/recipes-devtools/python/python3-huey_3.3.2.bb
index 47758ea655..19d2e59ef2 100644
--- a/meta-python/recipes-devtools/python/python3-huey_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.3.2.bb
@@ -16,3 +16,5 @@ RDEPENDS:${PN} += " \
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+

