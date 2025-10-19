Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4FECCD183
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 12:21:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.23621.1760876455963135681
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 05:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IeSFN5CP;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47117f92e32so19901725e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 05:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760876454; x=1761481254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFBKrabeVPEa7G34w35TSk6SUPSAEP+1Je9OoJxDhX8=;
        b=IeSFN5CPg745x58jQtiRPi5N7xegCumnMMayOXTdyTSgnUJyKhN58byAWWw28knO1E
         nEMZa9AOgmW+oU/8XWp1Pe/88+IWwbqOQNo7QdYlHNV1ok5OiK3cabtxS4QWk/0J9dIl
         2kJJkrv/LW5BTMQgX9fznDS1swONZE8siQWBfX+5xoL9JMEWjYSAp/NB9D4V756Pgcdq
         p+GaD9yA/YUMUoHFVKfgjSrhQ3L5ekQ5xlR1RtuALp3vtu2fZBAF+6a3P7H5pLsNeFH7
         ptwmjVebotgR62aiEIKaikQWvhSGbhgW6GcmZbxFwR9bG4aPsdxbojHrTFZiPtAS/upu
         wf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760876454; x=1761481254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFBKrabeVPEa7G34w35TSk6SUPSAEP+1Je9OoJxDhX8=;
        b=Iib1xb8AHbYjDcMmSK8JNP2Is6irhzxVdutAucNcyoveaBI4Z2BB+ghNIm45/0XRVd
         r9zhHo98bZRQ1urKy+LZZS5/NGZKG1BQPvrc1iij7zU9npucdx9jwSSke+0oGs7KIWj7
         Uag9h6uAIaQzO6ZG7Q4/Z/tjC4KBGq1K6PsWM2t5fBi3KUe36cZfSNs3VnNU5h4At0Lg
         af0P3rE6jVPVJ1uTng2vfIMPVQkyvvxzpUZxaXyTBmvDd3a+r8JvxbipFNQr+F8S1qvr
         vdNFC/cnGXg2ZZKARf7BilbVbhiqyPjSeYbsZ2UGCfF7o6M7TmsgoSyT60Oxn/Z7071G
         AyHA==
X-Gm-Message-State: AOJu0YyRW+l5dXOddPmNA65ymE0Txn1OZ99A8llEddBfJStzLZVAGu4f
	zqQal2tRKebZSxQP+16OdoeqPfXofjU4IfCZbUEM1+HX0hzJPplyGPBmwmF+pg==
X-Gm-Gg: ASbGncubls1hIyn+su8ZevCR7A34yCfucoEGG/cJgysW7p5+o4jS1lDsRstgyjsiqIZ
	OuLAg8uMk+gDBMyBH8MDYdl0m1iAkfOu8gY65hOkN42yuIBdhwR53NqDkvlbtAt1MUU9J+T9aUE
	dP+W2pRcF5twtn7sV/5If8v7DLM7DHHgjw0oVuBndpQP2mp+lxSqU1fODY5e8W4Gl0COucS6U1C
	bd1x/qixaqzZUD3YT3wPUI3jZhoUjNSjJa2TkZ3iR2J7RfBq2uTMty9q08emyzfco1dqJZXINYS
	Ef7InOdxCR4+GgS10Lgg95O87FQX3XNC3Jz1o6obCak2yqFsf0/RqhAehCJocabCv0AxfY8GH48
	aO30OXNL9Qy7hiAM9EnTJyrBbvWsui9vWNnJDd278ocbBBEQ3YDluBKOKwJK5wiAjRNBKXskLE+
	+Xf2RgQPEVPsqaxv+bTIk=
X-Google-Smtp-Source: AGHT+IEJC/Zfe0olegHxcSHUaARps6IjY5g0qJdrkam8JzRqZDuH1CAgxDa+jUFcpCatdfNsXtXc2g==
X-Received: by 2002:a5d:5c89:0:b0:405:3028:1be4 with SMTP id ffacd0b85a97d-42704d1456bmr5774155f8f.8.1760876454197;
        Sun, 19 Oct 2025 05:20:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm9864065f8f.36.2025.10.19.05.20.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 05:20:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-betamax: fix ptests
Date: Sun, 19 Oct 2025 14:20:53 +0200
Message-ID: <20251019122053.127152-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 12:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120789

A number of tests require internet access - set a valid DNS in resolv.conf
so the tests don't fail.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-betamax/run-ptest     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-betamax/run-ptest b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
index 8d2017d39c..531af4d015 100644
--- a/meta-python/recipes-devtools/python/python3-betamax/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-betamax/run-ptest
@@ -1,3 +1,11 @@
 #!/bin/sh
 
+
+
+if ! nslookup httpbin.org >/dev/null 2>&1 ; then
+    trap 'mv /etc/resolv.conf.bak /etc/resolv.conf' INT EXIT
+    mv /etc/resolv.conf /etc/resolv.conf.bak    
+    echo "nameserver 8.8.8.8" > /etc/resolv.conf
+fi
+
 pytest --automake

