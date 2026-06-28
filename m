Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB99AC44509
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:27 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14744.1782634347024928633
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QUqobXsD;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13809223fd4so2845391c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634346; x=1783239146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvySozKDpqeVAndY4hN7jJR4NfQd21SUGhpCve4JYXk=;
        b=QUqobXsDB8WKCsIO60cm6rwVIA6vyzUOeC6mSYlhJG4oBRjtLTDfnlQOd1HwmPs+j0
         vnpCUMn/q6ZGf1rZZ4Lc/8JDp69sq/JmKCY4KwQsm0BIPq3GvistoeEnFz5G1mat7W9c
         A2NaYHMfcCFWVtlHfKYV+TISCLrFhgU6ekDpoJRXWNDTulhmzPVgFbBjgEbVCX+pQ6Tu
         y0944SO6hALsDWwVV+zwjA/oCC42kC8SUvkEL2UQmTbmfjL5CyI7bzHlilR66Pf4FFGf
         MIWwAinhp5WMjRW5RVnquSN9j5atztWZdImMxlxeUh0woNhlnm5tE4/HcnQJUH7Xs6Kq
         OLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634346; x=1783239146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zvySozKDpqeVAndY4hN7jJR4NfQd21SUGhpCve4JYXk=;
        b=SCpel6fLg71GBZyLHlcFQLsbSMhXPXadiUtKcTeZqkijQZZLgrs2GuW0yDKs1QeW0v
         2415/r7Q8qy+FU3EOHjfSdzyvWphJmDNXVSSSh4X8amUOUviOfznJaZ4hd14VZKVDSFr
         A8XuuNUQbk8J/pnuiUIaXXIsb0frcYWtBCvlKRL7Uza1jgLlFh7UJYZrR6OApL/pSiIO
         D8nUxNmYmvTCzqS6DtQqIpNVokTB+SR+K2sq7mJwPXmkQd2BgrpNrjpIdkcFxjiX7vax
         B+4EGPhakTY+6HVbNo9eS57mj8oz83VWCy2vKugjhE+XrWXfBAt2m0vnPkz/cHUP+Y83
         L1Hw==
X-Gm-Message-State: AOJu0YxMQlQvSRoGQTLZuRVCPx5kXVr5UZXZ/QaPC5VvBqygmMrlpQ7I
	ngU4pAouzfB9RbAUMTdJ38JBnirerPRssPkSQRN6MDdg6haLk4DtejEXu9lP3suMUJqJ/w==
X-Gm-Gg: AfdE7cmglcgQAd8Y7klLTO+bGUqP8FgznRGpshf289eeyVOMGzUc6Wg9MFb6e35yQcP
	Jk9XGRKJQnPLn1tnos5CNxsx1IKWx+hCBXl+yAwPNNAXbOkul6OfLRHqiAZTlsKWotK1t/uu7SV
	ZBWUG33t3NSdohr06aPIvuWL7FRPEhBwENnF6HTmeqQyRo4KwzV1W5TwRYuSUjHu1+dyGPQSJ3f
	uSLoJ3a7zaIwazP7maZkMjsAqMdSNldfZ3EnHdklO5r0uR52C9D8WzO0JBv5Y9rgxOlY9UiPCyh
	thWut2XyjXCUmnqOjLR8Bbg6P97diBYdtAE0y/AGdPvgvgMbMXh4C+nzr6xGmIDrgqHizR8JYxZ
	sicU7hMDBU9DJc8oGe+1EfVfopFyunqCg6rtmdE5RjnSUP4dbF6lP6a4mK5nalLwPoAxKwo1jJW
	uUxyxAngBeZA4PPcnMsEPjhzRb3yE0uAX6nwZ1ZqN9ysdUrQ9OmdqOuvCCnAQdePyeCNwMl9UOH
	zJTty0Xo5FiFecmQrvF3OOAyrELhwkB1GrAIPFFCgll9T8btSOm3OCMv7lBvVViEQMyssKND3lI
	F8Gayo99pS44MnTG3OGfByue3uefiQ==
X-Received: by 2002:a05:7301:d8d:b0:30c:ab4d:3826 with SMTP id 5a478bee46e88-30cab4d3c4bmr6334547eec.40.1782634346259;
        Sun, 28 Jun 2026 01:12:26 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 066/128] zile: upgrade 2.4.15 -> 2.6.4
