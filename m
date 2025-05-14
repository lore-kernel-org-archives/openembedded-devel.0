Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0130C3ABD9
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 08:00:28 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.96569.1747209619558216650
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 May 2025 01:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IbFLxEK9;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acae7e7587dso1009023466b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 01:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747209618; x=1747814418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4BK7UaNr/Ue76NErC3aFSRAKMN6m1Km4DTuufyS033o=;
        b=IbFLxEK9vRArAoMGawJtCVjOpU5NV3wuhAdl+rpSZaPnYSj1aSrCnZnhw0xjH1Mfz1
         lAqetS/Q8fv4O7/sV3EJvfK7xY4oQdhwznGtMYVSj2WabAcHeQVOGOqNHkMXy27X8+ZW
         pHq9ImV2Kj8eVXBiV1Ouotl9IikQ+Ve8tcP9WDQbHZ8YvyGQEKPiuSDyqOsjHw52LhUo
         xs8ZN+sre0Pap97uAmpzNf/bWo2Gkgn/VpJiTJ7dyX497MCPzqTsQGHACk7u08xeJpsD
         Oga8cQ45AZlADKVMjwLX4ONywDhZFacdP/iSSKUnnvHEtg7wUgqIdhx/6lFGRZ5iPzwQ
         zU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747209618; x=1747814418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BK7UaNr/Ue76NErC3aFSRAKMN6m1Km4DTuufyS033o=;
        b=JRuJNlED302A6QPrHWfqIev7K1Mr5ljfdWncaRHOmpMW2OG6QzJW2A0yh6exGhWVrS
         Bp+PYTBZzYfsAItr49kam5zxr1wDwzvM3aIIr1sXgmBjNB2nzD/gT4V9B3pkVloee7Ib
         lNCIONZWc3ocjPU6R63hMYdANJNfreVI5FrOPK88O4a/Dn5ufrApXjHkZUbW/Rk0W/SS
         qI9RiIA9o9rXvFJKCbNeO1scxpjFr/ESayWyzFvSlZmZ6DwXVi2jhjtAwwULYR0JPL2K
         JmDoBNzOaxrCQgBi80Xb61u4mTZn+nRJG6s6fzni1Ni+0Yb00jAG7HreW4TyxZOlruvu
         JCvg==
X-Gm-Message-State: AOJu0Yw2866tdY7moQIIw1Gf4xfg3wzPAqMYvYIHRJM3NCCYvKnGCk32
	GcrMHL2dNoo76vMtPUIu6c+5SKakQm0PodtGyQMsibFTRbuCHxwlmGaHSg==
X-Gm-Gg: ASbGncukXkzDQ6x1VmaZbYzbGFnLF2VMG00eUQGEdqRdDnEaLP9ADUiQy0b5gembjhP
	7bW9s/L9x7es45UtfnNos6+gWsYjAnWdgAHap01awBzp2F8kkjvPZHIiGR1mvgQo0GslZXo7k2V
	MOKJbe+MnJEualPq7k6odYeTHJu8TOFRQrA0XnG3dOcFRTBTskWF43Qxr0CJhKbzik8FVxJMnn3
	k1zABedk9WdEJuy4N1gRMvFs74aMa8WaEn2z3ILe1ah7yO17k/UaoO/kkktzPeeW0gp02PB9UUv
	9kZeFiiXoz2QZKObox7KF0cHYyHYmhNc4VMojiwyDnw+6aqU7N/sy/PhYvLyt9VHpPDk8KPx0U3
	6eUHuTE+3
X-Google-Smtp-Source: AGHT+IGWKvl0stThraM2wOMn9sZSJkpifN7+/VQdyGyfmG2fxWO6YLoL+Lrz5gjJ/tHLNtl/urjswA==
X-Received: by 2002:a17:907:8b9a:b0:ad4:deae:dd13 with SMTP id a640c23a62f3a-ad4f7293ce1mr201482566b.45.1747209617656;
        Wed, 14 May 2025 01:00:17 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad247f283f6sm562523466b.36.2025.05.14.01.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:00:17 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] python3-gcovr: fix build with newer hatch-fancy-pypi-readme
Date: Wed, 14 May 2025 10:00:14 +0200
Message-ID: <20250514080014.2482513-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 08:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117411

From: Martin Jansa <martin.jansa@gmail.com>

It was upgraded in:
https://lists.openembedded.org/g/openembedded-core/message/216335

and now this fails with:
* Getting build dependencies for wheel...

ERROR Missing dependencies:
hatch-fancy-pypi-readme==24.1.0

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...yproject.toml-Support-newer-versions.patch | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch b/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch
index cf5ddf31cc..b06acdf333 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch
+++ b/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch
@@ -1,4 +1,4 @@
-From 7963caede294c7615ab0a60900e37790731279cc Mon Sep 17 00:00:00 2001
+From 99d7788bab614ff5a451f09204139b4cae40be3e Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Tue, 4 Mar 2025 13:30:48 +0000
 Subject: [PATCH] pyproject.toml: Support newer versions
@@ -9,22 +9,23 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ pyproject.toml | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index e162ba062..89798fa23 100644
+index f8e54eb03..e6242f042 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -1,7 +1,7 @@
+@@ -1,9 +1,9 @@
  
  [build-system]
  requires = [
 -    "hatchling==1.26.1",
+-    "hatch-vcs==0.4.0",
+-    "hatch-fancy-pypi-readme==24.1.0"
 +    "hatchling>=1.26.1",
-     "hatch-vcs==0.4.0",
-     "hatch-fancy-pypi-readme==24.1.0"
++    "hatch-vcs>=0.4.0",
++    "hatch-fancy-pypi-readme>=24.1.0"
  ]
--- 
-2.39.5
-
+ build-backend = "hatchling.build"
+ 

