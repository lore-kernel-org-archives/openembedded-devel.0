Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M0s5P-0002BZ-5B
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 May 2009 08:55:35 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M0rzn-000Au9-FD
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 May 2009 10:49:47 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 4 May 2009 10:49:43 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <20090503233009.B15601880DC@amethyst.openembedded.net>
	<20090504032113.GG7973@smtp.west.cox.net>
	<200905040954.04468.jay4mail@gmail.com>
In-Reply-To: <200905040954.04468.jay4mail@gmail.com>
MIME-Version: 1.0
Message-Id: <200905041049.44146.khimov@altell.ru>
Subject: Re: [oe-commits] Tom Rini : base.bbclass: check_gcc3 needs to	check for gcc-3.4.6 first.
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
X-List-Received-Date: Mon, 04 May 2009 06:55:35 -0000
X-Groupsio-MsgNum: 10013
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_IAp/J8i+BUUv4Ia"

--Boundary-00=_IAp/J8i+BUUv4Ia
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 04 May 2009 09:54:04 Yuri Bushmelev wrote:
> Hello!
>
> > And I really wish qemu would get fixed / rewritten to work with some
> > sort of modern compiler, yeah :(
>
> Qemu 0.10.0 and higher (current is 0.10.3) require no gcc3.x to build. Look
> here: http://www.nongnu.org/qemu/changelog.html

Speaking of which, we've been using 0.10.2 for native (GCC3 in build? No, 
thanks!) and it worked fine for us. Though there are a lot of patches 
currently in OE for qemu, some are very target-specific, so I've not checked 
those.

--Boundary-00=_IAp/J8i+BUUv4Ia
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-qemu-add-version-0.10.2-initial.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-qemu-add-version-0.10.2-initial.patch"

From c8b8db8de2d1f7fc49c24bda0714a752c72e19f7 Mon Sep 17 00:00:00 2001
From: Roman I Khimov <khimov@altell.ru>
Date: Thu, 30 Apr 2009 23:58:13 +0400
Subject: [PATCH] qemu: add version 0.10.2, initial

Finally not requiring GCC3. Added with masked preference, need to carefully
sort out and apply OE's patches.
---
 conf/checksums.ini                   |    4 ++++
 recipes/qemu/qemu-native.inc         |    5 +----
 recipes/qemu/qemu-native_0.10.2.bb   |    2 ++
 recipes/qemu/qemu-native_0.9.1.bb    |    3 +++
 recipes/qemu/qemu-native_20070613.bb |    3 ++-
 recipes/qemu/qemu-native_cvs.bb      |    3 +++
 recipes/qemu/qemu-native_svn.bb      |    3 +++
 recipes/qemu/qemu_0.10.2.bb          |   22 ++++++++++++++++++++++
 8 files changed, 40 insertions(+), 5 deletions(-)
 create mode 100644 recipes/qemu/qemu-native_0.10.2.bb
 create mode 100644 recipes/qemu/qemu_0.10.2.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 6f15ceb..0031ff8 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -19902,6 +19902,10 @@ sha256=3Dc85ba04c9459cbc283a6f04ced730b49dc9966cf7=
49808e8f960305116d525e6
 md5=3Da31f12647c5bb5f93c81465b4e5ff25a
 sha256=3D5795b9d619142e2d01016130c7ac71298aa1cabda4806f11762bb8fd489293af
