Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D033FC369A6
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 00:42:16 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.14018.1744332129140684961
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 17:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ExqCi/k9;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7369ce5d323so1274138b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 17:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332128; x=1744936928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EqtalLp31NiTdsLpJyrag6UvKK7k7RKmKCy0s7hx1o=;
        b=ExqCi/k9hmfPAXJTuCjIJJ5TAPzIG7ecg90VDe+mUBOGezCp16FieAm4O5xcWhPPOk
         fR9OEHFUXpQMGdUPV4uAGMrNEh9+JHjMX57Jx8HEM1hevQgsCVXo/fevSV06DgxSX+9J
         RkrWsV5ewjE7MLp29NiefdAEo/9OlD5sdQ5eEL2CWZV27Zkx6uUUJp3jyjzpOYjKyfa6
         tJwAy6xssxlU78/w9TFh1B0Kjos1T+24q1Op7SAcB1iKfhpDaCCY/S7mUwxBO8APDTqF
         KsS0bYJoUP9FVVeSv/Y+Ps9V+9StCY131KUuUfluMYc2YaLDihuTjgZaZPexRZfs4p+j
         90rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332128; x=1744936928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5EqtalLp31NiTdsLpJyrag6UvKK7k7RKmKCy0s7hx1o=;
        b=spscqifaN40Q8HFIF5TuZVhc3QEKU/uoXQUaxd3R/v2TuubWPFOJZ6c3F3K5hHL0Di
         ayVpQ69kVtDEjoaYD7krSaF53GliMLJzw6XlyUosETCaaFyuCofyeeSiAcM/oFVQWB5a
         WviN/Ngbgw7aYOZoGE0drLeW/drDBixFxcUZa8/i2zztq+wmwIE+WUjYdcSeOTN2oX2u
         ucQNAq0U1QJT93/6PGqDk8xO/V/BlaJVRJq9qqdkrgITILHb1BpmNgz6VNnVQwx/YG0Y
         KkWikrBcEM5tLOAc5MNdR2a88B0ZjH0Ry0gG4IyFhteuBYVsslKf2AoW6xhelX3zSGMn
         lc7A==
X-Gm-Message-State: AOJu0Yz3yGqJQUqRDD5c2V7B7AeLV+nqYdupXNpIeuv7/33UT0DbG92H
	lNtc44XOuK4a8a2bGwa0XPzgDAsHnKrd8qA/tQUPGQK7sL7BidnHUkokBqgB
X-Gm-Gg: ASbGnctOmZq4PcTCe+OZVsnHbNXvHG+1qS6FPk0Vo+h+UoBCBo/UvcAdxzJXyr7qLac
	kyllAIeGzNrsvUJGRO0bwOl4N0d0h9DwkDxwnDtyTarDkbs0TPpd3EH6oDd6wXHCE7uj4XgCmhF
	ClpYqCjQPFhx0R1axWHU36ADmVZ6EbKknu4zOEzijtRsSfC6Y2fT41Xl9pNMI9P8k8pgzeO7jEq
	0SYx3vaIMVew76QrCJEc4OA47Hf6dz1tMihEjzqbs+kt32Ad++QAW9D7wp6rX6q+wqJc4hmmjxS
	jPTcoAUpW6xraixqoI3GkqEQKlrv07oZ
X-Google-Smtp-Source: AGHT+IE7FLB8sl33o9InhO3o3cSCf4d6EAov/0HR539aut0qaTmom0Bk+/oKDrlwAol+y4xqRijvuA==
X-Received: by 2002:a05:6a00:4644:b0:730:95a6:375f with SMTP id d2e1a72fcca58-73bd1199eaamr1286571b3a.3.1744332128178;
        Thu, 10 Apr 2025 17:42:08 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6464sm226987b3a.64.2025.04.10.17.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:42:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 04/12] python3-pyzstd: Switch to PEP-517 build backend
Date: Thu, 10 Apr 2025 17:41:53 -0700
Message-ID: <20250411004201.3826913-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411004201.3826913-1-raj.khem@gmail.com>
References: <20250411004201.3826913-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 00:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116778

Add ptest support while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 ...-setuptools-dependency-from-74-to-79.patch | 27 +++++++++++++++++++
 .../python/python3-pyzstd_0.16.2.bb           |  3 ++-
 3 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-79.patch

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 58f53dedc7..bdb4482dc5 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -70,6 +70,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-pytoml \
     python3-pyyaml-include \
     python3-pydbus \
+    python3-pyzstd \
     python3-rapidjson \
     python3-requests-file \
     python3-requests-toolbelt \
diff --git a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-79.patch b/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-79.patch
new file mode 100644
index 0000000000..8fc26bd90b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-79.patch
@@ -0,0 +1,27 @@
+From e648bb2439cad0d2ce47875edc7944d0b446fdb4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Apr 2025 14:38:31 -0700
+Subject: [PATCH] Bump setuptools dependency from 74 to 79
+
+Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
+support beyond that which is needed for python 3.9 on windows. We
+do not have this problem on Linux
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index dd885e4..9f273b3 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,6 @@
+ [build-system]
+ # setuptools 64+ support --build-option
+ # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9 under Windows
+-requires = ["setuptools>=64,<74"]
++requires = ["setuptools>=64,<79"]
+ backend-path = ["build_script"]
+ build-backend = "pyzstd_pep517"
diff --git a/meta-python/recipes-devtools/python/python3-pyzstd_0.16.2.bb b/meta-python/recipes-devtools/python/python3-pyzstd_0.16.2.bb
index c1abd59f60..e1c24404e8 100644
--- a/meta-python/recipes-devtools/python/python3-pyzstd_0.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzstd_0.16.2.bb
@@ -8,9 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aedb5a2679cd1552fb61c181ef974b9e"
 
 PYPI_PACKAGE = "pyzstd"
 
+SRC_URI += "file://0001-Bump-setuptools-dependency-from-74-to-79.patch"
 SRC_URI[sha256sum] = "179c1a2ea1565abf09c5f2fd72f9ce7c54b2764cf7369e05c0bfd8f1f67f63d2"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 # clang-16 with -flto segfaults on arm, therefore ignore flto for now
 do_configure:append:arm:toolchain-clang() {

