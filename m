Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34358.1794851746797384365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SB1a/i/b;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37628596783so6272497eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851746; x=1795456546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wg0sI7KjYOEH0kw/08GzSnKO3pSGd9mJeU587Ba8nEM=;
        b=SB1a/i/bT3mzqcm8iqEvKDy452xY8TlzNl0dDm+jueictJTeKYSKJHg8XsdLGRptIL
         vpZl/C4qQDt5tGrMhT3kL4BMao/6SgQ5hi1QOL0MvEhe88lnfcqaf7EQ1e6Cc4MuaW0o
         RcE6LcNIVfsy/puMJzVXfPdtiON7Ke0wFXBPlrM9DEQgeGTqqFuWe5LOqi+mL9ZEd5jj
         FHhZvKokEWEpLk3QYV0XTj63VkWrJLKGv301gzitPVnievu8aF8VKBStiKNWPsJ39tkM
         +rn1L72qHwavkSl/68/al/Bylq4ZBJzRBqMip0/rkXqvYV7Cacii0axoYEH2w3jaNaZl
         2hHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851746; x=1795456546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wg0sI7KjYOEH0kw/08GzSnKO3pSGd9mJeU587Ba8nEM=;
        b=cjC/zOYNfPUG5BfXRcW8hYlwEjcyXwSJ80ivM5UAqGdxiEGi95+TU6u3JiTv180e/c
         Z3KEkAOb7Gxa6m6hentincQ/257/WHz4cmqz4sgmxw3LI3TxYmz4YVg3Gk7nNYICdGnH
         ijmFJseiGIDz+u8sALNUlDfkN52gO6A+aFi4IhpTpVslbmTdfZm6+xxQFvar1dYQ8hBJ
         xKN3hg2X+D4+YgkilB0a8qwHkjzfDF4XJeWMbbAEmwigyWOCjBELNnZkiCmVOCBiKuGK
         NxOXuxK68yn9c1EPqZuG3Pv2jDxl5lxpiKJTsOt6ccPAYpnDLVaCvSM6ZYJGG4OHO1ki
         wAwA==
X-Gm-Message-State: APuU4Z+UbnFQjXeeih9tI1cuRUKZBfYLRhVsIpR+actmndDrDk+Lmbeh
	fTJR2Wh/5QEjzhocmctBWM6ObEDzBWtcl+5mgAAPnkJDyQzRefkIeqPSMdyqenYv
X-Gm-Gg: AZFdTZdF/55eFJr5WMtAn4XQQ9R+Ct1/FAAlik0EYkK5hkhBQgnyc4kt4mQxWkOGwGd
	kawKW1enLtJHefEBAcRzmRJUiSoWZnwNETSPVetJIVIPvFDYl6Ik59wKxYD2jrq08/Uks370NkK
	cWdolTbAszjXmohbm7+N5QUFgrXZyyG2FB+IolVWnoFEmnFMik66slSTmTxZnvJvaJ56FBF3AzY
	N8cPEv1nu42gVu5kjWuI4wsU0gc45XXOZ80CWvFk5/5sXtWUVdDuUmnou8n8qDmQPq9OY9wK5q/
	Ekhm59rdsaDu2pW7Z/bXLuuqowLN0UvJ23iooEkEyP5vtAM8tv03vcbTkkdNWRKnwXc8CJwNwLz
	8EeoYq4kbgJFbg4tbC++c+Y2s/hVu0w88QqSX2uWRjmNKtDVhfpFKNiBVo9qZsyBCeGkur3HidT
	ikW5MDBRJop+1khAS/LA3tccmAdYPPbCDUUG96qjoI/SxcMzXQcvkg24QR0IIfcfPvsntFMsA+S
	IFEWe85io9CYpEFHc5n9cSNbsMiqNMRPbdC2p0js8+6XzV3NFbE9hcG3QCR+uPUG8ce4LAjLtGa
	L12h+255ce+ZcmwOEjg94kJmglzgTlN4Xqgwa7F8G865r5aEuUOuudgq4udZ+seiVzyD8/5JU3A
	swSEZuJ1MeApIpJ5cau3UHSf5Yfg9rvvUdI5taCSWWn8Um3gOFZP8e6CbsKc/RvmWCowBznVMM1
	1y02njp7ikPTolSkAF6gHMM/U0yNZ3M0DbGMXotyiZungzSFR6b4Y1FZBZ1Appy36EXD4AYhjd6
	doH5Wy9u+LFAsUVG83f3nhS2SPgHotCcHA2w8RawgLoTxAMfqRh37fbRC9U8A48SiJbqcs9Biub
	04gx
X-Received: by 2002:a05:7300:6da8:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-37965abb5bbmr14018037eec.9.1794851746132;
        Mon, 16 Nov 2026 09:55:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 076/105] python3-pytest-localserver: upgrade 0.8.1 -> 0.10.0.post0
Date: Mon, 16 Nov 2026 09:53:28 -0800
Message-ID: <20261116175359.342679-76-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132532
Content-Type: text/plain; charset="utf-8"

Changes:
- 0.9.0: expose the server certificate; request data stored
  explicitly.
- 0.9.0.post0: minimum pytest raised to 4.6, maximum raised to 9.
- 0.10.0: drop Python 3.6, add Python 3.14, license metadata per
  PEP 639, PyTest command removed from setup.py.
- 0.10.0.post0: Python 3.15 and recent PyPy support; no functional
  changes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ver_0.8.1.bb => python3-pytest-localserver_0.10.0.post0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-localserver_0.8.1.bb => python3-pytest-localserver_0.10.0.post0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb b/meta-python/recipes-devtools/python/python3-pytest-localserver_0.10.0.post0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-localserver_0.10.0.post0.bb
index d60004769f..b8cd5c47b5 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-localserver_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-localserver_0.10.0.post0.bb
@@ -7,9 +7,8 @@ DEPENDS += "python3-setuptools-scm-native"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-PYPI_PACKAGE_SDIST = "pytest-localserver"
 
-SRC_URI[sha256sum] = "66569c34fef31a5750b16effd1cd1288a7a90b59155d005e7f916accd3dee4f1"
+SRC_URI[sha256sum] = "06c21a66609d862b42bd9cb816334820e696ea8f77cacddfe159127d48649851"
 
 RDEPENDS:${PN}-ptest += " \
 	python3-requests \
