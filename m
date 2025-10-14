Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1ABCCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:54:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.324.1760475277544719995
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VzKwQvLk;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-27eec33b737so86333055ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760475277; x=1761080077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPc7iKlstsvTVWGdFgSMKhJkV6O2egiIM4zYzISJyTY=;
        b=VzKwQvLk+RE5+ger987K0/XUJy8d8AXWVonCEw7ThLJibOleFYqyJ8V2fZsNsx8PZ0
         WegOOCffeYesueLDnpmkl9WFdQ5QpjG29wrDs/M1DgB3Z5/3b7JzbmKuCV3fGWK8rOSL
         U0vel6r94CSrOgy9SThmdRxsmvIUSxoYGKITBi0KDqswWvMCmwxIkt54aluxaTOVlJxq
         k7qV60ELMpjmCYOIEL0yY7Si3YwZHWlZVtg25C4gmnpaJI/QQZuoUfgdtt756aPFO94i
         ZMIlrO847bq7Fyjh26dMsWEnJrHLYVtXiSdcNRqMxKfs1TIqnQvELFaY/O24sCC9LM7p
         GgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760475277; x=1761080077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPc7iKlstsvTVWGdFgSMKhJkV6O2egiIM4zYzISJyTY=;
        b=fCP5rJETJs99FPgpTTQ0kXGbcqauw8TVGE5vi5tN89wLDK/8Qzj/sJLw/BtZkp11oF
         Vbeyn5MfFrTsezVI8L034ibglyoWEUZJs23gukYNySuYDFxU2OGobbWxKmKUhw9ODY5O
         EwElSXN678yc5q9ycb7Uzdqo2YYFHotyq2SPejXunoIIv44zZGTkVXH/8kARLAVqtcV/
         IAI/nekflSYtp1KtJ2s6YT3Tfh7zxPOf7fam3V8TU4UTfSE8szR5EFpmUPPydjSJw0nb
         D3SZA0FOEQ1Bt5wPzdIVXS9MFiCEW79CTvIUHdyXFmANEYNhRSu0sh6t2AQsBODySpaA
         PPUQ==
X-Gm-Message-State: AOJu0Yy33QHqZIWZNlbPp4Tm/Lh7nhiYKvg0yyWuKih4tSg2rjkhcHvE
	MAVxllQ64eqELViqjrVNKzsrj8ap0CzyDtGpt5nbzBkWVhINB32zTIyEJkPaBw==
X-Gm-Gg: ASbGncsWF46N0uisxKxOKvNyIslYdhRaaQSBH4v5Bda6T/cRvXR6bPrNA+ec2sJlqIA
	YlbiNDLuqtHBsBuYc8nSleZRNJ6h56ZCUjqHStz+BXHCkIvaeD0BF9ATRDeJTT55CbfZSlDfZMw
	EY23P/Cu1ZR6ZF3LcKU1fYxxg8Vkk6HF9JlYS1vBlwl1IHLLgvgJufx4aZ4HIVtqy3rTPXHXW4Z
	Hu4eJx9n1KUvn0hO7Kwrn/a81wselKwaSaYnkhtZNuFCOtc/8m0NpfQ7XAXz+LLEatyGqMYgmq7
	EMfbaPxzQ0YD4taDWsER4npwTTKwuL9YDT3KVqwW0RTLz/aMvuQ6huLUigO1K3BppBhl+eDZrAl
	DKhsEtR0lkz7gAcazQ32D/Bjb/ocSQbaTl508HSDDVD+LkVmtmSEejKTfWifq+FAG1Q==
X-Google-Smtp-Source: AGHT+IHSMu8uU1FdhARZKPg1r4u2zFdRMH/JEAiFmtx5YmNJWwA8aMcrCIT3UUzOaRYxx4YdztfSmQ==
X-Received: by 2002:a17:902:cccd:b0:266:272b:7277 with SMTP id d9443c01a7336-29027319264mr347760555ad.59.1760475276796;
        Tue, 14 Oct 2025 13:54:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm174952475ad.24.2025.10.14.13.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:54:36 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 12/18] exiv2: patch CVE-2025-26623
Date: Wed, 15 Oct 2025 09:53:55 +1300
Message-ID: <20251014205402.1487867-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120645

From: Gyorgy Sarvari <skandigraun@gmail.com>

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
(cherry picked from commit 7907a3e206fb049e609996df8d09141bfb291fcd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
 

