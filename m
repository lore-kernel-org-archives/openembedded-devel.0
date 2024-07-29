Return-Path: <tymoteusz.burak@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB109C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 17:28:00 +0000 (UTC)
Received: from 16.mo550.mail-out.ovh.net (16.mo550.mail-out.ovh.net [178.33.104.224])
 by mx.groups.io with SMTP id smtpd.web10.61476.1722274077063011030
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 10:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@3mdeb.com header.s=ovhmo3617313-selector1 header.b=lzAa0ND5;
 spf=softfail (domain: 3mdeb.com, ip: 178.33.104.224, mailfrom: tymoteusz.burak@3mdeb.com)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.9.137])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4WXlgG74SHz1HSl
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 17:27:54 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-j9nzh (unknown [10.111.182.240])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id F3C481FE7D;
	Mon, 29 Jul 2024 17:27:48 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
	by ghost-submission-6684bf9d7b-j9nzh with ESMTPSA
	id QLo6KxTRp2bV+A8ARDiXtA
	(envelope-from <tymoteusz.burak@3mdeb.com>); Mon, 29 Jul 2024 17:27:48 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R001b8cf114f-60ee-4f17-83d6-aa8ca9dab86b,
                    640A8744C67237564BCAB5CC533FFE437B6568A1) smtp.auth=tymoteusz.burak@3mdeb.com
X-OVh-ClientIp: 89.64.21.97
From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	Tymoteusz Burak <tymoteusz.burak@3mdeb.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v3] dediprog-flasher: Add recipe
Date: Mon, 29 Jul 2024 19:27:08 +0200
Message-ID: <20240729172708.8968-1-tymoteusz.burak@3mdeb.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <CAMKF1sruk+AgtzT65AubtCZ6EqmUnx9j-vXYsJqc6Hem_N_H8A@mail.gmail.com>
References: <CAMKF1sruk+AgtzT65AubtCZ6EqmUnx9j-vXYsJqc6Hem_N_H8A@mail.gmail.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 15067355504367358000
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrjedvgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfihmhhothgvuhhsiicuuehurhgrkhcuoehthihmohhtvghushiirdgsuhhrrghkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevfeeltdefudfffeegjeevveeiveefkeeiveetjedugeethfffvefhhfetheeuffenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdekledrieegrddvuddrleejpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepthihmhhothgvuhhsiidrsghurhgrkhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehhedtpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=YEhTfHclBu+u6q8dl/Mmr9BSGqGlnE28+ubuucU6y0Y=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1722274075; v=1;
 b=lzAa0ND5zJZJOxdfNb3preigz/ZLYwn3jLJHZpHdX0k6nz6LG0sJlrpgEpbdSBki1CRmjpLO
 sf61Dq2l3qkA/lNY6iRAhYtl7Awrv2TMm0gJa0IJntgsKhkN0AqTrq6YWN3q0p1JJOpiCt9xh0n
 t56VPw0Qv9Gk8AIt6+LZBwDk0ztCnwJcEPGsC97su60m6J6B3OgbQuIajnsl07R77rbG9udffuf
 3RwZmHx+WAxYBSYNUL32lfs/CyP1jP4c46hsDKq0BBvhDiz2xfiMfRtqp3AJ5Cz4jGHCctW1o0H
 CLT7OQ2me2of2GYc/tqmlX3KzunQjpvHDJ7QijrMt4Etg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 17:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111472

This patch adds the dpcmd utility recipe. It provides software for
Dediprog SF100 and SF600 SPI flash programmers.

I've changed the PV to the tag from which the sources are fetched.

Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
CC: Khem Raj <raj.khem@gmail.com>
---
 ...01-add-support-for-cross-compilation.patch | 21 ++++++++++
 ...2-Makefile-add-conditional-stripping.patch | 39 +++++++++++++++++++
 .../dediprog-flasher_1.14.20.x.bb             | 27 +++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher=
/0001-add-support-for-cross-compilation.patch
 create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher=
/0002-Makefile-add-conditional-stripping.patch
 create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher=
_1.14.20.x.bb

diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-a=
dd-support-for-cross-compilation.patch b/meta-oe/recipes-bsp/dediprog-fla=
sher/dediprog-flasher/0001-add-support-for-cross-compilation.patch
new file mode 100644
index 000000000000..b97ddacc3684
--- /dev/null
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add-supp=
ort-for-cross-compilation.patch
@@ -0,0 +1,21 @@
+Author: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
+Date:   Fri Jul 5 16:39:13 2024 +0200
+Upstream-Status: Backport [https://github.com/DediProgSW/SF100Linux/comm=
it/b1fbcbc1fbb2d0d71a20a2936c6eff0586422243]
+
+    Makefile: allow overriding CC
+   =20
+    Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
+
+diff --git a/Makefile b/Makefile
+index 139e5c0c3c3c..226303a6921e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -12,7 +12,7 @@ endif
+ endif
+=20
+ PROGRAM =3D dpcmd
+-CC      =3D gcc
++CC     ?=3D gcc
+ PREFIX ?=3D /usr/local
+=20
+ PKG_CONFIG ?=3D pkg-config
diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-M=
akefile-add-conditional-stripping.patch b/meta-oe/recipes-bsp/dediprog-fl=
asher/dediprog-flasher/0002-Makefile-add-conditional-stripping.patch
new file mode 100644
index 000000000000..0654a0eb6f96
--- /dev/null
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile=
-add-conditional-stripping.patch
@@ -0,0 +1,39 @@
+From dac9d0ea5c419049c9ab0a5ba90d15d77a3271b0 Mon Sep 17 00:00:00 2001
+From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
+Date: Mon, 22 Jul 2024 13:02:59 +0000
+Subject: [PATCH] Makefile: add conditional stripping
+Upstream-Status: Backport [https://github.com/DediProgSW/SF100Linux/comm=
it/91f990f5783e0aebe94999bb37d93836b7a5ca79]
+
+This patch introduces a `NOSTRIP` conditional flag to the `install`
+target in the Makefile. The purpose of this flag is to allow the
+disabling of binary stripping during installation. This is
+particularly useful in development environments, such as BitBake,
+which handle stripping internally.
+
+When `NOSTRIP` is set to `1`, the `strip` command will be skipped
+during the installation process, preventing potential conflicts or
+redundant operations.
+
+Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
+
+---
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index 139e5c0..8b33320 100644
+--- a/Makefile
++++ b/Makefile
+@@ -58,7 +58,9 @@ install: $(PROGRAM)
+ 	[ $(shell id -u) -eq 0 ] || (echo "Error: install needs root privilege=
s" && false)
+ 	install -v -o 0 -g 0 -m 755 -d $(DESTDIR)$(PREFIX)/bin $(DESTDIR)$(PRE=
FIX)/share/DediProg
+ 	echo -n "install: " && install -v -o 0 -g 0 -m 0755 $(PROGRAM) $(DESTD=
IR)$(PREFIX)/bin/$(PROGRAM)
++ifneq ($(NOSTRIP),1)
+ 	strip $(DESTDIR)$(PREFIX)/bin/$(PROGRAM)
++endif
+ 	install -v -o 0 -g 0 -m 755 -d $(DESTDIR)$(PREFIX)/share/DediProg
+ 	echo -n "install: " && install -v -o 0 -g 0 -m 0644 ChipInfoDb.dedicfg=
 $(DESTDIR)$(PREFIX)/share/DediProg/ChipInfoDb.dedicfg
+ 	install -v -o 0 -g 0 -m 755 -d $(DESTDIR)/etc/udev/rules.d
+--=20
+2.30.2
+
diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.2=
0.x.bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.x.=
bb
new file mode 100644
index 000000000000..913937a16506
--- /dev/null
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.x.bb
@@ -0,0 +1,27 @@
+DESCRIPTION =3D "Linux software for Dediprog SF100 and SF600 SPI flash p=
rogrammers"
+SECTION =3D "devel"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da23a74b3f4caf9616230789d94217=
acb"
+
+DEPENDS =3D "libusb"
+
+SRCREV =3D "e691f2d432144e3dbc82e9e0eea1ebaed4f3becf"
+SRC_URI =3D " \
+    git://github.com/DediProgSW/SF100Linux.git;protocol=3Dhttps;branch=3D=
master \
+    file://0001-add-support-for-cross-compilation.patch \
+    file://0002-Makefile-add-conditional-stripping.patch \
+    "
+
+EXTRA_OEMAKE =3D "NOSTRIP=3D1"
+
+S =3D "${WORKDIR}/git"
+
+do_install () {
+    oe_runmake DESTDIR=3D${D} PREFIX=3D${prefix} install
+}
+
+FILES:${PN} +=3D " \
+    ${datadir}/DediProg \
+"
+
+inherit pkgconfig
--=20
2.45.1


