Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2883.1794217572418658612
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 01:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rPAG4YdY;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1025817c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 01:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794217572; x=1794822372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnTV6srWOmRu6/8xgEumL/DQ/Kwx44fX4IANJ1gfkTE=;
        b=rPAG4YdYbdlndfxkGrTp1hPrr4ymshw6Y8aIdv3sgIXGqKm6thkUYrKcIIyuuJL9uN
         Ehwbztk1HwzZ2k6c8xJbH15j4JKbDPR4H2y/7cTIGfJzMlwQ1UGQD0j29BKwQUKrVEhF
         RMB1U+ZBSRXnzk1ecFGZPOzv2h8gNgY2t+JrgkHqEfiW1fa8cyZhnJn9fteL8i0PeM5n
         /PIMnd98PmerXOY8udWhootZunNM+mbUb4y4EIh7y3Io2Q0Z9k1vq13M3LM/COAcNQcB
         T/PTDp5LAiIz0C3J3AILwVo1ZsONsEYR+6w1vN9aaw25kx86U0TKeRJK66YyMb3PfYli
         rGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217572; x=1794822372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnTV6srWOmRu6/8xgEumL/DQ/Kwx44fX4IANJ1gfkTE=;
        b=ixEtRFToY7h7XUkJ3KfIMc7gL41LBMlH+AxrHN863YT5H8MeuhIU9acMbhO+OpO/8V
         2wZoTUdex8oWCtNIJNIqajwkqhbbbfaLfcedGESq7rXdbBheh/EemS84T7c0qvh/YmJX
         txkt19lzy2KnqjSd2/utpNR9f0eZrqpa6mFRvBIyqmZTR4vO9iq3alOeHocT8SM3O15p
         Y5VBCT4oJl8WPaDD9lF98YZAuMICxHvIE408CwlW878nbIzMHCVjTpoeq+maj6zR53w8
         jwAd3a+nyAdg+juKt+SH8eP4mZRqPrs+v1MfGqhPfcXEBXaTx+PDkGgDcXMoHkepf1YV
         dXMQ==
X-Gm-Message-State: APuU4Z8E09iKVv++KL+BXqbAJLk3FuORoAqyfncHwAoSu6x98HGGHd1V
	UUyTI2cMOaFRXPoqEoLrhEDvuwSU9gezzZYRR00FhwzdmoHK3aFU+cVX83EMzdiNmuo=
X-Gm-Gg: AYBFou26cZF6K52r/eUVtlx/L8M3mEyES7SMt7oLJOO+tMXygJh4kbfArPx5UtNPqxE
	vDQHPSMq6evmN1uqD9uEjCiwWdpHQQgi4P1kJeyGndGNR+DuXfrsaxACaVPhRdDKgmkMoa6DJqM
	wzik0RBHcy8ivCCuZSiAG6ZvxreKPrLlgK3TlIXKV3wT3JWOxiESQabLlhlA12ZKOkW7maAhoiN
	aduXjKCY/CyI8pPSI3TyEEjgvtP+e2AzKmUxQTLwsLNIpqE0YFTHAEEUXUXCfRhD8riMXzHzP7b
	ghrlnryCHZ/k2wGmzse2JYN0qMw3PG+Yb9dj66l1hDFrvehTsKUSX6DqGAoTKwwUB4rxNnl9L7V
	4aXSsZhKcYMqPpTIePalcQYzk5DSwiZSloZl6k+iKNZ15HL7PDxNO327KqWpW2xSmpY16FdBGNl
	XgJR/B17CFA6EkpzMu5n61mnrVv+sTF0wRNureq3R04vFmTYiWBjLb3SkaAnyJqABxxm74ek60v
	LRG+MaR0JBb+CaNITRSJOird4dkj+K0hH7NhN3ZoVF+34HfzxiVSfz76qzA+z45jPG15yAug057
	j0U8Z2WdDPSi2Uk6KENCrdpMfZcwdEuWwEtU1pg/REfsabTnuLk+maG2PDs1IX6yqAcmFIeCP7L
	BcIKulHoR4dLMWOgNVQ7R+gWmVjT6YOLA/z2XYk7GaeZpKJRFK4le3gGTJ5MD8YIIfam68JHTLJ
	q0gfnZNqv9mNz/KpR7BXS8dE3wU1q1wh8NveljaaMjdc7wcTfFABdDu7oj8kTG5o3+7T3ytB0MU
	5++wx5kayMjtyGsXlTX1oCoYQAvPjq7LkY5nhd8122VpfSWfVb9q1MQNwQOhcmhKvYvKi25Mj6e
	nKn1
X-Received: by 2002:a05:7022:b0c6:b0:183:e993:7901 with SMTP id a92af1059eb24-1b39fe9485dmr5771389c88.17.1794217571574;
        Mon, 09 Nov 2026 01:46:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37561ccabsm11224402c88.12.2026.11.09.01.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:46:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 3/3] python3-pydantic-core: Fix ptest collection errors
Date: Mon,  9 Nov 2026 01:46:06 -0800
Message-ID: <20261109094606.2418633-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109094606.2418633-1-khem.raj@oss.qualcomm.com>
References: <20261109094606.2418633-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 09:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132056
Content-Type: text/plain; charset="utf-8"

tests/test_docstrings.py imports pytest_examples and
tests/test_tzinfo.py imports pydantic, neither of which the ptest
package depends on. pytest stops at the collection errors, so no test
ran at all:

  E   ModuleNotFoundError: No module named 'pytest_examples'
  E   ModuleNotFoundError: No module named 'pydantic'

Add both. test_docstrings.py then looks for core_schema.py and
README.md relative to the source tree, so install README.md and point
it at the installed core_schema.py.

Skip the ruff lint step of the docstring examples, as python3-pydantic
does. Outside the source tree ruff doesn't treat pydantic_core as first
party and flags the import order (I001) of 23 examples, plus a couple
of style rules newer than the examples. The examples are still run.

6025 tests pass and 126 are skipped on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-pydantic-core_2.50.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.1.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.1.bb
index e8f2317921..8530fddbd6 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.1.bb
@@ -33,9 +33,11 @@ RDEPENDS:${PN}-ptest += "\
     python3-hypothesis \
     python3-inline-snapshot \
     python3-misc \
+    python3-pydantic \
     python3-pytest-mock \
     python3-pytest-timeout \
     python3-pytest-benchmark \
+    python3-pytest-examples \
     python3-typing-inspection \
 	python3-tzdata \
 	python3-zoneinfo \
@@ -43,6 +45,10 @@ RDEPENDS:${PN}-ptest += "\

 do_install_ptest:append () {
     cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
+    install -m 0644 ${S}/README.md ${D}${PTEST_PATH}/
+    sed -i -e "s|PYDANTIC_CORE_DIR / 'python/pydantic_core/core_schema.py'|'${PYTHON_SITEPACKAGES_DIR}/pydantic_core/core_schema.py'|" \
+        -e "s/^    lint_skip = .*/    lint_skip = True/" \
+        ${D}${PTEST_PATH}/tests/test_docstrings.py
     sed -i -e "/--automake/ s/$/ -k 'not test_model_class_root_validator_wrap and not test_model_class_root_validator_before and not test_model_class_root_validator_after'/" ${D}${PTEST_PATH}/run-ptest
 }

