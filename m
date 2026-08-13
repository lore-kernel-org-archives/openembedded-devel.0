Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFE6C5DF69
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:59 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27804.1786651798891896224
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KcMy3DhO;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so185928a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651798; x=1787256598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xP20bBhPLnnTV9anPsPzxAxpeetrVBPEB00/q4myX3A=;
        b=KcMy3DhOqzFreu/ZDFPcP/yl3ygWWk3vWMJyHDWuIATueqLzPwmYNo3CE4fQWHrv0v
         fPSVgMAL0761QHHKNTKtVhgXaaeElCYp4U41NlQNfJyCYfxS+3fejd9aBvsxlhEzZCX1
         qZx/njGMSG+CG2K9Ux8/HV5Hj9DUVjwy6svqdlC+nqk/i9Y0eag7TLkNqw6uBxbMrBRj
         6msOxapkvVTg6beH8CEZXxSy+iTAh3dTBR8L1tJvfBYNzpXWzg1zNxspDZslKOEFHDrm
         44s/aKI1XTRdrLqFxqErwOLoDdU6tPI9gRbC8EKBFZLw5X0rLPOIWiUd1L2zppXSa6WR
         uC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651798; x=1787256598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xP20bBhPLnnTV9anPsPzxAxpeetrVBPEB00/q4myX3A=;
        b=eJ5i8UlzWp4SNERao/CY/wOA15umcq3ax3j0AaGo4t7K8ccTSNky2XYGPR4eJxGN7E
         uKEsogJEFcg8ZeUsPFWIwdFLEZhCfps5xcE1WzVs6zndp5pri/5H4aPoxFR8kS1kep3f
         FPpTJ927wneKOg3B28pmNJc9rVp571GRCD8lnLpppUi/KVnTkKuAxfDA3dCdr8CpGEdR
         YA8216OuhO9v0mfbfjPhdTe/icYmv9smm05SYko7HjeaJdBWMNYzb7fKEZa3IjE4UlFE
         T1WZHuY4V8jk89TpPs6rb+tCgXzhcSS6cz7TFtkR35oAVHBXnQcFPQpCQqqSy5MMkBU3
         JarA==
X-Gm-Message-State: AOJu0YyGne2ZIm7rFyUc+amkqwR2tHzo1dK/k0I56Y073ehAAFVaa2kU
	hWgvTxF1OlTE+7wW7xXDlZe4/N7KO9Hm6lS/c3KYoVWelbPZ0f03knWIE8yvsB+Q
X-Gm-Gg: AR+sD115DCnu7LZ9Zkh/Qlp8cyKd2vOojL+PDV+XB7UCkAhoYDEqMKPyx+6kA9b9y4q
	HxfIwKZ816YcNHGuJBk4q4VSg/FmZe6qew5gta6Ez81wdY7H00UktEkRGEPgkUK1Q3bOGEuoCXA
	W3uarN5eYSIbwEHfbDPpOLz7twIk74sYrsTIuzIOk7JE1VjRyuhQ+x9N5CRpOZUtCV5w/JWkwyj
	tYwt402aTM4stIc9O03ieB8KNPH7ES0z7JgRZiGt5MCF14lmiqEcHfuHHADzmvWIPX+EfLSBE+5
	QAAe9DGqzC+jX3RY87geiYLweR39VA6+yXu2+rxzz5GbN0AGFylgl+vJTDvbsuR7LGfoLIa1IJV
	myEoC9c08+dIphmpjDFLms1jK0XRUC11rlU7/sJROrj/a6iiTr0G1wXsDx94rWLggJc6qjN0mxc
	ozOSUgdEBN7BaYAvRvHQhO7XHEFoCeUOpdttjg5lMmHkBLwbSRpxQ5qijCLBmTLvXZ0g+adX8+g
	ztaADrUt5HY0NJcRt1qHm+tvb2L9PGrUt+fkC9C0FqOjT19SSs88nzCM8R7/HhTRNIlJuJ0GbC6
	CJH7SE3GcIwYQI00alkzMAg/EGPQX4rqVE44yf7AuXgnyZPwy2/jlb1tsLf0BfXTsAUGqV1BUBx
	2m1nSAsJc4c3lmHnMkTUK7JIpjLN9naKp+upBqqV1yeXPvA==
X-Received: by 2002:a05:6a21:3a47:b0:3c3:9993:d5c3 with SMTP id adf61e73a8af0-3cc71aae5admr473942637.9.1786651798216;
        Thu, 13 Aug 2026 13:09:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 44/80] python3-nocasedict: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:58 -0700
Message-ID: <20260813200834.1302829-44-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128988

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
 meta-python/recipes-devtools/python/python3-nocasedict_2.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_2.2.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_2.2.0.bb
index 4580fff727..54514a3f83 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_2.2.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "6f2b608602b0568cd06ff46e2a0f231d2a0c247d6dc120672c381cb291
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 DEPENDS += " \
     python3-setuptools-scm-native \
     python3-toml-native \

