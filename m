Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3867.1794729021520610347
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OSGnHEQl;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37198ed3727so3931017eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729021; x=1795333821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vkdG0BAsJ18TTcIcskl4omz4jJle7p/oDJjEAN5ynk=;
        b=OSGnHEQltppGoM5u5LzFfn+G5nNxqFipK6n4aewYDDwUk5SWiBuHW0K6YMtXZuVBK4
         4/bIMp76QoGQak55+Raae+6Rs/eY2eD5nfZ2m7/BXidJ+7QX3/m0op7ikYjuCDFCFPAI
         Mh6LqWZ/wjkz28LfjNNgtK8EjLRh3F3oGd2d4Q+TW5b8dRGuqrga5femuznCIJKx3eDX
         G5iIBPw4x+XehS6C+JSpugYfrZQ5KoEF0GjlOHMiGSp6mpoyd0MV9fy0aLSPCvUz+SI/
         O/5Ybzf/V0cOqAVEfDLKxSWuvXECQq4JxsDOv0lmsz6mhAZba2LNiJjjfW61tvJGWsWx
         j0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729021; x=1795333821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4vkdG0BAsJ18TTcIcskl4omz4jJle7p/oDJjEAN5ynk=;
        b=LreEFK7ZTJOeYEYGHGDQCpHcw4bgRGKQNT9cg7Y1L0EMw8tRjMOJJvANdcf0MsQT3f
         l/NcdOiTcf/BFc+A+hp6flq+tCntUHBkOgKBvMaPfj6SHu/POEpMhHIEPlZ7R9ENDA4J
         l3CRNewi0WNuqvsMdy/qG35nk0YLInBc55Jea+mjHMbpXgJ8r38olbTRmKgx84J8dX7P
         DEiqLEzfnLK6z7bBSV7YthVSmX8CnAwpoWWvrlexMyDA22YsPS6eEpFivKmyoptBeTVK
         ry0wc6SMv4LdVsuSiFOksTueS8VtPhC84DusbIARgk+milebd++sBL586ictpSdZGFbK
         YNBA==
X-Gm-Message-State: APuU4Z+7gGZdG6EiRmS6gAvUsSe94PHME46fiHU6xIWFlElERwXLGahX
	kJRTZmmQ2xel5IaFon/Yh3lMQGh7w2FpN+Inb7wmkiR7MWP+6V6o8tWmFHm/BkW6
X-Gm-Gg: AYBFou3PCKN0filV83Pozl1dBH39sjnLHB5vMYn6sVUTxLHOtYglqENVeAidbGLSN3Z
	a8WHN12nj8mkACDQS+qwpcgBICdUHKVKgGv91pt+dBSGzz6j/Dm101dglWg5nEFaon4gfUT7WTK
	4SVt2wQSaMbXSdKW3mpcyUdXvkCKdgb4jjz796tcZa5pKw1Hqa05ecF2h5+vcHMB8BHPOmpdPGC
	54dU6WJtUvCRkO/m7cRsAgkU1gs8ZHeNjYKXgiRgiwIgDB2BYq14Sg8SjYqjqzk27Q1SUFW4HUR
	rdQEaQ7EyLOy17XxunSKHx9MfifPYBDCKyCg+GepPa7458bxwa4zuO8279b8MnXpxcjJJzO7LtO
	tTZm3Ibco3XNXa+EwKXr8uCyS/FUHdn18HicsQd3FjZIIuEFGbP53OBwKpDzZdZx3O4xz1OFhfq
	ai9wDMX9+aEXRLh7DFXRS9WeGJzMAsfy2jsLYr6A6TWCS+rMUpVIldcjYbUq3jZFtL+jxokLosr
	8sgDZl2DVVMa2+6+0/TTMYwW0wGPdUVpRBfZPHkwaV0aVGV2w77KPvtWkV7rDqlfzy5iw7DYGCi
	1u9bkscwHPKIwrs/1dGj9YVYq6kvEF7x/ZoFyOVRunf9Wpuy723OUxFPDiJfqlYlKiJCdIqoNo+
	u/EKbAogpM1qQltyeBU2qy36wPe87Ihi333AZNfn5w2nRxwUkvF3FPlBGsAtteVMxtGoLrApPwG
	iDB2WFdgST1DEwda+gVvA+ZnUQRFI6E9VG7K7rA6CcRPFDs7cZ8UMwetj4efigxXgvAY1cIbK94
	KSMhFp+jQNDQSqN6BNj9F9sQd1jHjxidB/U2B8OvNBvSs+9lHJdXZdXOJMmyMIZjHTlm+9HtDWe
	UoSDzg==
X-Received: by 2002:a05:7300:d402:b0:357:ee3a:267a with SMTP id 5a478bee46e88-37963565cb0mr7318100eec.2.1794729020709;
        Sat, 14 Nov 2026 23:50:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 37/96] nanopb: upgrade 0.4.92 -> 0.4.93
Date: Sat, 14 Nov 2026 23:48:15 -0800
Message-ID: <20261115074918.2932593-37-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132307
Content-Type: text/plain; charset="utf-8"

Upgrades both nanopb-generator and nanopb-runtime.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{nanopb-generator_0.4.92.bb => nanopb-generator_0.4.93.bb}  | 0
 .../{nanopb-runtime_0.4.92.bb => nanopb-runtime_0.4.93.bb}      | 0
 .../meta-python/recipes-devtools/nanopb/nanopb.inc              | 2 +-
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/{nanopb-generator_0.4.92.bb => nanopb-generator_0.4.93.bb} (100%)
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/{nanopb-runtime_0.4.92.bb => nanopb-runtime_0.4.93.bb} (100%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.92.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.93.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.92.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.93.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.92.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.93.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.92.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.93.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
index 62dc3ec947..466167f3db 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
@@ -3,7 +3,7 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
 
 SRC_URI = "git://github.com/nanopb/nanopb.git;branch=maintenance_0.4;protocol=https;tag=${PV}"
-SRCREV = "160d4f09e5fabb2b66aa2dea32d4f38ace2c4b3f"
+SRCREV = "93550bb52a6216a7396d0a168a42b3a88223d811"
 
 
 inherit cmake
