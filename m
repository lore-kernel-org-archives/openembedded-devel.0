Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF145C9832F
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 16:27:44 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17245.1768753663383484443
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 08:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lD3ngWC4;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so1913782f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 08:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768753661; x=1769358461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RTdhscGz/iC5ItNGxfFbd03I1lBx5qSUHWiB+dkaTlo=;
        b=lD3ngWC4ZrBu3JC3izBFfxSTkM/XCUJuOn2gaLTj0TKoyvdy+gwgrqb9mCpkfvoCLA
         J6u8apM2x6y7YFC1uSNx22TaHWvrWS2q6fKT1RvjJhT647w8HpTxhTBFMW0rLrdPJ7Hl
         r+2xDMCF9KBKnsbZPJI1y5KnuNCR2TkwreaOejr1mom/2fpfQ5FRLjoKMhHrLAJMsTZw
         ftRZzoK/jtLaWD4whDu5/52SuYn/Yjps+YOxr1DhNcLBW64CDKeVbDC/17BF7DBY6HPO
         wu4AL6XAFYeG007sTBbSmDoUvPnY5auK+xEO+wk6iSnezONeZAJAbn8xhidlDI+ow5Op
         5NRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768753661; x=1769358461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTdhscGz/iC5ItNGxfFbd03I1lBx5qSUHWiB+dkaTlo=;
        b=CoHovvKmSOCDbjHAcIqMuTLxxHkagKIahf+CJeqI11mh8QFgk5KEfQT1GhokNSgQyx
         SdlH7SM8O4AExswe1LDUOxbYp9S5n3zYKxc63jMHfXjkDgIBBFBo7DMxFPn6TVGdDAs4
         77mUnrh3w5k4VQp85jGg5t2XotlOQizxSNmI9FTqNkxOKWq0oKfARhdX3RUvHW9cEAN1
         rQDY2kr3ziSW5ureMxnv7J1wrXnXONtFXJ5BxGQaRTA3qR4SJ7vjz+QqwjsDfuFXt9Jo
         SQ1rAECy9PN5zUSDhAHcWnRvu6sn3rFbByw07cvEsGFB03KeWNwJv0ULdzEwJGmtJJ3n
         rssA==
X-Gm-Message-State: AOJu0YyFFHyMjSDFFcxBsItuqXFjNeK6MQNok9Lk1egR3WDNkikQTIV4
	3pAsmkEDt+I34A+UeJTy/kgeDd5xPBN/J1tA3ZSIOGzov8hBm9dkk3TNMVfQpg==
X-Gm-Gg: AY/fxX5dq/l3I+hS8YYuv28hLIatbil00T52EStk2XtIJeimQcFZDG+m8bFRmRpO5zm
	559f133TbEpaXrKj6NPSsdTKHR9jJZig7vJdJZOd4hdSz50cd5DOwfvhf0KQqEpUXxekARYgO5+
	Wh+8yNEaKBCf4KEVr4IYmKQ5fY93ypYqrJTnQSqR+GagAFi3tRdMQAiJQiFgxVMcHaKOy9MiM9G
	yowWzQdB6ws1TFnUCo7jyfJulG2N+e3islhr+o0Ka3KRLCtJFzJ4jKZfwNJgbrwYcmGi+sxaauS
	LHhJyYkOzBc4/Lm1i9zbqrPl3K/5wf9q1zNeUYeJn6cVMmuTgB2xhHhmfvnydBEh3lq0ZBjazCK
	c6vS5J8agKV5BeDIMnEE+hh3nejCqFEvBhcRwhw+Q1u7g1uIO8ms9MKtnsX3KlzWP4ehogoN23v
	X1Pps57ZppNwAykLhXXjc=
X-Received: by 2002:a05:600c:b93:b0:480:1db1:b44d with SMTP id 5b1f17b1804b1-4801e34cab5mr120996105e9.27.1768753661229;
        Sun, 18 Jan 2026 08:27:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe47dddsm61402165e9.13.2026.01.18.08.27.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 08:27:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 1/5] python3-tblib: add recipe
Date: Sun, 18 Jan 2026 17:27:35 +0100
Message-ID: <20260118162739.3764017-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 16:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123572

Serialization library for Exceptions and Tracebacks.

It is a runtime dependency for python3-django ptests.

The ptests for this recipe run under a second.

Sample output:

root@qemux86-64:~# ptest-runner
START: ptest-runner
2026-01-15T19:37
BEGIN: /usr/lib/python3-tblib/ptest
PASS: tests/test_issue30.py:test_30
PASS: tests/test_issue65.py:test_65
PASS: tests/test_perf.py:test_perf
[...many passing lines...]
PASS: tests/test_tblib.py:test_parse_traceback
PASS: tests/test_tblib.py:test_large_line_number
PASS: tests/test_tblib.py:test_pytest_integration
============================================================================
Testsuite summary
DURATION: 1
END: /usr/lib/python3-tblib/ptest
2026-01-15T19:37
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-tblib_3.2.2.bb             | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tblib_3.2.2.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index d83ac85f1b..3b21c7cfa2 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -104,6 +104,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-soupsieve \
     python3-sqlparse \
     python3-starlette \
+    python3-tblib \
     python3-tenacity \
     python3-tomli-w \
     python3-tomlkit \
diff --git a/meta-python/recipes-devtools/python/python3-tblib_3.2.2.bb b/meta-python/recipes-devtools/python/python3-tblib_3.2.2.bb
new file mode 100644
index 0000000000..ae3ba730c5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tblib_3.2.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Serialization library for Exceptions and Tracebacks."
+HOMEPAGE = "https://github.com/ionelmc/python-tblib"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=810c4c43873f8d9331fb067a6473a960"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+SRC_URI[sha256sum] = "e9a652692d91bf4f743d4a15bc174c0b76afc750fe8c7b6d195cc1c1d6d2ccec"
+
+do_install_ptest:append(){
+    install -m 0644 ${S}/pytest.ini ${D}${PTEST_PATH}
+    # The tests are comparing exception outputs with expected ones, and it doesn't
+    # expect carets in the exception.
+    sed -i 's/pytest/PYTHONNODEBUGRANGES=1 pytest/' ${D}${PTEST_PATH}/run-ptest
+}
+
+RDEPENDS:${PN}-ptest += " \
+    python3-misc \
+    python3-pytest-benchmark \
+    python3-statistics \
+    python3-twisted \
+"

