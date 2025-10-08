Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC26CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 14:48:04 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.655.1759934880441475068
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 07:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CKjJZGka;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3b27b50090so1392659866b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759934879; x=1760539679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZ5ntlXyySqohNfNKkkdE4+Z18y1dm9WyKWeRONqCj8=;
        b=CKjJZGka6fhyHenxhiGUyY6cem7A40BADaaSpzGPf0RAVC4Zu/J+J2N5Lj1dKeSAsn
         Flq8ZViPWbpleKAQNBL4rjoY5aAYBKDjGFq/xVmDKCtB8VEeuGdzMj7o3dMK2n1sLSbI
         FEn4ya80JHN++HOZzSF/q7ZRKzMT6MChpxVPHy8J/TwsVrZpxRYSG6cJeSmZgrt+YZXz
         td03Prjl9WNY6hbVUJPk9QkPxLYPF4KVyr65H3KdetSYy1i5UJ/TRuH8Aj0418QMMWBI
         2iQewxIwXzfjdQNAzPfRZDZr+XFKvZcvm2R0zE+uTDhwiUdh6hmzC/p6Z5Xh+rXfHPlh
         qkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759934879; x=1760539679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZ5ntlXyySqohNfNKkkdE4+Z18y1dm9WyKWeRONqCj8=;
        b=rHVbO3RRPZriPkfmYh0rVOfn46rtddI9NgaUAfjJE4x6qLozdWbLzJhh3Em88fhIsl
         uytkuvLt2+N3a4S3RbJXYouGjx6lUY5924jIJnel1XW62hWzWGo2B5l6AkGei28/clJn
         HUg1RQ+BY7HhIfXydTvjv8RYbiQRMdln+gB8RKbEn5Rt95gs/JBdBFt9XZOiF5XBWJwO
         doYWc8u44PgjRQrSVR/jYBt9rfNoWXxOn/qhDC5gZJlLVZdV8qX0xX5lr51jRG3zRU4D
         Mfz5Tc4HfjIsO9O3JRNIe/inLHbs1+yYo+dxr0KgLD2lcLM/qnj+iSddeoBFkSNNlKb8
         9U+A==
X-Gm-Message-State: AOJu0YwnUoksj75WQXp5W1bffMXNFm7BEkZRv+/YYo4Uex3iXZnJOJBI
	0oJOqFFO4GA7GKRajZXXAh83rQ8UE8FcHZG2TI3EWi0s1+chTEWEPFyJTit7WHg7
X-Gm-Gg: ASbGncsaOdUZqP+qaXqQYaCdtITMT2uM9l7qrfRRyyowyqLgzzu7m3V9/lR6QUCLrem
	cqtlqLJoDgEqwR6YNmXkk2KSosoWYoN9spfmevOOa8C2bKSluB9bYdAm2ZHEtviusTdrgk5C5y8
	4eM7Un7BDBnFuXBoCrssRRLxtqn1L+O40HHg5fD8VAzFH8b8Dp1i8aCov2Ssf0GrNvT9mdwHu8/
	YQgBS8s5srurDhua6P5iqTQMKgvTpnRJkL/laIwbNXRnvraR9uILsQ0keOS9LQ8hOS3Y6P9XWG3
	dxCw4kSBSgGAkimdW8/fhTR7eAuEQfx7OUMSHEqbOCESl4NguawXhIY2TPoOVSQMCn4Z+v4quJV
	4dZ5NId8tTRnHbU/G3IZXKS+VdL7u3J4+MqQZdFWs6rk4VqLqCrcabms=
X-Google-Smtp-Source: AGHT+IHcXavQOvqmKGWc1duDKihFGMUQ9gangQgJ3zaq+zwjx3TtKb5Z5RDoQPAUKLl+Jfm8tKos/g==
X-Received: by 2002:a17:907:e8f:b0:b34:985c:a503 with SMTP id a640c23a62f3a-b50ac1c34c9mr360324266b.35.1759934878536;
        Wed, 08 Oct 2025 07:47:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865a83e3dsm1637724366b.29.2025.10.08.07.47.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:47:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 1/3] exiv2: patch CVE-2025-26623
Date: Wed,  8 Oct 2025 16:47:55 +0200
Message-ID: <20251008144757.411347-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 14:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120366

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-26623

Apply the first to PRs from the relevant issue.

(The second PR adds a test, and the 3rd PR tries to reimplement
correctly the feature that introduced the vulnerability:
it is switching some raw pointers to smart pointers. It was not picked
because the
1. In the original issue it is stated that the first PR itself
   fixes the vulnerability
2. The patch doesn't apply clean due to the time gap between our
   and their version
3. The behavior of the application does not change
)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-Revert-fix-copy-constructors.patch   | 82 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |  4 +-
 2 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Revert-fix-copy-constructors.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-Revert-fix-copy-constructors.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-Revert-fix-copy-constructors.patch
new file mode 100644
index 0000000000..b3074e2823
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0001-Revert-fix-copy-constructors.patch
@@ -0,0 +1,82 @@
+From f338465efb49166c543dcc2fc52810370ea90475 Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Mon, 17 Feb 2025 16:34:40 -0800
+Subject: [PATCH] Revert "fix copy constructors"
+
+This reverts commit afb2d998fe62f7e829e93e62506bf9968117c9c5.
+
+This commit is wrong and ends up resulting in use after frees because of
+C pointers. The proper solution is shared_ptr instead of C pointers but
+that's a lot more involved than reverting this.
+
+Signed-off-by: Rosen Penev <rosenp@gmail.com>
+
+CVE: CVE-2025-26623
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/pull/3174/commits/638ff11ce7480000974b5c619eafcb8618e3b586]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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
index 3e33ab7953..81e9954c1d 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 
 DEPENDS = "zlib expat brotli libinih"
 
-SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x"
+SRC_URI = "git://github.com/Exiv2/exiv2.git;protocol=https;branch=0.28.x \
+           file://0001-Revert-fix-copy-constructors.patch \
+           "
 SRCREV = "a6a79ef064f131ffd03c110acce2d3edb84ffa2e"
 S = "${WORKDIR}/git"
 

