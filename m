Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB56C5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:20 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28150.1786651818788157557
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QCQvifPS;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caea3f742bso6011425ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651818; x=1787256618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYBy5DrcUvtb6doUZCFXNfqmxbKz6KjtkcegdVZvj2E=;
        b=QCQvifPSjYhlQDNaVGVJrZjzXZ9RRLFRtiC5/vNjG+FhlfTzyPHPWH8LSqqCX7uCA2
         wQ0K1YvXQjL9XLW5yZrrNWM20Nr3q8j1PMMxNBKanFAoS05XT+GPjx1DcyZUAQdRFXy1
         arHH32kAFsvb4VfheWVNbd2spAVLTHxLyWgCEewCMh/y/psHQXXh/ETSnGQF7hMi/QcW
         oJrKmOXeEwkLGa0CcxAVS2r+Ksmr+IJ2PFPwx43Mr7Pnuwfbb8HcMoAQUtiitnEzSDsm
         TVuphnVQz6zI7FybTH17uDiEz8nWgbtHhQXvz25v7NaqdBnEcbNR5MQN4wSmzCGtTBCJ
         SVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651818; x=1787256618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYBy5DrcUvtb6doUZCFXNfqmxbKz6KjtkcegdVZvj2E=;
        b=Ulq7asMHtYFPIWyzwqhAV6AgxXJRVOabxF+3PbA2yNAW3BNJvy4QmqY7CIUiLPFH7/
         qnjq7taCyb/6SArmD9fZEkSPiQv+9ezY7F38orYPkLSQ+NetT8RbuRUfqDpk6P3HxoCM
         69thfH7kfLqA+XsF7ulPdHmQWB9YX7Q+V4yBBnwNqzrs4SPd1YQ2ySN/Fhe3TJxbLfgn
         sHc8XFpxtdMUKJ6ai/fJ432TyanFzf0cDYoIDp4+Njpk8vA8wCohZB5ZGXUD8D7zyKar
         C7Yu8Z7zlT3FFMofv8sNCLsfZh5Md78u1s6WAZUVsebHMXrvZyj6eYW3uiqkEvu/ocXf
         e83g==
X-Gm-Message-State: AOJu0Yx5G+1vB6ib3LD8nAS+9yfRgVdpHHbFcI31Kd5Vbvr3FuVMsE4b
	2U3lNvzU/WARIXx+b/4cIqjrsQraoEqhTMHCEMR4tq3WUl35SdWpsAidD7Tug06C
X-Gm-Gg: AR+sD10vGn/urFmTfzxahUsYQIYQzZ8zXR6quDNziz0K0caRuQLMG0iMheBF6PfCj5j
	T/KTrUdWaFw5SrXAr6WMkpqahyZN2GGj/+1Ri1qcr3LCEuurZz9Tb+cZxn+R5tgDozvGHDLfD0G
	/8O09gP0ArrJbKNhUI4jTxRKN6o1FaqwNMKw9o3u8knIqRWviTzHcifWqFT3pfeVZTIfQx0R+MZ
	0aFfG90jdWB3F2epxqfk5LkpSwmYgtOk7yEYLkOtgy+dYYMk55GWY+YcDtPNAULhZBaC8dEWv/u
	bA2erkapUURctxhH6wvn+H5j6ixVPqXezdy5YT/ygO76EHAaH7BCC5DXmO9msawxRS36Quh5z4/
	8MHKi5gWNbKYDeZnT6Uzi8X991vbrHCm3AREGVJhLJz77fmd8AkSdwTSiAwPFjwgVhBzcuQ1m8r
	fRmhAD2gEz09YMBCKFR8iWyPIHoW9zo9traq54RuGfg3sirpwOCVofcs66wR+jJdMS/jXkz7Rvm
	wHCq2Gpd4TeniakKWy0pekoTX9TaoQaNKkk0/0evlQmQU/mDMoWegbyj3nywCnOlR0uh84zQ0fC
	M8g7/ow3BIwAy/BhzSlWg4ozxppQFZoA+gHnR6b58XBBv8g8n0jBBLvMo5YiWga4LyKgLM2A1Oq
	FR+KEDOsZ4x5YEUSAWsrXe2rptb2U17pgD6cJ7c+Mh9Ac0UwNgJSg8H6Ndg==
X-Received: by 2002:a05:6a20:9143:b0:3c3:cc3e:a9 with SMTP id adf61e73a8af0-3cc71ac37a8mr373603637.4.1786651818009;
        Thu, 13 Aug 2026 13:10:18 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 55/80] python3-pyhsslms: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:09 -0700
Message-ID: <20260813200834.1302829-55-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128999

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
 meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb b/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
index 58f571be3f..edd41995f5 100644
--- a/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyhsslms_2.0.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bbc59ef8bf238c2902ca816b87b58571"
 
 inherit python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 # Maintainer refused to upload source to pypi.org, but said he would in a
 # future release. In the meantime, do github
 SRC_URI = "git:///github.com/russhousley/pyhsslms.git;branch=master;protocol=https"

