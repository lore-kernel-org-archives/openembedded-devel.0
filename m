Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC970CF2582
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 04:12:52 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7413.1763525566569871375
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 20:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EmOWNaVP;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso2090472a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 20:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763525566; x=1764130366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9T9sVf+J3r2kU4MZD7PVXrZYT+7ivO12AC2XWf1nMI=;
        b=EmOWNaVPV+FUhanaK2/9lbTogeH4+fyutDZuK5m+ozl7uKYRUHRecjz6MVQLDigPN1
         nnUmlKdhKIFHtzC/upaUALucjANMRyQiMY6jBjbeIlsV50tFsR5FI+lXhALgCHyovZ2f
         6mE8The2ecFfdAWyJZ1MM9uz7YVyLJEhpavVsWBUX8eP4dTk1lqpshHEePy5knlhh64M
         IsF/ER1MvvcehzqAReW2To3Jr+E+AblKSBy81Nc4AkxOQit9KSmjFJ7bJTqu2qjMLpAT
         qpaKbHowXCTdnHMxrdSkQKy17WdeAY/2fhXkbT+s1rzSL1IlWo6dX+B04VmB5QMjalIb
         wLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763525566; x=1764130366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r9T9sVf+J3r2kU4MZD7PVXrZYT+7ivO12AC2XWf1nMI=;
        b=G2wHFw/11kIBsy1OEMY8ALehPjVxida4s78s/9E1pwX82ouQrhvRFjSIErzeVrkCxL
         U1gwz8FSfW10yxqyJRvnCXkxw0pyYqQbpdH4hzuId/110o0FDTMeQ0e5vidO2rXF2feR
         VH6A+Mm6PqxPLbF4E2sF6cPTotiaMIG4zUAmymZiBIttaYkFvpPwEmTKt3qvjUBOtoIK
         dOdxMvDzry/xEiQF4uiDbOIJ18jM8gWsNu0eFEBwIk/lpRwUG6/BAp2IhVhecQBrnacp
         n29y/CErF3v7COeSK95/vPA5jo9MIXxkcZjATIdYLdzUrYdksJ/WAI0Q6BkSS+GcggHQ
         Rjxw==
X-Gm-Message-State: AOJu0YzCaaEHS/j1NglUb+ZXRpE4n/io16ZuwMQnjfhM/vTzQqWEuMT2
	gB921PUSegU1tYDFmY3by+gxKRAtzirLDzLqw7EuvsGBrgr7tHKUgn5bahno1KlG+Fg=
X-Gm-Gg: ASbGncvBRzd4+53rp6tX9/ruXEiP364yu7b3yCvxMtEk0mzDG2gbkv6uv8ChW7xPKqO
	uW9EsWKo7eH/hkFxJ7NUbBrIT1z5LAQq4/OZrA3K4rWPuCB6Bertqp7zjoYWn87iydp25m57n1I
	WZWFZGQ4T7MjwVSG+d1Oz6Vfmh++iTx1O/KYGjO1ij4nE/TAHWuYac41d6c2jA0TYvLoD+AH1Pc
	w6Ek4az1J/x+OeOD9A2+NOnHQHDjarTiHCWbZtYGU903qLET4SngHcUE4jZs39IyyxrS1rNtJnq
	5QJsAmLGto8WY17ISz0e6HiVtpj1cigk8Rd+fx1JwTtJ+lBLmF7qlRjS/1AXtXnleP2/rLaqTGg
	MPmiyuN3rjqCB9zzv0PqZ93PhWqq+24X7+12kKExkLpbj6IRMUB7f1b496hA0pbmFMwyiIDIZMf
	o+9u/k0aITfooNSzpu1B/Dg+6tRHey5xF1yw1+nVc+TrZ6gcLDR9p6bNdD32eVWRtkp/4uFkJ2d
	cpUlE0GNQYeM+Dl1dOyQlhzDBD/96/c
X-Google-Smtp-Source: AGHT+IFvDQhu6CsebgluryUH8CXu1eAKa3zP2IKpP/Wjf4PIMli7t51Uiq0V6GBok93ecO9+onH2vA==
X-Received: by 2002:a05:7022:ff41:b0:119:e569:f629 with SMTP id a92af1059eb24-11b4160cecfmr11107125c88.34.1763525565630;
        Tue, 18 Nov 2025 20:12:45 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm66819088c88.0.2025.11.18.20.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:12:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 8/9] python3-arrow: Add missing rdeps on tzdata pre-commit modules
Date: Tue, 18 Nov 2025 20:12:34 -0800
Message-ID: <20251119041235.2448193-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119041235.2448193-1-raj.khem@gmail.com>
References: <20251119041235.2448193-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121881

These were missing pieces for ptests to work

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb b/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb
index 3394e4d323..a967f9e429 100644
--- a/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb
@@ -14,6 +14,7 @@ inherit pypi python_flit_core ptest-python-pytest
 RDEPENDS:${PN}-ptest += " \
     python3-dateparser \
     python3-dateutil-zoneinfo \
+    python3-pre-commit \
     python3-pytest-cov \
     python3-pytest-mock \
     python3-pytz \
@@ -23,4 +24,5 @@ RDEPENDS:${PN}-ptest += " \

 RDEPENDS:${PN} += " \
     python3-dateutil \
+    python3-tzdata \
 "

