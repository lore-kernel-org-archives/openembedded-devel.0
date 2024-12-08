Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92E2E77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 21:22:37 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.web11.86713.1733692956921928864
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Dec 2024 13:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 92379620B1; Sun,  8 Dec 2024 21:22:35 +0000 (UTC)
Received: from localhost.localdomain (ip-046-223-149-087.um13.pools.vodafone-ip.de [46.223.149.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 77F1161995;
	Sun,  8 Dec 2024 21:22:35 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH] canopenterm: update to version 1.0.9
Date: Sun,  8 Dec 2024 22:22:12 +0100
Message-Id: <20241208212212.11732-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Dec 2024 21:22:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114244

- Add support for CANopen Profile data base files using a well
  documented JSON-based file format.
- Include codb to JSON converter (codb2json).
- Add API functions to generate test reports (JUnix XML).
- Removed PicoC support for the greater good.
- Various improvements and bug fixes.

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 ...-initialize-msghdr-in-a-portable-way.patch | 42 -------------------
 ...openterm_1.0.8.bb =3D> canopenterm_1.0.9.bb} | 15 ++++---
 2 files changed, 7 insertions(+), 50 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm/0001=
-can_linux-initialize-msghdr-in-a-portable-way.patch
 rename meta-oe/recipes-extended/canopenterm/{canopenterm_1.0.8.bb =3D> c=
anopenterm_1.0.9.bb} (68%)

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm/0001-can_li=
nux-initialize-msghdr-in-a-portable-way.patch b/meta-oe/recipes-extended/=
canopenterm/canopenterm/0001-can_linux-initialize-msghdr-in-a-portable-wa=
y.patch
deleted file mode 100644
index 09bbd4021..000000000
--- a/meta-oe/recipes-extended/canopenterm/canopenterm/0001-can_linux-ini=
tialize-msghdr-in-a-portable-way.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 464ed82087b0514694ab69e2808e859cb6f13833 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 22 Nov 2024 10:35:12 -0800
-Subject: [PATCH] can_linux: initialize msghdr in a portable way
-
-musl has padding bytes inside the msghdr struct which means initializing
-full structure will cause wrong assignments, doing partial assignment is
-more portable and assign the elements after that
-
-Fixes
-src/core/can_linux.c:362:71: error: incompatible pointer to integer conv=
ersion initializing 'int' with an expression of type 'void *' [-Wint-conv=
ersion]
-  |     struct msghdr      msg              =3D { &sa, sizeof(sa), &iov,=
 1, NULL, 0, 0 };
-  |                                                                     =
  ^~~~
-
-Upstream-Status: Submitted [https://github.com/CANopenTerm/CANopenTerm/p=
ull/70]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/core/can_linux.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/core/can_linux.c b/src/core/can_linux.c
-index d8824be..b4e7907 100644
---- a/src/core/can_linux.c
-+++ b/src/core/can_linux.c
-@@ -359,11 +359,16 @@ static char** get_can_interfaces(int* count)
-     int                fd;
-     char               buf[BUFFER_SIZE] =3D { 0 };
-     struct iovec       iov              =3D { buf, sizeof(buf) };
--    struct msghdr      msg              =3D { &sa, sizeof(sa), &iov, 1,=
 NULL, 0, 0 };
-+    struct msghdr      msg              =3D { 0 };
-     int                len;
-     int                max_interfaces   =3D 10;
-     int                can_count        =3D 0;
-     char**             can_interfaces   =3D (char**)os_calloc(max_inter=
faces * sizeof(char*), sizeof(char));
-+   =20
-+    msg.msg_name =3D &sa;
-+    msg.msg_namelen =3D sizeof(sa);
-+    msg.msg_iov =3D &iov;
-+    msg.msg_iovlen =3D 1;
-=20
-     struct
-     {
diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb b/=
meta-oe/recipes-extended/canopenterm/canopenterm_1.0.9.bb
similarity index 68%
rename from meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb
rename to meta-oe/recipes-extended/canopenterm/canopenterm_1.0.9.bb
index c9bf0af56..d52bcc363 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.9.bb
@@ -13,19 +13,18 @@ BUGTRACKER =3D "https://github.com/CANopenTerm/CANope=
nTerm/issues"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D10e84ea70e8c3a1fbc462f5424=
806474"
=20
-DEPENDS =3D "libinih libsdl2 lua libsocketcan pocketpy"
+DEPENDS =3D "cjson libinih libsdl2 lua libsocketcan pocketpy"
=20
-SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain \
-           file://0001-can_linux-initialize-msghdr-in-a-portable-way.pat=
ch \
-           "
-SRCREV =3D "5bc04e09351f68e889381e1912b0445c4f18ee32"
+SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain"
+
+SRCREV  =3D "fcf2a49eb1ef3ac5f5d17ac1865be6dfbd9e33d5"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit cmake
+inherit cmake ptest
=20
 EXTRA_OECMAKE +=3D "-DBUILD_YOCTO=3DON"
=20
-FILES:${PN} +=3D "${bindir}/CANopenTerm ${datadir}"
+FILES:${PN} +=3D "${bindir}/CANopenTerm ${bindir}/codb2json ${datadir}"
=20
-RDEPENDS:${PN} =3D "libinih libsdl2 lua libsocketcan pocketpy"
+RDEPENDS:${PN} =3D "cjson libinih libsdl2 lua libsocketcan pocketpy"
--=20
2.39.5


