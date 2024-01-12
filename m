Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBB1C4725D
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 12:53:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6186.1705064023117859647
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 04:53:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C3CD1FB
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 04:54:28 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 98E113F73F
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 04:53:41 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4] libuser: fix gtk-doc configure call
Date: Fri, 12 Jan 2024 12:53:37 +0000
Message-Id: <20240112125340.495067-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 12:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108236

From: Ross Burton <ross.burton@arm.com>

Update the GTK_DOC_CHECK invocation to specify where the
documentation will be built (as the default is ./docs).

This is needed so that gtkdocize as run by autopoint knows where the
documentation will be built. At the moment we manually call gtkdocize
but this will change to autopoint in the future.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libuser/libuser/gtkdoc.patch              | 22 +++++++++++++++++++
 .../recipes-support/libuser/libuser_0.64.bb   |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta-gnome/recipes-support/libuser/libuser/gtkdoc.pat=
ch

diff --git a/meta-gnome/recipes-support/libuser/libuser/gtkdoc.patch b/me=
ta-gnome/recipes-support/libuser/libuser/gtkdoc.patch
new file mode 100644
index 0000000000..4d11b94e02
--- /dev/null
+++ b/meta-gnome/recipes-support/libuser/libuser/gtkdoc.patch
@@ -0,0 +1,22 @@
+Update the GTK_DOC_CHECK invocation to specify where the
+documentation will be built (as the default is ./docs).
+
+This is needed so that gtkdocize as run by autopoint knows where the
+documentation will be built.
+
+Upstream-Status: Submitted [https://pagure.io/libuser/pull-request/70]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/configure.ac b/configure.ac
+index 0bd4a67..51508b7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -169,7 +169,7 @@ if test "$GCC" =3D yes ; then
+      AC_MSG_RESULT([$enable_Werror])
+ fi
+=20
+-GTK_DOC_CHECK
++GTK_DOC_CHECK([1.14],[--flavour no-tmpl --docdir docs/reference])
+=20
+ AC_CONFIG_FILES([Makefile po/Makefile.in docs/Makefile docs/reference/M=
akefile
+ libuser.pc])
diff --git a/meta-gnome/recipes-support/libuser/libuser_0.64.bb b/meta-gn=
ome/recipes-support/libuser/libuser_0.64.bb
index d86a577b10..973159c792 100644
--- a/meta-gnome/recipes-support/libuser/libuser_0.64.bb
+++ b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
@@ -14,6 +14,7 @@ SECTION =3D "base"
 SRC_URI =3D "https://releases.pagure.org/libuser/libuser-${PV}.tar.gz \
            file://0001-docs-Disable-building.patch \
            file://0002-remove-unused-execinfo.h.patch \
+           file://gtkdoc.patch \
            "
=20
 SRC_URI[sha256sum] =3D "ea6094c72cb9e60a42fb53509dc98d124a340f1c9222783b=
503208adc16a0a8f"
--=20
2.34.1


