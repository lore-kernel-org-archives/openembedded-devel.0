Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663F1CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 05:50:36 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.27034.1759729827120566888
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 22:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f89ofFEe;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-780fc3b181aso2415617b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 22:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759729826; x=1760334626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LKFqSBpFx9kkf3gHGoCm1SwhiarQ4gizneo5ddIKGVE=;
        b=f89ofFEesA880jmVf+NVv10VhXMGVV30uJAVtsCUxBZPBKIA5cydsWAVjiVmdTiLnT
         Qu0ek3RlhzOJXBbTv9aQ0g5ti4t6mlPTUrQnKRK+o8pq0UTb5TnRHhTCuj5+lrKFd+wi
         J1BcUbBGZ1DRjNk3snvqw20OCSyd9Yu7/hprst6bHUQ1TNcZ6fdQdi5TQ0w03cmp6L5H
         uhmiYXXv5fEJYifw1kphusx73fgmIgy+YBMnwbo7LGxBqz7IAqb/jAgPpy57w4MVTePU
         2TXa4mZitxAFsnqdlRcf1AtMkb+eubAgkWvWx5Cq5xTp/whvewN8LTz6xO5/vIg0RKPg
         1ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759729826; x=1760334626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKFqSBpFx9kkf3gHGoCm1SwhiarQ4gizneo5ddIKGVE=;
        b=soZwQ6u6nWqLIXnFHt1JiNBKgNffarEdXK+hH7+cNKwAUVVrmDAiSkHLGkhUpt9Bqo
         bNYmF/SeD92yjdv56jw7Uyo1D3hGRXbnMkSPuA5t7vj0KeIA+iVrvCaCAJHgjqSjrVmp
         /R7nOqIO/49XFWL/V0qYbEAB4jOHtBN4UcTun4ABu6IHxYxU+aJCO428kF7de7X29B2i
         39TVaDYax+w7RK6kefFqEX/ph10Gk/gg7IgCwgJS5JWQGyd/THLZDBDmV7uIlJKrISh0
         H/sIbpVmiaqJopAyHigYRGa+ztGCe+GVOZBkmIXHhydRI0xznR2N9rNftV0RVkhp5hI+
         ZvGQ==
X-Gm-Message-State: AOJu0YyYuMmFnqfOLLVejyESbq5jkXtV+aG1+e1Hw+6nZi2artgBvoy5
	XeE1st7jSbh5lqA+slbufh3AKQE5BzJW9eE+ijXY17ir77lfNha6eGBvRgip4Jzz
X-Gm-Gg: ASbGncuL6XUONsSjLvHkqdSwK9la7j0/L59nZ8NSV9q51NlY5kWhAH0HEj6eO5k1f4z
	4V+nZAn9cj75HvDA9sDDZOKB725wZVRp320fM/a8dL/bLqk1mjPzCqfdt5aUg2ei22HnlkbhVcX
	On0KhOCXjH43cH37wXSeHz3ba0GIvBKeVz5eZUlZZSeMNqdF0d1qKVuzSYgVi3lfCXgACfvc24u
	qEf8jR6hWk45GWXYL6Fe/h4iGRhJpO6rp8GSjD4dR4Y9esyAkv8ElKwP0Vf3oKIWRCG7J/i7I5C
	fZW0LYxs/jAjzTkkRKpyqCQKrBjN2+P3H1rai1Dtv+NHhJJfaJS9ppv4NeWb346lH9ja+aajftY
	8pbh8IuXu2o8SBh5RYcHYLGILLjo3b+3eKPz7IJMaGKUeEJznhWuwcnJFqVVMIhmpRK2EoZ8GDX
	1We5U=
X-Google-Smtp-Source: AGHT+IHvpZl/ulcjGXncVSiQ1oMQB6fOaaAGchOesZLNRZyHzATZ8RyhSdx44MoYugWcdCd5GNZyVA==
X-Received: by 2002:a05:6a00:b86:b0:781:1b5a:95b2 with SMTP id d2e1a72fcca58-78c98cc3212mr13476368b3a.28.1759729826033;
        Sun, 05 Oct 2025 22:50:26 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb1a9fsm11287981b3a.20.2025.10.05.22.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 22:50:25 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH v2] python3-odfpy: New recipe for version 1.4.1
Date: Mon,  6 Oct 2025 07:50:16 +0200
Message-ID: <20251006055016.578983-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 05:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120272

It's an optional dependency for pandas to provide ODS reader
and writer support. It complements spreadsheet support along
with python3-xlrd and python3-openpyxl, both of which are
part of meta-python already.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
v2: Add ptest and DESCRIPTION

 .../python/python3-odfpy/run-ptest            |  3 ++
 .../python/python3-odfpy_1.4.1.bb             | 43 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-odfpy/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-odfpy/run-ptest b/meta-python/recipes-devtools/python/python3-odfpy/run-ptest
new file mode 100644
index 0000000000..5cec711696
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-odfpy/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb b/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb
new file mode 100644
index 0000000000..9b470f11ac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Python API and tools to manipulate OpenDocument files"
+DESCRIPTION = "Odfpy is a library to read and write OpenDocument v. 1.2 \
+files. The main focus has been to prevent the programmer from creating \
+invalid documents. It has checks that raise an exception if the programmer \
+adds an invalid element, adds an attribute unknown to the grammar, forgets \
+to add a required attribute or adds text to an element that doesn’t allow it. \
+\
+These checks and the API itself were generated from the RelaxNG schema, and \
+then hand-edited. Therefore the API is complete and can handle all ODF \
+constructions. \
+\
+In addition to the API, there are a few scripts: \
+    csv2odf - Create OpenDocument spreadsheet from comma separated values \
+    mailodf - Email ODF file as HTML archive \
+    odf2xhtml - Convert ODF to (X)HTML \
+    odf2mht - Convert ODF to HTML archive \
+    odf2xml - Create OpenDocument XML file from OD? package \
+    odfimgimport - Import external images \
+    odflint - Check ODF file for problems \
+    odfmeta - List or change the metadata of an ODF file \
+    odfoutline - Show outline of OpenDocument \
+    odfuserfield - List or change the user-field declarations in an ODF file \
+    xml2odf - Create OD? package from OpenDocument in XML form \
+\
+The source code is at https://github.com/eea/odfpy \
+\
+Visit https://github.com/eea/odfpy/wiki for documentation and examples. \
+\
+The code at https://joinup.ec.europa.eu/software/odfpy/home is obsolete."
+LICENSE = "Apache-2.0 | (GPL-2.0-or-later & LGPL-2.0-or-later)"
+LIC_FILES_CHKSUM = " \
+	file://APACHE-LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+	file://GPL-LICENSE-2.txt;md5=751419260aa954499f7abaabaa882bbe \
+"
+
+PYPI_PACKAGE = "odfpy"
+
+inherit pypi ptest-python-pytest setuptools3
+SRC_URI[sha256sum] = "db766a6e59c5103212f3cc92ec8dd50a0f3a02790233ed0b52148b70d3c438ec"
+
+SRC_URI += "file://run-ptest"
+
+RDEPENDS:${PN} = "python3-defusedxml"
-- 
2.51.0


