Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id A02EA7EE4F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:29 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id w10so16490802pgj.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mTH9fOs2/sjE7FZgcTExpie19cf49w8Pxp/AzsLHJ4c=;
	b=SvbMHoPdhCM2CLZtICR13y6c/+GEpg/2jtcQTG1XzvtAqWdX9A2fxdKilbGuadnSiB
	b5GqOTNKF/KJPQm3UV9QsCU50zMXhBYU9T1+IFeeT7OPQRpr2wn2skt+AvcH/x1SnsA1
	ufwbeSQ9VRE9YkGr+JMjgCo1fQLqxaa0blKCHR1T+zHFgo+BvjwYtL0al8BQ5O1pmxP4
	gApRKPtBYSNB8YPBAzRdUrsI68CKb6wfYkvukovBkpISO5xWZj3UuQqCrBpXQQw/3abU
	RoFQ5eCQBCnAPlp5xK/W+WvJPtwQxRIy+gNzUMiaVdIo7gVuawC/BEKpsooVeYu0OZfg
	hA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mTH9fOs2/sjE7FZgcTExpie19cf49w8Pxp/AzsLHJ4c=;
	b=YajTvcsUEg9vi/VQ0uzRJjuVcgJ4DI+HHmRqWzen0hHNopbIsLofz/TLUm3bpCPS9w
	xRt8mEUoDaGybi3paYeR9i0loXSeFbbzVjYDU4GYkH+tT6MkK0W9CkLHbOJtMhvh8LGs
	Iry30CgKqjlpwo/pwQiDtLZ4jR1xQpEoW8sX44WVii+ef6AfodB66QW5Dzmwc+g5Hmo2
	TQOIlYluZ1nqjCJF3QG0iiljEBeaXcZDhKkdYT3SITFp8GqZ+oAfzv48xy2O00w5D0l2
	BbPfKSLWQB4F00lgvDqoCiDJiA6B9nAId6WvlZvdUHe0kTrXOUkjEOlyeufqTbgGNNTu
	UngQ==
X-Gm-Message-State: APjAAAV5ze7Qx5KY13BDpTzjXAWymHc0H+6D9DwF+qNfQUXr1O3Jou7z
	FzH4jioZkyC3RQDOAHkYSMgBkjZPZEI=
X-Google-Smtp-Source: APXvYqxB8eGSf9fSJxYD8L7N0vjyGAAgZ4kXuq6C97uNQ3CdzgVymkuONAoDkZ/YvxwuRuVSWxFbFw==
X-Received: by 2002:a63:2744:: with SMTP id n65mr54262954pgn.277.1563727170273;
	Sun, 21 Jul 2019 09:39:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:07 -0700
Message-Id: <20190721163919.32659-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721163919.32659-1-raj.khem@gmail.com>
References: <20190721163919.32659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 02/14] cli11: Refresh patch to fix fuzz
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Jul 2019 16:39:29 -0000
Content-Transfer-Encoding: 8bit

Fixes
cli11-1.8.0+gitAUTOINC+13becaddb6: Patch log indicates that patches do not apply cleanly. [patch-fuzz]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cli11/files/0001-Add-CLANG_TIDY-check.patch      | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch b/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
index bef3548a29..02b3c9bd7e 100644
--- a/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
+++ b/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
@@ -1,20 +1,21 @@
-From ef6310bc726a53ff6b45071633fa7b37224cae96 Mon Sep 17 00:00:00 2001
+From 902b251fd8d6408ee6623e7a92692948cf90187d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 12 Feb 2019 13:22:21 -0800
 Subject: [PATCH] Add CLANG_TIDY check
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 79404b8..f68217d 100644
+index 7073a0b..2dd2c02 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -39,7 +39,7 @@ if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
-         add_definitions(-Wall -Wextra -pedantic)
+@@ -60,7 +60,7 @@ if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
+         endif()
      endif()
  
 -    if(CMAKE_VERSION VERSION_GREATER 3.6)
@@ -22,6 +23,3 @@ index 79404b8..f68217d 100644
          # Add clang-tidy if available
          option(CLANG_TIDY_FIX "Perform fixes for Clang-Tidy" OFF)
          find_program(
--- 
-2.20.1
-
-- 
2.22.0


