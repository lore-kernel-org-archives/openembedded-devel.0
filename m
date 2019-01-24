Return-Path: <gstroz@uber.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id F000E7C31F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 22:44:05 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id z3so4562980vsf.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 14:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uber.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=Nqm+7Nntvq1FMHRO4IeFkuj70rZ5XHck/vun/zjtS/M=;
	b=pSpKrkjYFwamrjz38+pqbi4CuZKFNxVif0WN+iA/Q6JlEZM5+Vk2bR3j1T9Ti1MhdG
	+Dgcs95sjvjkmq4HgRJIWc3pFwAXAm6c20+FczHC2+anKG54ZZ6tJyOoT7Z7Arjh+De4
	v85/09nPFivJXXBfmz7lhX+wtPkgz8CmoWEXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Nqm+7Nntvq1FMHRO4IeFkuj70rZ5XHck/vun/zjtS/M=;
	b=NcuMgIwO5TOsuI/x5o2b9boG0CzzHYQBPjmJlK5hqs82plQM/iqlJ1rMSFXDZmnGrZ
	xNvvCnXCoCDt2spSTE9T8dUqFaROizwOJZy6BuWoWCQkEZwKDnQhZV9VYRnObmSEWOIO
	pSopefQUb9N0WvPee9kO8CfRaXGbyE3dwV8qhuXyM23QTzbVl6U10JzkeLMv2AjQlJeQ
	Foq2FXw5/tW6cTtcEmNTxM2OpGeL6FsDsuicU0wOkeuPokvGfV3pjUqtbRWd8duWvx3A
	CXLyXg+a7wMxpC6CS49LkvuXpD2tQ0IaIY2ms9OfXtI/iH3/0uMV9uGamu+VMF79oNkU
	TGRA==
X-Gm-Message-State: AJcUukdBcFmnkikvbppg3PIhYrTucsslnubT7jnRAJCxhrioc5+9B8WX
	PNFgcui6+uRbiegZyLpvh2l6D3cC8dpWia6shrC7cFgTTU4=
X-Google-Smtp-Source: ALg8bN7ixMIF+0yjvnqS73H2tbeUNfRbFS4IBqC67sAlMfg2dPgBSnLooVbDCz1oX/4cnw+LAA4YqQyF6Vvivia34WE=
X-Received: by 2002:a67:e34e:: with SMTP id s14mr3439420vsm.95.1548369846395; 
	Thu, 24 Jan 2019 14:44:06 -0800 (PST)
MIME-Version: 1.0
From: Glenn Stroz <gstroz@uber.com>
Date: Thu, 24 Jan 2019 17:43:55 -0500
Message-ID: <CAGvkhO+GZg6q2fXNzUeWJ1RW9Xmb0DyC3NEuBreUU-gk95N24w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libqmi: Update to 1.22.0
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
X-List-Received-Date: Thu, 24 Jan 2019 22:44:06 -0000
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Glenn Stroz <gstroz@uber.com>
---
 ...t-create-invalid-wds-start-network-w.patch | 41 -------------------
 .../{libqmi_1.20.2.bb => libqmi_1.22.0.bb}    |  6 +--
 2 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644
meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.20.2.bb =>
libqmi_1.22.0.bb} (78%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
b/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
deleted file mode 100644
index d230d6803..000000000
--- a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8269f4d86927fbe19e78776a12736680fe9169b6 Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <bunk@stusta.de>
-Date: Mon, 1 Oct 2018 16:53:31 +0300
-Subject: [PATCH] qmi-network: Don't create invalid --wds-start-network when
- APN is not set
-
-In 1.20.2 the warning for this was turned into an error.
-
-(cherry picked from commit 289d8ad6419895e2e1fba3d78a54a0db65da521d)
----
-Upstream-Status: Backport
-
- utils/qmi-network.in | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/utils/qmi-network.in b/utils/qmi-network.in
-index bf7bed9..a9e5299 100755
---- a/utils/qmi-network.in
-+++ b/utils/qmi-network.in
-@@ -334,11 +334,13 @@ start_network ()
-
-     setup_data_format
-
--    START_NETWORK_ARGS="apn='$APN'"
--    if [ -n "$APN_USER" ]; then
--        START_NETWORK_ARGS="${START_NETWORK_ARGS},username='$APN_USER'"
--        if [ -n "$APN_PASS" ]; then
--            START_NETWORK_ARGS="${START_NETWORK_ARGS},password='$APN_PASS'"
-+    if [ -n "$APN" ]; then
-+        START_NETWORK_ARGS="apn='$APN'"
-+        if [ -n "$APN_USER" ]; then
-+            START_NETWORK_ARGS="${START_NETWORK_ARGS},username='$APN_USER'"
-+            if [ -n "$APN_PASS" ]; then
-+
START_NETWORK_ARGS="${START_NETWORK_ARGS},password='$APN_PASS'"
-+            fi
-         fi
-     fi
-
---
-2.7.4
-
diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.0.bb
similarity index 78%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.22.0.bb
index f0bc81cc9..c15dfb472 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.22.0.bb
@@ -12,12 +12,12 @@ DEPENDS = "glib-2.0 glib-2.0-native"
 inherit autotools pkgconfig bash-completion

 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
-           file://0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
\
            file://0001-Detect-clang.patch \
            "
-SRC_URI[md5sum] = "584214476ab75c394160cb85fbccaa1d"
-SRC_URI[sha256sum] =
"c73459ca8bfe1213f8047858d4946fc1f58e164d4f488a7a6904edee25e2ca44"
+SRC_URI[md5sum] = "35f7e1b03f9b6218a30c78422f72c6ac"
+SRC_URI[sha256sum] =
"21c198b481f1617bb7edb1960d823569de3e38b269dbf513af1b56048cafaa17"

 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
 PACKAGECONFIG[mbim] = "--enable-mbim-qmux,--disable-mbim-qmux,libmbim"
+
-- 
2.20.1

