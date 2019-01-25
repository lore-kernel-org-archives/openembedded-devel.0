Return-Path: <gstroz@uber.com>
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
	[209.85.217.47])
	by mail.openembedded.org (Postfix) with ESMTP id D14357C346
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 03:32:24 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id x28so4878141vsh.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 19:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uber.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=IfCyF91CkJ0+2jLOXnU558h5vr+6crYhvljpfXraBx4=;
	b=4XsnIDUh1aBDtOmrVS7FQysHqwgP1LqjCvLP3QhNr1WDl3q7JbrsNvVTGvfxOjaLbZ
	Rs2ED34q0TgqP4QRm5gyI4zHrXbxwTUxPv3nxUmDsjWJwRPKji1TgUSHovgMmL6DApMe
	IXnKmhZJKC9bAMN0UqQJe+IodGM2EJcJwfyn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=IfCyF91CkJ0+2jLOXnU558h5vr+6crYhvljpfXraBx4=;
	b=Sk+C7SgxX8BhCB96iHg/ws0NVjP7vQtyo1W8dkZY+McAjWHPxC9sQexLQjRwqWmlHJ
	zVCHTJeK/sEFqiSE59MZcbEW6PoWvFvpGqvrZRxyM6eQ3zeTKHYta0m9Dv/A7OFHe7ad
	DJNJ455UENiggeAala0suNSaXu/CmgQ9n163AOu0VHSN2gLb73ljEdhhEVnlH8r4YWHv
	bQUxSVOeIAtPfakDd8iPC5zRWqQ6hBEjwQj5TP9QiJ2UaRjXedePEeNc/GXMOKe2Obup
	/qgFVWtlCXkwQqd/47kRQmJjgcrIxH+q3yq/KnBtEvgbpRhdQWRgxerrhyjYgDm9W59/
	58Ug==
X-Gm-Message-State: AJcUukfP9ItNoQlacIwoUqhmsv7XpBMbYSCHWJ3yAT8E36DDmD80XkJe
	ng1zpgbAY8x3N/UHb3a3onP+kLAOtelszFVvv7LIs9+WK+4=
X-Google-Smtp-Source: ALg8bN7B4ieJI5V8bvZdAYocsKRdenUo9uLNgdukWVo5yBhlY6iYCqZ5EzGru0bv0MFQerd3GP6qzlaat1r2tYoEVJ4=
X-Received: by 2002:a67:edd8:: with SMTP id e24mr4054936vsp.169.1548387145239; 
	Thu, 24 Jan 2019 19:32:25 -0800 (PST)
MIME-Version: 1.0
From: Glenn Stroz <gstroz@uber.com>
Date: Thu, 24 Jan 2019 22:32:14 -0500
Message-ID: <CAGvkhOKeZDU985PGVoAPqYebaN3x3bs2Y_MKjrGOmpnuSWSAOw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe][PATCH v3] libqmi: Update to 1.22.0
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
X-List-Received-Date: Fri, 25 Jan 2019 03:32:25 -0000
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

diff --git
a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
b/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
deleted file mode 100644
index d230d6803..000000000
---
a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch
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
--
 START_NETWORK_ARGS="${START_NETWORK_ARGS},password='$APN_PASS'"
-+    if [ -n "$APN" ]; then
-+        START_NETWORK_ARGS="apn='$APN'"
-+        if [ -n "$APN_USER" ]; then
-+
 START_NETWORK_ARGS="${START_NETWORK_ARGS},username='$APN_USER'"
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
-
file://0001-qmi-network-Don-t-create-invalid-wds-start-network-w.patch \
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

