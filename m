Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10349.1795753044375046281
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Aj4QXBFN;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b5786e099cso6418467c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753044; x=1796357844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OSyd2DPZDt+b2/WQs63rn9B9IAIDXLA3hUij+47/SJ4=;
        b=Aj4QXBFNax/N+YVbAbgsJPhjtADulNyORxG5kNwH8kvVsFwvQ4yWjAMbx3Ex1etpCv
         vNLZNqdy3BivB0T1qxzb4yTPs9OH76sxNqas/+eCA4jPwc6VIrp5SZLEWsFF6AtIFgs9
         eYLlJqHWw+3WVFf/Sgu7bR+3WyEtDX0GyNSrvgDrknS++l1sQ3jrf4M8R8voPJRuMRTd
         V8eaDQDtu5jOyX5Eos0m3/WMqtBtVXHnpOXtWLXM1vEHEOvbh1wSMImMvhY86F1ARCi0
         T3UbM144E6nr9YQEORQt/b8JolZWRTwL+Q4GCnWUfBYN1EvdCjWPUrbt0Fv6fxDzBk+S
         JN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753044; x=1796357844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OSyd2DPZDt+b2/WQs63rn9B9IAIDXLA3hUij+47/SJ4=;
        b=ETue4ztEWtVrh5afjnaL6nH7ucYGOODjxFXOwoCpbMXtXbTsMGwfMtIirFXV0+7+N+
         jY4pP8D2ZDf6TL/JpdJ6AjfGGujokA7jIN0cYoBAyDVuObXcjscr/PBOwCHvGiCAm/PL
         fONe3JjzpTTiaqPxj/uTz+c2Ccuqyfv49HvmSKsFhqYe51+ZqjxdKbef6uBnZQrA/rm2
         4cqC7Eit/5DKg7fPiIyw3ZqbRMwX32U7yLqBflgPYWmHEu2h/iRNWjaQDL0WBTUHhdiH
         ef/7tZu0wuSpFNeVUPD7w3U4Rrv+3I2xo9V8H0ZJPlojykL5w/HYeO3tL6gi+bINm9eN
         BT6Q==
X-Gm-Message-State: APuU4Z/1+sXPyPbIUsgDx1d910XNTrcnugIiNXtCI5e2EgSu8AOl65T+
	D/acWEkdlriDoZvJoZRA/LAbrmPWxs3wRSOdroLpCLHQpGDz3OQMO82mD5VQnNeo
X-Gm-Gg: AZFdTZds2+L2UTICAUFSW8N06dugkutZe/V7RO+Q4YYoDIl+teAgX3QuXoffQconPtk
	y2W5Kp26B1rRbAhgTO/gIgxwXTzQn+seCpE7NqjFb3VEtRttpcLlKf1oklCZUUWeqvceYTHphju
	oqmssKyaGT4rF7Y3NudFQoV0xEL1a1L4jTg1Se+4wWgz0K27kpxo/wHQYmD2Gso5zl1Dia3W5iF
	yP2NRlSCjRgNpgptXFS0Dr4vNzRFkqbiNPV1/HzZs1dxUqh4INkz3E8jaySAxZCky6UUza3PcvG
	ZCbEc4kcT1ETBWF/422IcA9oyu86EzeXLUb1jASifr2oEPjPyAC+EaEcD7MOVNDIjttfI4lRb55
	5AS+UEjvvxWoBZHMD+awBlkILKj0f+dpZEItTTfLVjKfd8xg4HDxBi92ayHQUKU2DS4KugOnz/r
	uNKAMie3BFxjmXlTh+xVqT3iBwwhLWXWqOPXdGNiJMvvcKMDnxFp0Y/fA4/EutxEbb5iU5bVMxO
	pmNvnvV4InWafgvqEZ9uVElUb7JAXQmpxkQ5JbJZHHLVq/rxajCdpZAddEH4/9ItSDV5WcJ660I
	MrLtOMbA8tWNiKGwznetCZ9L+F5nMzYIkIlRPzUt1zEmKSDS0x/chZYYUy7igidKAvopf4ZMuCo
	wJr3BbRXcDymJ5J2a0FGtrD6kcvi/bRjD8+4Z2bUVhcdsgO3Xcax+7HExIoRi66WSQ7G6Uuhk2h
	0bh7ZlMvSvihaxsd4zan+QdscyCxLwl/ebwCK7xlrFy9pS5hSfWyc0zpfI//MJA5SFa+oUCzGjJ
	5Siw7sd+NB5L3mPnDucXRGPuUTjBtfo/gmfus0w1K25XVdR1yDYEFwakR5HYIy8QXHuRw1QSxhh
	fxf9
X-Received: by 2002:a05:7022:7e8c:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1b55689eb35mr24325751c88.13.1795753043703;
        Thu, 26 Nov 2026 20:17:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 05/35] nng: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:45 -0800
Message-ID: <20261127041715.1776485-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133257
Content-Type: text/plain; charset="utf-8"

The default tag regex picked the old r12 tag as version 12. Only match
vX.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/nanomsg/nng_2.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_2.1.0.bb b/meta-networking/recipes-connectivity/nanomsg/nng_2.1.0.bb
index 0ed2299d51..29306594bd 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_2.1.0.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_2.1.0.bb
@@ -11,6 +11,8 @@ SRC_URI = "git://github.com/nanomsg/nng.git;branch=main;protocol=https \
 
 SRCREV = "0912dcbd63f2f44324fa974e9fc9695c7621abb9"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
 inherit cmake pkgconfig ptest
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DNNG_ENABLE_NNGCAT=ON \