=20
+[http://download.savannah.gnu.org/releases/qemu/qemu-0.10.2.tar.gz]
+md5=3D85a323cdf620687f39c5328f450a547d
+sha256=3Dfb93a49b2999a4572337fc9012c1b64be1095477446edda1a885b20387ec9a69
+
 [http://fabrice.bellard.free.fr/qemu/qemu-0.9.1.tar.gz]
 md5=3D6591df8e9270eb358c881de4ebea1262
 sha256=3D4756d0b4a4dc7dd88354bc6b37d381e4462dd328d0feef94803e90c0455835a5
diff --git a/recipes/qemu/qemu-native.inc b/recipes/qemu/qemu-native.inc
index 3e6433c..e4064a2 100644
--- a/recipes/qemu/qemu-native.inc
+++ b/recipes/qemu/qemu-native.inc
@@ -1,6 +1,3 @@
 inherit native
=20
-DEPENDS =3D "libsdl-native zlib-native gcc3-native"
-
-require qemu-gcc3-check.inc
-
+DEPENDS =3D "libsdl-native zlib-native"
diff --git a/recipes/qemu/qemu-native_0.10.2.bb b/recipes/qemu/qemu-native_=
0.10.2.bb
new file mode 100644
index 0000000..16984a3
--- /dev/null
+++ b/recipes/qemu/qemu-native_0.10.2.bb
@@ -0,0 +1,2 @@
+require qemu_${PV}.bb
+require qemu-native.inc
diff --git a/recipes/qemu/qemu-native_0.9.1.bb b/recipes/qemu/qemu-native_0=
.9.1.bb
index 16984a3..4c418f6 100644
--- a/recipes/qemu/qemu-native_0.9.1.bb
+++ b/recipes/qemu/qemu-native_0.9.1.bb
@@ -1,2 +1,5 @@
 require qemu_${PV}.bb
 require qemu-native.inc
+require qemu-gcc3-check.inc
+
+DEPENDS +=3D "gcc3-native"
diff --git a/recipes/qemu/qemu-native_20070613.bb b/recipes/qemu/qemu-nativ=
e_20070613.bb
index dc9852b..4c418f6 100644
--- a/recipes/qemu/qemu-native_20070613.bb
+++ b/recipes/qemu/qemu-native_20070613.bb
@@ -1,4 +1,5 @@
 require qemu_${PV}.bb
 require qemu-native.inc
+require qemu-gcc3-check.inc
=20
-
+DEPENDS +=3D "gcc3-native"
diff --git a/recipes/qemu/qemu-native_cvs.bb b/recipes/qemu/qemu-native_cvs=
.bb
index c9db5e3..51e6028 100644
--- a/recipes/qemu/qemu-native_cvs.bb
+++ b/recipes/qemu/qemu-native_cvs.bb
@@ -1,2 +1,5 @@
 require qemu_cvs.bb
 require qemu-native.inc
+require qemu-gcc3-check.inc
+
+DEPENDS +=3D "gcc3-native"
diff --git a/recipes/qemu/qemu-native_svn.bb b/recipes/qemu/qemu-native_svn=
.bb
index 1e3a4db..b530bbd 100644
--- a/recipes/qemu/qemu-native_svn.bb
+++ b/recipes/qemu/qemu-native_svn.bb
@@ -1,2 +1,5 @@
 require qemu_svn.bb
 require qemu-native.inc
+require qemu-gcc3-check.inc
+
+DEPENDS +=3D "gcc3-native"
diff --git a/recipes/qemu/qemu_0.10.2.bb b/recipes/qemu/qemu_0.10.2.bb
new file mode 100644
index 0000000..d6ad1d7
--- /dev/null
+++ b/recipes/qemu/qemu_0.10.2.bb
@@ -0,0 +1,22 @@
+LICENSE =3D "GPL"
+DEPENDS =3D "zlib"
+
+# Need to port OE patches there
+DEFAULT_PREFERENCE =3D "-1"
+
+FILESPATH =3D "${FILE_DIRNAME}/qemu-${PV}"
+FILESDIR =3D "${WORKDIR}"
+
+SRC_URI =3D "\
+    http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz \
+    "
+
+S =3D "${WORKDIR}/qemu-${PV}"
+
+EXTRA_OECONF +=3D "--disable-gfx-check"
+
+inherit autotools
+
+do_configure() {
+	${S}/configure --prefix=3D${prefix} ${EXTRA_OECONF}
+}
--=20
1.6.2.4


--Boundary-00=_IAp/J8i+BUUv4Ia--
