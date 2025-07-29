Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4838FC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 05:22:38 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.648.1753766552933339279
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Jul 2025 22:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id 90D62C5F
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 07:22:30 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.235.207]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ugcnG-1JYNJB0; Tue, 29 Jul 2025 07:22:30 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] waylandpp: update 1.0.0 -> 1.0.1
Date: Tue, 29 Jul 2025 07:22:22 +0200
Message-ID: <20250729052222.106925-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1753766550-8A7FE592-6F026DAB/0/0 CLEAN NORMAL
X-TOI-MSGID: 8b947c3b-84c2-4537-89cb-3cf4f3af46bb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 05:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118752

This maintenance release fixes missing cstdint includes, wrong quoting in=
 CMakeLists.txt, and adds cmake 4 support.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-include-missing-cstdint.patch        | 59 -------------------
 ...426020932ebc481ae35c15f644af2f17e88a.patch | 23 --------
 ...{waylandpp_1.0.0.bb =3D> waylandpp_1.0.1.bb} |  6 +-
 3 files changed, 2 insertions(+), 86 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/wayland/waylandpp/0001-inclu=
de-missing-cstdint.patch
 delete mode 100644 meta-oe/recipes-graphics/wayland/waylandpp/4576426020=
932ebc481ae35c15f644af2f17e88a.patch
 rename meta-oe/recipes-graphics/wayland/{waylandpp_1.0.0.bb =3D> wayland=
pp_1.0.1.bb} (88%)

diff --git a/meta-oe/recipes-graphics/wayland/waylandpp/0001-include-miss=
ing-cstdint.patch b/meta-oe/recipes-graphics/wayland/waylandpp/0001-inclu=
de-missing-cstdint.patch
deleted file mode 100644
index f2169c43c9..0000000000
--- a/meta-oe/recipes-graphics/wayland/waylandpp/0001-include-missing-cst=
dint.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 5e3243b163aa5d50083b4036c21f84c1204f2023 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 26 Jan 2023 23:25:05 -0800
-Subject: [PATCH] include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no longer=
 transitively included [1]. Explicitly include it for uint{32,64}_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://github.com/NilsBrause/waylandpp/pull=
/75]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/wayland-client.hpp | 1 +
- scanner/scanner.cpp        | 3 +++
- 2 files changed, 4 insertions(+)
-
-diff --git a/include/wayland-client.hpp b/include/wayland-client.hpp
-index a3f782b..4598a0e 100644
---- a/include/wayland-client.hpp
-+++ b/include/wayland-client.hpp
-@@ -29,6 +29,7 @@
- /** \file */
-=20
- #include <atomic>
-+#include <cstdint>
- #include <functional>
- #include <memory>
- #include <string>
-diff --git a/scanner/scanner.cpp b/scanner/scanner.cpp
-index bebd71e..c25746a 100644
---- a/scanner/scanner.cpp
-+++ b/scanner/scanner.cpp
-@@ -15,6 +15,7 @@
-  *  along with this program.  If not, see <http://www.gnu.org/licenses/=
>.
-  */
-=20
-+#include <cstdint>
- #include <fstream>
- #include <iostream>
- #include <list>
-@@ -1106,6 +1107,7 @@ int main(int argc, char *argv[])
-   wayland_hpp << "#pragma once" << std::endl
-               << std::endl
-               << "#include <array>" << std::endl
-+              << "#include <cstdint>" << std::endl
-               << "#include <functional>" << std::endl
-               << "#include <memory>" << std::endl
-               << "#include <string>" << std::endl
-@@ -1125,6 +1127,7 @@ int main(int argc, char *argv[])
-     wayland_server_hpp << "#pragma once" << std::endl
-                        << std::endl
-                        << "#include <array>" << std::endl
-+                       << "#include <cstdint>" << std::endl
-                        << "#include <functional>" << std::endl
-                        << "#include <memory>" << std::endl
-                        << "#include <string>" << std::endl
---=20
-2.39.1
-
diff --git a/meta-oe/recipes-graphics/wayland/waylandpp/4576426020932ebc4=
81ae35c15f644af2f17e88a.patch b/meta-oe/recipes-graphics/wayland/waylandp=
p/4576426020932ebc481ae35c15f644af2f17e88a.patch
deleted file mode 100644
index 5011f05f3d..0000000000
--- a/meta-oe/recipes-graphics/wayland/waylandpp/4576426020932ebc481ae35c=
15f644af2f17e88a.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 4576426020932ebc481ae35c15f644af2f17e88a Mon Sep 17 00:00:00 2001
-From: Alexey Sokolov <alexey@asokolov.org>
-Date: Sun, 4 May 2025 14:38:52 +0100
-Subject: [PATCH] Fix build with cmake 4
-
-Upstream-Status: Backport
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 866477b..8e9d2ad 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -21,7 +21,7 @@
- # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE=
 OF THIS
- # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-=20
--cmake_minimum_required(VERSION 3.4)
-+cmake_minimum_required(VERSION 3.4...4.0)
- project(waylandpp VERSION 1.0.0 LANGUAGES CXX)
-=20
- # packages
diff --git a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb b/meta-o=
e/recipes-graphics/wayland/waylandpp_1.0.1.bb
similarity index 88%
rename from meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
rename to meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb
index 0e53807cc7..7ea9f3ffec 100644
--- a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
+++ b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.1.bb
@@ -3,15 +3,13 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3aae28cc66d61975114c2b14df215=
407"
=20
 SRC_URI =3D " \
-	git://github.com/NilsBrause/waylandpp.git;protocol=3Dhttps;branch=3Dmas=
ter \
-	file://0001-include-missing-cstdint.patch \
-	file://4576426020932ebc481ae35c15f644af2f17e88a.patch \
+	git://github.com/NilsBrause/waylandpp.git;protocol=3Dhttps;branch=3D1.0=
.x \
 "
=20
 DEPENDS =3D "pugixml"
 DEPENDS:append:class-target =3D " waylandpp-native wayland virtual/egl v=
irtual/libgles2"
=20
-SRCREV =3D "4321ed5c7b4bffa41b8a2a13dc7f3ece1191f4f3"
+SRCREV =3D "4f208c416f37ea093e4a70a1407abd7d93c889f9"
=20
 inherit cmake pkgconfig features_check
=20
--=20
2.50.1


