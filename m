Return-Path: <tymoteusz.burak@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2A3C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 14:03:05 +0000 (UTC)
Received: from 18.mo550.mail-out.ovh.net (18.mo550.mail-out.ovh.net [46.105.35.72])
 by mx.groups.io with SMTP id smtpd.web10.18877.1721656980140210952
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jul 2024 07:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@3mdeb.com header.s=ovhmo3617313-selector1 header.b=a/7TRryD;
 spf=softfail (domain: 3mdeb.com, ip: 46.105.35.72, mailfrom: tymoteusz.burak@3mdeb.com)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.25.23])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4WSMS21M2Hz1Rrf
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jul 2024 14:02:57 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-8sbwj (unknown [10.110.118.174])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 022161FEC9;
	Mon, 22 Jul 2024 14:02:56 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.97])
	by ghost-submission-6684bf9d7b-8sbwj with ESMTPSA
	id inZDLZBmnmYz6gAAZ5Ztrg
	(envelope-from <tymoteusz.burak@3mdeb.com>); Mon, 22 Jul 2024 14:02:56 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-97G002279b2a6e-0815-499a-80b3-2ff4eab5df31,
                    9ACBE58C89F6A49851271BBB5C33F51B15DCB032) smtp.auth=tymoteusz.burak@3mdeb.com
X-OVh-ClientIp: 95.49.233.246
From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	Tymoteusz Burak <tymoteusz.burak@3mdeb.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] dediprog-flasher: Add recipe
Date: Mon, 22 Jul 2024 16:02:10 +0200
Message-ID: <20240722140209.1431735-2-tymoteusz.burak@3mdeb.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <111419>
References: <111419>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7390688463509246000
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrheejgdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvhihmohhtvghushiiuceuuhhrrghkuceothihmhhothgvuhhsiidrsghurhgrkhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepjeekfedthfduvdffudfhvdekhffgleffgefhvdffudekheevjefhheelhfeilefhnecuffhomhgrihhnpedvtddrsggspdhgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpleehrdegledrvdeffedrvdegiedpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehthihmohhtvghushiirdgsuhhrrghkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=a1r4AVPPRAboZwXIpDXVgikbXbcX7z1E0Tv1QckqyNw=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1721656978; v=1;
 b=a/7TRryDk/OGXH2AUZ3F+SvMatYXxyD6RUnkzqTITbPNJz8u8RhE9h0qrz0t3KVEziiN+qey
 iL24mTDblewKWswuvoriWTauIKonev6KXhlf7wgiUH/zzRzNF5+jMdJpBhl1KUnXFM88y762VV4
 +esYpTG8nmSZRwlZiABILvXe5w0I3uoer/mbP2w/A4dNIxj8bLcnQ1zRTOBzoa99FlkG5UHPDcg
 XBroEC/ND6ja5TeGb9uTw33shg9CVLAFTujk6Ju41PZXm/aA+UhcZ3MNE3eDL7/D4GQ4HqhycX5
 YapPoCC0XAYibRyvd5yQHlsfDUyLjZ7UbCypeGIg3H85A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jul 2024 14:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111427

This patch adds the dpcmd utility recipe. It provides software for
Dediprog SF100 and SF600 SPI flash programmers.

Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
CC: Khem Raj <raj.khem@gmail.com>
---
 ...01-add-support-for-cross-compilation.patch | 21 ++++++++++
 ...2-Makefile-add-conditional-stripping.patch | 39 +++++++++++++++++++
 .../dediprog-flasher_1.14.20.bb               | 29 ++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher=
/0001-add-support-for-cross-compilation.patch
 create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher=
/0002-Makefile-add-conditional-stripping.patch
 create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher=
_1.14.20.bb

diff --git a/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-a=
dd-support-for-cross-compilation.patch b/meta-oe/recipes-bsp/dediprog-fla=
sher/dediprog-flasher/0001-add-support-for-cross-compilation.patch
new file mode 100644
index 000000000000..fbc0f5a18e1d
--- /dev/null
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0001-add-supp=
ort-for-cross-compilation.patch
@@ -0,0 +1,21 @@
+Author: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
+Date:   Fri Jul 5 16:39:13 2024 +0200
+Upstream-Status: Submitted [https://github.com/DediProgSW/SF100Linux/pul=
l/86]
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
index 000000000000..0fc8ac5bd2ef
--- /dev/null
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile=
-add-conditional-stripping.patch
@@ -0,0 +1,39 @@
+From dac9d0ea5c419049c9ab0a5ba90d15d77a3271b0 Mon Sep 17 00:00:00 2001
+From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
+Date: Mon, 22 Jul 2024 13:02:59 +0000
+Subject: [PATCH] Makefile: add conditional stripping
+Upstream-Status: Submitted [https://github.com/DediProgSW/SF100Linux/pul=
l/88]
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
0.bb b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
new file mode 100644
index 000000000000..83a88ab75f42
--- /dev/null
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
@@ -0,0 +1,29 @@
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
+PV =3D "1.0+${SRCPV}"
+
+S =3D "${WORKDIR}/git"
+
+do_install () {
+    oe_runmake DESTDIR=3D${D} PREFIX=3D/usr install
+}
+
+FILES:${PN} +=3D " \
+    ${datadir}/DediProg \
+"
+
+inherit pkgconfig
--=20
2.45.1


