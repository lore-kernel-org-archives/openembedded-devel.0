Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB434C5DF6E
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:40 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28159.1786651835862699978
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h5bjh+fy;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbed97fa26fso146807a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651835; x=1787256635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iD+P8saIQaZmEZFiMIX9IjjF88/l98YjBV+1G2c+kXM=;
        b=h5bjh+fyW3o1Y7oCVkXZOsIma34bOOW14f3OYv/1ERevcm7vvgKzsefAF4H5HjNyoo
         66izfFdL0Z5y/Vn+mIX5uq67j6KtH3FTUue8Xfz8jG4IZrXFGfIA6uZNtigknwaJbwLO
         Mvu+G6jpEqu9rfgmmWsHALh8gR2FEoRzJFqeE51LMY7hkNKBUzZNblK6hbGrayZaTg0i
         AJp81BEVzJROBXCwW9t+n+UbPI9Lq/OXMwIWUzbyeBAlh0JsNx+DcVjMShqxEp5NfTeH
         CFEEARPAOCUw+8L3BhoAqLB/a6grpOS6HrDj8gTiCvWI5symVIa+GrvzoM0xhPupFmoQ
         n2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651835; x=1787256635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iD+P8saIQaZmEZFiMIX9IjjF88/l98YjBV+1G2c+kXM=;
        b=KLjMg0S9CMTAftghNG25Fk6GAZCvScmRBe3JZoQFR1qkTszptpszGupPoNC5LQzc8N
         YWLL7FJlfAha54WVp81mtXYjoR8FAwpOD5g7iHXP7P+TvXK49M9UY7TcOVywGR6KyVlZ
         rUTm9qYwSjoR71+J4luJgeUsgJUMqkrDb29MatmaJIrEnCYOCHCN4dP2V4bBxB6fL1Ws
         Zz8/u7ZSje2GCuSADypXf/KBVWJAGSDamnnDL4rMpIvzCoCiD0lO1AnMEmwI09F+Es3a
         /Z3dm6Go4iIdkMjZoXw5y6R/HkjIOFPRFm/Xq/MD3EpfuwzRKSEIeLg5i2hxgnxgYT2N
         JC3Q==
X-Gm-Message-State: AOJu0Yx9DQ48zvYA6yR55qndUM9SIig9k6cWlbh0jdyDWuPcvdEj9TDA
	tflw99ZYnSkzz/evw4e1Blr6IM1soEAB1tIwQDv230gkStogv1RYUqHxcJIXPtD8
X-Gm-Gg: AR+sD10oZ75oQAMXxsH8+mnS0aOSBB4PVchPl9QbUOfL4WRmA+p3ONWiMmag2sajwJ4
	SZ9k2geJs+bMPn0opgMtCoOdz9UJEf2HD8udh8/jNXgEx64SeRPfZXkucszmj2vWIBlHyFPBteY
	hwtgYh/nHVAaawTqgUOReorPFQAkca2je2guLVuSNT1IWWutOkIodkaxUE9iMkZMlhjxrmUURwA
	QhciOvf+UqydNRvsb2sWQBXjbQz7xtQrAfvzoU9iUkH9HnoL8qf4JfFm6K79y4V/KHF7Nf2YqAI
	rS7E6yCjaQAvELGFgT8DX7YvpYN0SXdjbhL0pWe8y4d69iabHrvZy3tAYGhI7iTmDO8MesmCe/q
	yNEXy1eiqjJDsOMY4uEzX/5Qc+tqXM0f2dRBs6RnCs/6q4UQoUmBycokrqMSGwPLQ6unZIhdC7p
	L2QVLT23oZ+ZrWiK9cm9mnlsZJ0YCPztFP/tzJkPx/vyvFWHtflr+YpPCUZFeaBGz/NAVjO0BCh
	sE1R4wCl1EujpglGhLXhjshPLYZdyMwTqAetzC5dZfPN6Af9C41dOS40a46m/L2COMvlKzxNN5/
	4OUIz/HmovqSFONfhA26ah15vk9e5xfiuMYTVlydXsawFtenX7lokWUvdhXEc0H6eVtvH/GP4gK
	Hmv/a7gowLNcI2RWD1hSp6SEfEQDy+4C/xTqoQkSQ4wcH9w==
X-Received: by 2002:a17:90b:3841:b0:38d:eaed:4adb with SMTP id 98e67ed59e1d1-3931f614141mr5004759a91.20.1786651835164;
        Thu, 13 Aug 2026 13:10:35 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 65/80] python3-setuptools-declarative-requirements: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:19 -0700
Message-ID: <20260813200834.1302829-65-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129009

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
 .../python/python3-setuptools-declarative-requirements_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.3.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.3.0.bb
index 82bb3415be..44a51b42fb 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.3.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "57a5b9bb9ad350c278e8aa6be4cdebbcd925b9ba71d6a712a178a618cf
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 DEPENDS += "python3-setuptools-scm-native"
 
 BBCLASSEXTEND = "native nativesdk"

