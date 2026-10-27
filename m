Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21615.1793114388171351819
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 08:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=r/DoJcep;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-181516de561so907000c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 08:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114387; x=1793719187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bj1wRPoWSaHdM5Mj5+5b9ur+OykTrW2MB+Qi4m99euM=;
        b=r/DoJcepOCtGrjM52COrO0VeAU4DGECo2MDQNweDxAJui3Ipp1AGyioteGed+Yuhfk
         7xysPEiLdkW3IydT586XigUayqyli3waGfRH5musfRR6fUVjqjhvXnhDErViPavjhXkC
         fB9pATRMgaIdIPO7j4COGhCFj6ajFKAQccln/ceGADZLGmZFEBUbOq98/SWy9r6IjI8e
         LKlgiw1pc9qk1UuqPmVzx0a/cfv0DtBkSiYzlW6MpEzQ6vlDNqklTbrufrEbTRY9xneO
         ZeHpAh07o6C36YTsDg3BWx61LtoZRhOxXXCSOiU/qx4UcPc6ws0HgC8S7sj23XaW+YK6
         0JJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114387; x=1793719187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bj1wRPoWSaHdM5Mj5+5b9ur+OykTrW2MB+Qi4m99euM=;
        b=ZnI4wRsM1bk5iN8CGGppe6pq5shhX7SQzth0xMIljVL3xIoH0z3QALBnIlfG93gD7V
         k7f1ailS5klwDHFNFjh98Gn5lymQkyayI9RKRlSkVK2WfmjUiA2bC1g46MRJYLeCR9dM
         Ajk84XlRZFnABExYd2gZkGESznWx+qd6NOm6JR/Vf8rkIXryULDT1TjAPP+Af9Ho7fuK
         4O1l/iS593j7SM+lLTNMbeMLteAwugfsk5fiKZez9dsHq5B/vr7dEbFvfBxVSzkXOMXt
         kglKUDnKgbTv2If++Iw5JAz9/AwvG5EXZbIiaRkhrDBWzzuE1ZmRodZ7+Jh5dhEIapuR
         XVcw==
X-Gm-Message-State: AFq9FYIcW0K43VZwQ+uuxh1mTsmedVsUWCjL1qO2mLfZ6sbNIYi9wj/q
	iGD2BpOHa8JoNwYNOVLSB+iobDPGU2fCyb89YT6pxZwAIqfveSUs+WQ5VqY3adGhHvk=
X-Gm-Gg: AYBFou3VS+iMEeIqQJ63L33DemqDzIUESya0mT+Ql7B6Bkjmt3TznfJr8AVhvKPSsZP
	L5Uj1oT6IPW4rhRl2Sim1t4dOrwOkQDmi+TrjclYDRwGX0YusHD88CROqSRuVt0fDyaekYrwHMq
	9wmbHx6jcHcmgOfHmxMPk5wmKGGjeV0AXAW52KP6usFz45hI56VlhrZnX2x+v/krpLZssto7HTX
	H/7MvsOfEEEBwjOsUUNKk8yzrWKfW3CGcC09Zeo3273OwF2N8C/8hM9odJ5DOmaXl0HQx58Fxjy
	FVaXJcFSmxwHd8i8lYCCH3k+TGKo0SuHk0+bEegFcoerIqhkFDuCszppPoekVBvtlrqpUSlqR74
	+Ym7C286rYJmtgQITI+XLJKxoIYIwFPiVvLvqZUkd6JhzJyeZR/++bYelnlwQMCMzHB/sPHOiHD
	imuLhvVU3NWhV0dbJ3yAncsRnyZVmgNgCAap6bYUoKO16oZWYjewuDHbzrqSTwf4XZCkluuxNbZ
	qmJJfAGa6vaeeBCsxOxljpo9xIqgZYTjcqXoa39px4XHzGcehn5kc3UA5igTgeVbea5GYaSSQJ1
	OH/mT/9gOBv97HIHUjwhU8N/67LobUPVWT62b0DHuWUMCKbBA/I8lqus+GarqZReBO5Ft60k3xR
	pd6LKPk0gBrUlzg/ueFAtN/tU2+gzV+ZPbLCCGbLcJ+yJDb0XfQM7Mp964yl57WJhWP/llIn264
	OlwX0qNLB8UqFXAXYpMmC/0UOV0vSiPSTqpPCgMiqiQoZT5XuDLWyzg+WJZjUrutUEroeDrTHhU
	SZDjpTflHh6OEKEjSBwhNwxdU8EjxRl
X-Received: by 2002:a05:7022:2609:b0:159:d448:dd1c with SMTP id a92af1059eb24-1a3c904ca8dmr4754532c88.19.1793114387130;
        Tue, 27 Oct 2026 08:19:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm34728834c88.14.2026.10.27.08.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:19:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-cchardet: Use python_setuptools_build_meta
Date: Tue, 27 Oct 2026 08:19:43 -0700
Message-ID: <20261027151943.858795-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 15:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131537
Content-Type: text/plain; charset="utf-8"

pyproject.toml specifies setuptools.build_meta as the build backend, so
inherit python_setuptools_build_meta instead of setuptools3.

Fixes:

QA Issue: inherits setuptools3 but has pyproject.toml specifying backend
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb b/meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb
index 0aefe92942..6143a477eb 100644
--- a/meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cchardet_2.4.0.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ecda54f6f525388d71d6b3cd92f7474"

 SRC_URI[sha256sum] = "7b062e7e92e5ab1a00aaf5c164d5f056daae648ba1f144082baf5b4c229b794e"

-inherit pypi setuptools3 cython
+inherit pypi python_setuptools_build_meta cython

 BBCLASSEXTEND = "native nativesdk"
