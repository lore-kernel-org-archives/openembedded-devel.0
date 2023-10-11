Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95EBCDB46F
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 16:34:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21327.1697042037101773037
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 09:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ABEF150C;
	Wed, 11 Oct 2023 09:34:37 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05EB63F7A6;
	Wed, 11 Oct 2023 09:33:55 -0700 (PDT)
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego.Sueiro@arm.com,
	Rahul.Singh@arm.com
Subject: [meta-oe][PATCH 1/3] linuxptp: update linuxptp recipe to 4.1
Date: Wed, 11 Oct 2023 17:33:44 +0100
Message-Id: <20231011163346.1856498-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011163346.1856498-1-luca.fancellu@arm.com>
References: <20231011163346.1856498-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 16:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105427

Update linuxptp recipe to the new version, from 3.1.1 to 4.1.

Remove one downstream patch that is already applied and
update the remaining to remove merge issues.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 .../0001-include-string.h-for-strncpy.patch   |  8 ++--
 ...ditional-assignment-for-KBUILD_OUTPU.patch | 42 -------------------
 .../linuxptp/Use-cross-cpp-in-incdefs.patch   |  8 ++--
 ...-Allow-CC-and-prefix-to-be-overriden.patch | 12 +++---
 .../{linuxptp_3.1.1.bb =3D> linuxptp_4.1.bb}    | 22 ++++++----
 5 files changed, 26 insertions(+), 66 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-m=
akefile-use-conditional-assignment-for-KBUILD_OUTPU.patch
 rename meta-oe/recipes-connectivity/linuxptp/{linuxptp_3.1.1.bb =3D> lin=
uxptp_4.1.bb} (59%)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-=
string.h-for-strncpy.patch b/meta-oe/recipes-connectivity/linuxptp/linuxp=
tp/0001-include-string.h-for-strncpy.patch
index 60f2079d37ae..ae544699272f 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-string.=
h-for-strncpy.patch
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-include-string.=
h-for-strncpy.patch
@@ -1,4 +1,4 @@
-From d49b4fb8063ecd89617587e5ea566cc9da9393ef Mon Sep 17 00:00:00 2001
+From ecfc8e287eb6811e42c4e2800a913822f554d7c8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 31 Aug 2022 19:09:18 -0700
 Subject: [PATCH] include string.h for strncpy()
@@ -6,12 +6,13 @@ Subject: [PATCH] include string.h for strncpy()
 Upstream-Status: Pending
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  interface.c | 1 +
  1 file changed, 1 insertion(+)
=20
 diff --git a/interface.c b/interface.c
-index 65bdff0..5228db9 100644
+index 29229ad..9a83c36 100644
 --- a/interface.c
 +++ b/interface.c
 @@ -5,6 +5,7 @@
