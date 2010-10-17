Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1P7Wgy-0005Qk-Gx
	for Openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 19:06:41 +0200
Received: by gya1 with SMTP id 1so36176gya.6
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 10:06:06 -0700 (PDT)
Received: by 10.150.98.3 with SMTP id v3mr5168117ybb.304.1287335160887;
	Sun, 17 Oct 2010 10:06:00 -0700 (PDT)
Received: from [192.168.10.100] (cm198.psi191.maxonline.com.sg
	[58.146.191.198])
	by mx.google.com with ESMTPS id k2sm210300ybj.8.2010.10.17.10.05.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Oct 2010 10:06:00 -0700 (PDT)
From: Sean Cross <sean@chumby.com>
Date: Mon, 18 Oct 2010 01:05:55 +0800
Message-Id: <FD3ED125-4701-4F36-88EA-E70AAB057103@chumby.com>
To: Openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH v2] live555: Add version 20101015 and remove older versions
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Oct 2010 17:06:42 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Live555 gets downloaded from http://www.live555.com/liveMedia/public/ =
but they only have the latest version available.  This patch adds =
support for the latest version, and removes older packages which cannot =
build due to missing tarballs.

---
 recipes/live555/live555_20051005.bb |   26 --------------------
 recipes/live555/live555_20090602.bb |   45 =
-----------------------------------
 recipes/live555/live555_20100409.bb |    7 -----
 recipes/live555/live555_20100529.bb |    7 -----
 recipes/live555/live555_20101015.bb |    7 +++++++
 5 files changed, 7 insertions(+), 85 deletions(-)
 delete mode 100644 recipes/live555/live555_20051005.bb
 delete mode 100644 recipes/live555/live555_20090602.bb
 delete mode 100644 recipes/live555/live555_20100409.bb
 delete mode 100644 recipes/live555/live555_20100529.bb
 create mode 100644 recipes/live555/live555_20101015.bb

diff --git a/recipes/live555/live555_20051005.bb =
b/recipes/live555/live555_20051005.bb
deleted file mode 100644
index a4eb5bd..0000000
--- a/recipes/live555/live555_20051005.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-# live555 OE build file
-# Copyright (C) 2005, Koninklijke Philips Electronics NV.  All Rights =
Reserved
-# Released under the MIT license (see packages/COPYING)
-
-DESCRIPTION =3D "LIVE555 Streaming Media libraries"
-HOMEPAGE =3D "http://live.com/"
-LICENSE =3D "LGPL"
-SECTION =3D "devel"
-
-SRC_URI =3D =
"http://downloads.videolan.org/pub/videolan/vlc/0.8.5/contrib/live.2005.10=
.05.tar.gz \
-           file://config.linux-cross"
-
-S =3D "${WORKDIR}/live"
-
-do_configure() {
-	cp ${WORKDIR}/config.linux-cross .
-	./genMakefiles linux-cross
-}
-
-do_compile() {
-	make
-}
-
-
-SRC_URI[md5sum] =3D "6f15406664ef31172c68d46567569bb8"
-SRC_URI[sha256sum] =3D =
"9532b981c9b8974ceedd3d25a8f9a0e167a92c9da0dece47f34a4ec34e34b1cf"
diff --git a/recipes/live555/live555_20090602.bb =
b/recipes/live555/live555_20090602.bb
deleted file mode 100644
index a07a748..0000000
--- a/recipes/live555/live555_20090602.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-# live555 OE build file
-# Copyright (C) 2005, Koninklijke Philips Electronics NV.  All Rights =
Reserved
-# Released under the MIT license (see packages/COPYING)
-
-DESCRIPTION =3D "LIVE555 Streaming Media libraries"
-HOMEPAGE =3D "http://live.com/"
-LICENSE =3D "LGPL"
-SECTION =3D "devel"
-
-PR =3D "r3"
-
-SRC_URI =3D =
"http://www.live555.com/liveMedia/public/live.2009.06.02.tar.gz \
-           file://config.linux-cross"
-
-S =3D "${WORKDIR}/live"
-
-do_configure() {
-	cp ${WORKDIR}/config.linux-cross .
-	./genMakefiles linux-cross
-}
-
-do_compile() {
-	make
-}
-
-do_install() {
-	install -d ${D}${includedir}/BasicUsageEnvironment
-	install -d ${D}${includedir}/groupsock
-	install -d ${D}${includedir}/liveMedia
-	install -d ${D}${includedir}/UsageEnvironment
-	install -d ${D}${libdir}
-	cp -a ${S}/BasicUsageEnvironment/include/*.hh =
${D}${includedir}/BasicUsageEnvironment/
-	cp -a ${S}/groupsock/include/*.h ${D}${includedir}/groupsock/
-	cp -a ${S}/groupsock/include/*.hh ${D}${includedir}/groupsock/
-	cp -a ${S}/liveMedia/include/*.hh ${D}${includedir}/liveMedia/
-	cp -a ${S}/UsageEnvironment/include/*.hh =
${D}${includedir}/UsageEnvironment/
-	# Find all the headers
-	for i in $(find . -name "*.hh") $(find . -name "*.h") ; do
-		install ${i} ${D}${includedir}
-	done
-	cp ${S}/*/*.a ${D}${libdir}
-}
-
-SRC_URI[md5sum] =3D "088f848b64cef1d54034bc24cfa3c156"
-SRC_URI[sha256sum] =3D =
"66c54241bfcc7ea42fe40e1c93739be79a3c065390c4163c0f2647ac45c24758"
diff --git a/recipes/live555/live555_20100409.bb =
b/recipes/live555/live555_20100409.bb
deleted file mode 100644
index 01fdd63..0000000
--- a/recipes/live555/live555_20100409.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require live555.inc
-
-PR =3D "${INC_PR}.1"
-
-SRC_URI[md5sum] =3D "7f56f54c1c4697764c6e88282e353e81"
-SRC_URI[sha256sum] =3D =
"e9539f59058cb885f28ac48cdce285f8a0fe567c4aa889c2ac3bd0638b007944"
-
diff --git a/recipes/live555/live555_20100529.bb =
b/recipes/live555/live555_20100529.bb
deleted file mode 100644
index 22c9aa4..0000000
--- a/recipes/live555/live555_20100529.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require live555.inc
-
-PR =3D "${INC_PR}.1"
-
-SRC_URI[md5sum] =3D "285266fe9ddf6ed1f7bfd6ecae16f742"
-SRC_URI[sha256sum] =3D =
"9079b577ac20b85378b39ea00a1bf30e09a77763e704d8c5bdc85451257a8f72"
-
diff --git a/recipes/live555/live555_20101015.bb =
b/recipes/live555/live555_20101015.bb
new file mode 100644
index 0000000..eb6dfe3
--- /dev/null
+++ b/recipes/live555/live555_20101015.bb
@@ -0,0 +1,7 @@
+require live555.inc
+
+PR =3D "${INC_PR}.1"
+
+SRC_URI[md5sum] =3D "29734ddc6fddbb1a3a8f51a6de7a21c5"
+SRC_URI[sha256sum] =3D =
"278d99c0880f324769164d6872fea88f8d82ec5b87bb66c92035f46ee2f10adc"
+
--=20
1.7.0.4


