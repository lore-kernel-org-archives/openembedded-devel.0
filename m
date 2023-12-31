Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24F5C47079
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.218949.1704025430521614194
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jddynPyh;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40d5b159497so45325155e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025429; x=1704630229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiywUULPPOMgQruF1QzkkmJA8tSd/OtJQZPpNrYyLn8=;
        b=jddynPyh4X+cbEwfmkszb2klb/dnrPu+qJMDZKN9Tyc7+dzMq5ah1qzcZYrO0b7U07
         t2Wu+X7jCvB1cQovS6F9QhzOvxtNvToLaEUOcR8/ag6GoUJCPP1Nrn8B+19NOGUYkaTZ
         awlWPKPtgwrxydtdUywfj2RXkKYokY8qkUGsdHelSiW9ER/srzoCbgzwJkBn86D1KvCQ
         hUUhRXK/InJdgC5WAF1QKdbrKXfkALl0dcvMw7v3dsnpRBWXZzAC+bYjxDOuegVivmrL
         Cd+hO2n+oej39/wh+6YT1uh82INXyN9O/mGeAfadgYFI4YctwX2q+4rANymZWdxy2cWR
         iItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025429; x=1704630229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiywUULPPOMgQruF1QzkkmJA8tSd/OtJQZPpNrYyLn8=;
        b=lwVgwvJxcK2A+letf/cSJjqYpDfI9r2MqTf2gWrRaHO4WfW3RahJdVd56MQb7VuL7U
         mxHrdO4oUOFlOUG91bOnBqepG7BdJb2/I/+4GKb6Av9Jp2mMzNoC+GOwbf9x4sThslSV
         xukipJ4g/5M7eir15Xbkrbw8nY7H4LEnZK18Rq1Ds0yJXhpyIQfe1uhSmzFGsIb1jupA
         COhJvRkIHNWhxRa0ZOpQXYXPhxWyUqRQNghosQ/+GLPLv7ZGKGAgNCrRFlqNAmAD+uBq
         5DdZZiwmEhZ81kQfozCaiETKc8yTlw/cK1z5BA1NEXDza5gs/R3k71KNc2aFIegqzBlg
         92bg==
X-Gm-Message-State: AOJu0Ywtrac9CDLVQiNySHfOkra2N5s5u8kFuzP4zBtzrkVU6Viu92zX
	1nJ+eOOQQIHmoSrAB+VNkMaDaEToldM=
X-Google-Smtp-Source: AGHT+IF5VD2rc03Ini/WATj0JUnj2JBMBqQDVnrF4SOH+UihoOFQeki8DtjU+/PrzfCbH1p0GE3zcQ==
X-Received: by 2002:a05:600c:2315:b0:40c:5536:66da with SMTP id 21-20020a05600c231500b0040c553666damr4824244wmo.21.1704025429019;
        Sun, 31 Dec 2023 04:23:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/23] python3-kmod: remove the recipe
Date: Sun, 31 Dec 2023 13:23:28 +0100
Message-Id: <20231231122329.405225-22-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107973

Not compatible with cython 3.x, and has been inactive for years:
https://pypi.org/project/kmod/#description
https://github.com/agrover/python-kmod

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../packagegroups/packagegroup-meta-python.bb     |  1 -
 .../recipes-devtools/python/python3-kmod_0.9.1.bb | 15 ---------------
 2 files changed, 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 32e962aff..41fce5327 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -217,7 +217,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-keras-preprocessing \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 opengl", "python3-kivy", "", d)} \
     python3-kiwisolver \
-    python3-kmod \
     python3-langtable \
     python3-lazy-object-proxy \
     python3-libconf \
diff --git a/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb b/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb
deleted file mode 100644
index 52e1cf6af..000000000
--- a/meta-python/recipes-devtools/python/python3-kmod_0.9.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Python bindings for kmod/libkmod."
-HOMEPAGE = "https://github.com/agrover/python-kmod"
-SECTION = "devel/python"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6d62c2454850386a2ffe44f72db83d74"
-
-inherit pypi setuptools3
-
-RECIPE_NO_UPDATE_REASON = "Version 0.9.2 is broken when using latest build machinery for C extensions"
-SRC_URI[sha256sum] = "f3bf829059bf88eca22f4f549e17aa316cdaa14302bf2ba49ddeee60cea109ff"
-
-DEPENDS += " \
-    kmod \
-    python3-cython-native \
-"
-- 
2.39.2


