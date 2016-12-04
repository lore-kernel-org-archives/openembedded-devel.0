Return-Path: <paul.betafive@gmail.com>
Received: from mail-wj0-f170.google.com (mail-wj0-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6822F71A85
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Dec 2016 10:42:36 +0000 (UTC)
Received: by mail-wj0-f170.google.com with SMTP id tg4so11677096wjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Dec 2016 02:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=BfqmjeJRF2jjZWixFwAIq30WiWxdpY0ZHCw4ttRmf0Q=;
	b=tKCo1tXIfBYv+wSzA20nFonksJwwqUW9LYV9Y8/YRuTcjpF545IFBvROqrLyVrizxs
	eg27nJjUyy91SITrUZbSPPS54w3KDJSUy/WHPDTF4pX8qf89qU6zaJ/JCOqUTYlMtPrw
	HvAzVMvYcHak2SohEqnRk7F3aEc+XaaKNrVkW42reDk/PpzzHkvl6Lm8pLpJL1qx5MUi
	A9S2MIE6ICGm7nKMAJGWTcqcJyGrjInYwC3eGqfZK/u3DmQYX/HugLkxx6n4Ea722pVu
	bZvtQtd6TMrZjP/GfTwd2anElzDWgKIdyv/UnY6ApVeD3TYmslHJGS4YnKYl/81Ie/HO
	e7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=BfqmjeJRF2jjZWixFwAIq30WiWxdpY0ZHCw4ttRmf0Q=;
	b=AJsfoKayULq6LfBsvtgsOZes2ZGuupsFQoay9prOCv43CWRRQW2X52Ds9RAeMVFlm0
	T/KwFoEa+q4hwJVSUfJwoeKjYkABuyyjVjZ69N1F5rHFkaJjzd7mRiVXaMNM+IL/oZkz
	5Daqw1a193m+42Ta3+/7cmFaz97z5IsuUNWOUgOlbjySaOIfF0Vq48np/9NU49Qi7Dvg
	D5vUmwdzxCPmvTl5Y1u4u0xP7CkSrpm6we9euasXX86Z74nHEPL2lbCDIchstz84u2s9
	pYgymnImbAeFVZFPv2O+MCpsD1Pm0MEG7iV+4bVvkhSNaf1MFXAnL9VweAjM4gyfIjuO
	6oVA==
X-Gm-Message-State: AKaTC032D3WXgr9PiYUUnYrwrVpNMwd/QyLTEHe0MTsxoIz6iyIUZ30h3staQP9j0ERPFA==
X-Received: by 10.194.100.225 with SMTP id fb1mr46477559wjb.128.1480848157659; 
	Sun, 04 Dec 2016 02:42:37 -0800 (PST)
Received: from dev-jessie.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net. [86.27.96.131])
	by smtp.gmail.com with ESMTPSA id
	p144sm12455402wme.23.2016.12.04.02.42.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 04 Dec 2016 02:42:36 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OpenEmbedded Devel <openembedded-devel@lists.openembedded.org>
Date: Sun,  4 Dec 2016 10:42:25 +0000
Message-Id: <1480848145-17610-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] toybox: Upgrade to 0.7.2
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
X-List-Received-Date: Sun, 04 Dec 2016 10:42:37 -0000

Patches are dropped as they are no longer needed.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../toybox/toybox/0001-Fix-TOYBOX_VERSION.patch    | 29 ------------------
 .../toybox/0002-Fix-trimmed-printf-in-grep.patch   | 34 ----------------------
 .../toybox/{toybox_0.7.1.bb => toybox_0.7.2.bb}    |  6 ++--
 3 files changed, 2 insertions(+), 67 deletions(-)
 delete mode 100644 meta-oe/recipes-core/toybox/toybox/0001-Fix-TOYBOX_VERSION.patch
 delete mode 100644 meta-oe/recipes-core/toybox/toybox/0002-Fix-trimmed-printf-in-grep.patch
 rename meta-oe/recipes-core/toybox/{toybox_0.7.1.bb => toybox_0.7.2.bb} (90%)

