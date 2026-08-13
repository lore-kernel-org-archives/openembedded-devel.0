Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30840C5DF70
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:41 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28161.1786651837327708306
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S9OaFOE/;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc73e322dbso6263435ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651837; x=1787256637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOd26OAnr6Hp5cYLvzzLpXdqGugYMewwUg6won5ClxA=;
        b=S9OaFOE/fLcHPsDk1tQUTB+rExz4qvOuUXMUOVLGwbubtLW0rxMfdhHqcKSjT6P8ta
         EIwG+cp9t3ce7QfZEDhjpgp7eaC0oaRcqiAA8xlYs7aNcOUCQ/jAAsCE5hYxffoSAeYk
         oEobj7h9aZbuqePjTuLshkZRly5saMDu8J+2+WpCPBSLbXiO3kTHsd2V4WZOd0Jie71K
         tNk4XE9a2c3nZRH+vngRnHSCgZ4FidRn6UHT20R+utVyD1zG1udLG4wP5X6bvQ3+uoqg
         C9+lesEW8QjvE4RzVxuj73AYH7jpEZbQ64/57dPL7PrrVqobPt0iKCwAGs1ZUX4yAkqj
         4v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651837; x=1787256637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOd26OAnr6Hp5cYLvzzLpXdqGugYMewwUg6won5ClxA=;
        b=hAZhMUjAJWMv+zEn2FZmmhsxDgwHUKWSfpaGm5rF+YHvY165Sa8WNp7EFcnvDK4n6w
         jGuqzT6SWXIu2Ec9r9SIykKti509qA/F5g5i19oGBmospxhA86EWsj/EbJr/SgRlh1eO
         mhnj6YVonshFDNHQGf8FRkhM7iiCMirnhDaW3PTjA0g3cNATfKoJMlK9MTb40tU3Fbpy
         8Fs8QIJEk5/3gbfuoENI4ycqElqa2OO+4fW5HoTxgUNiUW7YUFF8NMLe0qf6uP/2gQK/
         FErKptmzI3c1odqrvZjxjE6QiSthOqcgqPN0p1pprZiC0f7QL+WdIHXaDJnE1mdDG3Qg
         uEKg==
X-Gm-Message-State: AOJu0YwB30P5kEOobg7pTSHRO12Dd557A17RWB+4F4AXOnNmf0hexFUJ
	AFGtQJB4dEGSRBiREi5a5ZCRIejMQU3WoOfrea8bzbg9SNT3+Ibk4//Wfx6uovlk
X-Gm-Gg: AR+sD12KVdzcM/fk3wUuO1QGzjvUFuGHdPhr2WBzKDDYJ6Ink6T5/t5iF0OoB0U9Ycd
	/yEuEOssXZkBYTrBdGXA13YfUZPxWBk2gvahc6fa3s5LwiLVHyZgEoDA4LF4ANFA4NZ+GX4M+1k
	UdQqkvL2BjXetR1sjMKXefnfoee69IShzmYI8USpL6WcqllVaL1Mhh7Rn21Wsea/Clq+XtEMWbE
	+NIhJUpML8mXKAG2efz7eE24Env3Hw6TJP7xR7JM3Rpp5D0ixznQxA+jYS+X4Dds1fkuqeuGVWo
	NVTA1NoON7pu6d4tkH2JydGBNXzOuEyotI1EVWf0MbTxxCI8AsxpqeHSFBb1uB59UmqdnLjTfjq
	CAyHBvBp4ZZsniZkIffxMrZu8HP/am8vWamxYlWOs9Xm6Qlh+ZrimVpanXNIWr5fti3kjgc8mtw
	KsiV6OG7kaf1mZy7bwP6k0k8t7zrhWdoYaBA2RDFNnskNDizNrbPkGoRsJQUOhn4XHRgx/rfUrq
	klQG1fBs8dLYKTrgtMH+zDGfX3gqzkgBtQQ+7K/RR31ZLE9iMy+h9damR2Bwm3Ro4TPt4wACO/p
	f1TZE6DUsNeeifYTrRIyQMmXaS4oBcqklviLUq0H5tpwloFCBPmYyI2/aGBNaC51QcA7ral+WYS
	6he0i85rGBciSFI/QTi9/E7Oih/1CYhByA55FuqHUhwCcog==
X-Received: by 2002:a05:6a20:6a0d:b0:3cc:1d29:f172 with SMTP id adf61e73a8af0-3cc71fa83c4mr225167637.22.1786651836617;
        Thu, 13 Aug 2026 13:10:36 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 66/80] python3-setuptools-git-versioning: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:20 -0700
Message-ID: <20260813200834.1302829-66-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129010

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
 .../python/python3-setuptools-git-versioning_3.1.0.bb           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.1.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.1.0.bb
index 433525d041..d39fefd7f0 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.1.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "612dfcf184addac9e1c2216f4f229724b2390e5bf613fb925ae80b84f2
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[python-version-smaller-3-dot-11] = ",,,python3-tomli"
 

