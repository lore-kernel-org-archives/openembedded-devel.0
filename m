Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FAFC5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:02:24 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.746.1787335340540848171
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=heZMG3pp;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ced3386430so12148555ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 11:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787335340; x=1787940140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTFHrrO0sTemnBUGIiQxQxAZB3ZDCZITVzB3kAmX7lU=;
        b=heZMG3ppjqLWqTwfIXDELSFU+x6ia9i20xsf+oqlsPHH4HfPRl5gNb9vdqbPG+3j8n
         wnGdxHRfjuXiPqJR/+sIQfSVrzLXShLOu2kfX5BIPruVuoXb4vbAZNER1uOa6dHzjktk
         nVJ1s+vLkEHv8AkZ4WdS4RwufVN6ZhF+zqIE3v8HONbZorBllLfE6cZ8AMPGHghjQXu7
         z6C5ZCJg/hq+U9lvcvAUcCz8mnjWmV9mJgO+6xzfCXoX8oqguJYC2XmxozgPKEhXW9zx
         /nw+ZiZtUIAff8emgq/O3V7iDvYJRV5gd4Q0YOevxwxu9hhhugpTmh5aKJL9FIpCsXmv
         6AGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787335340; x=1787940140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTFHrrO0sTemnBUGIiQxQxAZB3ZDCZITVzB3kAmX7lU=;
        b=m34lMH1FW6rOo1GjeCaBizPxiwnbejOtGmvyApSlju+t1rA/ViLzhRItqU/CHgPEQc
         QyiZ95piykP3c/Qd8OjMSMiL4U4LnyMit9liD3+JyNlsUBnrx8Oy0g95PcYlgWBYt6Gb
         7xGZDqOoHF+Abdk3aQ9MaziqjeAhTS8Pfr32FaLzf4hifVzMOsShABD+zuDNu6kQsIXs
         P97peZZdXfRndGaIGAoM5LTrOZB13RpLYM2iN9iBfOrglrjTGUoYmRKkHKxbKy/XeoW2
         XGxuHU3iSw/wADiDVJ9C5PzO0qgB2EGNTtsqVS6XZrzgJe3AD+GdkCmVN1pN45KBhb4L
         FsQA==
X-Gm-Message-State: AFuF++k2oz2xOVI3N6gjj6K/jPN7CmW4CE2fVrpVeFODNcFFev3L2yty
	AN672HXi09mPB6ThfkDW51L2LE9XVGt6yQqDc2Hbv9sAgXkWDTkUv2LDT7qmJQ5H
X-Gm-Gg: AR+sD11CVqA2feMSijrvJGVBFs/KKp2jyAHoXj9YZqq8FkAOYWIdrWvAq1M0ma8flw6
	ulC3fi1E0IHSsFRSc2vu1eYcZDZL/A3yVPugnt+T0ZQAqgPhPPdbcHUUbl1Ea2xToD5rEOuV/H2
	iZnuQy/1VPZ0GgDiyd3BCGK4CSy/VIP0PTuDhvXz031ofCofW7J/R6iyIfiB8FwU+wpDmSoEkI+
	spQCUDiqZ5thZcCeHMTOLPkDc2QjQH9GVVQsq8MXP5W5TFiCqLrCVSSHF5mHoZE2YIUC3hn5/J5
	NrH/+s3b+pELqLUQRU2xkgluStj2b2zEOwvLWb5PhPWB6l+IE1Lf1lqqC7pONJ2YiohaQ9Abk8u
	g75prXpCbisRzySwOEEvpSkDU/n5dOqakl89J1iBdaBc++bHND28sLsJ3tUQNzTZrH1M5mi8U4c
	i7+gwBMsXp0TvAeVYouGUK1YlCp+NQLEqP8vrqWbPgSEc4w9Ahc9bkwnQqlESnbTqwOdAbBOpNz
	80aYPWizXRqAlzLk6zmVAsjna/azIycAC/dG5Z7sddXHbx+uhHNCqWyDMDwXJwR6Tmuo3P6iKnt
	DyHCFewruoLe2wtgY0vYi75hymGHJp6+R3CSGP93cYARXSscV4JSjnD+VZ+FgF9n2c1JLRMlad2
	2abICCfNjCL+bHyDwe15FZn1LeAtVkJKUxRbtND3OceqGsA==