@@ -22,6 +23,3 @@ index 65bdff0..5228db9 100644
  #include "interface.h"
 =20
  struct interface {
---=20
-2.37.3
-
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile=
-use-conditional-assignment-for-KBUILD_OUTPU.patch b/meta-oe/recipes-conn=
ectivity/linuxptp/linuxptp/0001-makefile-use-conditional-assignment-for-K=
BUILD_OUTPU.patch
deleted file mode 100644
index fb5190652196..000000000000
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/0001-makefile-use-co=
nditional-assignment-for-KBUILD_OUTPU.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From dfd38cb29c0768692f886d3ab9158bd2b3132582 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 22 Nov 2022 15:20:48 +0800
-Subject: [PATCH] makefile: use conditional assignment for KBUILD_OUTPUT
-
-Refer [1],from make 4.4, all variables that are marked as export will
-also be passed to the shell started by the shell function. use "=3D" wil=
l
-make KBUILD_OUTPUT always empty for shell function, use "?=3D" to make
-"export KBUILD_OUTPUT" in enrironment can work.
-
-[snip of 4.4 NEWS]
-* WARNING: Backward-incompatibility!
-   Previously makefile variables marked as export were not exported to c=
ommands
-   started by the $(shell ...) function.  Now, all exported variables ar=
e
-   exported to $(shell ...).
-[snip]
-
-[1] https://git.savannah.gnu.org/cgit/make.git/tree/NEWS?h=3D4.4&id=3Ded=
493f6c9116cc217b99c2cfa6a95f15803235a2#n74
-
-Upstream-Status: Submitted [linuxptp-devel@lists.sourceforge.net]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/makefile b/makefile
-index 529d8a0..3db60fa 100644
---- a/makefile
-+++ b/makefile
-@@ -15,7 +15,7 @@
- # with this program; if not, write to the Free Software Foundation, Inc=
.,
- # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-=20
--KBUILD_OUTPUT =3D
-+KBUILD_OUTPUT ?=3D
-=20
- DEBUG	=3D
- CC	?=3D $(CROSS_COMPILE)gcc
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp=
-in-incdefs.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cr=
oss-cpp-in-incdefs.patch
index 876088649e3d..9c87851e48ef 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-inc=
defs.patch
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-inc=
defs.patch
@@ -1,4 +1,4 @@
-From 8a4cad5e2f2cbb6a34bdc6e877fe499502b8c4c8 Mon Sep 17 00:00:00 2001
+From be8808005772da48c052cf34a343a6d140541f6a Mon Sep 17 00:00:00 2001
 From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
 Date: Fri, 23 Dec 2016 18:12:29 +0100
 Subject: [PATCH] linuxptp: Use cross cpp in incdefs
@@ -8,11 +8,13 @@ we need to ensure we use correct setttings from toolcha=
in
=20
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
=20
- makefile | 2 +-
+---
+ incdefs.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
+diff --git a/incdefs.sh b/incdefs.sh
+index a9e94f7..dd1692f 100755
 --- a/incdefs.sh
 +++ b/incdefs.sh
 @@ -27,7 +27,7 @@ user_flags()
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-C=
C-and-prefix-to-be-overriden.patch b/meta-oe/recipes-connectivity/linuxpt=
p/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch
index 55ce4c9a9015..d4d6fac0ee5c 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-p=
refix-to-be-overriden.patch
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-p=
refix-to-be-overriden.patch
@@ -1,4 +1,4 @@
-From af485c638c61fa883212ea424e676fbf90bee594 Mon Sep 17 00:00:00 2001
+From 886bca11ff8fcc55386b6e4397b13e64950f93fb Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Tue, 1 Jul 2014 17:37:31 -0300
 Subject: [PATCH] build: Allow CC and prefix to be overriden
@@ -6,16 +6,17 @@ Subject: [PATCH] build: Allow CC and prefix to be overr=
iden
 Upstream-Status: Pending
=20
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
 ---
- makefile |    4 ++--
+ makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/makefile b/makefile
-index 22e7d0d..809cc8f 100644
+index 3e3b8b3..5c1a1f9 100644
 --- a/makefile
 +++ b/makefile
 @@ -18,7 +18,7 @@
- KBUILD_OUTPUT =3D
+ KBUILD_OUTPUT ?=3D
 =20
  DEBUG	=3D
 -CC	=3D $(CROSS_COMPILE)gcc
@@ -32,6 +33,3 @@ index 22e7d0d..809cc8f 100644
  sbindir	=3D $(prefix)/sbin
  mandir	=3D $(prefix)/man
  man8dir	=3D $(mandir)/man8
---=20
-1.7.10.4
-
diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb b/me=
ta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
similarity index 59%
rename from meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
rename to meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
index 5903cb38ca4e..0b559df8c3c1 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
@@ -1,19 +1,23 @@
-DESCRIPTION =3D "Precision Time Protocol (PTP) according to IEEE standar=
d 1588 for Linux"
+SUMMARY =3D "linuxptp package for linux"
+DESCRIPTION =3D "Precision Time Protocol (PTP) according to IEEE standar=
d 1588 \
+for Linux"
 HOMEPAGE =3D "http://linuxptp.sourceforge.net/"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-SRC_URI =3D "http://sourceforge.net/projects/linuxptp/files/v3.1/linuxpt=
p-${PV}.tgz \
+LINUXPTP_SRC_URI =3D "http://sourceforge.net/projects/linuxptp"
+
+SRC_URI =3D "${LINUXPTP_SRC_URI}/files/v4.1/linuxptp-${PV}.tgz \
            file://build-Allow-CC-and-prefix-to-be-overriden.patch \
            file://Use-cross-cpp-in-incdefs.patch \
            file://0001-include-string.h-for-strncpy.patch \
-           file://0001-makefile-use-conditional-assignment-for-KBUILD_OU=
TPU.patch \
            "
=20
-UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/linuxptp/files/=
"
-UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
+SRC_URI[md5sum] =3D "1db8699fc155965341759be5e5aad938"
+SRC_URI[sha256sum] =3D "e1743d44f8208897e30895da3579e670ff919b914feb4b5a=
949f3e421ddde535"
=20
-SRC_URI[sha256sum] =3D "94d6855f9b7f2d8e9b0ca6d384e3fae6226ce6fc012dbad0=
2608bdef3be1c0d9"
+UPSTREAM_CHECK_URI =3D "${LINUXPTP_SRC_URI}/files/"
+UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
=20
 EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} EXTRA_CFLAGS=3D'${CFLAGS}' mandi=
r=3D${mandir}"
=20
@@ -24,10 +28,10 @@ do_install() {
=20
     # Install example configs from source tree
     install -d ${D}${docdir}/${PN}
-    cp -R --no-dereference --preserve=3Dmode,links ${S}/configs ${D}${do=
cdir}/${PN}
+    cp -R --no-dereference --preserve=3Dmode,links ${S}/configs \
+        ${D}${docdir}/${PN}
 }
=20
 PACKAGES =3D+ "${PN}-configs"
=20
-FILES:${PN}-configs =3D "${docdir}"
-FILES:${PN}-doc =3D "${mandir}"
+FILES:${PN}-configs +=3D "${docdir}"
--=20
2.34.1


