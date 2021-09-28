Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFB5C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 08:20:55 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.11205.1632817253919835847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Sep 2021 01:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18S8KqFv026043
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Sep 2021 01:20:52 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18S8KqFi011931
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Sep 2021 01:20:52 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 01:20:51 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 28 Sep 2021 01:20:51 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libqb: Upgrade to 2.0.3
Date: Tue, 28 Sep 2021 16:19:45 +0800
Message-ID: <20210928081945.3704-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 18S8KqFv026043
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Sep 2021 08:20:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93160

From: Mingli Yu <mingli.yu@windriver.com>

Remove one backported patch and add libxml2 to DEPNEDS to fix below
configure error:
 | configure: error: Package requirements (libxml-2.0) were not met:
 |
 | No package 'libxml-2.0' found

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ure-script-neglecting-re-enable-out-.patch | 56 -------------------
 .../libqb/{libqb_1.0.5.bb =3D> libqb_2.0.3.bb}  |  8 +--
 2 files changed, 4 insertions(+), 60 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libqb/libqb/0001-build-fix-c=
onfigure-script-neglecting-re-enable-out-.patch
 rename meta-oe/recipes-extended/libqb/{libqb_1.0.5.bb =3D> libqb_2.0.3.b=
b} (90%)

diff --git a/meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configur=
e-script-neglecting-re-enable-out-.patch b/meta-oe/recipes-extended/libqb=
/libqb/0001-build-fix-configure-script-neglecting-re-enable-out-.patch
deleted file mode 100644
index c82f3bf01..000000000
--- a/meta-oe/recipes-extended/libqb/libqb/0001-build-fix-configure-scrip=
t-neglecting-re-enable-out-.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 73d2aea33e32272bac693550e8a3b0e3ad89707f Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Jan=3D20Pokorn=3DC3=3DBD?=3D <jpokorny@redhat.com>
-Date: Tue, 26 Dec 2017 00:02:26 +0100
-Subject: [PATCH] build: fix configure script neglecting, re-enable out-o=
f-tree
- builds
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-For the former, a prototype and the final code got (hm, mysteriously)
-intertwisted.  For the latter, I am clearly guilty of (rare, anyway)
-testing of the out-of-tree builds only with libqb-already-system-wide
-scenario, which is rather shortsighted.
-
-Thanks Fabio and his ci.kronosnet.org project for spotting that.
-
-X-mas-present-for: Fabio M. Di Nitto <fdinitto@redhat.com>
-Signed-off-by: Jan Pokorn=C3=BD <jpokorny@redhat.com>
----
-Upstream-Status: Backport
-
- configure.ac    | 2 +-
- lib/Makefile.am | 4 +++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9900310..f9761cc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -710,7 +710,7 @@ if test "x${GCC}" =3D xyes; then
- 			                      | grep __stop___verbose | cut -d" " -f 3)
- 			 test "${verbose_start_addr}" =3D "${verbose_stop_addr}" \
- 			   && gcc_has_attribute_section_visible=3Dno \
--			   || { verbose_start_type=3D$(${READELF} -s backup \
-+			   || { verbose_start_type=3D$(${READELF} -s "conftest${shrext_cmds}=
" \
- 			                             | sed -n '/__start___verbose/{s/^\s*//p=
;q}' \
- 			                             | tr -s ' ' \
- 			                             | cut -d" " -f6)
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index 6ca6b15..b035f0b 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -101,7 +101,9 @@ endif
- endif
-=20
- qblog_script.ld: %.ld: %.ld.in
--	$(AM_V_GEN)$(CPP) -xc -I$(top_srcdir)/include -D_GNU_SOURCE -C -P $< \
-+	$(AM_V_GEN)$(CPP) -C -D_GNU_SOURCE -P \
-+	  -I$(top_srcdir)/include -I$(top_builddir)/include \
-+	  -xc $< \
- 	  | sed -n "/$$(sed -n '/^[^#]/{s/[*\/]/\\&/g;p;q;}' $<)/,$$ p" \
- 	  > $@
-=20
---=20
-2.16.2
-
diff --git a/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb b/meta-oe/reci=
pes-extended/libqb/libqb_2.0.3.bb
similarity index 90%
rename from meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
rename to meta-oe/recipes-extended/libqb/libqb_2.0.3.bb
index d14fbaed3..76dac6730 100644
--- a/meta-oe/recipes-extended/libqb/libqb_1.0.5.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_2.0.3.bb
@@ -9,13 +9,13 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D321bf41f280c=
f805086dd5a720b37785"
=20
 inherit autotools pkgconfig
=20
-# v1.0.5
-SRCREV =3D "d08dbcf08b0da418bce9b5427dfd89522916322a"
-SRC_URI =3D "git://github.com/ClusterLabs/${BPN}.git;branch=3Dversion_1 =
\
-           file://0001-build-fix-configure-script-neglecting-re-enable-o=
ut-.patch \
+SRCREV =3D "404adbcd998ec83643e47d92b3ea8d9c3970e68b"
+SRC_URI =3D "git://github.com/ClusterLabs/${BPN}.git \
           "
 S =3D "${WORKDIR}/git"
=20
+DEPENDS +=3D "libxml2"
+
 # otherwise do_configure fails
 # configure:21609: checking whether linker workaround for orphan section=
s usable
 # configure:21639: i586-oe-linux-gcc  -m32 -march=3Di586 --sysroot=3DWOR=
KDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0/recipe-sysroot -o conftest  -O =
-fno-omit-frame-pointer -g -feliminate-unused-debug-types -fdebug-prefix-=
map=3DWORKDIR/libqb/1.0.3+gitAUTOINC+c235284b5f-r0=3D/usr/src/debug/libqb=
/1.0.3+gitAUTOINC+c235284b5f-r0 -fdebug-prefix-map=3DWORKDIR/libqb/1.0.3+=
gitAUTOINC+c235284b5f-r0/recipe-sysroot=3D -fdebug-prefix-map=3DWORKDIR/l=
ibqb/1.0.3+gitAUTOINC+c235284b5f-r0/recipe-sysroot-native=3D  -pipe  -pth=
read -D_REENTRANT  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,con=
ftest.ld conftest.c  >&5
--=20
2.17.1


