Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523E0C35FF3
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 14:03:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.12595.1742306577985959867
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 07:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=I/jRXdEL;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0618746bso25579905e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1742306576; x=1742911376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIYsU1t+mtzMZC1Rrfkuc45N8lXpFJPsZe+Fuc5LqLg=;
        b=I/jRXdEL/hiOjG/dvtZudmHtsDiMUGvweCb6zgT1QLIUQUyIjHlhH/XtC9O1f0o5LP
         hBwhWNNcJ/cdHB9rTfSyzrE8hAyCpm7bv2crA1CzG3nbSzVlGh7eTcN69ZnZX5AXDFY5
         +s218gwaD0RkqI6m8BVVtfoXXtyn1haNT428I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742306576; x=1742911376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIYsU1t+mtzMZC1Rrfkuc45N8lXpFJPsZe+Fuc5LqLg=;
        b=FwlIzI00u08YuAQ2Lu+OZSLBgTcMHWiw7xyIGA4CwFmDu6WhrOcavnJ7dNamIbabXb
         WD3VqfadHT6uH6rngh7d6v69mY8bAWOC/aEv83RV0Ih8c8ItaoGNqWBmtoeqT2yGsTDw
         fxIz/v89kZU1rhGoOQpbQcusaVc1a/3RCVnubzIx/cgl1DNDNsRVy1nTBrQIrLQUXf9R
         +Z5/l4GMAldYqXCaiZFx2yudI0wvepinHjNqA4MATXz+Qsom+hm/JHMBEdBq0oMYMVQl
         60tYHBWMMpG0wppzVxxkbG82/kfpqmkRD+RmM3QL/W5m4mEY7D3Ve8ulr9X+mKPJOjnO
         e17g==
X-Gm-Message-State: AOJu0YyIff9f9OOGecBxon51QgQAGZ4lL2V8EYdvLWSpAIPz0B9lF1rx
	ymcBCU5d6F7gwQa8utLNDU2NwqqYEOmIVQhbTKCKpEhGOm9RVlFFoGDtnIMdD1HtW0IArkfcR4S
	m
X-Gm-Gg: ASbGncsufByuP/dsDXl2KnrDRJ9uKKRNwA6tDJeRxMvkj6ppoTXVLLrfipA5V8YAf2g
	Fo86MublnAg9ARpMknjJzYw8eh03PbyUVMHZK9cpJeoJwwQAY0YLxttb6ygklkDM6zlztBgiVbo
	7UPE87g5oVI1RphwSFnPc1Gse5PxShoJ1CV7iyM/wANwW7eKUcQfej71NZ4f0F3gk9deTHDEILE
	OJeU0ssf3lJ6f5zMNpud2y8F6EUpSRTfz4CduGMGpPBw21LHJHEeIOFND6jdwphJgS7pBj3cNQr
	Y8mX2n8Nj4Gly78JllmzV/bBdnJcMY5j2KUj2oSokdigcgri+3ANoW0BW5c=
X-Google-Smtp-Source: AGHT+IGYXHDSF59sM5JWSpjt67tCHdVi0NMi+0hkEB62zvAY99nbeUJ2pzciKoxoi3FZUPd2waG4FA==
X-Received: by 2002:a05:600c:4e4c:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-43d3b9ce579mr22418715e9.20.1742306576072;
        Tue, 18 Mar 2025 07:02:56 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d20e29a38sm131345035e9.37.2025.03.18.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 07:02:55 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-filelock: Upgrade 3.17.0 -> 3.18.0
Date: Tue, 18 Mar 2025 16:02:51 +0200
Message-Id: <20250318140251.522768-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318140251.522768-1-leon.anavi@konsulko.com>
References: <20250318140251.522768-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 14:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116059

Upgrade to release 3.18.0:

- Indicate that locks are exclusive/write locks
- Support fcntl check on Emscripten

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-filelock_3.17.0.bb => python3-filelock_3.18.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.17.0.bb => python3-filelock_3.18.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.17.0.bb b/meta-python/recipes-devtools/python/python3-filelock_3.18.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-filelock_3.17.0.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.18.0.bb
index 995a55c811..9c4721d4bf 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.18.0.bb
@@ -1,14 +1,14 @@
 # SPDX-License-Identifier: MIT
 # Copyright (C) 2023 iris-GmbH infrared & intelligent sensors
-
 SUMMARY = "A single module, which implements a platform independent file lock in Python, which provides a simple way of inter-process communication"
 HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "ee4e77401ef576ebb38cd7f13b9b28893194acc20a8e68e18730ba9c0e54660e"
+SRC_URI[sha256sum] = "adbc88eabb99d2fec8c9c1b229b171f18afa655400173ddc653d5d01501fb9f2"
 
 BBCLASSEXTEND = "native nativesdk"
+
 inherit pypi python_hatchling
 
 DEPENDS += "\
-- 
2.39.5


