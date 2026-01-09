Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D70FD26D82
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:03:31 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16229.1767981809173413677
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 10:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cR2cpZh6;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso2316869f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 10:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767981807; x=1768586607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cx/2cCYQg2AItXkFB/58FUltGpfXLMLPyfv9lju0Gs=;
        b=cR2cpZh6PRK3b298+Sqd2TYKeDDndB9LcCcfXhaamcqG0FmHQU2mIZbigwIZQkaKTg
         NC26teSWFIVc2TC+IPfe8fCtxuPlJVo6nnGSzhPG+MdE0oLc3UTzFGYxpPJUPc3i1vl7
         8R4z7M3LhgT4Nt2Us1R9MOnlDeCU5zYXFBV8c1F+9Wi2ERgTRzTlvFZ2jTJhJA8ttzXc
         JM727DziKEYPbEQnJh/R+Bl8bOu0DPKkJAEd4pQEtP9reS8gqNSBaNPYQA3MhUx4Aaad
         Jyjb174uskJ691kWosssk3ABOIQxz1IdNvjqBEkFwaPD4tRlizrETpFJ2vranufAXzS7
         r2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767981807; x=1768586607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9cx/2cCYQg2AItXkFB/58FUltGpfXLMLPyfv9lju0Gs=;
        b=sI0vZOEPuYNKOLPSKkdtOw69CtEv8poGkzhHlWL0sHQsg0ODmcC1OJTZ3q/UVyn7sQ
         5sEf7WufMMhw8tZDkwbiJItJEkPiycGbFQdhbbK4SCofs0csv0SzUHFoDdDLpFqywEWd
         WH52Y+e7Au00W73qs0PzzfSHEiDwrUe93GLfNXY5SBIZLfQegNW1rGSyBvCI5V+UFYEv
         RhC6JJJMMU9vr8o+D8AVRs6qk4gbSDdNNpiKoUfgF2drycPhd+feM0NwTc7WYvc5pSY/
         kbZBexMcV+6YwBlhUabFOFGH3MowGxWhs5IawhKgDQBJANSgPoG+rPV9THUBbMeoPmf8
         T2WQ==
X-Gm-Message-State: AOJu0Yz4TI9FVlHplQdBPrC9kxEQTIoAalL5WZAhWmVmY6Yc97rJC8lP
	J8ItE2Y5dgsdHmFUFsJwXWKLW5PUhWE+RDaue5PMlhT6jBXA1pPq4JWRZqFQ1A==
X-Gm-Gg: AY/fxX7mvd5/pGFFNdNxVgdgyFYnCcbUxaQdSUlRk60YftujJiw+m2mRdn9Z3OzaRgB
	LPlA8qn2qo1LXXXcg/5Y0DxZtvnS+Ep0PB29mzIO5vxAXrGavbmQWZA4xf9iszypEBCo6zTZJQV
	5p7InOlMJ/wENpFEv+xlpNUGDNHvxB0/7DwGqy2HCfNampvWRINE0PnAKdtV5whJrMU+Zax1wH2
	Qd5h4yD2SbHbjUYA/AumuG/uYpEKt7jIEyiPdlstuJETklnZPafJdgdkI324tH/DKstz8eBPhWP
	BGHOc+Jw6W1y32krGvQcB7Nbd4gFS9r7/sD/U7fQzZSWGgIfgexOcAVjlKoIUt/sUCSbdtj7R0a
	CSJ2SdV98TzPi4qeAnx6T1kcPPxSEzvlNm84QWx0y0gRauH8K9UUnjP2M8fNjVsPLTUuC5tqgMj
	Ae7RbAIslY
X-Google-Smtp-Source: AGHT+IHCl9jVQxnL/3CAICcH4JXboRAN8hzUYlXprBp0B5Sd9N34IRb0R6PKWM0veMwuPevyoXlMAg==
X-Received: by 2002:a05:6000:4287:b0:432:5c34:fb22 with SMTP id ffacd0b85a97d-432c377c54dmr13395782f8f.22.1767981807476;
        Fri, 09 Jan 2026 10:03:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df9afsm25563450f8f.24.2026.01.09.10.03.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 10:03:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-filelock: add ptest support
Date: Fri,  9 Jan 2026 19:03:22 +0100
Message-ID: <20260109180322.4028207-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109180322.4028207-1-skandigraun@gmail.com>
References: <20260109180322.4028207-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123311

The tests take <15s to execute.

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2026-01-09T18:00
BEGIN: /usr/lib/python3-filelock/ptest
PASS: tests/test_async_filelock.py:test_simple[a-str-AsyncUnixFileLock]
PASS: tests/test_async_filelock.py:test_simple[a-str-AsyncSoftFileLock]
PASS: tests/test_async_filelock.py:test_simple[a-PurePath-AsyncUnixFileLock]
PASS: tests/test_async_filelock.py:test_simple[a-PurePath-AsyncSoftFileLock]
PASS: tests/test_async_filelock.py:test_simple[a-Path-AsyncUnixFileLock]
PASS: tests/test_async_filelock.py:test_simple[a-Path-AsyncSoftFileLock]
[...many lines...]
PASS: tests/test_filelock.py:test_mtime_zero_exit_branch[SoftFileLock-TimeoutError]
PASS: tests/test_filelock.py:test_mtime_zero_exit_branch[UnixFileLock-PermissionError]
PASS: tests/test_virtualenv.py:test_virtualenv
============================================================================
Testsuite summary
DURATION: 10
END: /usr/lib/python3-filelock/ptest
2026-01-09T18:00
STOP: ptest-runner
TOTAL: 1 FAIL: 0

(There are 20 Windows-only tests, which are skipped)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-python.inc      | 1 +
 .../recipes-devtools/python/python3-filelock/run-ptest   | 6 ++++++
 .../recipes-devtools/python/python3-filelock_3.20.2.bb   | 9 ++++++++-
 3 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-filelock/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index a297441bf6..7261382bdd 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -29,6 +29,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-execnet \
     python3-fastjsonschema \
     python3-fastnumbers \
+    python3-filelock \
     python3-flask \
     python3-flexcache \
     python3-flexparser \
diff --git a/meta-python/recipes-devtools/python/python3-filelock/run-ptest b/meta-python/recipes-devtools/python/python3-filelock/run-ptest
new file mode 100644
index 0000000000..88654deb70
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-filelock/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# Some tests require non-root
+useradd tester || echo test user exists already
+
+su tester -c "pytest --automake"
diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
index 75eb16635c..2a0af552b6 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.20.2.bb
@@ -5,11 +5,12 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
+SRC_URI += "file://run-ptest"
 SRC_URI[sha256sum] = "a2241ff4ddde2a7cebddf78e39832509cb045d18ec1a09d7248d6bfc6bfbbe64"
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit pypi python_hatchling
+inherit pypi python_hatchling ptest-python-pytest
 
 DEPENDS += "\
     python3-hatch-vcs-native \
@@ -20,3 +21,9 @@ RDEPENDS:${PN} += " \
     python3-logging \
     python3-asyncio \
 "
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest-asyncio \
+    python3-pytest-mock \
+    python3-virtualenv \
+"

