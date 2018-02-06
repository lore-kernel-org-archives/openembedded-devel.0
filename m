Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f44.google.com (mail-pl0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id EF9E378055
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Feb 2018 07:46:33 +0000 (UTC)
Received: by mail-pl0-f44.google.com with SMTP id q17so779482pll.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Feb 2018 23:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y4lyUR02JC4t6q2Y5aImrMtVpY8v7yp5Rf6eecikbUg=;
	b=G6ZZrpTn8Y2cre146BeAjkaP/JgNW/qGsReDi4PBrTjnEFAk8lXwiwsukuEtltlykY
	sKyFXJnoP6m5i+c0NG+M6AvLchrCDyzbp9/ebV4pQuFiBS6X7QJouUVWQs5R3u1SaOAD
	Amz584OL/kpIKBf2GbkTbY+H0ZVAJN3vhRcflC2qhsyRJWuPwagu53l0yhk/Q7An/rAI
	i2/pdMU0h/L8gohe4h2lFHWyiXRItx/tBZ5wBV6MdMeIFNbyhfa3E0NY/oLTI4CrHC7p
	oPYR4+ntRle01kkRN3GBQnJ0qrucFzapA3+N08cbAQyyzvnk2lmItgmm64uJqVYqwMMv
	0ONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y4lyUR02JC4t6q2Y5aImrMtVpY8v7yp5Rf6eecikbUg=;
	b=mBiHssFf67NzvU/yWshpRBhuDnLHwytBKuUcIPpgRTcCRrShvUxfYak1S8Bx27Cs7j
	N6JzS/F78hIRHFDVdWD1wIq8l5gsLE1iR+HwEOnetFd/TVsPuzlsAgpLRTIp77rz8gz9
	CwhtZRcLhE/GcwmMPQhp1JPwIeqcPmdK/UhX1O9LkfOPuaeZlB6qn9dabkmD+Qhw/sls
	Iyb/FbcDrlkUdIIInz7MSmzMUQ2id/oXUep2BAkB+bzd3oaXoXuF5isEBE7Pa1UdObbi
	DlOywED1jaceGFqQeTeQ0gx+lfJJh7AyuI2jm/nuH0angaTJ0vrPrjSfQFNjFMkjxpEj
	HFMg==
X-Gm-Message-State: APf1xPBv43x0cwLPq1uPTP9f/7RPVZA9rD4bNi21ULXukVB0JVsmsMhX
	MfKqL+eau2pdCKcDlwatvvQrIg==
X-Google-Smtp-Source: AH8x224pnE28QtZJaElmfzjMDkm35RSLZ/ISkAyRICswY/eBULVob2j5l2xQSdrog0uAg60YFFeSIQ==
X-Received: by 2002:a17:902:380c:: with SMTP id
	l12-v6mr1520249plc.8.1517903194968; 
	Mon, 05 Feb 2018 23:46:34 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::5590])
	by smtp.gmail.com with ESMTPSA id
	s90sm20976060pfi.139.2018.02.05.23.46.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 23:46:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Feb 2018 23:46:19 -0800
Message-Id: <20180206074619.22165-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180206074619.22165-1-raj.khem@gmail.com>
References: <20180206074619.22165-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/6] libyui-ncurses: Fix build with musl
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
X-List-Received-Date: Tue, 06 Feb 2018 07:46:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rc-Replace-using-sys-errno.h-with-errno.h.patch | 59 ++++++++++++++++++++++
 .../recipes-graphics/libyui/libyui-ncurses_git.bb  |  4 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-src-Replace-using-sys-errno.h-with-errno.h.patch

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-src-Replace-using-sys-errno.h-with-errno.h.patch b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-src-Replace-using-sys-errno.h-with-errno.h.patch
new file mode 100644
index 000000000..ae1b265dc
--- /dev/null
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-src-Replace-using-sys-errno.h-with-errno.h.patch
@@ -0,0 +1,59 @@
+From 46f016c4b87bb2a594df1c84e4d494bff0cbeaf9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 5 Feb 2018 12:01:25 -0800
+Subject: [PATCH] src: Replace using sys/errno.h with errno.h
+
+sys/errno.h is no longer the right place for this file
+
+error: #warning redirecting incorrect #include <sys/errno.h> to <errno.h> [-Werror=cpp]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/libyui/libyui-ncurses/pull/63]
+ src/NCAskForDirectory.cc | 2 +-
+ src/NCAskForFile.cc      | 2 +-
+ src/NCFileSelection.h    | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/NCAskForDirectory.cc b/src/NCAskForDirectory.cc
+index 06ec6ac..ed1a30c 100644
+--- a/src/NCAskForDirectory.cc
++++ b/src/NCAskForDirectory.cc
+@@ -39,7 +39,7 @@
+ #include <sys/types.h>
+ #include <unistd.h>
+ #include <dirent.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ 
+ /*
+   Textdomain "ncurses"
+diff --git a/src/NCAskForFile.cc b/src/NCAskForFile.cc
+index 31fdb39..63a6679 100644
+--- a/src/NCAskForFile.cc
++++ b/src/NCAskForFile.cc
+@@ -39,7 +39,7 @@
+ #include <sys/stat.h>
+ #include <unistd.h>
+ #include <dirent.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ 
+ /*
+   Textdomain "ncurses"
+diff --git a/src/NCFileSelection.h b/src/NCFileSelection.h
+index d42311f..514d020 100644
+--- a/src/NCFileSelection.h
++++ b/src/NCFileSelection.h
+@@ -38,7 +38,7 @@
+ #include <sys/stat.h>
+ #include <unistd.h>
+ #include <dirent.h>
+-#include <sys/errno.h>
++#include <errno.h>
+ 
+ 
+ struct NCFileInfo
+-- 
+2.16.1
+
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
index e445ee0cc..3388876e4 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
     file://COPYING.lgpl-2.1;md5=4fbd65380cdd255951079008b364516c \
 "
 
-SRC_URI = "git://github.com/libyui/libyui-ncurses.git"
+SRC_URI = "git://github.com/libyui/libyui-ncurses.git \
+           file://0001-src-Replace-using-sys-errno.h-with-errno.h.patch \
+           "
 
 SRC_URI_append_class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
 
-- 
2.16.1


