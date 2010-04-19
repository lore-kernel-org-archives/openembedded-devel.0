Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1O3vpP-0004gw-CF
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Apr 2010 20:36:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 1AB3EA2C401
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 20:32:40 +0200 (CEST)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id laBf3tB2om9j
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 20:32:32 +0200 (CEST)
Received: from tomboy.localnet (pD9E1744C.dip.t-dialin.net [217.225.116.76])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTP id 9EFAEA2C3FD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Apr 2010 20:32:32 +0200 (CEST)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Apr 2010 20:32:30 +0200
User-Agent: KMail/1.12.4 (Linux/2.6.33-2.slh.6-sidux-amd64; KDE/4.3.4; x86_64; ;
	)
MIME-Version: 1.0
Message-Id: <201004192032.30713.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: dbus-c++
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
X-List-Received-Date: Mon, 19 Apr 2010 18:36:16 -0000
X-Groupsio-MsgNum: 18709
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_+GKzLTZSSYcUB0C"

--Boundary-00=_+GKzLTZSSYcUB0C
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,
i need dbus-c++-native, but dev.openwengo.org is gone.
I want to change the host to the unofficial git i found on 
http://www.freedesktop.org/wiki/Software/dbus-c%2B%2B because the official tells 
me that there is no such repo.
Also i defined a PV for this package.

Is this patch ok for everyone?

Regards
Thomas

--Boundary-00=_+GKzLTZSSYcUB0C
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-dbus-c-dev.openwengo.org-is-gone.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-dbus-c-dev.openwengo.org-is-gone.patch"

From c136297e3a0fae5dbb48f465ef52acbc8fabd865 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <ml@vdm-design.de>
Date: Mon, 19 Apr 2010 20:22:33 +0200
Subject: [PATCH] dbus-c++: dev.openwengo.org is gone

* switch host to new git repo
* define correct verion
* bump PE because no PV was defined before

Signed-off-by: Thomas Zimmermann <ml@vdm-design.de>
---
 recipes/dbus/dbus-c++-native_git.bb |   21 +++++++++++++++++++++
 recipes/dbus/dbus-c++-native_svn.bb |   21 ---------------------
 recipes/dbus/dbus-c++_git.bb        |   23 +++++++++++++++++++++++
 recipes/dbus/dbus-c++_svn.bb        |   20 --------------------
 4 files changed, 44 insertions(+), 41 deletions(-)
 create mode 100644 recipes/dbus/dbus-c++-native_git.bb
 delete mode 100644 recipes/dbus/dbus-c++-native_svn.bb
 create mode 100644 recipes/dbus/dbus-c++_git.bb
 delete mode 100644 recipes/dbus/dbus-c++_svn.bb

diff --git a/recipes/dbus/dbus-c++-native_git.bb b/recipes/dbus/dbus-c++-na=
tive_git.bb
new file mode 100644
index 0000000..dd43f91
--- /dev/null
+++ b/recipes/dbus/dbus-c++-native_git.bb
@@ -0,0 +1,21 @@
+require dbus-c++_git.bb
+inherit native
+
+FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/dbus-c++"
+# actually dbus-native and expat-native, but even the bearest build machin=
e should have that nowadays...
+DEPENDS =3D ""
+
+do_compile() {
+	oe_runmake -C src libdbus-c++-1.la
+	oe_runmake -C tools dbusxx-xml2cpp
+	install -m 0755 tools/dbusxx-xml2cpp ${STAGING_BINDIR_NATIVE}
+}
+
+do_stage() {
+    autotools_stage_all
+}
+
+do_install() {
+	:
+}
+
diff --git a/recipes/dbus/dbus-c++-native_svn.bb b/recipes/dbus/dbus-c++-na=
tive_svn.bb
deleted file mode 100644
index 5599aeb..0000000
--- a/recipes/dbus/dbus-c++-native_svn.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require dbus-c++_${PV}.bb
-inherit native
-
-FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/dbus-c++"
-# actually dbus-native and expat-native, but even the bearest build machin=
e should have that nowadays...
-DEPENDS =3D ""
-
-do_compile() {
-	oe_runmake -C src libdbus-c++-1.la
-	oe_runmake -C tools dbusxx-xml2cpp
-	install -m 0755 tools/dbusxx-xml2cpp ${STAGING_BINDIR_NATIVE}
-}
-
-do_stage() {
-    autotools_stage_all
-}
-
-do_install() {
-	:
-}
-
diff --git a/recipes/dbus/dbus-c++_git.bb b/recipes/dbus/dbus-c++_git.bb
new file mode 100644
index 0000000..06e1cb3
--- /dev/null
+++ b/recipes/dbus/dbus-c++_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION =3D "C++ bindings for dbus"
+LICENSE =3D "LGPL"
+SECTION =3D "libs"
+DEPENDS =3D "dbus dbus-c++-native expat"
+SRCREV =3D "530a887913d3b0dd7091eabb8eef8e3c279e3bb8"
+
+PE =3D "1"
+PV =3D "0.5.0+gitr${SRCPV}"
+
+SRC_URI =3D "git://gitorious.org/dbus-cplusplus/mainline.git;protocol=3Dgi=
t"
+#           file://fix-linking.patch;patch=3D1"
+S =3D "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+do_compile_prepend() {
+	find . -name "Makefile.am" |xargs sed -i -e 's,$(top_builddir)/tools/dbus=
xx-xml2cpp,dbusxx-xml2cpp,'
+}
+
+FILES_${PN}-dbg +=3D "${bindir}/dbusxx-xml2cpp ${bindir}/dbusxx-introspect=
"
+FILES_${PN}-dev +=3D "${bindir}/.dev"
+FILES_${PN} =3D "${libdir}/*.so.*"
+
diff --git a/recipes/dbus/dbus-c++_svn.bb b/recipes/dbus/dbus-c++_svn.bb
deleted file mode 100644
index 80e6f14..0000000
--- a/recipes/dbus/dbus-c++_svn.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =3D "C++ bindings for dbus"
-LICENSE =3D "LGPL"
-SECTION =3D "libs"
-DEPENDS =3D "dbus dbus-c++-native expat"
-SRCREV =3D "13131"
-
-SRC_URI =3D "svn://dev.openwengo.org/svn/openwengo/wengophone-ng/branches/=
wengophone-dbus-api/libs;module=3Ddbus;proto=3Dhttp"
-#           file://fix-linking.patch;patch=3D1"
-S =3D "${WORKDIR}/dbus"
-
-inherit autotools pkgconfig
-
-do_compile_prepend() {
-	find . -name "Makefile.am" |xargs sed -i -e 's,$(top_builddir)/tools/dbus=
xx-xml2cpp,dbusxx-xml2cpp,'
-}
-
-FILES_${PN}-dbg +=3D "${bindir}/dbusxx-xml2cpp ${bindir}/dbusxx-introspect=
"
-FILES_${PN}-dev +=3D "${bindir}/.dev"
-FILES_${PN} =3D "${libdir}/*.so.*"
-
--=20
1.7.0.4


--Boundary-00=_+GKzLTZSSYcUB0C--
