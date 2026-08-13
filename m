Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99FCC5DF70
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27803.1786651796952794882
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JSb0ALcd;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d0407aedd6so4357015ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651796; x=1787256596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGRtBYRmj4cHXkj4LoUw2zf5oU7xxJivzq0XBRIRxhc=;
        b=JSb0ALcdNMnRZyPWlZlJZUud41OwJNmVtIE9mtUs9qSgBpcsH+rODKXm2yzjh7Ri4B
         p/M9YPTE8FtUvVAYhieCyr+fO1MU0H/uNnS2uOtvBLmZZhE1L9gPCbX87CeGaZuKGSNr
         0uIg67D/Fhf5/9H9Vr1owsepErFqR4DGfvUMH9kZdCqe83DWdWpsHN/jKbOi+AxewXPr
         LJEYW9CJDdUvobb8OTbawv8d525QJGGinG6GQc7TTIZ3REuCRmxHOjozlvcxjYZ8zUHK
         fjr9uQDLAbNW8rxTjOvIg7X2NEMhB1MpAfHqcGaWsY3hmGw6SXlcyP4eg4ptmWE3Gp1P
         lkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651796; x=1787256596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGRtBYRmj4cHXkj4LoUw2zf5oU7xxJivzq0XBRIRxhc=;
        b=ef2g2Ej9v/O1wZDWjFoRZWRRm1mP4MtaAD+gLPACnf/TaAFfvQuSY4XC9KYoTgRtv8
         Ks13bSHYk/SKlZgY7mFmEs0WYkZxkYQdNQMEKDUsMyGKo875R3r28kCSbWfJx5hbF7pj
         uf9gl9/eOt20v69f4aKa2X/4MoirlvdBYT5tyMUaac7fFYgqtHw4DnnRfZFyrSRPG+Vr
         acFDWe0rdECaEDhwGDP/zwnlz0dkhei8HYFCZTUD+zx0vKk3aAiAfgY/xDi4gse9Iz4t
         20Q6tOAQvaz0F1weDCZPQVuelsd65m8XW5dyfXdYeN2gHDFcDBMtttaX96fUJVFWmfQN
         JHSg==
X-Gm-Message-State: AOJu0YwXLWcBRbuwsnqez/arWC6nGzSphaQv2Jm8ijUrv1gJSq9lMxu/
	4jKo5tIAFJjjXgImEJmVO5++IGob3pld3irkpBoZeVuVCSpE+CGbU6gjwb2DerPb
X-Gm-Gg: AR+sD1383TFrvCdQignAE00pza9PbNO5/0QnZwNaAZ2H9gLtSQto0cn8l901CNVcw02
	Byi/8C5Kft6/TAcIfFvMIEhYXeKxtHQblmkQ1NOfqgLXJMWHvASjG92iZ/4lTfJfJaLEz0biF7A
	wC6Z/Dd4Ff2fdBgShROk0XJkc0A+PveIA14aooqTbpY0EQte6WyBeon2XlGTk4SBXGEp8wCOJou
	Tzf2N9X7rt46hI5Crt2CdRGeOmKMOnOqyY2YA+ysPLaPzheFsfC3Jgq/GvBxwhDMlJ++CxclHra
	975KjVw1oIGMz1M5HCODrqYuQWA1QPK8zCH5Qc+RNnJT6SiRVOjmhgd4XfKBoOo3qXm8aqEUBv4
	dKdQOfJlYNOXWo07s/JKAfRjGmBroiCweddUirFPJHGcvAY3Ffi3KI2mq6qNafoKA4fhVVQ2pgd
	r2+xzSdgfQMSA7Ats578jOMgPCJqJzcBJBCMVTyBKe9vc/ZCPA4NQeOlbTqfc1V/s4C8Y2ccPBg
	tIWmQMhnownm41rTPk7KL91RF/hYOSvq9IMG8y3aBkhaXhZoErvdfKa8LlXa6DwJgCsN9KSvsee
	saaNUzLE6umP45Y4aQOPYfS5wPRlRSDLyAsev57b88oY9vLPrfH94Cr16aQ1eIdK3vwGp5GRo4y
	nxlu0d56x71yuoiDRHoeTr1GWA4VK4F1gJ4/Mhs0zLuaB5Q==
X-Received: by 2002:a17:903:384c:b0:2ce:7563:70a5 with SMTP id d9443c01a7336-2d3b0d1254emr5535935ad.6.1786651796153;
        Thu, 13 Aug 2026 13:09:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 43/80] python3-moteus: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:57 -0700
Message-ID: <20260813200834.1302829-43-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128987

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
 meta-python/recipes-devtools/python/python3-moteus_1.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_1.0.0.bb b/meta-python/recipes-devtools/python/python3-moteus_1.0.0.bb
index 1f360dcfc9..36348b0311 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_1.0.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI[sha256sum] = "d66b00328e8cb3f57adfb54f43c6acb6d09c2215808c242725ece530fc7f9fdf"
 
 S = "${UNPACKDIR}/moteus-${PV}"