X-Received: by 2002:a17:902:da82:b0:2ca:61bc:317c with SMTP id d9443c01a7336-2d64b17b564mr143251035ad.13.1787335339814;
        Fri, 21 Aug 2026 11:02:19 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb46sm26102708eec.3.2026.08.21.11.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:02:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/9] postgresql: drop bashisms from ptest runner
Date: Fri, 21 Aug 2026 11:02:05 -0700
Message-ID: <20260821180211.423633-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
References: <20260821180211.423633-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 18:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129427

From: Khem Raj <raj.khem@gmail.com>

run-ptest has a #!/bin/sh shebang but used two constructs that are not
available in the target /bin/sh (dash), so the suite died immediately
after starting the server and reported no test results at all:

  run-ptest: line 54: stdbuf: not found
  run-ptest: line 58: syntax error: bad substitution
  ERROR: Exit status is 2

${PIPESTATUS[0]} is a bash array reference; dash has no PIPESTATUS and
fails with "bad substitution". stdbuf is coreutils-only and is not
guaranteed to be installed on the target.

Capture pg_regress output to a temporary file and use $? directly
instead of piping live into sed, which removes the need for both
PIPESTATUS and stdbuf while keeping the same PASS:/FAIL: translation.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-dbs/postgresql/files/run-ptest    | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-dbs/postgresql/files/run-ptest b/meta-oe/recipes-dbs/postgresql/files/run-ptest
index 4cb8e5c7e1..31f2116a7e 100644
--- a/meta-oe/recipes-dbs/postgresql/files/run-ptest
+++ b/meta-oe/recipes-dbs/postgresql/files/run-ptest
@@ -37,24 +37,31 @@ mkdir -p "${TESTDIR}/testtablespace"
 chmod 0700 "${TESTDIR}/testtablespace"
 chown postgres:postgres "${TESTDIR}/testtablespace"
 
-# Disable set -e before the pipe so we can capture PIPESTATUS
+# Disable set -e so we can capture the regression run's exit status
 set +e
 
-# Run the regression tests.
+# Run the regression tests, capturing output to a plain file instead of
+# piping live into sed: ${PIPESTATUS[0]} is a bashism this script's
+# "#!/bin/sh" shebang can't rely on (target /bin/sh is dash, which has no
+# PIPESTATUS array and fails with "bad substitution"), and batching
+# through a file avoids needing stdbuf, which isn't guaranteed installed.
 # --dlpath points to the standard PostgreSQL package library directory
 # where regress.so and contrib modules (autoinc.so, refint.so, etc.)
 # are installed, so that CREATE FUNCTION ... AS tests can locate them.
+REGRESS_LOG=$(mktemp /tmp/postgresql-ptest.XXXXXX)
 su - postgres -c "cd ${TESTDIR} && \
     ${TESTDIR}/pg_regress \
         --inputdir=. \
         --bindir=${PGBIN} \
         --dlpath=${PKGLIBDIR} \
         --max-concurrent-tests=20 \
-        --schedule=parallel_schedule" 2>&1 | \
-    stdbuf -oL sed -n \
-        -e 's/^ok [0-9]\+\s\+[+* ]\?\s*/PASS: /p' \
-        -e 's/^not ok [0-9]\+\s\+[+* ]\?\s*/FAIL: /p'
-RESULT=${PIPESTATUS[0]}
+        --schedule=parallel_schedule" > "${REGRESS_LOG}" 2>&1
+RESULT=$?
+
+sed -n \
+    -e 's/^ok [0-9]\+\s\+[+* ]\?\s*/PASS: /p' \
+    -e 's/^not ok [0-9]\+\s\+[+* ]\?\s*/FAIL: /p' "${REGRESS_LOG}"
+rm -f "${REGRESS_LOG}"
 
 if [ "${RESULT}" = "0" ]; then
     echo "PASS: all tests passed"

