Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id EDD9277E72
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:55 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id o123so18544880pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3VC+rxeu2XFmK/wG/dIz/pgj8H3xZl51/gaMv1ccP0o=;
	b=S6PE7uxUGwzn7+oDQdv/mjmQ+pJkeBm+Jgy4EPd0dIDYKaRIFGTuXASoFXl2fVHmhc
	U6A/8z4EdqIKQ3+MpvVAjQ/4qi9FOwc9c0KW5BtPSP6SwlGumaRGAJwKM/7prZ4CGR4F
	9xdkB8HT6hXK/7827P92S3YviKiECGfczOs7UU0mPQTQPf7Jnd9pC73lsogCHondk1dF
	l4HM/DGMvAZGOes89fIAUtJBfbAFxSawKrzG8XPW1I6cEt4ATBGbmxrOzRe8sz/HH3FI
	exuKRgThji5TQLBcEteqMpMjw+1e7o/EX0BtvgiIA3TEKuKMh2xfhE1f2ht9e7drSmQk
	rCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3VC+rxeu2XFmK/wG/dIz/pgj8H3xZl51/gaMv1ccP0o=;
	b=czGiSclRfTzsPGMTN+IA2/Sg8BCx2bGI/OKtfpl/Lsf4DEHBwxyPHLvUTfxTZcNIna
	JWxYWBCavnoQ1bog6RCwzs37TJX52WzD3TxPITq3NtoYi+0Tx7lgpi9p0/ZaUgZk+4av
	AsanckAR4EB75oMXUuaudNh6mFvEJCHLLBHjiMd3QfkAETohWbJgpGEmtIyM2t3Uhy1c
	lymD7tSqCY2AiU50hVzcFY1hkk0Vo2lJI8jHnCcvsuodhtkuQZ+cWolAgBPSePfMtrhS
	OfaB2vzTRNM0PeqdFwDiuHI7frOYNK+Vgop3uwC7NzOpow4C3YKuqRdFVcsLkNi8hz5T
	ZFfw==
X-Gm-Message-State: AFeK/H1fAuwXr5inOmT9RejjoZvNG08yx0/6yy2WKMVGOY9kBdXtOoQEJvo17ScWrFPq5g==
X-Received: by 10.84.164.199 with SMTP id l7mr4527077plg.151.1490978637269;
	Fri, 31 Mar 2017 09:43:57 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:46 -0700
Message-Id: <20170331164247.5052-42-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 42/43] libunique: Fix build with secutiy flags on
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-unique-Add-format-qualifier-s-for-string.patch | 32 ++++++++++++++++++++++
 meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb | 11 ++++----
 2 files changed, 38 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-gnome/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch

diff --git a/meta-oe/recipes-gnome/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch b/meta-oe/recipes-gnome/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch
new file mode 100644
index 000000000..7f9fdf397
--- /dev/null
+++ b/meta-oe/recipes-gnome/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch
@@ -0,0 +1,32 @@
+From 37632aca00d48c53e91f08bc7435c721ba81b2cd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 30 Mar 2017 14:32:55 -0700
+Subject: [PATCH] test-unique: Add format qualifier %s for string
+
+Fixes potential security issues that compiler flags
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test-unique.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/test-unique.c b/tests/test-unique.c
+index b7cde45..82ee81b 100644
+--- a/tests/test-unique.c
++++ b/tests/test-unique.c
+@@ -82,10 +82,10 @@ app_message_cb (UniqueApp         *app,
+                                    GTK_DIALOG_DESTROY_WITH_PARENT,
+                                    GTK_MESSAGE_INFO,
+                                    GTK_BUTTONS_CLOSE,
+-                                   title);
++                                   "%s",title);
+   if (message)
+     gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG (dialog),
+-                                              message);
++                                              "%s",message);
+ 
+   gtk_window_set_urgency_hint (GTK_WINDOW (dialog), TRUE);
+ 
+-- 
+2.12.1
+
diff --git a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb b/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
index 8aa293ff3..9133cccb1 100644
--- a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -4,11 +4,12 @@ HOMEPAGE = "https://wiki.gnome.org/Attic/LibUnique"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=libunique"
 
 SRC_URI = "${GNOME_MIRROR}/libunique/1.1/libunique-${PV}.tar.bz2 \
-    file://fix_for_compile_with_gcc-4.6.0.patch \
-    file://noconst.patch \
-    file://build.patch \
-    file://0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch \
-"
+           file://fix_for_compile_with_gcc-4.6.0.patch \
+           file://noconst.patch \
+           file://build.patch \
+           file://0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch \
+           file://0001-test-unique-Add-format-qualifier-s-for-string.patch \
+           "
 
 SRC_URI[md5sum] = "7955769ef31f1bc4f83446dbb3625e6d"
 SRC_URI[sha256sum] = "e5c8041cef8e33c55732f06a292381cb345db946cf792a4ae18aa5c66cdd4fbb"
-- 
2.12.1


