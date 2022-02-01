Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8976C4167E
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:35:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51299.1643733312140614542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:35:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82AA111B3
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DEDF3F40C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/14] s-nail: add a maintained mail(1) fork
Date: Tue,  1 Feb 2022 16:35:03 +0000
Message-Id: <20220201163507.1320861-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201163507.1320861-1-ross.burton@arm.com>
References: <20220201163507.1320861-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 16:35:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95195

Heirloom Mailx hasn't been maintained for some time: the last release
on their web site was 11.25 in 2005 and Debian shipped 12.5 in 2016, but
this appears to be a Debian-specific fork which is also now dead.

s-nail is an alternative mail(1) fork which is actively maintained, so
add a recipe for that.  It provides an alternative for ${bindir}/mailx,
so should be a drop-in replacement.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../s-nail/files/make-errors.patch            | 18 ++++++++
 .../recipes-extended/s-nail/s-nail_14.9.23.bb | 44 +++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-extended/s-nail/files/make-errors.pat=
ch
 create mode 100644 meta-oe/recipes-extended/s-nail/s-nail_14.9.23.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index a600b24cc3..de7239287c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -421,6 +421,7 @@ RDEPENDS:packagegroup-meta-oe-extended =3D"\
     sedutil \
     libsigrok \
     libsigrokdecode \
+    s-nail \
     sigrok-cli \
     snappy \
     tipcutils \
diff --git a/meta-oe/recipes-extended/s-nail/files/make-errors.patch b/me=
ta-oe/recipes-extended/s-nail/files/make-errors.patch
new file mode 100644
index 0000000000..18cfd257d2
--- /dev/null
+++ b/meta-oe/recipes-extended/s-nail/files/make-errors.patch
@@ -0,0 +1,18 @@
+Don't wrap CC in quotes as our CC has options and this breaks command lo=
okup.
+
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/mk/su-make-errors.sh b/mk/su-make-errors.sh
+index a62af31..b73881e 100644
+--- a/mk/su-make-errors.sh
++++ b/mk/su-make-errors.sh
+@@ -152,7 +152,7 @@ compile_time() { # {{{
+    # The problem is that at least (some versions of) gcc mangle output.
+    # Ensure we get both arguments on one line.
+    # While here sort numerically.
+-   "${CC}" -E "${TARGET}".c |
++   ${CC} -E "${TARGET}".c |
+       ${awk} '
+          function stripsym(sym){
+             sym =3D substr(sym, 2)
diff --git a/meta-oe/recipes-extended/s-nail/s-nail_14.9.23.bb b/meta-oe/=
recipes-extended/s-nail/s-nail_14.9.23.bb
new file mode 100644
index 0000000000..4dbb99b3d5
--- /dev/null
+++ b/meta-oe/recipes-extended/s-nail/s-nail_14.9.23.bb
@@ -0,0 +1,44 @@
+SUMMARY =3D "Feature-rich BSD mail(1)"
+HOMEPAGE =3D "https://www.sdaoden.eu/code.html#s-mailx"
+SECTION =3D "console/network"
+
+LICENSE =3D "ISC & BSD-3-Clause & BSD-4-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D87266591c81260f10221f1f38872d=
023"
+
+SRC_URI =3D "https://ftp.sdaoden.eu/${BP}.tar.xz \
+           file://make-errors.patch"
+SRC_URI[sha256sum] =3D "2c717b22f4cd8719b82b6618640da6031382d2bf8eb51283=
bca2c6266957bca8"
+
+DEPENDS =3D "coreutils-native"
+
+B =3D "${WORKDIR}/build"
+
+inherit update-alternatives
+
+EXTRA_OEMAKE =3D "VERBOSE=3Dyes \
+                CONFIG=3Dminimal \
+                OPT_AUTOCC=3Dno \
+                OPT_CROSS_BUILD=3Dyes \
+                OBJDIR=3D${B} \
+                strip=3Dtrue \
+                VAL_PREFIX=3D${prefix} \
+                VAL_BINDIR=3D${bindir} \
+                VAL_LIBEXECDIR=3D${libexecdir} \
+                VAL_MANDIR=3D${mandir} \
+                VAL_SYSCONFDIR=3D${sysconfdir}"
+
+do_configure[cleandirs] +=3D "${B}"
+do_configure() {
+    oe_runmake -C ${S} config
+}
+
+do_compile() {
+    oe_runmake -C ${S} build
+}
+
+do_install() {
+    oe_runmake -C ${S} install DESTDIR=3D${D}
+}
+
+ALTERNATIVE:${PN} =3D "mailx"
+ALTERNATIVE_TARGET[mailx] =3D "${bindir}/s-nail"
--=20
2.25.1


