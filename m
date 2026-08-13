Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5FBC5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:10:51 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27836.1786651846465161635
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Hf6Mw7eV;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cea3004256so4334805ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651846; x=1787256646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vs85NADeOaj4GAXreW4TDdQuaHmuQKXx6cbJjpsncaU=;
        b=Hf6Mw7eVcksV8csALpQ58RRaJGAZYNeEGMjW+OW8UefPx2092j+q0Z0j1IpI9Kxw9l
         iJtflaJQM5Hcn8jOElnQTVdtYSjmRL6De5JyImIHICvfCZxh4mSCDSTC3NJdW8nAcu0W
         oOAYtPIh7yVIgw5SOrUZQgv0T4I7PqFvSWDP8DWoO8gtvCXFaqBqPdV7mQCvpNz4jziz
         x+oUcYhuAmSYQkuieItPWXmdHKEFdU/PUCGmY6bhtNNCH8IDIi2cTCF3GeearbET8sa7
         A28ICI8s98UZiMoWfkP+rfD70MVt16KXqyV64aJOMtigcqNKpAU9mG9Ami+cr4DbyaHU
         NATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651846; x=1787256646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vs85NADeOaj4GAXreW4TDdQuaHmuQKXx6cbJjpsncaU=;
        b=nFMQYSffsK2eftFP4KaSZsnPMo0uoBxVY7dRSxEY/1btNogoNroZeB2fvmJG+7KYiY
         Y3RM/LqbIknW2x+wHvXbX/tZmUg3xoriWoGbry8Gvb5tAOrYgUSK3rhVHlXG1cYEhCTH
         KNdhvDfJJVqHCXtAURcBmdbwjSuFxFSrV0BwXPELsNmqyydvC0HzABkcaXte9jSIsGgi
         aXfWF24aVvu81SGQIa9aQEraUMHEqmGmBuGdh8dqGHi+Rdl5OXrkUiaIK4zUMrn4LjQZ
         +Ga50H9EINihxsyhN4okgaxjX0hFtpmjs/090KIs1xkA33A2Z7V12I8+lhyJBFwEbJ09
         oslA==
X-Gm-Message-State: AOJu0Yy8EOa/uifER60B/sHJHwx30dme7AZ+/Fp4YF81aPMz3fJvld0t
	J+1HCfro7IjRFHTb0/hqa3iQsocZYqWIn9aeeJNSZ/386BaYOKF4YBffAg8TwzD6
X-Gm-Gg: AR+sD10qFCL+fiHSmL7CNGXrsCQCW+s89+x0Jnhp3yM86D1HV3q+Ie9C8BLqJHfOLUn
	WornpW7/TQGAE/rg/zdf6fbyFEbjmw+ZBAhXYEoxDRCsMr10weGdKc0yZCGdHIZ9aTurnXmYnI1
	DEjRunB2VC56QnZB7knRz/ywagnk/T/4mniqpcStYy6PceXOdYYkh8UE6r3FlvXT9VkWhuVP/Pu
	s/9Sa0aOkroYVbJlU/yVzIJjkcVTxQthBSRNhSBpdsA2CbHnyHGNrdHEPwisyXguRB7S8Gfn3ip
	Lgc4xDi7L2YmyRt1XpWJPzXzER3hWb5ggqC+1EIqt1BKaJ2joRo2kWtIvlpDAyqvdyukmNqRezA
	wm+W1EzsZtWIwoyRCWskQcbFYJ1HJkLryolJbIhcr77Ymvo0sNAFUNWsAchDJV+MqYRP2YmwO/V
	x1iewwyDgmnkIIx3EMOVBB2cSAtEsVtGZIlluFOv8zLazRjNx4+fkGaRyYhZv6O7Cb4zeRG3zaB
	skkSYVp3aerUkyohl5DV4NxJG+c52HUGhAnzLEwFvdQS1V3V1WZ5cW2vEXa2Tpf0ktS2LviTfB9
	4+BfSZbpi62DRyrQCw9/LGuLnoeM03QgoS3Qq5wpcbQGWXOspEhrOgAU6Zw1N8of1M5iNGP1kXR
	Oh6aidcpJUNPniPQ2adBATmbm9eSUO/5FwhSobsCtsIxqSEXYVJo=
X-Received: by 2002:a17:903:19e4:b0:2c8:1f58:55dd with SMTP id d9443c01a7336-2d3b088b124mr6489155ad.9.1786651845778;
        Thu, 13 Aug 2026 13:10:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:10:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 72/80] python3-tzdata: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:08:26 -0700
Message-ID: <20260813200834.1302829-72-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129016

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
 meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb
index 3284b1bb51..0216d4f0b9 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.3.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "4a1518b8993086a7982523e071643f3c0e5f213e75b21318e78bcabfff
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN}-ptest += "\
     python3-attrs \
     python3-pytest-subtests \

