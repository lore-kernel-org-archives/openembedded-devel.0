Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE8BD1BDED
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 20:22:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.550.1730751756586366979
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Nov 2024 12:22:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F5tvn4WO;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43152b79d25so39661435e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 12:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730751755; x=1731356555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9x+Y13mDNuXUnHzf8OtPDRufpGHAEiyNPiZDMlWS0W0=;
        b=F5tvn4WOUxhjHS3++o7iVmLvgdURpI5WVoUZqmf307ZzRlaGsj42GjW2ib0kMe2HEF
         6zVkJtsB9jBBpOz1TF8YdlQ10pJ1hGC9AZAqxPLHObPijConnYHYImkNAMeIfjz7dFYT
         z2Inu9uspRrYjgoXOXo711K7e8FOUVny9U/lQ64MPUxj1u99FcR8q9HDqUwE2McyVwpn
         Qp6+JMLW3FzgBcCP9fhkn/YDzDqqb74ct0MOVcts3EpovV3bUU59ZpNrMZDLTqNA5DSJ
         zd6EIo63PSRer2J58RGXA5JwZ7Jt3Y/njxEItyzTs/OByyk8Ps/mHjr5oZ9XxyddBxST
         jHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730751755; x=1731356555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9x+Y13mDNuXUnHzf8OtPDRufpGHAEiyNPiZDMlWS0W0=;
        b=oqM/v9IkZIyHiqfY58lxz2LE7kob2Q6nw6ofcsaBW0+xlV58XpAFGdG5zot/GFu8PE
         lz6guaPsi+QP0Y0rrKPcb+UFpDCcLPApjKuDC+SE+KlwZCpr6R9YwVBWk2ZZPW0P7Hlm
         Pr2DAgo7VqvLHB9VakC1X/rc/0YXGqrqWop/pkkF4ZjXO9KTlmM4Jk1KFht4+4CaOQpr
         Loq9PQ4ZavVPKfV7zwVEbXU1p/aYzLkBYhkSN3HC1pcmmuJF3JNFHknMJjNeu4QcQ6tc
         ysVPV+H1EJeKxr0M66EGAU3JNg84uXojch7NiR77sR7kCR8zW1jgFOpHHVlkmiI+A0IB
         0c1w==
X-Gm-Message-State: AOJu0YzDVXltrj5gKuvtN38xWgxPYCqxFhNF/Lf21oV/OqoUg0iRMFWf
	2kT1jt9SFujD7j32pyMivIfOe2ThGwX5RXUyrBbg7spcwf9/XTNxwiNc0v+n
X-Google-Smtp-Source: AGHT+IF40xsEMWk0SPKEB7XtSfwcnG7Uy5QC9l7mzJw9wtlhPrSMJAQ9+FmvZHXQKeVXtEn36x8DDQ==
X-Received: by 2002:a05:600c:3b14:b0:431:5c17:d575 with SMTP id 5b1f17b1804b1-4327b6f9521mr147396725e9.11.1730751754580;
        Mon, 04 Nov 2024 12:22:34 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qxtdobqrxrcewr.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:6021:e9a4:5aa0:257b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e885sm14113696f8f.89.2024.11.04.12.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 12:22:34 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-apiflask: version bump 2.1.1 -> 2.2.1
Date: Mon,  4 Nov 2024 21:21:57 +0100
Message-Id: <20241104202157.2231657-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 20:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113409

fixed:
  do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]
  warning:oelint.vars.dependsordered:'RDEPENDS' entries should be ordered alphabetically

Download of the source archive was failing with PYPI_PACKAGE set.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 ...on3-apiflask_2.1.1.bb => python3-apiflask_2.2.1.bb} | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-apiflask_2.1.1.bb => python3-apiflask_2.2.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-apiflask_2.1.1.bb b/meta-python/recipes-devtools/python/python3-apiflask_2.2.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-apiflask_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-apiflask_2.2.1.bb
index 94f2e37a8..d6e88beec 100644
--- a/meta-python/recipes-devtools/python/python3-apiflask_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-apiflask_2.2.1.bb
@@ -3,16 +3,14 @@ HOMEPAGE = "https://github.com/apiflask/apiflask"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5f89d1b0dec37448d4f4163dc3c40e64"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE = "APIFlask"
-
-SRC_URI[sha256sum] = "88db5a539cc155e35d9636d99b434d00ca6c0b23e7c87c8321ec9dc980535366"
+SRC_URI[sha256sum] = "9c7573fedbb75524396c5733d4b0c150d1839a5d52b905c15b6a36e030c44908"
 
 RDEPENDS:${PN} += "\
+    python3-apispec \
     python3-flask \
+    python3-flask-httpauth \
     python3-flask-marshmallow \
     python3-webargs \
-    python3-flask-httpauth \
-    python3-apispec \
     "
-- 
2.39.5


