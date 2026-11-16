Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33643.1794851675959392863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VNFZxpSV;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-380b40312e2so1299466eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851675; x=1795456475; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xfGyTlDQ6lac5R+0Lu/IupzP30vFyhY36LONrBV7N6A=;
        b=VNFZxpSV2H53EZWt3FOln5vAGGt/v1NvWw2yQRVLpWf8SjQatbkhqSLyw+kp2Oak/r
         NZVTE5XnHgwoUDTY0Y15d0YLDTgLXsSEKFpyh/h6htXiHmK0jUxTx7gtVy3SSG4v6T8i
         e8WpPu9SL/Oad8zYdXsSU0L88d6cfo+ctNI94gtsgLaaMovgebC/o+kpjaSPqmSbk/Zr
         N9IWNqJojv1/sET0m5GtTBnEl+rDvoeRYq7TIyjdCGn1E0P+r/v2hAhGakWSYQcuVdGl
         2fuDf6LoKe+Zm+MBuj8eSobY3KR3su4lfwNoAw1rbzrBrNjaj5SkceX9JLkMKxABa6ao
         Vm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851675; x=1795456475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xfGyTlDQ6lac5R+0Lu/IupzP30vFyhY36LONrBV7N6A=;
        b=D65MzXtbvQ8QHaIlk/OCUyDsthN5wlKNVL7EwkTuQqnnEDaL6sPbmQPRXOAMgfdCoN
         ZP+VRg5aplnTiaa4UXSW0aIyreHWadcjHwwDwLsnOQpdZDCXrwf6o2HR47gFYaJJVNv2
         30vwl9fNnzvaW+P8Wv37aL2Iz1ZWhdDGrbjcqzfcdSomly3ZLawTXws4TuRKFMJ5pXNA
         gdB5u4+T7bpI9LqmgwpyV/TldKxc8wZlOacN4npT/pjpLnlELe5OVeICLZeq6EnGkH7r
         wV66Im2IBsNW2iq4lzrkxY4LMmTBYNVxsN2QOWkOkqdkqNAi4cJE68LQf7N2rwja/rW0
         +YSg==
X-Gm-Message-State: APuU4Z98qu7pzAX7353H7+9aluZN8ceJynNKgsFqBEaiFMZ+MEFWuWlz
	65aUgUxgXZl0NoNU0g56VqsB0mFThGW2Cp5Tgh/nbalW4GtaEwHm/hUDdkOY2a4u
X-Gm-Gg: AZFdTZda/SPE3/mgkDsjRq1foHxKi5KP2rvYibBPiEgNvDdrpbPtFxVfVr2+fmeYNEh
	DCfMBhdzJCvlxM0DXx82eyN01OlL6ujpRKOkLK9oULXSbwdqlTlbNyfkOkhwlSbjjSOJfOTyjZq
	o0Z9kryEd0T6U5+AaFLMkp3XLYsVOa6Opxa67ulS5ZbfOBgzcUtMZSmfQmj1+QsUajW9CdabHyb
	kQwWr6QDaAa4AchLAHpqsWGrtAlBbECzCyDfS57oCtKi8bqO/yGnj6U77fsYSNe7m+9VOzyFl5f
	+BZgxGyGd7cbbIaLnziZZKamYbjUeQPpxnLEZs6pOgviFZZeeEq3kACfBPDK6ZfZjb3LWJXBIME
	agGO4qMnNrN1W44flsPKUQdOtYXOBkhGnTxRGauM8stTlginpoTc4jZ+vccReIWFJMBUBZ053JI
	SRS5XJZv7DGKzcFK81v/deeJZ3YScxnZLAMKWYZWSqowc+q5cGRcSFJYhjC7gYkbAYQz1kpttE9
	b61sWabpPNq28uIdETXgOjW3LtDlsovF7onAs+lY/WQPuBbg536iC+1hOWGTSwEdzNmu/ogooZW
	aOijzbfzpD/eLaHJC5E8TihiI7M/Hlf5qxXDUqiGPgQFwTy89fgkZDbaME31syJl+/6FAmKm5IG
	vGtp+OOSMiQWrx2kpK6LkTE9PYwBinGzlAJbSDlgvPXB/YxhuiF65m//oJoBA+WzgdMz3/Sus20
	QbRzNIIsUU5r0hKew+dHv6r5iJDR3+k+Mi5F3kIN5a9Z9k1vpsVAMOdb3VpbLwD5/F4ZkiAs5fG
	aqErZG3G9ptY7Tim93ILGHWhtccwzcyq6SJaGROQ4mxT8NUVS8fZqfSVG7ckORJSlQl8Oo/i9VA
	uWNh
X-Received: by 2002:a05:7301:c02:b0:36a:50f4:ed0d with SMTP id 5a478bee46e88-37966766d98mr11437489eec.25.1794851675099;
        Mon, 16 Nov 2026 09:54:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 020/105] python3-deprecated: upgrade 1.3.1 -> 3.0.1
Date: Mon, 16 Nov 2026 09:52:32 -0800
Message-ID: <20261116175359.342679-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132476
Content-Type: text/plain; charset="utf-8"

Upstream dropped setup.py and builds with hatchling; inherit
python_hatchling.

License-Update: LICENSE.rst renamed to LICENSE.md (MIT text unchanged).

Changes:
- 3.0.0 (major): requires Python 3.12+ (use 1.3.x on older Python) and
  wrapt >= 1.16; Python 2.7 support and the inspect2 dependency
  removed.
- Build backend moved from setuptools to Hatchling (pyproject.toml,
  src layout).
- Removed deprecated.__date__ and classic.string_types; "from
  deprecated import *" exports only deprecated and deprecated_params.
- Added deprecated.google and deprecated.numpy docstring decorators,
  type annotations with py.typed, and pickling support for deprecated
  functions.
- 3.0.1: preserve constructor signatures of deprecated classes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...hon3-deprecated_1.3.1.bb => python3-deprecated_3.0.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-deprecated_1.3.1.bb => python3-deprecated_3.0.1.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-deprecated_1.3.1.bb b/meta-python/recipes-devtools/python/python3-deprecated_3.0.1.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-deprecated_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-deprecated_3.0.1.bb
index cc5c96a7a1..38fdd9c802 100644
--- a/meta-python/recipes-devtools/python/python3-deprecated_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-deprecated_3.0.1.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Python @deprecated decorator to deprecate old python classes, functions or methods."
 HOMEPAGE = "https://deprecated.readthedocs.io/en/latest/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=44288e26f4896bdab14072d4fa35ff01"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=656397bbedec0bd68b9163ff5e53032b"
 
-SRC_URI[sha256sum] = "b1b50e0ff0c1fddaa5708a2c6b0a6588bb09b892825ab2b214ac9ea9d92a5223"
+SRC_URI[sha256sum] = "2f5a9fecc9961e26462846cf1e57f73a612b1d0b79c27dceeed8de647beadcee"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling
 
 RDEPENDS:${PN} += " \
 	python3-wrapt \
