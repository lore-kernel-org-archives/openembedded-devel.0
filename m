Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189D4C369A4
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 06:33:08 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.68881.1744093981707878682
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 23:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kE9XYBIA;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2241053582dso65390005ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 23:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744093981; x=1744698781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3pFqqikb4di1w/SClxFYgTgCCY6HhgSeT6JLx/wEKBk=;
        b=kE9XYBIAVBRjYX3V0GDzPAYX6ACUNK66NvdPEr2q4Eu/bHCt+Bc0859zbVlvl4K4xo
         WmVV1PZDwg7slvO2cWIMo74w+elyuNS8n6Js1Hn1p1F1MgTxpNMVJ7CkohW5cf0PCgAl
         IiwdYXPIhwHyfjsNvGHEFfX5u47opL5dzyGCfHVzLVaLc0sI3XlDXqZRoNnrJ2/3icpw
         vDv5GelFSZiIsP6hJfgXGQNMYjsyUTfNw0UeISY1CDMGbTI9P4XXyMtOQEksBAsRstqa
         NdRQF+P50I5d9NtXxFGjyzj8JxEwuXQWY4sDJLmr3/AyeT8JbZbLLsAEHNd3+bpHuGlM
         fxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744093981; x=1744698781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pFqqikb4di1w/SClxFYgTgCCY6HhgSeT6JLx/wEKBk=;
        b=WkF/wo9KOp8jglFe1Nam3BRvuSwane6U3zOfutQcPwfmxtCB+KB6a7uJ7MJABjKnMc
         MH7GSZYHu/tAun1WiBdAXWBNVVmM6RIhzhYG8vlySeuBtLQTNib+WQQ4Y1JnAL18iDfH
         uMaO5S8I/vA2rdReAVO4Hj+7kC1B8RlukvsCOhWfC/wuRKIMXYX2Hh7Wdy1m6RMuFhKT
         gUHsT2MkkxtER20gKAMriCGIhimeySdwiG6EX6+Z+oDjtZ7lrL+RfFBJuJ/khbjz+prR
         CxSd9YBObu8LvF3uOFN+7Gp4KUx3ONK5OMG86DSF7Eim+NqQaZha9pd7BPl3CD6a7LPT
         mT0g==
X-Gm-Message-State: AOJu0Yxws74PEfschG7kkKLXqs39rLn4Foknv8Lp6vy8HyzXGt2vyRjZ
	WizCGePRBfI6AlG7qvYRNFQTjMhG/PihAm+tk/vsAfQezaUA0FhRovBcsV4A
X-Gm-Gg: ASbGncsd3YDCj5uRbcZtr+Se7PU5evaJSgxnji/4Vqxk4xO559JtvMoaifhOcysD9x8
	ErtH5XgGin9KlnWXVKafq3GarNtPSN7t1fRNoVsaRKo/XbI8iOkGkEWnDGomXWJblnD64d5VORX
	nig300kOWquT9Aiwar+VId8tgk3tVV5n2uztQuII3bWSNtomLYl94KgeDMfrnV6b/Nt49OQbdMY
	I5kj4Ex5CY+EHKiMNYPJ0QtiY8COS5yofx8J9rZy+u6toAlOMl958Zg0Iyn1M1WBqTwiPW2nKyr
	Hme5J0u5XbD8xNUHuEVstdMnWUlGidRKw7NbZT/+YKEF1GU=
X-Google-Smtp-Source: AGHT+IFGhQWPdCIxUN1tqUt8shGchws+3qothNYDdUwKRANaELIEBqrcEG15Zx8C8KTN+dcgkz0wpw==
X-Received: by 2002:a17:902:e890:b0:224:1001:677c with SMTP id d9443c01a7336-22a8a0429c5mr213237025ad.9.1744093980724;
        Mon, 07 Apr 2025 23:33:00 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22a960c3b54sm57266715ad.90.2025.04.07.23.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:33:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-arrow: Ignore America/Coyhaique ptest
Date: Mon,  7 Apr 2025 23:32:58 -0700
Message-ID: <20250408063258.2800873-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 06:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116692

America/Coyhaique has changed recently and unless the tzdata is sync'ed
this will fail, so disable for now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-arrow/run-ptest    |  7 +++++++
 .../recipes-devtools/python/python3-arrow_1.3.0.bb     | 10 ++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-arrow/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-arrow/run-ptest b/meta-python/recipes-devtools/python/python3-arrow/run-ptest
new file mode 100644
index 0000000000..4f9f7327b5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-arrow/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+# Ignore test_parse_tz_name_zzz[America/Coyhaique] because this has changed in latest pytz and zoneinfo
+# modules and latest version of arrow has moved away from pytz to zoneinfo module so once updating to
+# 1.4.0 or newer see if this test passes
+# see https://github.com/arrow-py/arrow/commit/2aaafcd581115c50cdcbf04b196657dad1692a26
+pytest --automake --deselect tests/test_parser.py::TestDateTimeParserParse::test_parse_tz_name_zzz[America/Coyhaique]
diff --git a/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb b/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
index 7ce9583d2a..650520a023 100644
--- a/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-arrow_1.3.0.bb
@@ -4,21 +4,23 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=14a2e29a9d542fb9052d75344d67619d"
 
+SRC_URI:append = " \
+    file://run-ptest \
+"
 SRC_URI[sha256sum] = "d4540617648cb5f895730f1ad8c82a65f2dad0166f57b75f3ca54759c4d67a85"
 
 inherit pypi python_flit_core ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \
+    python3-dateparser \
     python3-dateutil-zoneinfo \
+    python3-pytest-cov \
     python3-pytest-mock \
     python3-pytz \
     python3-simplejson \
+    python3-types-python-dateutil \
 "
 
 RDEPENDS:${PN} += " \
-    python3-compression \
     python3-dateutil \
-    python3-dateutil-zoneinfo \
-    python3-json \
-    python3-types-python-dateutil \
 "

