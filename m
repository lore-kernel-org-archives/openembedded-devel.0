Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11B9CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 04:13:23 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.1108.1760069599336946214
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 21:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mw84ponM;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1613378b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 21:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069598; x=1760674398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAjl1QbORb+d+mCJWktCvBDc/ZGXXk1pkrorfv8zHBw=;
        b=mw84ponMk9b1tLJvYrbDwzJ/GaJ/IT84sQ7juztGgxOoYKkTq4DeeCdRnbx1OtKrfE
         diUKyrtly3OSlbFrMqPEX3z9uGL369RAvKv9aB79xVmJupjN+WXWE7JlMw82y85zjbN5
         qpceSBWt/GvMR3yAmLDrofhRL7evHaJM8LSNYdILX4QvAvGulSqfZLGXUpJeuBO18SCx
         DRW3UXa7takSgn9P2MdzSgSmGXrH2ynHYfueEECvK/70lggncL7ej2D9J6HGHmqf/1ZE
         FI9Jlm4ssKYHdUH1SgT4k+tE5VprGTDIj0FeJcXY3VQkR7AgpMyX+YnH0OnpLmnD805k
         DDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069598; x=1760674398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAjl1QbORb+d+mCJWktCvBDc/ZGXXk1pkrorfv8zHBw=;
        b=jwfyKMiwFF6ZNDc37wrZ/z4VYWT2oxVbC0VSOeEENuIYV05m3a6Zwb24i4QWtGljHO
         4tmMis9jChHdxz5F7VlRfd/HV1g9WDeFdIoC2DHXpYaMnPDjq9Lio5dUeNfJvUBqJypE
         X7eKd9RYoSAVyO41g1ZGdAxHMj8pkVAn4Ov2+Pl517kcJDBHAXM0oiimEbub16wYunkq
         tYrgoGR4+/fKsmXpulIgRqCBQRNzsKmuN87GAHajkVeGdduznS92Xksevzyfc69N/ffS
         yeBwpq+zEx3ydeBO2QgYTKi+u6proQGWGH8CR5oPeon3ZsI/yf2SLmh7+D8DkO6mkLFW
         orUw==
X-Gm-Message-State: AOJu0Yw5RJmMdBKJyZuIb5lDlT/XFDw65pvtbYOd8nrlDYmzbqmbShQ7
	gerKS4OZXEo5sAot4XwNoDbNNati/YHGdXb7OwVcx+w3n1K8k+xVFX8M4sq+pg==
X-Gm-Gg: ASbGncsFqnqj+8s9H95RRf5rjuChTjA347LTUNYnFSH0XxvNvKZY+nboKf06AwOhbb8
	7+HNsOzCQ8vJIKtmW+KOccORtmTpz4gQdgZqULaRmuVEz/KL5Zv4Mo/zEdIV4Oy2v+R4WhKgx4b
	p3EHSQGoALfHpZ3tF32JrlF+DuoWuc53TqzUTsTUSFRoBkV3/Q4Z4TV3xOBYziTJIR0JW4PZQre
	V2kru8rmxgbiuUBXK/ZDDw5rqiaFNBMVgmisZV7NWNDVURxqX94KYkxHXMRHRyQaNM3GMftefWB
	+rNkEvJPnpvqXyVkE94aaTTEASSjopL8cDndaul0aE3AZaFdOi4Om0kkVFsj6nvXCwwKdJXFdI2
	J+n45tr/lm9v08lj9BCclQGxz0qDUcIZ0WRB4GlGjJTV7AQADp5tuDwM=
X-Google-Smtp-Source: AGHT+IETlEjCGAfwSIECDvIesQNEd1fAt4aY/fTwCKjrBXpt5wfsYolnHqw0YYX9jJ17JqP6INsrxg==
X-Received: by 2002:aa7:9285:0:b0:77f:1016:d47f with SMTP id d2e1a72fcca58-7923084dffemr12124540b3a.8.1760069598256;
        Thu, 09 Oct 2025 21:13:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b63d90asm1360354b3a.24.2025.10.09.21.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 21:13:17 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 1/3] exiv2: patch CVE-2025-26623
Date: Fri, 10 Oct 2025 17:13:09 +1300
Message-ID: <20251010041311.55847-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 04:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120466

