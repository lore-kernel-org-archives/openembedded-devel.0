Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E307D609DB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 17:58:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.246.1765907926506849474
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 09:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TxJsdtUr;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso52902765e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 09:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765907925; x=1766512725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vwChxisJEyQoOMx95+uHYeJzERZOjxoerRSf/JgNng=;
        b=TxJsdtUrB2USsg/+RDsJ+BNaCdhlJa/fuZuLJARpGOexWseS8cOxZZOrNZAvAhewuF
         +l1RMOP7GAdFsKDmx3P91szePDFhDp67frWNlbXDRCHc5IsCa0vKHrgXz4k5Pjd9a6LU
         UFvRch7kptgWDcJwnqxvnLsOjYb77Dnz83//HOPYW6e7Nv7OwPlZ6Qakyww1kmduI/cy
         CAVFotliIF4XR7nGygJIIaLB1iBbbDpa4fN6b+hgnnotNwzDOOE5ibgQ8LgI09ud3P61
         uLdhuax6w1ytof2JY3TurU/E9Y8LpJjoEvU19iWy2WJN0fC3+o/t6cg99pHqVAbtL0Y+
         6Bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765907925; x=1766512725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7vwChxisJEyQoOMx95+uHYeJzERZOjxoerRSf/JgNng=;
        b=YNbNQ00Kk7UImZbR68Gft49DuTm681xL11yssh4lTswBC048AN7Sy7b+OoGA0g+JJG
         d0Ghww10r+YjVDLjIBpsdXPY166210K1+doy2H10q8fMwjtD5nQkS5vALAzrC32f6NfT
         NfB6XKb+cIbSeULfcSWFEOuBFEvDP6lT0mGnTKOtA5BwmtlrZxdSdFiLtwmCM2APVZOe
         otW/dqQDUzHHbvDtFTwZUUtK6Et1bWdGE338te64afJCBU0fOW0QK8k+ssLnI/jDIt+L
         tp7k5CFVSB73KCvR1MhfURRc8rE5Elyqn/0fHWo9N4VcfXYKc8SjhvozPsbXP3/KCn6i
         au6w==
X-Gm-Message-State: AOJu0Yyvs8vn2HZ63Rk1SSAxEdMjeIjA4KnqBIAApc7A9CDsDmF59cYw
	9YCTEWnsIuKFkhPM69NkltKiQKAye1IZAzPLjivkHAnobnZIoXdCdXUzdoFCdA==
X-Gm-Gg: AY/fxX5gQyPfgu/n+QpbWgL++YMgz5ttb9EYNIHU3k5is+FBiGY0ruONwGVigFTs0/C
	U5/P9fYG5luzWdusV233t7ecWoKbBIKCCdM5sduXjyVEvJ516HiJvS5mbIwRepvEOrFhRiqRiXJ
	VROuQhFc7xcEIXO3iMbOJbgImn4xl44vxGOAtGQ2BXXM0mXuPTjPHgDCKh7z6+1OTJIGhDHgT2M
	EaUN2+e8Ta4ptbpl0/i81dYL/zXZWIidcmXdFBOm+JnIl2RIo1SuY26cJHBqZFMly5KR32aY4w4
	fP5Tep2UghC8V/JGQXl/6kViSDIudfU8knHCZpo0AKrXbK+6auZClpb3cn7l24RAbDUKAJbTjIo
	3M6chOgfRdDFVSGbb+wNSyhjp7CSHPhfV5nWyJzYliJB2i4U+xcnEEJS6NUEtXvwzwC/OMy7og7
	vAHUnG/hZd
X-Google-Smtp-Source: AGHT+IGB0U8ocYZ31qIPXpeHeiF8OIJIjfVwmZ6pKInDe/8IBbSqPcJ1cxI4/xOupQxyBcC/bIK+Og==
X-Received: by 2002:a05:600c:4e09:b0:477:9976:9e1a with SMTP id 5b1f17b1804b1-47a8f89bc6cmr170204355e9.6.1765907924787;
        Tue, 16 Dec 2025 09:58:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd992ad0csm13714525e9.9.2025.12.16.09.58.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 09:58:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/7] python3-priority: add ptest support
Date: Tue, 16 Dec 2025 18:58:37 +0100
Message-ID: <20251216175840.2939403-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216175840.2939403-1-skandigraun@gmail.com>
References: <20251216175840.2939403-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 17:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122703

It takes under 5s to execute. Sample output:

qemux86-64 login: root
root@qemux86-64:~# ptest-runner
START: ptest-runner
2025-12-16T16:00
BEGIN: /usr/lib/python3-priority/ptest
PASS: test/test_priority.py:TestStream.test_stream_repr
PASS: test/test_priority.py:TestStream.test_streams_are_well_ordered
PASS: test/test_priority.py:TestStream.test_stream_ordering
[...many lines...]
PASS: test/test_priority.py:TestPriorityTreeManual.test_maximum_streams_with_bad_int_is_error[-50]
PASS: test/test_priority.py:TestPriorityTreeOutput.test_period_of_repetition
PASS: test/test_priority.py:TestPriorityTreeOutput.test_priority_tree_distribution
PASS: ../../python3.13/site-packages/hypothesis/stateful.py:TestPriorityTreeStateful.runTest
============================================================================
Testsuite summary
DURATION: 4
END: /usr/lib/python3-priority/ptest
2025-12-16T16:00
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc  | 1 +
 .../python-priority/python3-priority_2.0.0.bb                | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 18f31a7c6f..7bc6b6575f 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -65,6 +65,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-portion \
     python3-precise-runner \
     python3-prettytable \
+    python3-priority \
     python3-propcache \
     python3-pyais \
     python3-pydantic \
diff --git a/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb b/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb
index 93b694c8b8..26620a3a39 100644
--- a/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb
+++ b/meta-python/recipes-connectivity/python-priority/python3-priority_2.0.0.bb
@@ -6,4 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ae57d8a09fc8b6b164d7357339619045"
 
 SRC_URI[sha256sum] = "c965d54f1b8d0d0b19479db3924c7c36cf672dbf2aec92d43fbdaf4492ba18c0"
 
-inherit pypi setuptools3
+PTEST_PYTEST_DIR = "test"
+inherit pypi setuptools3 ptest-python-pytest
+
+RDEPENDS:${PN}-ptest += "python3-hypothesis"

