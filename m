Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7644F30268
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:58:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29044.1773583112019150864
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d9f5U4HI;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48539cbb7b1so20742435e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 06:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773583110; x=1774187910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZVDahdsiBf43eHhGt5knCb2xgzijlNq2vnQbIQDwCQ=;
        b=d9f5U4HIXRN7my26f+MwWR2vLEapTmF/vjOeJkMEkSclE9lmd2soyAU+i9kHZKHCGd
         ibU/CxnyAHVrh2rpactYbR5ou1h96adD6rFYP0Pe4PBqukYvXcCnHUCDbCIXwFp1Z+qY
         NprVBinVVqLEE0rHlbuLsEPjRHmptqseqJHqrtV6sE8AoIYeUZPTwu2jyjS7Yhz2elAw
         qKrb/GhTrhTcsjROlxxPjp21OosE5x2BCZ4tfjDdoaO/18Ryeb02hGqRYtZQIJpqTu3G
         idPDYUNuhkqT6xGixCcO3+JWj+sFMkUIiJUMSez2lKEuM0Xw9+KnbXB6HLuAQqvxx2PE
         C/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773583110; x=1774187910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZVDahdsiBf43eHhGt5knCb2xgzijlNq2vnQbIQDwCQ=;
        b=kWCoqITo2fMPKRAdLwOwjMGekmV4R/2SbfETMmom6DEBCHzi+fH7Y/otOhCPSS2bHR
         /60erwavIxqnkNT7Ih9O4/rvuG1qJ+fHwMS69l5yqOb+1imDQaxAuyOfHj3myEorhlk3
         jQRQakVpGrX5FbaV6ns9kbrUpsPd3lntIVSkO0QFV3D2AtoURUmzHgwnccPJVU6pXBez
         WeJCEaOYFxgy90/2NxO5p8oBS15f/4mF99zAB20HhY18FEnkwtGkJhkVa6cDdymMzNuO
         gdkumfCKkKr0BOLUpRiAErfU406mSshHWQgupZ7Q8C/Dv4YNOEOiNhdd6bTmViBhJxLb
         MzDw==
X-Gm-Message-State: AOJu0Yzaf47d30b7betYj42W/8in3TdCeR3uoyz88fvBuRujNJ+k+3nB
	+9IbOjR/kmwh87naOvR5reFSvB4oIQ8QxX8f3+NiKZIc65YDhdYWNas+IZ1bzQ==
X-Gm-Gg: ATEYQzzomivbu8OD1pqczJF/L6fcAg5fNUCg4aHJD7hdlfjB1rbbfLVOA5Kzy+iotX5
	ZFK9H7rAx35bdDMcOPfZcQ8lPQNaRUbJNQSTVKkNpvo4//NQ82UF/pUnuBLhCAikdW2fXjrsQ8P
	z2S7ryH1Vq+eNbfBc9vEiLGP919zHbj0FKNqDYI8e+DlMBmQIBNo53vPFub3shnhEBnblp/yL3K
	cgWVYiB1oL3oYcb+Azt9Besp4EBD6h+DmLkrndyWGK+UBnXdYtC8SlaETDo6V0sQbOTB33P8kRG
	mJVNLoOLUwC+SLLol7A6rcEQ+GlbFXzOI78x0TZghy/garzLQeFj7ogjS41b/Zzc28taX/H3Cfk
	wU20VnI/LIN2p3g0fzl/EWussM5UpUd1ZHgK+JeCQBWjUI/4qze6jMECfHVRbav3Y6fefUbCxd/
	yx6YN/kY/YlrrRuyfJhSKi
X-Received: by 2002:a05:600c:3b16:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-4855671e83bmr161825555e9.24.1773583110002;
        Sun, 15 Mar 2026 06:58:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm446111605e9.3.2026.03.15.06.58.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 06:58:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-httptools: allow building with latest setuptools
Date: Sun, 15 Mar 2026 14:58:28 +0100
Message-ID: <20260315135828.1074994-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125244

By default this recipe requires Setuptools with strictly version 80.9.0.
oe-core has updated Setuptools to 82.0, and this recipe failed to build.

This patch relaxes the Setuptools version requirements.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...llow-building-with-latest-setuptools.patch | 23 +++++++++++++++++++
 .../python/python3-httptools_0.7.1.bb         |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-httptools/0001-Allow-building-with-latest-setuptools.patch

diff --git a/meta-python/recipes-devtools/python/python3-httptools/0001-Allow-building-with-latest-setuptools.patch b/meta-python/recipes-devtools/python/python3-httptools/0001-Allow-building-with-latest-setuptools.patch
new file mode 100644
index 0000000000..cad199f275
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-httptools/0001-Allow-building-with-latest-setuptools.patch
@@ -0,0 +1,23 @@
+From 61e4a5acc1ec27ca295f4c0f288b97208fec1f78 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 14 Mar 2026 16:55:54 +0100
+Subject: [PATCH] Allow building with latest setuptools
+
+Upstream-Status: Submitted [https://github.com/MagicStack/httptools/pull/138]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index e2acba3..86c46de 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,6 @@
+ [build-system]
+ build-backend = "setuptools.build_meta"
+-requires = ["setuptools==80.9.0"]
++requires = ["setuptools>=80.9.0,<=82.0.1"]
+ 
+ [project]
+ name = "httptools"
diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.7.1.bb b/meta-python/recipes-devtools/python/python3-httptools_0.7.1.bb
index f961745a1b..01e317732b 100644
--- a/meta-python/recipes-devtools/python/python3-httptools_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-httptools_0.7.1.bb
@@ -6,3 +6,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI[sha256sum] = "abd72556974f8e7c74a259655924a717a2365b236c882c3f6f8a45fe94703ac9"
+SRC_URI += "file://0001-Allow-building-with-latest-setuptools.patch"

