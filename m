Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A60C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:18 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27771.1786651754673272984
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=q388rQ9P;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso3374255ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651754; x=1787256554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKtBmYXGi4WK1DTmqgu5O4D71qa26DAD+GRRskb/Gvs=;
        b=q388rQ9PvKGHVNr0CrTa0maEsvY1gIuSPhER+t/FOg64LOESiooJoOzaI0+wIzEG41
         OWzeVsJNxtdY45jwYjuDIqnjuCi5UuXkh6Gp77d72IR97bo7WpITutCBnRp7sTpP4bb8
         XLtL/S3gv5RAOIM8cZ8pNFlQ3WvjjJKF1IQGGOKhztpDwQ/nuTDixhuL7cNvtsKse4f4
         NftsOaRSMn+snPRh5K6GkMlzO/uMG2lgkaKhZz88jFJuJ3lv15YuZosm2wtPILCANLns
         OtmRJgzRT/55bTMZ447JugoUhaLA4yjvI3EOF087l8LH956zWN1lARjSQMoTYqAqQwdB
         MVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651754; x=1787256554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YKtBmYXGi4WK1DTmqgu5O4D71qa26DAD+GRRskb/Gvs=;
        b=DWyBSL25Qy3fqlTLz38d3DKqjGLCU2J3yp/at0sFgG9+2pfsxSR8ziNFnbwzcqejg3
         zQu6Kwp7VUU3icdsrEGZVAaS+5X/lHgIXcoW/+Fm6+ls3myIEH9R68ISrVRd9jxjf7U8
         y+Ns7WtufX0QJvHXt5hlcPyZyeEKf/st58Vm8Jzow1WW+8vqjlIf2+9K7Y9AvsGwM+Fv
         tBiIG42dCATvJ5bVnF+3f5njbZDKREE0yW4+IzpAT4A60Mq1p2NX0wwfdTX3u7cDvAj8
         P3xRKapOXFUhFs6AIwdLe7Le0d/WRyH8MpJYjZ6NI63C3FwiWzCjUDPGz6+UL9J7CQoS
         ECRg==
X-Gm-Message-State: AOJu0YyVUFNJbNGh2H7z77tBrxt4b8DfS+vQZ+ynn83T8SH72yXc8msj
	rqW2+BTeyGOkT6AOx+dDj0xv/LeSws4oGX7uWnTNlscr3kYGEUtxdu8DMD/S2AEx
X-Gm-Gg: AR+sD12lX0WvP8aTK1bcrEIUMQHN6yDRsXgYVzRTvDqDzG3yJG99JRjz9LrCtbsWkxU
	0U/utlj1Zh/NSxTJPUSJCXqIHWLo9MhxFOn6p5aCEQDsw/VrXgXyy+G1yk73yMKZrmJuZ/7Xwd2
	VcLqxpPWwf+AQwQZZbNvJHeSAubsOv7NDSWlZcV4nDklO07+9rsWR8hFGpcmkU00DCRTqbua6qV
	2aGDwZ0WqdmaKTJC7HyfJAFF6FYRYLMbqg0Dc6RrBIjX6LUyKnvqodNtw/Vm/AygR79u7UY0VS6
	VPpOTnr6g3BOARWBzrtkLqJmlRKOzUGQQ1dOTipqmToMSHT9b1IA7H/EZz908SsCWQps+W9r2lt
	QVw/0lvPKatL9Kul9qeJ8tSNRwz5JXd70y/D3le0MPy71rjVHszETJPVhN/fNnvO+VyjSeMDs86
	YbJB+F2n6/+WeEiC+CBwi29OAJtAlJYaSxVWVjEz8t6Y8mRjBZPaDEIhbW9tXtDIRgygDr9iNM6
	akL8HZnEZzNjYHm45FjLXMi/cJs1lwEJIvjE5TwLEhPGExjf8KJQTxoKyAUUD2yTAmw6838Diho
	n8ETVSGIzd6jP+WcGMqJ5SdBqDOyuMfkt11Mb9G2yfKeRCbHN3Ja1o9TEfwnjNk3EtOfk0Zzf3b
	8dTTuEETzYAEcBuePIBtOQ0j7P4en3adiAtTniml4OjApBg==
X-Received: by 2002:a05:6a20:9143:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3cc7196e809mr281849637.4.1786651753859;
        Thu, 13 Aug 2026 13:09:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 19/80] python3-executing: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:33 -0700
Message-ID: <20260813200834.1302829-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128963

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
 meta-python/recipes-devtools/python/python3-executing_2.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-executing_2.2.1.bb b/meta-python/recipes-devtools/python/python3-executing_2.2.1.bb
index 2bac5e8486..79c0e922ce 100644
--- a/meta-python/recipes-devtools/python/python3-executing_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-executing_2.2.1.bb
@@ -6,4 +6,6 @@ DEPENDS = "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 SRC_URI[sha256sum] = "3632cc370565f6648cc328b32435bd120a1e4ebb20c77e3fdde9a13cd1e533c4"

