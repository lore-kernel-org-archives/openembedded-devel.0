Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D66D339A7
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 17:15:02 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.57597.1730135700908085471
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 10:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y8fhaTgI;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20e6981ca77so48761055ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 10:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730135700; x=1730740500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65/RRmb1JNtBcc6Mqdqz6TRYgP0FO7UG3CRePc7RSWQ=;
        b=Y8fhaTgIhWVksi1iVKh9Zf+I57DSNybUqYYFccSpoU0psmN4k4eDeqkj2GujnFHVIH
         8JIGl27ubw2b15pCZDQ8ttRvdahbnHIRsDUS8d6LYuL79MPgiNFgZ78UeA4kskt2POPO
         3jnWLPEu62Jt1Gml22YfKavS/zW3SpEqXIEo+jxhPrTLVqpkoX7BhKaDs+yJ9Dr0rrEV
         HyAsWdyP5cn2XFAkfa28caRGajRCUy2mmr4ZCa+MLxWDefJaVhanFuOGPfK6+sF0fyuK
         GtyHzz2imthI1FEJ+XyBVvWaD848wQ4i0oSzXoM5YW2SA1YpBJH0NFiqtBgtniLGH0Gt
         9QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730135700; x=1730740500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65/RRmb1JNtBcc6Mqdqz6TRYgP0FO7UG3CRePc7RSWQ=;
        b=fLXQVb6KYHz9UUOLjT17R8EktLCNEfK/1RLl17d8rs5G1fINalFGTdUv1gCp0/8Uy6
         ftIbCOH4zUkXUVU752gh44HboFM0UmwKAgfjllEm1TAuTyOBlZWpWQfJ7VGltRj//oA+
         oJU/u6uq2r5JRPTavOxkMJxhyMZh0rBTHciuODkFGb9AyHWfjZaobMc2GDlll29KQNOM
         D83fe7TbI9tkMeLD/4npSjRdGeHrdUmCKHuWz3B8988dVq85IkgXEukC+/9Za0czwdty
         Gj7Va+GjgtRNdtZy/paevSEWmDepPszh4/GZa2TfIRzLzR5LPY7XJBNIF5nxRNyf1nAK
         XtHg==
X-Gm-Message-State: AOJu0Yz3J0F2eqZ0rXQyacs5BLWgtdHhrnCyj+kH0QFsTuMArW9K2cVk
	z8vJSqsk4g/DeC6VrONsMVZ99vJ5H/g4qkcmLtNRSqGXqD5O3C48GZ5dzuO8
X-Google-Smtp-Source: AGHT+IGpS1rdrXpsc3uiM1ct7FCZYRKpClGjnS04MH5rb/SpTKrCRPiurhTDpXn4oyAvygANUMntxA==
X-Received: by 2002:a17:903:192:b0:20b:7be8:8eb9 with SMTP id d9443c01a7336-210c6ccc963mr113888535ad.54.1730135699934;
        Mon, 28 Oct 2024 10:14:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9a1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc04b8bbsm52656095ad.244.2024.10.28.10.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:14:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-dominate: Fix ptests with python 3.13
Date: Mon, 28 Oct 2024 10:14:56 -0700
Message-ID: <20241028171456.2462158-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028171456.2462158-1-raj.khem@gmail.com>
References: <20241028171456.2462158-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 17:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113264

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d7fdb171f80ed6ce97e6ca4409723975c47f.patch | 40 +++++++++++++++++++
 .../python/python3-dominate_2.9.1.bb          |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dominate/58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch

diff --git a/meta-python/recipes-devtools/python/python3-dominate/58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch b/meta-python/recipes-devtools/python/python3-dominate/58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch
new file mode 100644
index 0000000000..e3d0d485ee
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dominate/58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch
@@ -0,0 +1,40 @@
+From 58f7d7fdb171f80ed6ce97e6ca4409723975c47f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
+Date: Sat, 3 Aug 2024 16:07:38 +0200
+Subject: [PATCH] Update tests for docstring dedenting in Python 3.13
+
+Update the `get_expected()` function to account for the fact that
+Python 3.13 automatically dedents all the docstrings, and therefore
+does not require explicitly removing the indent (which effectively
+removes too much indent).
+
+Fixes #199
+
+Upstream-Status: Submitted [https://github.com/Knio/dominate/pull/202]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test_svg.py | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tests/test_svg.py b/tests/test_svg.py
+index e5bbec3..ea7d98f 100644
+--- a/tests/test_svg.py
++++ b/tests/test_svg.py
+@@ -1,3 +1,5 @@
++import sys
++
+ import dominate.svg
+ from dominate.tags import *
+ from dominate.svg import *
+@@ -14,7 +16,10 @@ def base():
+ 
+ 
+ def get_expected(func):
+-  return func.__doc__.replace('\n  ', '\n').strip()
++  doc = func.__doc__
++  if sys.version_info < (3, 13):
++      doc = doc.replace('\n  ', '\n')
++  return doc.strip()
+ 
+ 
+ def output_test(func):
diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb b/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
index 054d5236e5..cce304498a 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
@@ -7,6 +7,7 @@ SRC_URI[sha256sum] = "558284687d9b8aae1904e3d6051ad132dd4a8c0cf551b37ea4e7e42a31
 inherit pypi ptest python_setuptools_build_meta
 
 SRC_URI += " \
+    file://58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch \
 	file://run-ptest \
 "
 

