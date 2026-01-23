Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F125FD77882
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:02:28 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.112.1769187745335345715
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mKUwMp+d;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee2715254so13407125e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769187744; x=1769792544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ih0qeP3nWwWELOmLvDivXER/zwh685mzFaFXfUr2mr4=;
        b=mKUwMp+dm3iAgKZfs+QisWyQc/fF7nXWayRNeLQBG5s1aU3PE5C56Of7OspOKp5YTE
         GmO+qBAYkIKrb8kOz+JJo4QxJG9XjWKx9GzkjdVF/tSiI63QypKsjIUGJndHSxZ0HINA
         h7JsrqECJulRlE+G5FXZKisraPhN/tRjBqCObc56lCW+7WVtlMc/hWqtvGX0qU2HUXN/
         DkHavGyhW6MBBImn77H8HKUHaHxYOtgi2ytaDWZHZBNcL50Z5F0yinfJN/Y0tt5GYLB2
         sbFPUQpTerNAnJrSEjJKThnAn0r0TajnxlQepdBetiJ5kkz1BzGfIuNFO9hRye7ZnpGp
         DbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187744; x=1769792544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ih0qeP3nWwWELOmLvDivXER/zwh685mzFaFXfUr2mr4=;
        b=vSg/P+hDtIEDTG7AbtWcYRB5ok5mkxMg0+oUQTMyCnQ8OkBd8nFDg43i16YuuaLf4L
         Nfk8r7eJQ9ZDgJ+hswdCkXAHRj9BJGFKI/ITPqqVm4nETRTOtTag+uiaLqjZSk/FXFv9
         WvJ3LSRWUfmi42u1z1wf5Cfq3dDTcBIgwhyxNnufb4Ss0YtkjPDvxTrraituJtkL8Z5C
         yxEFxk56tZ8LnNIedAnDaSa+/ZTdkadyVRpmZhrSqPJmXU6MjYZ+asLUtuE9/IrQdfVN
         QV4SUE51QuQ+RbbtX+ke+aKHCXzECcuewXYFNRz0Gh3TNrl925m6ncS7BTtsr81m61Ke
         QeNg==
X-Gm-Message-State: AOJu0YyGWtGsey/RvCzTti18DIM9cs5KPsktXoj+pcQqT6u1EYqN3lB4
	VOSupyhMiEc0npMc6B5/l4CiE9B0mXVFRZ5YZt2rPuwrNDXrQoZarlLc/CK+Dw==
X-Gm-Gg: AZuq6aI03i3kd77ZTGA93tw0Idyozu2MN7g5IZnka2mxgZoJoobKdF5TP8E09VIY+gQ
	ggH8KIoQ/IrKhN0uqAMG1yHv256ldH9YCzYsD28PNPxfhJS9XofKKNfTq6olqxJ/XVkveybJyeY
	rgRVGyYc1wcij0t/URoDNnZiNAr5EyzEUzMFJMYZ8mzLCPlDOJrbtaoUOg5PzPWIJMDvtaIB9dW
	9MHTLwYD37IMJb4D20g22cECSNTEk3KNkOn+8+lhG9nTHEDum6lIOMkVf3d5HeVHhy45kOL7Hji
	ylzbb+5P3b6wYlIh7jNBY/iPr2879BT8vuBOvy3PVRh1+tUWX8RtxMvHYiirN4CQuOxKnf63Cny
	eptnfKeaqcGrr/382/RRg/SSAenCdlZNH7h4aHTfPyPbXDT74cpNc9e3vannRxaSaEJXAQmHLMH
	3rQnnhFFMs
X-Received: by 2002:a05:600c:4e4e:b0:47d:4fbe:e6cc with SMTP id 5b1f17b1804b1-4804c9596aamr58919705e9.13.1769187743295;
        Fri, 23 Jan 2026 09:02:23 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd4630sm25455165e9.17.2026.01.23.09.02.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:02:22 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 01/10] python3-django: upgrade 4.2.20 -> 4.2.27
Date: Fri, 23 Jan 2026 18:02:12 +0100
Message-ID: <20260123170221.671471-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123786

Upstream has switched from setuptools3 build backend to setuptools_build_meta,
however their setuptools requirements are higher than what's available in oe-core.
As a workaround, add a patch that lowers the requirements. This change has been
tested by successfully executing the django test suite in qemu (without Selenium tests).

