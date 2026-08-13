Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E6BC5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:09 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28145.1786651809224131583
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AJ/1E/ef;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf52d15d88so3319645ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651808; x=1787256608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H46grzCUlpQAczI4B1LO23MFgFkTVc+/aYQoPJF+mH4=;
        b=AJ/1E/efurtic/CbV8YPYGs6ZSWwAMks1b9XDfa9AEFzapAFbM8q7HfI/HH+MwQOuf
         mReJ3Z6fBZsUKDpgt82epgmAJbU5ABIUkhReNiqQrwwSpnJnGWVIi5EkcWzGmGSsv4vJ
         HBSQAu1e7Sl+GsVma9GTkQGsF6hI8I1WOApEtZyQA69if3y5DKGlTy7a6yNEnBZzCoJn
         4Y+wJS6lUQA8JvJwqgJoerdO4OaW7mQ3G4upacOu0ICYYWOqhvvPeEqHHAtKUyYZ0Gm1
         X4bIG0iFbBZifXIrZugZiRXNvwdWDA5kj5iAa42X6ZOzTBsudNk7933/T4XUNbTjmN4c
         m+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651808; x=1787256608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H46grzCUlpQAczI4B1LO23MFgFkTVc+/aYQoPJF+mH4=;
        b=AqtbJ+iX4Ctj3PHQ+1VVTQq4WaafWVVB5wCMvI0dNOxOsP4AT0HZc+REts+0he6M9W
         emsMfBn3NhALltFm3juTx6cmW/3hWrtO6tL5t4n2CggMolJkO117TaO9Uvn2hsD/GZ0s
         Tq5ZGyRLocCxsOqTOmjiwo0hR412a7kpj7sA1sNTis3+Qo7KiqVaMvRXa7unU0CLGh3I
         AXGp1dedqKYIoExnZAvhWRW9PjQvECXYGpY3Oh94CXLsSiVX9J+MlpW4ARtN7Z1Rw31g
         BH7pqMAOXNs7FqNB3DuOpOC7Kyje8PTcd7k+tz8MSdsZoOvN8Lrep0tQHmZj2arkXo4p
         eJ7w==
X-Gm-Message-State: AOJu0Yys+6ogojgoqusK+bKO/lPiaRNVVWgh0GLsMm7J0NZE5Nxxnx5J
	kT7K5ah2vlH2KzJZJHxzI2ptQQ81B7/szLV56fEFL22zR8aeDBPdLscJkU4XZyUP
X-Gm-Gg: AR+sD10d8ekUPmnTtGuPp1XMNR/ZyiU2Zlr85e0ESlPi1za9YG4fgcc2wAQnbo0yb3a
	WZyqEoMPUW9s7E/lJstJSYEHljZCHVxt5WFTQryf+fKmPoZB1rsJF6kaZXYZrxTMflss1IGuEnS
	MtIHD5fxcFivLmjJiDogpBigvBzRhw0X1bG2scp58AY2pm+nXCPjvHnsHy55K0kePQ+HhqaOWoQ
	+o80igdOhupmmqiSBodT9cKB+Jus/Dukz9j7DKc97Cr8EvqLPifM4hAGU46gDGN5VTpsKzdkkSN
	NfjpyTUsuo8wdGUnW7aWJMWMEJiutZXbRhlvmqMAZg+tPbrlGyHqmmWnQyzlHyfQvQY1n+jjr23
	fpB/9vV7IXLGrJ3I9HsOgliiKHrRAj0NdmfTD1ynzRZP+oG6yqn+CPF+tU35ICcEQSJEqrpkKzr
	Vy0ocrVkdClJzUOs2DGHeYi24aiVf/ymjD70/KexT5iRiMQaywg6q0LShnKqZJEF9pUpRd7a2Gn
	fUI9M4PqNqT2LRRaQq3jw84ZVj/SrFTp1AgylLx9J5iO1qc9NE3tYCTE4QmLZJ2ng/snHJXrBAB
	5vzQq1JM65eyJFxSpSXwTLypD4/HlEg4JIFXnM0I4Cg+Lv/olpodZwDufMpBpRjn5Zm+zf/c+dq
	+ENLEEYqC7c95W/s0o/cIjUOzMwCziUyPJntJd+L9COnjcZdN3ZdXPsOP
X-Received: by 2002:a17:902:ef0f:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2d3b0d4d701mr6417895ad.17.1786651808554;
        Thu, 13 Aug 2026 13:10:08 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 50/80] python3-pyaudio: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:04 -0700
Message-ID: <20260813200834.1302829-50-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128994

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
 meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
index 0e2810ae74..4a80f66fd8 100644
--- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
+++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.14.bb
@@ -10,6 +10,8 @@ SRC_URI[sha256sum] = "78dfff3879b4994d1f4fc6485646a57755c6ee3c19647a491f790a0895
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI += "file://0001-Remove-absolute-paths-into-build-machine-system-dirs.patch"
 
 DEPENDS += "portaudio-v19"

