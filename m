Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A3BC46CA0
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:24:41 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.113088.1701991475696432686
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AXa2x+yn;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: ticotimo@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6d9b05bed94so964093a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 15:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701991474; x=1702596274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25Xs9fiKTeMYl+whsNTzxktB8U4Bk0Xh6aoEvm55jWs=;
        b=AXa2x+ynX6PQY2YBpQO8Nrf8LyCuwnh3JjrkMo527uaTxT16ZBY4nHCl4o8CtdMvO/
         Qz5HOR/xZnldJdX7ewTd7H9yJM2OXa9aIxuiVipkxEgRwVX5q9OB0NaDU7v9LAly6u3V
         uYiGqOP+QQTKZ9W3c2gGamS0HQomIG9ZpCGV8zQNotDhlCogdh9Jka+ROHoWK3RI53Rx
         bGaIASDntm1eiaHlzuoxiBA8//hKxWS5xp9AdATfwZ75kTabOj5D3thq/RsBRIH5VYU8
         eza0YZQdOl+oqn21G0asrs4u0kXcIXl9Fi6Y4qoBjK4nawrt2Sls4QZ9HJzjUbqMw0UM
         1ycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701991474; x=1702596274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25Xs9fiKTeMYl+whsNTzxktB8U4Bk0Xh6aoEvm55jWs=;
        b=b4p6hnXFLZLGDAtEaJ1xmXOvJNsv0D3VfcJRA7BwRNYR6yn6vZGRU0gfHcEEJPZUi0
         rWjxBZ6wCTPkszktv7E6N0aUZVo1YP1CScbu0gmCakmg1g+iD6uLNSsDGlvVyA4Tlcdw
         cLTL3GPD9fLrfKyZYvommO0omb9REyJklBqQ7UJaU3nkJ45Z4C46xDHwUHj1XvHUZ7oF
         /p76MlRTcKIFMdvjyu8otKHkiODBl/AR333YK0RDVjfYUYPT1iCft/s62o9TKzguHhe2
         lCvbU0oqdL2Th/K4go05eCXgpWEkDmPNHviCdRdY4FX1rd5HACq+AhzOKsCn7+H+C3HG
         qtyw==
X-Gm-Message-State: AOJu0YxM22yZHqHgGSfuSY9ggM14uMMTW3Khd8k5iaQCaS+/qjNexWD+
	tVpshpQR4RX1Fq31C6oOj3FC3piIpn0=
X-Google-Smtp-Source: AGHT+IHqzKyRDfMB17UBZ4lrdEuGtc/clPKhtRT6cSk58Mq9Os+jiftZTWExVAu8SrH9RcCaSneFHw==
X-Received: by 2002:a05:6358:730b:b0:170:17eb:204c with SMTP id d11-20020a056358730b00b0017017eb204cmr3388037rwg.53.1701991474231;
        Thu, 07 Dec 2023 15:24:34 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f523:dc1d:b135:87b9])
        by smtp.gmail.com with ESMTPSA id ff16-20020a056a002f5000b006ce742b6b1fsm324266pfb.63.2023.12.07.15.24.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:24:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 5/7] python3-pydantic-core: enable ptest
Date: Thu,  7 Dec 2023 15:23:55 -0800
Message-Id: <e3b18f45a2c2a09e78dec9119a15994d08c10f68.1701991044.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701991044.git.ticotimo@gmail.com>
References: <cover.1701991044.git.ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 23:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107297

* Add to ptest-packagelists-meta-python.inc "FAST" under 30 seconds

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../include/ptest-packagelists-meta-python.inc    |  1 +
 .../python/python3-pydantic-core/run-ptest        |  3 +++
 .../python/python3-pydantic-core_2.14.5.bb        | 15 +++++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 3272d9819..13dcb621d 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -27,6 +27,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-polyline \
     python3-precise-runner \
     python3-prettytable \
+    python3-pydantic-core \
     python3-pylint \
     python3-ptyprocess \
     python3-py-cpuinfo \
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core/run-ptest b/meta-python/recipes-devtools/python/python3-pydantic-core/run-ptest
new file mode 100644
index 000000000..8d2017d39
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.5.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.5.bb
index 8221de80b..01f180c8c 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.14.5.bb
@@ -23,3 +23,18 @@ PYPI_ARCHIVE_NAME = "pydantic_core-${PV}.${PYPI_PACKAGE_EXT}"
 RDEPENDS:${PN} += "python3-typing-extensions"
 
 INSANE_SKIP:${PN} = "already-stripped"
+
+inherit ptest
+SRC_URI += "file://run-ptest"
+RDEPENDS:${PN}-ptest += "\
+    python3-dirty-equals \
+    python3-hypothesis \
+    python3-pytest \
+    python3-pytest-mock \
+    python3-unittest-automake-output \
+"
+
+do_install_ptest() {
+    cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
+    rm -rf ${D}${PTEST_PATH}/tests/benchmarks
+}
-- 
2.34.1


