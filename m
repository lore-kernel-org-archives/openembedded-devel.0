Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8F6CEBF93
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 07:24:48 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7300.1763450679296892065
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 23:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ecv5oY2B;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2980d9b7df5so54315655ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 23:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763450678; x=1764055478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oZ2RGBkf+FbJ0nLgs7W32gGco9yvChKiXHVe8ipUO8Y=;
        b=ecv5oY2Bjj338zQ1RFB19svTy4/IGHQ5UVioTSTLSUploYlchz7cZMX0I+7yMTzSXe
         AyuioaPfIPzhHtl1S/PPuhiBkBmGJFxvhhyQGvbLz8qoZ0tN31M2EG79colsDyXM99+0
         bFxfL46YzmRgw1ymfvRT/zyYv0DT8VLt8l67SViTtXJaXglfFu6KFqv6ebJ0a0YzCYAk
         VhOgOVXfTh6ySaWlXVyPNE04eI8IcXSE/vOsluvrtAc2kdnaexMUt8d8XdaWuCJlYEA6
         O+2Q2PbkmN7TyW4Y/XFDlWi3PoNeS3tsBIADM5IYk3M8KKzmI43KA+4EvaXzXWwa7WN2
         gWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763450678; x=1764055478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZ2RGBkf+FbJ0nLgs7W32gGco9yvChKiXHVe8ipUO8Y=;
        b=F0qmmX/hxrjfsowf7oG6x/l7nrIO8nPcHy8dYW6+JbB62urMOUnRqbFe5/TabujxS5
         izPf/zZjxM+UlkMYkI1X/TI0q1kNSbx0w62SP1nX9nla37Ag9YkYhKhShvBDZxaEj6LP
         CUxC38zT3pWxphT6Q5EDKbjTkYgn8Q4adPfhUflgcSs2UaEGogVMf3dC5I3yKrRLPM9I
         XY+OK5A2ToH8FkMcClivh5xpFYdOA0t3jGJ2EL5jlU1ywaz6cRXnCVaIAsN1di4lseb1
         N9uut2k/g69dEEODxXFnXmbiG6wjnR6SVcCUJ8RPwaghodW3glOwSLACNktdXvB/y7Qa
         qOIA==
X-Gm-Message-State: AOJu0YwvmCrOEK/gY1L8ope3h0wt6aMegs2M04bPLxDDpGJmxmn0HGQk
	DQjUv5WLsS/anDV8KUPcq74F96R7ykb0SFT4iS7c2IGYEALvyLJqfmrLO0lEC8+iYcM=
X-Gm-Gg: ASbGncuXA1Tv3Ldb4pPIDuZbY2P2sDFIEtUkSuureu3rM5yB1fxKjg8vl4B2TeOCQ0z
	Gh2jKwKn+JfgD8YrO1WGDQwMcRstVXzmLvx+fiqG1+LWl7ZzoKqN5S+ES9IplhmComx8r4KXkbk
	bAmsRdvhybnOcxWxB7+Ou2MzYAnSo8kB7sN27Ztdims+9wNuJWkA6nfkVoByKRh1PmPns9Nrk+J
	SUen29901xXZ8y6fcSvkSQzrAD9yRC03+Ax6CH60H0MiTLQOm9ZSePGzBN1i+w87StjFJrE7uDi
	iD7oNSEGlTWt6smL7cLGIPfeCeBlkRmCjHOqo4c3Rh2nQrLmfX0GK+ONtuiepNBJWjrhVx49vAe
	+S/rUi4pIPaJkUM8YwU/+FKTtCGhMU0EouC1BdcHbb4Hs2sH/PByl1YsRaeDHcD1lvyKgiEyoxF
	2Wg2zWwoJK0cGbYuloE6+JY0pf8iVI+D1v/jTc+w4SfIXI/MNSRkiEw5akUMC72apuVwJK3OHpr
	MM3pxz1bezjIuMQLn5OHDICIos+wQWePf67DoGOXMs=
X-Google-Smtp-Source: AGHT+IFMh8uuOHMNiLggrn2Hc15msJKxSWoG4jnbl4Axu9DZnEiMz9p8FXt7gHvA1uD7XVeo3HQ3HA==
X-Received: by 2002:a05:701b:2401:b0:119:e56b:9581 with SMTP id a92af1059eb24-11b40e7c830mr5280331c88.6.1763450678273;
        Mon, 17 Nov 2025 23:24:38 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b80fd6790sm31306808c88.10.2025.11.17.23.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:24:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2] python3-python-dotenv: Add missing rdep on click module and coreutils
Date: Mon, 17 Nov 2025 23:24:35 -0800
Message-ID: <20251118072435.4104724-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 07:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121810

Needed for ptests to pass

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add coreutils dep for printenv utility used in ptests

 .../recipes-devtools/python/python3-python-dotenv_1.2.1.bb    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
index 58784fcf2e..a63bd7ae28 100644
--- a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
@@ -11,12 +11,14 @@ SRC_URI += "file://0001-test_main.py-skip-two-test-when-running-as-root.patch"
 inherit pypi python_setuptools_build_meta ptest-python-pytest

 # Uncomment this line to enable all the optional features.
-#PACKAGECONFIG ?= "cli"
+PACKAGECONFIG ?= ""
+PACKAGECONFIG:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' cli', '', d)}"
 PACKAGECONFIG[cli] = ",,,python3-click"

 PYPI_PACKAGE = "python_dotenv"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"

 RDEPENDS:${PN}-ptest += "\
+    coreutils \
     python3-sh \
 "

