Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29.1794851783683266802
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Dge+frXD;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e795af1d4so70728eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851783; x=1795456583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uX0Mc1BEZOnl5YiiExrS0RDC3B1UcyLYzgrfIK0C/2s=;
        b=Dge+frXDyLrR7fdVoF0UEVVV6GmhyZ5/tX9t1vHmZFjI3Ovqynjp+9+TLlaPOErvdL
         is+1g/sIayYzl6tXISwzGF+e97dW2YULqaIy1EOm7dVtrX0GjSN3yz20kjEpihk3xrqk
         xJxbclGBRet8NrPam7nCcaWJoDMmmiOdUmHCfOkKh6MUenbOwzh6ohA0T7mBepcxbh8L
         XHGVCkFS3iixMVejir+O1uY4rYW6zzA+hnXcS1zRTJrUt9dzT6NBg3vTQYtGcXzOvix0
         FboSHMArFagJ7LPGW9P7u3tONZodcs/fLhOuFRmA/bdAhQDnfC1o+20+GHSEcL+BvZYx
         o5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851783; x=1795456583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uX0Mc1BEZOnl5YiiExrS0RDC3B1UcyLYzgrfIK0C/2s=;
        b=lg/ddbewlBWELdjGBsucubaTlJPD74U1GLMFM6f+gJaCsRbcjPTXDl6wxtukiLtpuo
         +owDQ852zZfBpP3gXin9EFl175/ZeQT93mtUAV1+Ise/NZ5bsP3FO+tZsEiULMXqXGOO
         Wfj046D5oOFbZemsYTdMSOx2kXlAmIlWZ/837Caqz5YjtW39LLhS1GWetrTcSRa2+jYP
         QXRaw5VqGxT52T136LNTjnGt0UEaWQ0y/HW6tN5hftRXmJnS+d/l5Z4yWvdNry8/Io0r
         nNJq8wFEZlOJ+ESuZZRWwNe0uuEjINbFho1JrQsb7lUR05lCvS44V31kia6jD7jKibiz
         ZBvA==
X-Gm-Message-State: APuU4Z/3uZ1E38o6Jta1Ebuy351eUzWi/Fiz58NQIl4yz/ZU4L1ItuBN
	+Jda4hQ2UMGfg5bT08zpmOonhKNnd2bRzI7RO16IbhKIq+EgTlYmK4BdOnGaVwlO
X-Gm-Gg: AZFdTZd2tHcEHpfXfAZlRdINkAuYXRMUvFEDm6q6Bnr/omw2+M30wjNNgWPkYot700u
	OqeXHg7QuKQNepHMdNCXLvyYSJGP7TKBJNo2TDCrkpRCbct3W9Zd2RkxHR0OzTJnKwWkYNA/g3k
	hRUfaKS5pOMABIk74GESTTQ3q3iYC4fmsDMTvZKrNgT33qZ4u+0IY0kFThV8WpVLwXIs7hm1pRw
	G8ZylXWlfbhsc4Fmr1IPYweWMKUCsmB28DOZg42nE0pDFIB/78K4w8bm1kH1WZeCBchzAmLMv+T
	tRWszvfCeF1TKrON8lCC/sSO7P9ii0zPyJs7SVsZTEWy3ENKVCucwgpCdiQ/OsVhacsbsHcJ9tr
	+ICg5tPrKCe/ZwtE86mggD59a+RM5wUpmmhOlQDewblXCTlrGnfp4ilriSmgBLB8Kkksf1nuQnt
	hP2e/emlXSy2IIj+gAlveYX98QwVFi6js3rwbz5EKRwAJSkNkYSN7a4lmkUHTUUBafLK0KKfaR4
	AMX5Kwd31ueoB/M4/ic3FnDpjUlmc3BuC0oShRGzh6/DYEr6FDRiijsA0h1TW4jzbGtEedaKYFw
	SLl3IUw3OFjxNRFa800fytmSaCjiBEn748hZ1BkIwEcy07ylO4oxiRzr/kQu3R46x1HgvgvYKiH
	u3QwNN2sJDVFP39qi6etfyhaifz8V6nJ5H9ynWFldoqvWCveC8Jz+6pYRqFlQCgCNVTCVhuNzrc
	CxKnRzbnraqaCnTiShis55DE6gfqfJJgUDRss3Ief2vqfy7UBn9cf1A85Venz4QpTfe4Rfl11ol
	3y8Chutg8ZN8BgRFcZH+oHKmIeQ1nQNT05SLHn464Cu6UiMGoMI0h4KkAKXGobguT4TRokwPo+d
	voI8
X-Received: by 2002:a05:7300:8289:b0:373:64ef:5dfe with SMTP id 5a478bee46e88-3810c8462d7mr169396eec.8.1794851782999;
        Mon, 16 Nov 2026 09:56:22 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 105/105] python3-zopeevent: upgrade 5.0 -> 6.2
Date: Mon, 16 Nov 2026 09:53:57 -0800
Message-ID: <20261116175359.342679-105-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132560
Content-Type: text/plain; charset="utf-8"

License-Update: PKG-INFO no longer has the License line at line 8; point
at LICENSE.txt (ZPL-2.1) instead.

Changes:
- 6.0: replaced the pkg_resources namespace with a PEP 420 native
  namespace package.
- 6.1: no longer needs setuptools at runtime; added Python 3.14.
- Dropped Python 3.7, 3.8 (5.1) and 3.9 (6.1); added 3.12/3.13.
- 6.2: package metadata moved from setup.py to pyproject.toml; build
  allows setuptools <82. 5.1.1 requires setuptools >=75.8.2.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-zopeevent_5.0.bb  | 11 -----------
 .../recipes-devtools/python/python3-zopeevent_6.2.bb  | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-zopeevent_6.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb b/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
deleted file mode 100644
index 1c378ec544..0000000000
--- a/meta-python/recipes-devtools/python/python3-zopeevent_5.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "The zope.event package provides a simple event system"
-
-LICENSE = "ZPL-2.1"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=72092419572155ddc2d4fb7631c63dd3"
-
-SRC_URI[sha256sum] = "bac440d8d9891b4068e2b5a2c5e2c9765a9df762944bda6955f96bb9b91e67cd"
-
-PYPI_PACKAGE = "zope.event"
-PYPI_PACKAGE_SDIST = "zope.event"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-zopeevent_6.2.bb b/meta-python/recipes-devtools/python/python3-zopeevent_6.2.bb
new file mode 100644
index 0000000000..eace9d0e2a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zopeevent_6.2.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "The zope.event package provides a simple event system"
+
+LICENSE = "ZPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
+
+SRC_URI[sha256sum] = "b97d5d6327067ee6b9dfcbdf606ade9ade70991e19c162e808ea39e5fcf0f8d3"
+
+PYPI_PACKAGE = "zope.event"
+PYPI_PACKAGE_SDIST = "zope_event"
+
+inherit pypi setuptools3
