Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155.1794852074718555197
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 10:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bybZiPFF;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4adea5b7a2fso2012511fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 10:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794852074; x=1795456874; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2+lw+lAhIKUxGd3baBgUB7x2FIYbS9zQOZ6MPQ/qVKQ=;
        b=bybZiPFFv2wKN9cQ186BSzm8v8g2f9FuOEtbY0veA53G25CfGmtfjmmDjI5bxMPt54
         /YhZo5UoYmcpdYJwtfk6XR6BvqNqY/gGgv3ob/Ke7bdhSGwq2yMlysqX/NL249poyH+T
         mK0eZq7YPdp0p2cnu3qp96lK8agMAYylKwk7fq9TziMQWbXePxPPL4iGSA1up8ELf+nU
         5WhIGn10+XdMb1G93AYOVkPM4rK+5tLWq7AaRKozDkd8MAKtXuTmTxDUhZkLoIDgcIcq
         Bqw7dB6S0YQqoOx3pLkbdbcS13vyu/fAqn+pt0NlnUVM/v5fCVmyPceReSvWy8WrfvOy
         Jy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852074; x=1795456874;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+lw+lAhIKUxGd3baBgUB7x2FIYbS9zQOZ6MPQ/qVKQ=;
        b=1n7PmY8op0ElaN0uRbpUj6gEitF6EYivCE+C4mXuFCHNCBT/3qJPXDjanF8J2NH1DS
         l1qGol5wlq1dqI4eBj1l0x+RutPwGMVRaT1A8a+VzjQRpO4PRyDwKA7bk1Ck5eeMzd0X
         tBJjEjFdCIbRXxg+3bszDNTy1DtEf99P2beSMz7jk1VJyQuGaFsS2hkWa6E8JAfp6P/q
         C11Tq8rKk+lsn502y+a7GV+9MZJf5NNxAApm8YBeABBuS/R3TOlywodHQmzH3D/cYV6u
         32LEJQsk66gEZXgvmVO6dP/ibktJ3oEq2rojaDTHYuF94zYSesvJdEK8pfYBU2Y0rL5S
         7SnA==
X-Gm-Message-State: APuU4Z/yngiN3WSPBTFx8+nCbCaGPtWfNoaZ8ddL5fjKzr1fN+CdDyY+
	NHHVKvQU5wkVSgTpVr04AnxSEpKbU81Z+7/q/RDFwmWvCjF5KwymnK5a2dYw6J30
X-Gm-Gg: AYBFou1zbMmS+NeE18jSrLgW/zAl2zManN33LpgHpaxygSGcbirNW/oYqZIpczJcHAf
	vYRVIgt0iu9Z96tt9wDF4d3YMeyixSoFYT5PK/JMWAmPKl8wI+iodbbFsnsHoS4F6+ou5AK6Pb3
	3cNfho/hTQQLL5RcpuBtaAgBUYkQeZKtA2vu++3tP39sYZZsjrdLJv8MTzeX98du9TxhlcZrc1B
	lVMzStuKMT5yLFiOKa8Ra+HttsiUvNRYNBdZI4vauwLFGbcg3zNOM4Ns6wtPwKJQJZDQ9mc3ebQ
	90bYcgHHDGT74IiJ7zMq5zzGrNTYz5BpBMhM0MUmzoGPsCCJR6kO38wN9xx1HIQMnsZFywsrbCu
	BaeuXnLTtyjfaCgcTjiih012E9HfboezUHJeJvhTQVa8H2W1NAhafL2/dALepN6NQZoh8uQPNsJ
	Sppz4sCjQNVP5bRceMxiHvRHY6IpT+4gVfPpTO0B80UUzTEW5QupSMz4jHJmKCNpytnL/D7vh/a
	4JqNfC/UHEWQCArVIO/RwBXjgzu9OUohdkuPbvfrb9mALjhCY8QQk6XvcgMsHMT49l6MTlDWgju
	qy0btbuROZhoVEhgZc29ncGm/I9nAuBo/5oWO2VhiPyFl8r4pMiqW6aRWIlZ/BdxX0t0sE+mnTx
	CfK21gD2NZ9RUqAcKMmH0xG7f2xmzm81GPDzOBV/EXa8bc7qqxwbh799kVTwp4ljH8pxMsegf+6
	nYQRT1YSaRjVMaYBrfMsqq9Nw6bQ9G9Qvkr8yrpcqkawSgrlXjBNT5U3/IKhJcaR1sY8Rr7NErS
	36mZpRSfwTJw9NKYbpuSzJCMyE+22AUvNlbnMAtTsQsdnFAw4GXwDKEo8ggGms1RUC6bUNBlrDj
	iiqE
