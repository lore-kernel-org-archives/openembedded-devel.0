Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED3FC83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 18:13:16 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.4030.1752084786950098588
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 11:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id 695A8DE94
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Jul 2025 20:13:04 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.46]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uZZHx-1L1wav0; Wed, 9 Jul 2025 20:13:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] waylandpp: fix build with cmake 4
Date: Wed,  9 Jul 2025 20:12:56 +0200
Message-ID: <20250709181256.1981722-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1752084781-5F7FC4FD-A53BE477/0/0 CLEAN NORMAL
X-TOI-MSGID: 7a5a7d18-4263-4706-a7ec-781de6e6514d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 18:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118375

Add a backport patch that fixes build with cmake 4

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...426020932ebc481ae35c15f644af2f17e88a.patch | 23 +++++++++++++++++++
 .../wayland/waylandpp_1.0.0.bb                |  7 ++++--
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/wayland/waylandpp/4576426020=
932ebc481ae35c15f644af2f17e88a.patch

diff --git a/meta-oe/recipes-graphics/wayland/waylandpp/4576426020932ebc4=
81ae35c15f644af2f17e88a.patch b/meta-oe/recipes-graphics/wayland/waylandp=
p/4576426020932ebc481ae35c15f644af2f17e88a.patch
new file mode 100644
index 0000000000..5011f05f3d
--- /dev/null
+++ b/meta-oe/recipes-graphics/wayland/waylandpp/4576426020932ebc481ae35c=
15f644af2f17e88a.patch
@@ -0,0 +1,23 @@
+From 4576426020932ebc481ae35c15f644af2f17e88a Mon Sep 17 00:00:00 2001
+From: Alexey Sokolov <alexey@asokolov.org>
+Date: Sun, 4 May 2025 14:38:52 +0100
+Subject: [PATCH] Fix build with cmake 4
+
+Upstream-Status: Backport
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 866477b..8e9d2ad 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -21,7 +21,7 @@
+ # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE=
 OF THIS
+ # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+=20
+-cmake_minimum_required(VERSION 3.4)
++cmake_minimum_required(VERSION 3.4...4.0)
+ project(waylandpp VERSION 1.0.0 LANGUAGES CXX)
+=20
+ # packages
diff --git a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb b/meta-o=
e/recipes-graphics/wayland/waylandpp_1.0.0.bb
index bb909a313a..0e53807cc7 100644
--- a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
+++ b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
@@ -2,8 +2,11 @@ SUMMARY =3D " C++ binding for Wayland using the most mod=
ern C++ technology"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3aae28cc66d61975114c2b14df215=
407"
=20
-SRC_URI =3D "git://github.com/NilsBrause/waylandpp.git;protocol=3Dhttps;=
branch=3Dmaster \
-           file://0001-include-missing-cstdint.patch"
+SRC_URI =3D " \
+	git://github.com/NilsBrause/waylandpp.git;protocol=3Dhttps;branch=3Dmas=
ter \
+	file://0001-include-missing-cstdint.patch \
+	file://4576426020932ebc481ae35c15f644af2f17e88a.patch \
+"
=20
 DEPENDS =3D "pugixml"
 DEPENDS:append:class-target =3D " waylandpp-native wayland virtual/egl v=
irtual/libgles2"
--=20
2.49.0


