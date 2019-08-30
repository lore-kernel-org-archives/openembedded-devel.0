Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id ABBC27F440
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 15:51:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46KkTx2360z3S
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 17:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567180261;
	bh=TZfgjHIJsJvxZaWmk6esKQWkewTH5e3inN19aK/K57A=;
	h=From:To:Subject:Date:From;
	b=uPWkSNj9jaU9LHgat4P88L3311dUcL8tMZHF+wvNQgl2qROapWZJkvQskCaTgbqio
	V6LfIP/VKKx72sQVhuQ1BTHowvAtHquceLDQxB8cta/P3mrOdN5THRAuAKyrUe+Zun
	sWB4lqKpjx7VxPAVNJiQ4+kjrdG7w8jNwdPY8j0X50pnBMpSiPgN3YgxkMD1+Vzj9A
	RktZJ2P+6ySdYS7IzywIjSTvINWAyYwVgJXZ7tq0YtHxMa/c/AXD4S7Ia8JiqtlhnD
	JR4Gq8QXIUeq9lwwF2K0rtDPyP1pqINrY0cS0FE9JYoTOpfDo8/wC2551b5HJ5K0Vj
	SG9k9nZoFjEiSQiWKizyO4yXpOCB+1zHtQm3VG8qkXjejVK18Vo2ZPb0ykLkEhU5tD
	jpp8s8uiXKRJ5OmnlWm84CkYziOBipmqI0x+dZmX/7lpusS7QBPYFtw9e8c0jB5k+o
	BXvQ/t+ZNCU5k4/dHRa7raDgcWbesilalKalq6ksilt4m31/EX+pAtrN0Khixz1ejb
	viXgdrgbChf8XmUB0Ff5oU0lWqOa2YICaBUeFkZKvsi//1StfUf47WxCzzlAUeSvCX
	LHgWdnw4Cg6vUjVOCg2eHLP9zT22wZFSeCeIifGgD7WSVSVvMZd4I9oOuBfqJw3OJq
	86FWa/3+Z8WTaP6cYEh016h8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Aug 2019 18:50:59 +0300
Message-Id: <20190830155059.21044-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-openembedded][PATCH] Remove bogus COMMON_LICENSE_DIR usage in LIC_FILES_CHKSUM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Aug 2019 15:51:01 -0000

Using COMMON_LICENSE_DIR in LIC_FILES_CHKSUM of downloaded
code is never the right thing to do, there must be some
license information and that has to be checked instead.

In several cases the claimed LICENSE was also incorrect.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-support/daemontools/daemontools_0.76.bb       | 2 +-
 meta-python/recipes-devtools/python/python-daemon_2.1.2.bb    | 4 ++--
 meta-python/recipes-devtools/python/python-grpcio-tools.inc   | 4 ++--
 meta-python/recipes-devtools/python/python-grpcio.inc         | 4 ++--
 meta-python/recipes-devtools/python/python-intervals.inc      | 4 ++--
 meta-python/recipes-devtools/python/python-lockfile_0.12.2.bb | 2 +-
 meta-python/recipes-devtools/python/python-pint.inc           | 2 +-
 meta-python/recipes-devtools/python/python-protobuf.inc       | 2 +-
 .../python/python-robotframework-seriallibrary.inc            | 2 +-
 meta-python/recipes-devtools/python/python-scrypt.inc         | 2 +-
 10 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
index 84e9bca0e..35251cb8d 100644
--- a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -12,7 +12,7 @@ data."
 
 SECTION = "System/Servers"
 
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/PD;md5=b3597d12946881e13cb3b548d1173851"
+LIC_FILES_CHKSUM = "file://src/prot.c;beginline=1;endline=1;md5=96964cadf07e8f8c1e2ffb3b507dd647"
 LICENSE = "PD"
 
 SRC_URI = "http://cr.yp.to/daemontools/${BPN}-${PV}.tar.gz \
diff --git a/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb b/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
index ffb5beb57..002da046c 100644
--- a/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python-daemon_2.1.2.bb
@@ -8,8 +8,8 @@ RDEPENDS_${PN} = "python-docutils \
                   python-resource \
 "
 
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
+LICENSE = "Apache-2.0 & GPLv3"
+LIC_FILES_CHKSUM = "file://README;md5=2695c853a2cafc33e68a1d972889ebd2"
 
 inherit pypi setuptools
 
diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools.inc b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
index 91cc62f40..1a15c48de 100644
--- a/meta-python/recipes-devtools/python/python-grpcio-tools.inc
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
@@ -5,8 +5,8 @@ SECTION = "devel/python"
 DEPENDS_append = "${PYTHON_PN}-grpcio"
 RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
 
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-grpcio.inc b/meta-python/recipes-devtools/python/python-grpcio.inc
index 7d3675c45..c5762b26b 100644
--- a/meta-python/recipes-devtools/python/python-grpcio.inc
+++ b/meta-python/recipes-devtools/python/python-grpcio.inc
@@ -17,8 +17,8 @@ RDEPENDS_${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-six \
 "
 
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-intervals.inc b/meta-python/recipes-devtools/python/python-intervals.inc
index 1ecca3524..a915e09f9 100644
--- a/meta-python/recipes-devtools/python/python-intervals.inc
+++ b/meta-python/recipes-devtools/python/python-intervals.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "Interval arithmetic for Python"
 HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
 SECTION = "devel/python"
 
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 PYPI_PACKAGE := "python-intervals"
 
diff --git a/meta-python/recipes-devtools/python/python-lockfile_0.12.2.bb b/meta-python/recipes-devtools/python/python-lockfile_0.12.2.bb
index 9ad865d40..20ea01804 100644
--- a/meta-python/recipes-devtools/python/python-lockfile_0.12.2.bb
+++ b/meta-python/recipes-devtools/python/python-lockfile_0.12.2.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 RDEPENDS_${PN} = "python-threading"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2340dffbbfea534b58f1349984eeef72"
 
 inherit pypi setuptools
 
diff --git a/meta-python/recipes-devtools/python/python-pint.inc b/meta-python/recipes-devtools/python/python-pint.inc
index 53f778393..2bc8e4ab6 100644
--- a/meta-python/recipes-devtools/python/python-pint.inc
+++ b/meta-python/recipes-devtools/python/python-pint.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
 SECTION = "devel/python"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
 
 PYPI_PACKAGE := "Pint"
 
diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
index ce95e66c9..5058d4bd3 100644
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://developers.google.com/protocol-buffers/"
 SECTION = "devel/python"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de84f8d949cfcfd4e"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-robotframework-seriallibrary.inc b/meta-python/recipes-devtools/python/python-robotframework-seriallibrary.inc
index 9f07b6577..bfcb023a2 100644
--- a/meta-python/recipes-devtools/python/python-robotframework-seriallibrary.inc
+++ b/meta-python/recipes-devtools/python/python-robotframework-seriallibrary.inc
@@ -1,7 +1,7 @@
 SUMMARY = "Robot Framework test library for serial connection"
 HOMEPAGE = "https://github.com/whosaysni/robotframework-seriallibrary"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
 
 SRC_URI[md5sum] = "b7c9565d54c30df7cd3f3c0e29adffa3"
 SRC_URI[sha256sum] = "256ad60fc0b7df4be44d82c302f5ed8fad4935cda99e4b45942e3c88179d1e19"
diff --git a/meta-python/recipes-devtools/python/python-scrypt.inc b/meta-python/recipes-devtools/python/python-scrypt.inc
index fef6ec976..aff86a594 100644
--- a/meta-python/recipes-devtools/python/python-scrypt.inc
+++ b/meta-python/recipes-devtools/python/python-scrypt.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Bindings for the scrypt key derivation function library"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=168ff75417f75a83e63c8875292d44dc"
 HOMEPAGE="https://bitbucket.org/mhallin/py-scrypt/overview"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-scrypt:"
-- 
2.17.1


