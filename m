Return-Path: <tymoteusz.burak@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E975C3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 15:12:06 +0000 (UTC)
Received: from 7.mo583.mail-out.ovh.net (7.mo583.mail-out.ovh.net [178.32.124.100])
 by mx.groups.io with SMTP id smtpd.web10.20801.1721401921610500952
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jul 2024 08:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@3mdeb.com header.s=ovhmo3617313-selector1 header.b=A5TR5HyC;
 spf=softfail (domain: 3mdeb.com, ip: 178.32.124.100, mailfrom: tymoteusz.burak@3mdeb.com)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.139.16])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4WQY734j2lz1TTZ
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 15:11:59 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-p5wcg (unknown [10.110.178.240])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 060291FEA1;
	Fri, 19 Jul 2024 15:11:58 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
	by ghost-submission-6684bf9d7b-p5wcg with ESMTPSA
	id B8gGLj6CmmaKRQEA3WaQTQ
	(envelope-from <tymoteusz.burak@3mdeb.com>); Fri, 19 Jul 2024 15:11:58 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-98R0020e54cadd-e1cb-4b21-80c2-8f24df9c28ba,
                    0DAC71DC4688F35B407E28F83CB24C577BAD2293) smtp.auth=tymoteusz.burak@3mdeb.com
X-OVh-ClientIp: 213.192.77.249
From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
Subject: [meta-oe][PATCH] dediprog-flasher: Add recipe
Date: Fri, 19 Jul 2024 17:11:41 +0200
Message-ID: <20240719151141.477978-1-tymoteusz.burak@3mdeb.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9385220149709492432
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrhedugdekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfihmhhothgvuhhsiicuuehurhgrkhcuoehthihmohhtvghushiirdgsuhhrrghkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekkefhjefgtedvheeliefhkeevgeelgfehieehgfevtedugefhleeujeffiedtgeenucffohhmrghinhepvddtrdgssgdpghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudefrdduledvrdejjedrvdegledpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehthihmohhtvghushiirdgsuhhrrghkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=dwuK8KQdafDE9YC8e8PixHraT1k8y0w+OF0nsQX2vAE=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1721401919; v=1;
 b=A5TR5HyCqbDh/1C7ESdWQ3uDV3hvgIJQ8Skrav8jFh8L4jTRsOyDndpTNedKIgFpbShnr0xy
 ZHTNtQSWREeGDoeC2k+U56FltvQMc810iNecSwOXOMx34yyY7Mtb2zRZlKAjjIOklHod0SpHRf4
 Mf7WJULzvXIM4ERXD9lTFu+qpq3HWBsd2KTYzgoDT37rcoiIbJiyRfOa1+bwv4VPwlHv2XP1iBh
 74jvy1OL+QhopavvW+6SPmxxPGVBinz6DYMum1kiiDcNsAlKyRh48ZX0Ayz7LHUE+8xlY0qgGSI
 7n68BuZqeFUb87x6vPlpkD1j/xpPxHD5xg/QkGxDcCPUw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 15:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111417

---
 ...01-add-support-for-cross-compilation.patch | 21 +++++++++++++
 .../0002-Makefile-remove-stripping.patch      | 30 +++++++++++++++++++
 .../dediprog-flasher_1.14.20.bb               | 25 ++++++++++++++++
 3 files changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher=
/0001-add-support-for-cross-compilation.patch
 create mode 100644 meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher=
/0002-Makefile-remove-stripping.patch
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
akefile-remove-stripping.patch b/meta-oe/recipes-bsp/dediprog-flasher/ded=
iprog-flasher/0002-Makefile-remove-stripping.patch
new file mode 100644
index 000000000000..5e7d7fc5fe89
--- /dev/null
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher/0002-Makefile=
-remove-stripping.patch
@@ -0,0 +1,30 @@
+From 96d8849c3c482f21ad04f1dad45bf59f453e43d6 Mon Sep 17 00:00:00 2001
+From: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
+Date: Mon, 8 Jul 2024 10:58:45 +0000
+Subject: [PATCH] Makefile: remove stripping
+Upstream-Status: Inappropriate [oe specific]
+
+This patch modifies the install process to disable stripping of binaries=
 by the
+Makefile and allow the stripping to be handled by bitbake to integrate
+it seamlessly into the bitbake workflow.
+
+ Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 139e5c0..aa6eba5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -58,7 +58,6 @@ install: $(PROGRAM)
+ 	[ $(shell id -u) -eq 0 ] || (echo "Error: install needs root privilege=
s" && false)
+ 	install -v -o 0 -g 0 -m 755 -d $(DESTDIR)$(PREFIX)/bin $(DESTDIR)$(PRE=
FIX)/share/DediProg
+ 	echo -n "install: " && install -v -o 0 -g 0 -m 0755 $(PROGRAM) $(DESTD=
IR)$(PREFIX)/bin/$(PROGRAM)
+-	strip $(DESTDIR)$(PREFIX)/bin/$(PROGRAM)
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
index 000000000000..5d0e4e856f82
--- /dev/null
+++ b/meta-oe/recipes-bsp/dediprog-flasher/dediprog-flasher_1.14.20.bb
@@ -0,0 +1,25 @@
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
+    file://0002-Makefile-remove-stripping.patch \
+    "
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