X-Received: by 2002:a05:7300:72cc:b0:372:598d:c0bb with SMTP id 5a478bee46e88-37966e3ad18mr17428429eec.13.1794851747067;
        Mon, 16 Nov 2026 09:55:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 077/105] python3-python-dotenv: upgrade 1.2.1 -> 1.2.4
Date: Mon, 16 Nov 2026 09:53:29 -0800
Message-ID: <20261116175359.342679-77-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 18:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132561
Content-Type: text/plain; charset="utf-8"

Drop the root skip patch; upstream skips the permission test as root now
and removed the other test.

Changes:
- Breaking (1.2.2): set_key/unset_key and the CLI set/unset no longer
  follow symlinks unless follow_symlinks=True; the original file mode
  is preserved instead of being reset to 0600. Python 3.9 dropped.
- 1.2.2: Python 3.14 (incl. free-threaded) support; dotenv run
  forwards flags to the command.
- 1.2.3: strip leading UTF-8 BOM; set_key escapes backslashes; friendly
  error for dotenv run without a command.
- 1.2.4: dotenv get no longer exits 1 for empty values; fix parsing of
  empty unquoted value followed by comment; dotenv run --no-override
  expansion precedence fixed.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...y-skip-two-test-when-running-as-root.patch | 39 -------------------
 ....2.1.bb => python3-python-dotenv_1.2.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch
 rename meta-python/recipes-devtools/python/{python3-python-dotenv_1.2.1.bb => python3-python-dotenv_1.2.4.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch b/meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch
deleted file mode 100644
index 154ab559a4..0000000000
--- a/meta-python/recipes-devtools/python/python3-python-dotenv/0001-test_main.py-skip-two-test-when-running-as-root.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 68e4f05ece6b20e8a7d914d047185483373db759 Mon Sep 17 00:00:00 2001
-From: Jan Vermaete <jan.vermaete@gmail.com>
-Date: Mon, 10 Nov 2025 18:04:27 +0100
-Subject: [PATCH 1/1] test_main.py: skip two test when running as root
-
-Upstream-Status: Inappropriate [oe-specific]
-
-The patch will only work for Linux and not for Windows.
-And it's not common to run the tests of a Python module as root in the
-not Yocto world.
-
-Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
----
- tests/test_main.py | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tests/test_main.py b/tests/test_main.py
-index 4496111..182bc33 100644
---- a/tests/test_main.py
-+++ b/tests/test_main.py
-@@ -61,6 +61,7 @@ def test_set_key_encoding(dotenv_path):
-     assert dotenv_path.read_text(encoding=encoding) == "a='é'\n"
- 
- 
-+@pytest.mark.skipif(os.geteuid() == 0, reason="Skipping becuase user is root")
- def test_set_key_permission_error(dotenv_path):
-     dotenv_path.chmod(0o000)
- 
-@@ -167,6 +168,7 @@ def test_unset_encoding(dotenv_path):
-     assert dotenv_path.read_text(encoding=encoding) == ""
- 
- 
-+@pytest.mark.skipif(os.geteuid() == 0, reason="Skipping becuase user is root")
- def test_set_key_unauthorized_file(dotenv_path):
-     dotenv_path.chmod(0o000)
- 
--- 
-2.47.3
-
diff --git a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.4.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-python-dotenv_1.2.4.bb
index 416dec3a17..7b59ad5a13 100644
--- a/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-python-dotenv_1.2.4.bb
@@ -4,9 +4,8 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e914cdb773ae44a732b392532d88f072"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
-SRC_URI[sha256sum] = "42667e897e16ab0d66954af0e60a9caa94f0fd4ecf3aaf6d2d260eec1aa36ad6"
+SRC_URI[sha256sum] = "f0d53e69935a851c0dcc78f3ab7aaccd8cabef0b92382b576b824212902873c0"
 
-SRC_URI += "file://0001-test_main.py-skip-two-test-when-running-as-root.patch"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