Date: Sun, 28 Jun 2026 01:10:17 -0700
Message-ID: <20260628081122.178348-66-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127876

zile 2.6.x was rewritten in Vala and now needs glib-2.0, libgee and the
Vala toolchain, plus autoconf-archive (AX_REQUIRE_DEFINED) for autoreconf.
Add the dependencies, inherit vala, build in-tree (the Vala build writes
generated sources back into the tree) with CLEANBROKEN, and drop the
obsolete --enable-acl PACKAGECONFIG (removed upstream).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/zile/zile_2.4.15.bb | 24 -------------
 meta-oe/recipes-support/zile/zile_2.6.4.bb  | 38 +++++++++++++++++++++
 2 files changed, 38 insertions(+), 24 deletions(-)
 delete mode 100644 meta-oe/recipes-support/zile/zile_2.4.15.bb
 create mode 100644 meta-oe/recipes-support/zile/zile_2.6.4.bb

diff --git a/meta-oe/recipes-support/zile/zile_2.4.15.bb b/meta-oe/recipes-support/zile/zile_2.4.15.bb
deleted file mode 100644
index d7973ab861..0000000000
--- a/meta-oe/recipes-support/zile/zile_2.4.15.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Zile is lossy Emacs"
-HOMEPAGE = "http://zile.sourceforge.net/"
-DEPENDS = "ncurses bdwgc"
-
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
-
-SRC_URI = "${GNU_MIRROR}/zile/${BP}.tar.gz \
-           file://remove-help2man.patch \
-"
-
-SRC_URI[sha256sum] = "39c300a34f78c37ba67793cf74685935a15568e14237a3a66fda8fcf40e3035e"
-
-inherit autotools pkgconfig
-
-do_install:append() {
-    rm -rf ${D}${libdir}/charset.alias
-    rmdir --ignore-fail-on-non-empty ${D}${libdir} || true
-}
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG:append = " ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)}"
-
-PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
diff --git a/meta-oe/recipes-support/zile/zile_2.6.4.bb b/meta-oe/recipes-support/zile/zile_2.6.4.bb
new file mode 100644
index 0000000000..eb677d1019
--- /dev/null
+++ b/meta-oe/recipes-support/zile/zile_2.6.4.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Zile is lossy Emacs"
+HOMEPAGE = "http://zile.sourceforge.net/"
+DEPENDS = "ncurses bdwgc glib-2.0 libgee autoconf-archive-native"
+
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
+
+SRC_URI = "${GNU_MIRROR}/zile/${BP}.tar.gz \
+           file://remove-help2man.patch \
+"
+
+SRC_URI[sha256sum] = "d5d44b85cb490643d0707e1a2186f3a32998c2f6eabaa9481479b65caeee57c0"
+
+inherit autotools pkgconfig vala
+
+# zile's Vala build writes generated sources (e.g. src/dummy.vala) back into the
+# source tree, so build in-tree. The shipped maintainer GNUmakefile aborts on
+# "make clean" before configure, so skip the preconfigure clean.
+B = "${S}"
+CLEANBROKEN = "1"
+
+# zile ships a pre-generated aclocal.m4 with the pkg-config macros but does not
+# carry pkg.m4 in its m4/ macro dir. With newer autoconf/automake, autoreconf
+# regenerates aclocal.m4 and can no longer find PKG_CHECK_EXISTS, failing with
+# "undefined or overquoted macro: PKG_CHECK_EXISTS". Stage pkg.m4 from the
+# native pkg-config so aclocal picks it up (m4/ is on its -I search path).
+do_configure:prepend() {
+    install -d ${S}/m4
+    install -m 0644 ${STAGING_DATADIR_NATIVE}/aclocal/pkg.m4 ${S}/m4/
+}
+
+do_install:append() {
+    rm -rf ${D}${libdir}/charset.alias
+    rmdir --ignore-fail-on-non-empty ${D}${libdir} || true
+}
+
+# zile 2.6.x dropped the --enable-acl/--disable-acl configure switches
+# (file attribute handling moved to GLib/GIO), so no acl PACKAGECONFIG.

