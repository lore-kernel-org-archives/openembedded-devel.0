Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1BEA978A8A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2018 20:41:49 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id h11so5941985pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 12:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H4Ofyc37K5u3zbhYsYV6UF0udx31oApShVQQ9HaJntY=;
	b=t1dXCN4YBxUusHLbCGGtfa4M7raa6gHJXqiIVbkcPZsaXSm61bxYRAie/j54zBlzx7
	yr3OIsD7KSclATfWn7R0+1Ko9kfUe0TMW5WMBCV1nnySpMxC7pvAE2vIZ5II7uNXGXrT
	lAa0azXZY9EKVZ7A3Xu7DvqOELE6k9G1rF0pwh5V/308MRJ+x/7qNb+k4WW9Oc2G1Erb
	JNVlFbIlWdfrYpFKJujdHSpMqvQ4PpmkCtaFhQVwmbMaU5hoTrc50Ks73m5izB+mgFos
	+XsM+QqT67KYCmEybApR/lcAyKdHesDalK2qG1tvMtP70Gcd0xR5x+RFldw2W/QZ5rqa
	w5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=H4Ofyc37K5u3zbhYsYV6UF0udx31oApShVQQ9HaJntY=;
	b=GBb7YgDrUVKbZfoSbW/am7PDsKEkbrFC1TFRKfw6R9VFWhWpXANrGteKFiv/ZXKTSG
	dP/gQMEY7SDx3C+7RM/iH/sg39vQYniOKs6501JgHg+ZKi/Q3zM1TlKflVHddRqLs6mP
	r4pW9rAphjLEwlJ9mmKoHu54njdxAfOG2x8qRoZwu2/iRBeuodhp1a1WsXapwICpMh1G
	4B+RXGFK56zynaBM8FyEuW2inZqby2lhEWQxFMAJZl6uXOM8z232nL0e/9GGzT8rL6fy
	tZPDAF6VJq/VFWukduSd+d+orC5VncBVFSZcDlf3KCy4GfdPpAhQkMFnvED6b/R/MmtE
	DLkw==
X-Gm-Message-State: APf1xPCYV9w5r8BoL+lgbjgArzZWcf310vY04ObTRYGk7WFTvdCVF6gm
	LJ/4P3O8DpN11RzgqHP9jo4kFQ==
X-Google-Smtp-Source: AG47ELsn94Yg0ZCD0Cs7B8BVpSSIjWalkzRa7bybxhLoPYW/f5aTmicT87xQ65G3FuV9IsokkFAkeg==
X-Received: by 10.98.144.146 with SMTP id q18mr13185869pfk.103.1520196110396; 
	Sun, 04 Mar 2018 12:41:50 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	u28sm22943090pfl.19.2018.03.04.12.41.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 12:41:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Mar 2018 12:41:30 -0800
Message-Id: <20180304204130.23962-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180304204130.23962-1-raj.khem@gmail.com>
References: <20180304204130.23962-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/7] libyui,libyui-ncurses: Update to lates
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
X-List-Received-Date: Sun, 04 Mar 2018 20:41:49 -0000

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rc-Replace-using-sys-errno.h-with-errno.h.patch | 59 ----------------------
 .../recipes-graphics/libyui/libyui-ncurses_git.bb  |  5 +-
 meta-oe/recipes-graphics/libyui/libyui_git.bb      |  2 +-
 3 files changed, 3 insertions(+), 63 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-src-Replace-using-sys-errno.h-with-errno.h.patch

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-src-Replace-using-sys-errno.h-with-errno.h.patch b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-src-Replace-using-sys-errno.h-with-errno.h.patch
deleted file mode 100644
index ae1b265dc..000000000
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-src-Replace-using-sys-errno.h-with-errno.h.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 46f016c4b87bb2a594df1c84e4d494bff0cbeaf9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 5 Feb 2018 12:01:25 -0800
-Subject: [PATCH] src: Replace using sys/errno.h with errno.h
-
-sys/errno.h is no longer the right place for this file
-
-error: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Werror=cpp]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted [https://github.com/libyui/libyui-ncurses/pull/63]
- src/NCAskForDirectory.cc | 2 +-
- src/NCAskForFile.cc      | 2 +-
- src/NCFileSelection.h    | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/NCAskForDirectory.cc b/src/NCAskForDirectory.cc
-index 06ec6ac..ed1a30c 100644
---- a/src/NCAskForDirectory.cc
-+++ b/src/NCAskForDirectory.cc
-@@ -39,7 +39,7 @@
- #include <sys/types.h>
- #include <unistd.h>
- #include <dirent.h>
--#include <sys/errno.h>
-+#include <errno.h>
- 
- /*
-   Textdomain "ncurses"
-diff --git a/src/NCAskForFile.cc b/src/NCAskForFile.cc
-index 31fdb39..63a6679 100644
---- a/src/NCAskForFile.cc
-+++ b/src/NCAskForFile.cc
-@@ -39,7 +39,7 @@
- #include <sys/stat.h>
- #include <unistd.h>
- #include <dirent.h>
--#include <sys/errno.h>
-+#include <errno.h>
- 
- /*
-   Textdomain "ncurses"
-diff --git a/src/NCFileSelection.h b/src/NCFileSelection.h
-index d42311f..514d020 100644
---- a/src/NCFileSelection.h
-+++ b/src/NCFileSelection.h
-@@ -38,7 +38,7 @@
- #include <sys/stat.h>
- #include <unistd.h>
- #include <dirent.h>
--#include <sys/errno.h>
-+#include <errno.h>
- 
- 
- struct NCFileInfo
--- 
-2.16.1
-
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
index 3388876e4..f60c85668 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
@@ -5,13 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
 "
 
 SRC_URI = "git://github.com/libyui/libyui-ncurses.git \
-           file://0001-src-Replace-using-sys-errno.h-with-errno.h.patch \
-           "
+          "
 
 SRC_URI_append_class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
 
 PV = "2.48.3+git${SRCPV}"
-SRCREV = "7b251c2ff541df6139f3d210d0a0a27d042926bd"
+SRCREV = "79b804b45ffc6a0d92e28e793ff389a20b63b54b"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-graphics/libyui/libyui_git.bb b/meta-oe/recipes-graphics/libyui/libyui_git.bb
index 9b1d1d818..92d96044e 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_git.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/libyui/libyui.git \
            "
 
 PV = "3.3.3+git"
-SRCREV = "f4ccea39f6b6f37eabd0a4df49db5f9bcb3c013a"
+SRCREV = "2b634cb7821e2e79dd4b7a73caf8e67c50189376"
 
 S = "${WORKDIR}/git"
 
-- 
2.16.2


