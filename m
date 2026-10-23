Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.936.1792720922461855783
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 19:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FPPicjW1;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1931ff67a29so1052896c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 19:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720922; x=1793325722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBL20ADUTpTgvmuSu+Y0QzhFGJk7jqIQ9FPDnHniH1Q=;
        b=FPPicjW16vJOHPWP0anfhVb+Um7YozknFC8N0BCcqfI5X0aoZpA2kyaa06A8cS6SFQ
         tF8Jin0+cxXWIq9D3FDcgr12vafvnqomZ7bihUGjBpK5EDemnARhrNaOoYuxcM7Fn4Oe
         PodVx0+ouBGZTk5csLO7JBugf1KFBLkkFO92GkJSovshCnfNlWaELAmTmkrd3KgJySPA
         28v3Jn3R1mQTv62tja2KLWqmZtFn5BOnKYIsdsQoZNEKV+A75kfz2nkjMFvSlr3ZTDbf
         ZY8VF3Ov/7jcYfvRi0SCWZUoCTHAEgbSdZDHD1nW9njBJk7pka07lzbQDV12AvY1NDoW
         iVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720922; x=1793325722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBL20ADUTpTgvmuSu+Y0QzhFGJk7jqIQ9FPDnHniH1Q=;
        b=K7Kx6NTOy84IDfV4PrpF7rr8Yt+s+zuXV82PpnanPh1Pnhedp/op1eQDSvTjoTluzn
         kGk46gkk+JFXnZqbfJVn5frkQAA5hbVF7H8+ShQOGhUZwgXkRrnAsg21k52UJxPc90Z3
         d0T0+DXAJYYnqdSmTsnv6NtFLQDvIN1Sobcr+VxCHOKI0naHbswStKREW8NA2f7H3fpb
         tq3E3Js4bg8Cnv/ayhFWOtDHltUivDkANfEAXGpGOJfO/tU7w5z4+0bOi3zbF8vNbo4v
         X+rq+VtjJuM/LoDFegMd/+mhWci3mEUG0z3I/mzB/DSWQFhMSFIuFrbvRIsA49bhemnS
         duhg==
X-Gm-Message-State: AFq9FYJBSx405XFIsPGLiARp04TO/ok6Ag5Khobr5E4yOCp9ULDW4Zd0
	T4C7nCoUN5puKKlZX1uJ1eog1w1oyBB636LNUGQiuVsTTyFeJll4VrJeCtxdWhyHHUI=
X-Gm-Gg: AYBFou2XPU90poVAVusqBQ9qn0YCkBoWgrpEUBQVtXYpgRXuEEKc3tnNJ9GhOjgFqpB
	70+kDEiPpdwsSbpV7jgbtVmQm5rARArMZ0VqFP0Z1nmYLdnchbDfD10trDjUfxy9ojw4XUYvg4/
	VVJtqszgfmx2JIYonp/4NLrA73HH/6mAxbmB0j7SfUHexPG33/o/lP8wabRutCWnl6GtRp/xLuA
	yVYk7Hh5R1gWvWb4obylr9VnRHJ7oO9HwahfHReCrvx2/GIhkFJ6yjeL2RmH7NoWh6b4XSkFCHH
	iEnJcr+sd3InhJMDlMzKnSg6C57o5/FjkCUIvb7QaYm8/vga4msN8wKKrPDvFXzTA5Kd+cM854Q
	gmDPyMlebPyZpzEsqDEGEYILRG5J7QF5k6DHVqzVBxmaJ4Z8tc2hZWWGIuBBbP/q63FwDIKp3yb
	OcLG5y9js6SurrpnAfKNb7efCZc/V+YYrUZRrn2RnQKwBHMcJwnDoz91cZGvKhWIk/9c/pHsb8H
	tf3kV4DApPOQdJ2wHbaFRtAdWEjWeuJGj7txgRIHG7HE90xvtP2M/ckTArVVZHEBVeRAZaQk3M1
	wIRVTPgjcJA51lTmuXYYeag5K9wkQdT41jz3rn0bdI4wh1sjHvYCHi2oQTqyOZAiptVip+sbqR1
	syjLoDjrLZPz5onKdQ6tS6u3W3ayH0b7poAYFZnStrSKOQ5Og/SHJSnAhj1qR73xk/cnUiBJRLV
	E3YYu7lU1K2ZstOf7+c0uOkvU0kwxWWmch63u0JUSxZ1YpVqSbSogxkUvsxagSx0LiOkFiEan6I
	eLGGfTc4ZdiUR/+rxR+psi/RTu+zg4C0/mqc8mRim80h8eEKN3p
X-Received: by 2002:a05:7022:1302:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1959eb781aamr1430372c88.16.1792720921459;
        Thu, 22 Oct 2026 19:02:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e1a085sm2079541eec.29.2026.10.22.19.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:02:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 4/5] python3-fsspec: Fix runtime dependencies and install conftest for ptests
Date: Thu, 22 Oct 2026 19:01:53 -0700
Message-ID: <20261023020154.3881598-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023020154.3881598-1-khem.raj@oss.qualcomm.com>
References: <20261023020154.3881598-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 02:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131321
Content-Type: text/plain; charset="utf-8"

fsspec imports ctypes, asyncio, json, logging and threading, which are
not in python3-core, without ctypes "import fsspec" fails, which also
broke the python3-pyyaml-include ptests.

Install the top-level fsspec/conftest.py into the ptest dir, it
provides the "m" fixture and the autouse instance cache cleaner, and
without it most tests error out or fail.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-fsspec_2026.9.0.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2026.9.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2026.9.0.bb
index 43d405f017..cacafc88d6 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2026.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2026.9.0.bb
@@ -10,6 +10,14 @@ inherit python_hatchling ptest-python-pytest

 DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"

+RDEPENDS:${PN} += "\
+    python3-asyncio \
+    python3-ctypes \
+    python3-json \
+    python3-logging \
+    python3-threading \
+"
+
 RDEPENDS:${PN}-ptest += "\
     python3-pytest \
     python3-pytest-mock \
@@ -28,6 +36,9 @@ do_install_ptest:append() {
     cp -rf ${S}/fsspec/tests/* ${D}${PTEST_PATH}/tests/
     cp -rf ${S}/fsspec/implementations/tests ${D}${PTEST_PATH}/implementations/
     touch ${D}${PTEST_PATH}/implementations/__init__.py
+    # Top-level conftest provides shared fixtures such as "m" and the
+    # autouse instance cache cleaner
+    install -m 0644 ${S}/fsspec/conftest.py ${D}${PTEST_PATH}/
     # Tests import helpers via fsspec.tests / fsspec.implementations.tests,
     # which aren't in the installed package
     grep -rlE 'fsspec\.(implementations\.)?tests' ${D}${PTEST_PATH} \