Details https://nvd.nist.gov/vuln/detail/CVE-2025-26623

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../exiv2/exiv2/0001-CVE-2025-26623.patch     | 86 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |  5 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-26623.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-26623.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-26623.patch
new file mode 100644
index 0000000000..db561ed96b
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0001-CVE-2025-26623.patch
@@ -0,0 +1,86 @@
+From 943fbd9c688a10037ccb42bf7c4b20be76df1119 Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Mon, 17 Feb 2025 16:34:40 -0800
+Subject: [PATCH] CVE-2025-26623
+
+Revert "fix copy constructors"
+
+This reverts commit afb2d998fe62f7e829e93e62506bf9968117c9c5.
+
+This commit is wrong and ends up resulting in use after frees because of
+C pointers. The proper solution is shared_ptr instead of C pointers but
+that's a lot more involved than reverting this.
+
+CVE: CVE-2025-26623
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/facce628f3622764e91a8161f89ade8cb34bc120]
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+(cherry picked from commit ebff8b48820b96c786cfddbf0bebb395cb1317d7)
+(cherry picked from commit facce628f3622764e91a8161f89ade8cb34bc120)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/tiffcomposite_int.cpp | 19 +++++++++++++++++++
+ src/tiffcomposite_int.hpp |  6 +++---
+ 2 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/src/tiffcomposite_int.cpp b/src/tiffcomposite_int.cpp
+index 95ce450c7..3e6e93d5c 100644
+--- a/src/tiffcomposite_int.cpp
++++ b/src/tiffcomposite_int.cpp
+@@ -127,6 +127,25 @@ TiffEntryBase::TiffEntryBase(const TiffEntryBase& rhs) :
+     storage_(rhs.storage_) {
+ }
+ 
++TiffDirectory::TiffDirectory(const TiffDirectory& rhs) : TiffComponent(rhs), hasNext_(rhs.hasNext_) {
++}
++
++TiffSubIfd::TiffSubIfd(const TiffSubIfd& rhs) : TiffEntryBase(rhs), newGroup_(rhs.newGroup_) {
++}
++
++TiffBinaryArray::TiffBinaryArray(const TiffBinaryArray& rhs) :
++    TiffEntryBase(rhs),
++    cfgSelFct_(rhs.cfgSelFct_),
++    arraySet_(rhs.arraySet_),
++    arrayCfg_(rhs.arrayCfg_),
++    arrayDef_(rhs.arrayDef_),
++    defSize_(rhs.defSize_),
++    setSize_(rhs.setSize_),
++    origData_(rhs.origData_),
++    origSize_(rhs.origSize_),
++    pRoot_(rhs.pRoot_) {
++}
++
+ TiffComponent::UniquePtr TiffComponent::clone() const {
+   return UniquePtr(doClone());
+ }
+diff --git a/src/tiffcomposite_int.hpp b/src/tiffcomposite_int.hpp
+index 4506a4dca..307e0bd9e 100644
+--- a/src/tiffcomposite_int.hpp
++++ b/src/tiffcomposite_int.hpp
+@@ -851,7 +851,7 @@ class TiffDirectory : public TiffComponent {
+   //! @name Protected Creators
+   //@{
+   //! Copy constructor (used to implement clone()).
+-  TiffDirectory(const TiffDirectory&) = default;
++  TiffDirectory(const TiffDirectory& rhs);
+   //@}
+ 
+   //! @name Protected Manipulators
+@@ -944,7 +944,7 @@ class TiffSubIfd : public TiffEntryBase {
+   //! @name Protected Creators
+   //@{
+   //! Copy constructor (used to implement clone()).
+-  TiffSubIfd(const TiffSubIfd&) = default;
++  TiffSubIfd(const TiffSubIfd& rhs);
+   TiffSubIfd& operator=(const TiffSubIfd&) = delete;
+   //@}
+ 
+@@ -1346,7 +1346,7 @@ class TiffBinaryArray : public TiffEntryBase {
+   //! @name Protected Creators
+   //@{
+   //! Copy constructor (used to implement clone()).
+-  TiffBinaryArray(const TiffBinaryArray&) = default;
++  TiffBinaryArray(const TiffBinaryArray& rhs);
+   //@}
+ 
+   //! @name Protected Manipulators
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
index 3e33ab7953..4986415a6b 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -4,7 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 
 DEPENDS = "zlib expat brotli libinih"
 
-SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x"
+SRC_URI = " \
+    git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x \
+    file://0001-CVE-2025-26623.patch \
+"
 SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
 S = "${WORKDIR}/git"
 

