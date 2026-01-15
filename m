Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07BBD4117A
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 12:41:03 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34748.1768480858762153591
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 04:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a7cYJ5Uv;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso5065815e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 04:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768480857; x=1769085657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=g+tF9LepzS3aPkD1E+KJFLhYmt+pAL2qj/i9IJPI5FI=;
        b=a7cYJ5UvzxZWOsUC+LyI+GXz8rS3X+iMhcK32FlTqqXgWzoSh6VixWPz84H12Gzd53
         qGR490pm6HwrBlnJXuOMEBzohXCwYPm4DDQWA/1/SC9e7LppJcfBl9xa7NTDNv0Dvv/d
         7R16CBG/b90F2gYkmc1AMLy2CGgJnKTH0LCT321GsZGAOZ4WuL2Kb1G/2qcA594p/NaM
         6TkEetHV6Pu2xDFaWds13PGo1adMoIwDHssHnsxPY+6qIVRLfCjhmF/JYtamCfwX0IBs
         U2kHx/cFpR3DerSGdVyMRLEfophOnriFghkBHHnHS2cEShpqYWFQnFLpni9KSuT6MTwl
         nzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768480857; x=1769085657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+tF9LepzS3aPkD1E+KJFLhYmt+pAL2qj/i9IJPI5FI=;
        b=v9RUSU6SxC/T8qZQ1Dc5b0CaWHiUImAZWKflFfc+HJ/s8j7Mfejx1ZXFvh3KJzv2IY
         U+c1CI5Qjl9jqVb2lgDg4DxEgu/ZMhhDxyfUtiBq50ly7mDwKYOqgyxa0qnSq88nmbuy
         TBnZDAS2+Dll/s7PAfNQpBic53Vaf/nQv5lwk3XJSahpC3BuJbAJBY6lDJR4zH24fQQW
         Zrc0j3lOesdSB1nZDI6zqDq6QIs6e5YZDGFCoTydiAy7hmrflz2Y0ry5WeLbqhtJTB7X
         PcR5DY5tc06O4J/r1/4CZ6t2qdvrjQMkx58gAl7dDpnk6aH272xU5IrDTSCF2iGsmrZu
         +Pbw==
X-Gm-Message-State: AOJu0YxJdDwZad4BBQp+S1mwtmCTgXk9sPIzUIwj44KDsXPRB42x+4R3
	hOY2wr/LdeuEHVWcImZuQWGv4UcebJkPhchXlSBLeZ2hXQz9LOPE5E9Oe2Vapg==
X-Gm-Gg: AY/fxX7kI84y65iiZelNEB9WgBnxZOqdrRcLaSfHJNgVRvJbLCmYf+vGA5+TS2Xz0ri
	X5Duf0snSu1sFJvptw/SxXF/SzLVUetdj3VFjaIFl3ehDYSc80razVRYUg2q8PpHC4zjXOvSigk
	MHtUhiugJL6qEfgNIi06Yu5Zeec5yE7i5wA4El+xlj9ynQfGcLpf7CftVzVbRLuiR3dnQpHBNmq
	ZR/Wb7IW+U6HgmElV0ItwSiPK2MUqDIMYPulB6+URMB8BUoOgdPt/hp04+Kwc+z79cYmd8j9qeC
	j//eFAFtaghjIFxX2vyB2xJW2pcYAWqvhA0pi6X0bgaw8vpskXnZeUmwrIgEmvsFeRuEUi85Y+l
	H8JYAPt1w4qsYksa123UWVhBQUp5bb15qa/p8v1N5OlGgOqdDysd+vTnn+UY9IbV8+nGNl4voQr
	HUvPYsfUWq
X-Received: by 2002:a05:600c:4450:b0:47d:333d:99c with SMTP id 5b1f17b1804b1-47f4b270601mr28240365e9.18.1768480856768;
        Thu, 15 Jan 2026 04:40:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee27d9aaesm45759495e9.3.2026.01.15.04.40.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:40:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH v2] python3-django: fix CVE-2023-36053 patch
Date: Thu, 15 Jan 2026 13:40:55 +0100
Message-ID: <20260115124055.2590229-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 12:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123506

This change is for python3-django_2.2.28.

The patch was accidentally backported incorrectly. The patch in general
introduces a field-length restrictrion on the email input fields, however
the patch was backported in a way that the restriction was applied on
file input fields instead of email fields.

This change amends the patch in a way to restrict the email field.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
v1: https://lists.openembedded.org/g/openembedded-devel/message/123448

v2: instead of changing the existing CVE-2023-36053.patch file, just
introduce a new patch for the ease of readability. The actual code
change remains unchanged between the patches.


 .../0001-Fix-patch-for-CVE-2023-36053.patch   | 43 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fix-patch-for-CVE-2023-36053.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Fix-patch-for-CVE-2023-36053.patch b/meta-python/recipes-devtools/python/python3-django/0001-Fix-patch-for-CVE-2023-36053.patch
new file mode 100644
index 0000000000..48805df9cd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-Fix-patch-for-CVE-2023-36053.patch
@@ -0,0 +1,43 @@
+From 85fd44420b007be726b502e3be58f56b0e44cc08 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 15 Jan 2026 13:36:01 +0100
+Subject: [PATCH] Fix patch for CVE-2023-36053
+
+The patch was accidentally backported incorrectly. The patch in general
+introduces a field-length restrictrion on the email input fields, however
+the patch was backported in a way that the restriction was applied on
+file input fields instead of email fields.
+
+This change amends the patch in a way to restrict the email field.
+
+CVE: CVE-2023-36053
+Upstream-Status: Inappropriate [Backport specific]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ django/forms/fields.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/django/forms/fields.py b/django/forms/fields.py
+index b3156b9..bbb135f 100644
+--- a/django/forms/fields.py
++++ b/django/forms/fields.py
+@@ -523,6 +523,9 @@ class EmailField(CharField):
+     default_validators = [validators.validate_email]
+ 
+     def __init__(self, **kwargs):
++        # The default maximum length of an email is 320 characters per RFC 3696
++        # section 3.
++        kwargs.setdefault("max_length", 320)
+         super().__init__(strip=True, **kwargs)
+ 
+ 
+@@ -542,9 +545,6 @@ class FileField(Field):
+     def __init__(self, *, max_length=None, allow_empty_file=False, **kwargs):
+         self.max_length = max_length
+         self.allow_empty_file = allow_empty_file
+-        # The default maximum length of an email is 320 characters per RFC 3696
+-        # section 3.
+-        kwargs.setdefault("max_length", 320)
+         super().__init__(**kwargs)
+ 
+     def to_python(self, data):
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index dedb2498cb..7735898ca5 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -44,6 +44,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch \
             file://0001-Made-RemoteTestResultTest.test_pickle_errors_detecti.patch \
             file://0001-fix-quote-type-in-expected-error-message.patch \
+            file://0001-Fix-patch-for-CVE-2023-36053.patch \
             "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"

