Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900C8CEE346
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 17:54:30 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3196.1763488464318772072
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 09:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TCghn0To;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bc0e89640b9so3958907a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763488463; x=1764093263; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1yHy/YjW76lY08PNw+yLljgBQ5JhHQM1zJ4q5cYGtyk=;
        b=TCghn0ToPLXPQkGilJjX6TCduCgPFQ5Btwp1psJ8Kp80jichXl7NVYJY4ZDtlU0u0i
         PrQovdrikOMLSuYcIiPnenf4hngzYyqfDjvW0XtHPJyno8lh1MI4L0QDf48lU3WzGn+E
         G++CWZ4GTUbFlE7d0ysVYIKTAiVfiXadP3uwO5xgPGLguFyaIm5UYADYTUKjT3vyw770
         Tfz+03bcGLlY6ebPLYvHGsvQXdrafgl5EqJl6HuI6qOM9B1xxtpUorhLZkMayOTp2J2L
         Mn83V3jIqQfTFKQ/ahGyJnSk9ypjD9o1OAprFGulXQHHjunsaAy39TvHQsjjseo32igJ
         R1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763488463; x=1764093263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yHy/YjW76lY08PNw+yLljgBQ5JhHQM1zJ4q5cYGtyk=;
        b=caicCRUArlZQt2+Ug5nDlvgbA3gfvPo1GaTU2wbI6ZCMX+qTrINlC6R2e2ANt8ureP
         LwEUrbctL5mkrLPdm5WzT0FsHVIPptG3Ec/7FWnctyVCtEtI6KDnlTW2J99+oFB0BEXT
         jHwg/FAvBX8Ki0HfWuK1OuD1ELuItHTT3opn7sTR3mmEoTX+NvoPJwR/BRN7byBcmF+7
         8twXY1+Z7hFBH0OFS4e/HUBaGuRX7MM3GEQswJsIp0T72djXOdmipFq/gOi6FJP7loA+
         4bHN4QpDTphFxwsYRSmMzO8XFvt010LuHEMX2to6eAwoYKZHoFywJUEfehGBKBVsL54D
         Zdtg==
X-Gm-Message-State: AOJu0Yyu0O22QXb+tYbs438qnQmndL6znagaIVwNUxC91BQseawPey6j
	rKJFt7n2Ot/vlKv9/JTgI9XBuOaeo18C3ZYFDiGErdXcsz4lhaBZyBffbHHgrkJ3CDE=
X-Gm-Gg: ASbGncuw0Qv+bNvMSIdA7VuedL7MSvwZE4BRPij/dCQl5R3xwODfVoszFevKbaAnQvG
	ZK6XQfCxMDIcnHFyIcCktT3v1yZDXIGIBccDhapW8ur8ZDNN3qZ+mV+rpWgvLXuEmLwWl6Mnrq9
	27aYUchJPkYuXkEYZ5JNPKgiIqAFWrIq+oxytWioWZQ6Na/bgEPZD8i1F8oCGNsehNi/3NIuUXP
	QqOB146UoI3j5KHIzu9ythJA4oJX0MXQG4fUazbdGeiPVruqqsgqMs0QAt4/yRzuSGVaEsh6iv9
	AYHJxDFr5nI7h1mCzPzCiQ37LkRdMgUMJWebWCJR+LUhrT7gJuTeTGZZmXbDLoZmQVagP56lR4D
	OivSM9Ahnj1TB9RD4l4lyS7x4AJ0+BDX3dbC6NUUKvMUmPYb9lId3KSpmjjPytMenq6TKujrahV
	XETaH+zvWAfpnlHz6aHmEmqSIcSZqDPpQrzmCLX4HXW7KdI0ukVLb+rjuJtwxFA17RbuA5xSDDb
	mp9eE/XQoW7x9wSehQK8OIKrERu0RPmpB80TJU66V0=
X-Google-Smtp-Source: AGHT+IH89KY9qxI2qoHbGWuAt5R+g1HS01NEn6kHVpxbxX2mrsojU1MRgLaZInAvugxHWx2Ji360Sw==
X-Received: by 2002:a05:7300:bc86:b0:2a4:3594:72d4 with SMTP id 5a478bee46e88-2a4ab88e643mr7585389eec.3.1763488463351;
        Tue, 18 Nov 2025 09:54:23 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d695821sm67188430eec.0.2025.11.18.09.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 09:54:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v3] python3-python-dotenv: Add missing rdep on click module and coreutils
Date: Tue, 18 Nov 2025 09:54:20 -0800
Message-ID: <20251118175420.1699182-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 17:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121866

Needed for ptests to pass

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add coreutils dep for printenv utility used in ptests
v3: Use PTEST_ENABLED for check instead of distro feature

 .../recipes-devtools/python/python3-python-dotenv_1.2.1.bb    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
index 58784fcf2e..22b976dd9c 100644
--- a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
@@ -11,12 +11,14 @@ SRC_URI += "file://0001-test_main.py-skip-two-test-when-running-as-root.patch"
 inherit pypi python_setuptools_build_meta ptest-python-pytest

 # Uncomment this line to enable all the optional features.
-#PACKAGECONFIG ?= "cli"
+PACKAGECONFIG ?= ""
+PACKAGECONFIG:append = "${@bb.utils.contains('PTEST_ENABLED', '1', ' cli', '', d)}"
 PACKAGECONFIG[cli] = ",,,python3-click"

 PYPI_PACKAGE = "python_dotenv"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"

 RDEPENDS:${PN}-ptest += "\
+    coreutils \
     python3-sh \
 "