diff --git a/meta-oe/recipes-core/toybox/toybox/0001-Fix-TOYBOX_VERSION.patch b/meta-oe/recipes-core/toybox/toybox/0001-Fix-TOYBOX_VERSION.patch
deleted file mode 100644
index 8af4305..0000000
--- a/meta-oe/recipes-core/toybox/toybox/0001-Fix-TOYBOX_VERSION.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 209fad8ebd17bf46d0431dafbb547f429a3cffdf Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Sat, 4 Jun 2016 15:05:49 +0100
-Subject: [PATCH 1/2] Fix TOYBOX_VERSION
-
-The latest tagged version is 0.7.1.
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-Upstream-status: Submitted
----
- main.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/main.c b/main.c
-index eeae2f3..bedb333 100644
---- a/main.c
-+++ b/main.c
-@@ -6,7 +6,7 @@
- #include "toys.h"
- 
- #ifndef TOYBOX_VERSION
--#define TOYBOX_VERSION "0.7.0"
-+#define TOYBOX_VERSION "0.7.1"
- #endif
- 
- // Populate toy_list[].
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-core/toybox/toybox/0002-Fix-trimmed-printf-in-grep.patch b/meta-oe/recipes-core/toybox/toybox/0002-Fix-trimmed-printf-in-grep.patch
deleted file mode 100644
index 37808d0..0000000
--- a/meta-oe/recipes-core/toybox/toybox/0002-Fix-trimmed-printf-in-grep.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9c51a0d7690fb3b08871dae2486af4032d8442fb Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Sat, 4 Jun 2016 15:42:48 +0100
-Subject: [PATCH 2/2] Fix trimmed printf in grep
-
-Using a default trim value of INT_MAX/2 when printing a line causes nothing to
-be printed on a system built using OpenEmbedded for the qemux86 target. This may
-also affect other systems.
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-Upstream-status: Submitted
----
- toys/posix/grep.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/toys/posix/grep.c b/toys/posix/grep.c
-index 2ca02d2..f38c538 100644
---- a/toys/posix/grep.c
-+++ b/toys/posix/grep.c
-@@ -74,7 +74,10 @@ static void outline(char *line, char dash, char *name, long lcount, long bcount,
-   if (!line || (lcount && (toys.optflags&FLAG_n)))
-     printf("%ld%c", lcount, line ? dash : TT.outdelim);
-   if (bcount && (toys.optflags&FLAG_b)) printf("%ld%c", bcount-1, dash);
--  if (line) xprintf("%.*s%c", trim ? trim : INT_MAX/2, line, TT.outdelim);
-+  if (line) {
-+    if (trim) xprintf("%.*s%c", trim, line, TT.outdelim);
-+    else xprintf("%s%c", line, TT.outdelim);
-+  }
- }
- 
- // Show matches in one file
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.1.bb b/meta-oe/recipes-core/toybox/toybox_0.7.2.bb
similarity index 90%
rename from meta-oe/recipes-core/toybox/toybox_0.7.1.bb
rename to meta-oe/recipes-core/toybox/toybox_0.7.2.bb
index 032b138..93ef45b 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.7.1.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.7.2.bb
@@ -4,12 +4,10 @@ DEPENDS = "attr"
 
 SRC_URI = " \
     http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
-    file://0001-Fix-TOYBOX_VERSION.patch \
-    file://0002-Fix-trimmed-printf-in-grep.patch \
 "
 
-SRC_URI[md5sum] = "e959e5ff8c6806781eb06e56f302a393"
-SRC_URI[sha256sum] = "5bb3069f58faf12940d5cfde3209ac7f63210bebdd9023979b0c20cede126ea7"
+SRC_URI[md5sum] = "372d8fdf6ea3675edbf1f6a4109b6db6"
+SRC_URI[sha256sum] = "79da71c7c39cef0a5f7b834f0b17d0d436e7994dd33e912f581b4c12d3b1681f"
 
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0b8b3dd6431bcaa245da0a08bd0d511"
-- 
2.1.4


