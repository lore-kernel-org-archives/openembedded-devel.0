Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14983CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 23:33:28 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.3487.1760484797978084596
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 16:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gt/eRVha;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-339d53f4960so6179649a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 16:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760484797; x=1761089597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPc7iKlstsvTVWGdFgSMKhJkV6O2egiIM4zYzISJyTY=;
        b=Gt/eRVha4SIw/dlxN2PdCMh4jV4KSFGTsR2odeJWBLloW4QpLUy5AFvMkLKjbo/5zb
         G3+JUu1xbAAxmE+Mbhic0RN7JyHokrNon9JgTs1o2No9g9Ype4RAzbykmqojJxQODAOu
         nVYSdlri6aJpMyQq29zuMH87vJguaJLAT+vF71Qq0T4HlT2i2BJ5azVUa09cQt2hwo2W
         E58XOiKt00CZlc199YrA3zsaY/w7YDUjAFLWXxDYnmDm5T/25PZu88vvvb81o4OSlxFW
         XvO8VTlz1NB+dwxlUL/6ph/1XhZddxElfs3FozeDyj9w7VykBB6eQ4qnzYndj3Kee85G
         sYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760484797; x=1761089597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPc7iKlstsvTVWGdFgSMKhJkV6O2egiIM4zYzISJyTY=;
        b=iRzYBujPtyzsdUYEmRgIVWzuU1yKnNQJGq4/yX5U0EMsIixADzejH7bn0sRMzzDpms
         dSkXSleW0+740xykjVTfygKsGKucWqwMVUtv/vV/awvl8tKKQdvSyITAbRJriiwGB1RJ
         g3HkZ6PWP05plx8Fyra7c0ptaNZPC0SYDerz98eJOiohx5ZLvrW5E41GgEBfT6SUQJ5i
         25IIvKoXTWnFJqvvmGtv5QiU3Jh02KE+sgb6upZnaCEIB/ImRknRjCU0+R9XJvBOQlEe
         MUGZFkVNd8Rgmpfbc1Ka2Qka6Ldj48h3iMGRAKPpgqPTsDXh2MZlAB6tm+s+2ajJecJb
         podA==
X-Gm-Message-State: AOJu0YymrzrWuBVFNbGrliTgBXczgT04sLDAbm8jeGmobH2Cm0PCYrPG
	YEtY6iy0eT4bmIufp43CI5LuobTe/E3fXvW3KwnkcG0uR2yD8SxfYgVL87FU4Q==
X-Gm-Gg: ASbGncs9Cl6rwqgk+iRR2ViytBsOXBGNkEN5Bbj4JuW57uCqMQqXI6Y+daGfoVPYqne
	GbapTGpGEbqfDMoZDW9EVXGqzfplxxI/ptxleytipbAIi6/wa3O7yfOORfx9G11o0nbekj0AKxn
	mChEOdeKpthd0nuWp6CXfR3hyL7sf3CwfbZdyd4ovrdr4oGTI4dw5HoyWz12GAFuAM9IpukNURY
	LbipldJNciEusAx87JXO3Ok7gGhkxI18Smu5Wgp+4+Z1x/HLMcM2L2KuCfxbtp3uSe94jZ5PBDO
	NJYhm8tJkBAc9BABGgdpQHyu/jZ0ivWPvjAAll0iVpz+Xif7DOK2ec5Ia1ZSd+jRSjimEW4OTe+
	+FqHJQv9TrlK3TafRpXkeE5/iQJRKWOSyfefJwQ0AilwabR55cvyhgB8=
X-Google-Smtp-Source: AGHT+IEWC1oKficZ+bT5xidjv9+VBiY8XL2Lvs2FhRXQLWfOOkOOzlWCAce4c9pQGCvZXNkGWR3vLg==
X-Received: by 2002:a17:90b:38ce:b0:32e:96b1:fb6e with SMTP id 98e67ed59e1d1-33b513b4ca7mr33876031a91.18.1760484797115;
        Tue, 14 Oct 2025 16:33:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aac5besm17033254a91.14.2025.10.14.16.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 16:33:16 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH v2 v2 12/18] exiv2: patch CVE-2025-26623
Date: Wed, 15 Oct 2025 12:32:23 +1300
Message-ID: <20251014233233.304125-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
References: <20251014233233.304125-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:33:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120671

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
 

