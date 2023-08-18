Return-Path: <roger@norberthealth.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEF5C001DE
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 11:42:32 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.9035.1692358948424594649
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Aug 2023 04:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norberthealth-com.20221208.gappssmtp.com header.s=20221208 header.b=C/EOHLFP;
 spf=pass (domain: norberthealth.com, ip: 209.85.167.44, mailfrom: roger@norberthealth.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so1240448e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 04:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20221208.gappssmtp.com; s=20221208; t=1692358946; x=1692963746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q4s8ox6o55WQ6fm+vYJ2YqQaDwwA1NX4M7q3mfvwy38=;
        b=C/EOHLFPRFGlw9sNn40tbtPX9EZHmq9I/utUXnjo19xvRYMllR0YFu8WvGQtJIJnFC
         w4um84Ni+CZpaOxG0cOF8yFPsq/+tYPNdMLQGoGemsP2iQgHAhkFObmDrEq219P6MqEM
         9JIieZTntGfIiKKyWABJO6FUp3n9VUaqGAraa1X0JmjpD3sXabfr5J60wdWPM6mUCe3e
         vRMT5EngInpYOfeWBdYCY5CDz58jFDDYYWB1aAYJkZsS7beiFtXQBING+zmdSYT5i7eb
         KMsCJU/Z2oaEMVes0IkT/bcQbhc+1t7eJkxg1SByWhgUBDjhmJXzFkQuON1ycxxHPx32
         pBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692358946; x=1692963746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4s8ox6o55WQ6fm+vYJ2YqQaDwwA1NX4M7q3mfvwy38=;
        b=BzwzJsdGBcRQKIHD39CpMg2ayoclZ/8AiRl28z6n7nozWjlZzNtzKI5MJLDvpfRXHq
         IiwwQkBtlsSEHT0+Y82XPi3AAdXINpYuENpHPVsLkwZQj9SCMRYf3hncGBaYNlSILD0v
         P4ijYsKVbuylCzeT4L809SaQ+nB81RURFkV8cOXBscoi0+rkjE3PiyY64wyQ6tc5kDC2
         b27THk1F/0brWbl/pVFqUPPjG4A7T3/aKVQgGsgScqfajaHSz8/3yrAQPICA1PabENYb
         DG8gFFt7C8hzY3lFbIEwC2H6Clz6gAVJm1WrCLKxtUhwa8sZdVbliISSJKlSakpyx09b
         q8lQ==
X-Gm-Message-State: AOJu0YwG6gB4cMrrwMnlT9/CzQqFsKrhD68R1doHnlQk11R0qvDOut9G
	G3v3yFoEW4/60t2PlmYyY2Y2uG32lh7fylSteB+mwQ==
X-Google-Smtp-Source: AGHT+IGCUG6eh99TZ008GlfRyQXuAZz6VlQvTcFiXu/mTD7NEJ8671WM+zkSrShv4aNcjsQdP9VTSw==
X-Received: by 2002:a05:6512:28f:b0:4ff:a23b:de26 with SMTP id j15-20020a056512028f00b004ffa23bde26mr1431145lfp.52.1692358945817;
        Fri, 18 Aug 2023 04:42:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:214:bf30:8993:b321:4936:7469])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c379200b003fc01189b0dsm2523262wmr.42.2023.08.18.04.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 04:42:25 -0700 (PDT)
From: Roger Knecht <roger@norberthealth.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Khem Raj <raj.khem@gmail.com>,
	Roger Knecht <roger@norberthealth.com>
Subject: [meta-python][PATCH] python3-schedule: add recipe
Date: Fri, 18 Aug 2023 13:41:56 +0200
Message-Id: <20230818114156.367538-1-roger@norberthealth.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 11:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104488

Add a recipe for python schedule library.

Signed-off-by: Roger Knecht <roger@norberthealth.com>
---
 .../recipes-devtools/python/python3-schedule_1.2.0.bb  | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-schedule_1.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-schedule_1.2.0.bb b/meta-python/recipes-devtools/python/python3-schedule_1.2.0.bb
new file mode 100644
index 000000000..98b7690e1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-schedule_1.2.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Job scheduling for humans"
+HOMEPAGE = "https://github.com/dbader/schedule"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6400f153491d45ea3459761627ca24b2"
+
+SRC_URI[sha256sum] = "b4ad697aafba7184c9eb6a1e2ebc41f781547242acde8ceae9a0a25b04c0922d"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += "${PYTHON_PN}-datetime ${PYTHON_PN}-logging ${PYTHON_PN}-math"
-- 
2.25.1


