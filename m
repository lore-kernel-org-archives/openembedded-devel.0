Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 31D0E786D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:25 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id i14so6537455pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H4Ofyc37K5u3zbhYsYV6UF0udx31oApShVQQ9HaJntY=;
	b=YGZlshvX9xjJ9/YvxI+o5FBpXx4d9yIVH0xGdFYbtz9xzA7SqRbvey9OpjvyeYywjy
	4RgCVlD7qzKJVjXlU1JwwDBhaF8Jn2RVrW1e3kuHMYDP35OUIbIm9ZZaa7PA189IWthQ
	rU/mjQPqRv0/yg7T864exKZ5kGRcBOGoSZ0IuqAfwc+UYM6gU+GS2Wbl1Jj8QGGUb04W
	eWaVczNdPXXcyyQ8SmhM3r0g9kqs7an1be/rmnVGCXx8Ivu4JIx5fLDRB2JqX5puJ4qw
	7tjxBrFER+/XEmANqR9GgcU0pr2XDzeTjJkgsVNqezZjwNsi/ddo4KnHXIyUlG15OWAc
	Xg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=H4Ofyc37K5u3zbhYsYV6UF0udx31oApShVQQ9HaJntY=;
	b=WZm79xDTV1z+rW6EOh7MsDB5S6kh956VIGxLoDnycPl3FVjVWAeNqVleChJ7nLaYz0
	1oM2t4yNZqlEzZIgQmeYZ3Reuz9mJEOJ6EBxyQPFBbxwZLeGAcK1ywoUujuf7p0fxu0W
	rf4TNupA9g4lwVPX0qcHEG8EbGshiEmzGqwSouSLqDKeqCvos0NmihNRRAdpw52k6sjX
	DAN0zv3ohsQ9/GOYccsKkL4aRVmXXzNbUbU1R0ufM17AbkolXAfSXSs2I6kHP+/J9lMS
	FhVYhtl65/KSlzMtxlOa/ttxSspjBnWaEgBU651SuOzJY0vMrXtTiU4UIqIhR9uT5AF1
	2viQ==
X-Gm-Message-State: AElRT7FHma4DA1jwJvY/sz3PITm3+VKWBfGp+UCyngAA8Fy+6le6L+Rq
	zg5f0eYVEIzKCXdVuzZ2TeDRdw==
X-Google-Smtp-Source: AG47ELsJvpxRzIn+FBUYNQjgQR2za9ZQ8VMza6JSWzlnx7jPMXnAymbtvB7PFauvbCzXN1BTS9CuXg==
X-Received: by 10.98.212.80 with SMTP id u16mr9217382pfl.58.1521439407144;
	Sun, 18 Mar 2018 23:03:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:53 -0700
Message-Id: <20180319060300.5366-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 11/18] libyui, libyui-ncurses: Update to lates
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:26 -0000

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