Changes:
4.2.27: https://docs.djangoproject.com/en/6.0/releases/4.2.27/
- Fix CVE-2025-13372
- Fix CVE-2025-64460
- Fixed a regression in Django 4.2.26 where DisallowedRedirect was raised by
  HttpResponseRedirect and HttpResponsePermanentRedirect for URLs longer than 2048 characters.
  The limit is now 16384 characters

4.2.26: https://docs.djangoproject.com/en/6.0/releases/4.2.26/
- Fix CVE-2025-64458
- Fix CVE-2025-64459

4.2.25: https://docs.djangoproject.com/en/6.0/releases/4.2.25/
- Fix CVE-2025-59681
- Fix CVE-2025-59682

4.2.24: https://docs.djangoproject.com/en/6.0/releases/4.2.24/
- Fix CVE-2025-57833

4.2.23: https://docs.djangoproject.com/en/6.0/releases/4.2.23/
- Fix CVE-2025-48432

4.2.22: https://docs.djangoproject.com/en/6.0/releases/4.2.22/
- Fix CVE-2025-48432

4.2.21: https://docs.djangoproject.com/en/6.0/releases/4.2.21/
- Change build backend
- Fix CVE-2025-32873
- Fixed a data corruption possibility in file_move_safe() when
  allow_overwrite=True, where leftover content from a previously larger file could
  remain after overwriting with a smaller one due to lack of truncation
- Fixed a regression in Django 4.2.20, introduced when fixing CVE 2025-26699,
  where the wordwrap template filter did not preserve empty lines between paragraphs
  after wrapping text

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-lower-setuptools-requirements.patch  | 25 +++++++++++++++++++
 .../python/python3-django_4.2.20.bb           | 14 -----------
 .../python/python3-django_4.2.27.bb           | 17 +++++++++++++
 3 files changed, 42 insertions(+), 14 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.27/0001-lower-setuptools-requirements.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_4.2.20.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_4.2.27.bb

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.27/0001-lower-setuptools-requirements.patch b/meta-python/recipes-devtools/python/python3-django-4.2.27/0001-lower-setuptools-requirements.patch
new file mode 100644
index 0000000000..5f6707467b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.27/0001-lower-setuptools-requirements.patch
@@ -0,0 +1,25 @@
+From 10ddc1ee660ed5ee4d9aa21f751eb07a1b260b6c Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 23 Jan 2026 13:49:53 +0100
+Subject: [PATCH] lower setuptools requirements
+
+Scarthgap ships with version 69.1.1 - adjust the requirements for that.
+
+Upstream-Status: Inappropriate [specific to OE LTS versions]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 4635d0e..319b261 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,6 @@
+ [build-system]
+ requires = [
+-    "setuptools>=75.8.1; python_version >= '3.9'",
++    "setuptools>=69.0.0; python_version >= '3.9'",
+     "setuptools<75.4.0; python_version < '3.9'",
+ ]
+ build-backend = "setuptools.build_meta"
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
deleted file mode 100644
index 3fb8b03224..0000000000
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require python-django.inc
-inherit setuptools3
-
-SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"
-
-RDEPENDS:${PN} += "\
-    python3-sqlparse \
-    python3-asgiref \
-"
-
-# Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-# default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.20" can be added to local.conf
-DEFAULT_PREFERENCE = "-1"
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.27.bb b/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
new file mode 100644
index 0000000000..038b0220fa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
@@ -0,0 +1,17 @@
+require python-django.inc
+inherit python_setuptools_build_meta
+
+SRC_URI += "file://0001-lower-setuptools-requirements.patch"
+SRC_URI[sha256sum] = "b865fbe0f4a3d1ee36594c5efa42b20db3c8bbb10dff0736face1c6e4bda5b92"
+
+RDEPENDS:${PN} += "\
+    python3-sqlparse \
+    python3-asgiref \
+"
+
+PYPI_PACKAGE = "django"
+
+# Set DEFAULT_PREFERENCE so that the LTS version of django is built by
+# default. To build the 4.x branch, 
+# PREFERRED_VERSION_python3-django = "4.2.%" can be added to local.conf
+DEFAULT_PREFERENCE = "-1"

