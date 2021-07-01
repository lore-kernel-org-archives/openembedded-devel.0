Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2374.1625109885604071074
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jun 2021 20:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1613Oi8x017058
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jun 2021 20:24:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 30 Jun 2021 20:24:44 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Wed, 30 Jun 2021 20:24:43 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] bats: fix qa issue when multilib eanbled
Date: Thu, 1 Jul 2021 11:24:41 +0800
Message-ID: <20210701032441.7007-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Fix qa issue for bats when multilib is enabled:

| ERROR: bats-1.3.0-r0 do_package: QA Issue: bats: Files/directories
     were installed but not shipped in any package:
|  /usr/lib
|  /usr/lib/bats-core
|  /usr/lib/bats-core/formatter.bash
|  /usr/lib/bats-core/test_functions.bash

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-test/bats/bats_1.3.0.bb       |  3 +-
 .../0001-install.sh-consider-multilib.patch   | 43 +++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/bats/files/0001-install.sh-consider-multilib.patch

diff --git a/meta-oe/recipes-test/bats/bats_1.3.0.bb b/meta-oe/recipes-test/bats/bats_1.3.0.bb
index 8190a5e3a..39a02733f 100644
--- a/meta-oe/recipes-test/bats/bats_1.3.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.3.0.bb
@@ -7,6 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2970203aedf9e829edb96a137a4fe81b"
 
 SRC_URI = "git://github.com/bats-core/bats-core.git \
+           file://0001-install.sh-consider-multilib.patch \
           "
 # v1.3.0
 SRCREV = "9086c47854652f2731861b40385689c85f12103f"
@@ -15,7 +16,7 @@ S = "${WORKDIR}/git"
 
 do_install() {
 	# Just a bunch of bash scripts to install
-	${S}/install.sh ${D}${prefix}
+	${S}/install.sh ${D}${prefix} ${baselib}
 }
 
 RDEPENDS_${PN} = "bash"
diff --git a/meta-oe/recipes-test/bats/files/0001-install.sh-consider-multilib.patch b/meta-oe/recipes-test/bats/files/0001-install.sh-consider-multilib.patch
new file mode 100644
index 000000000..c7393ca2e
--- /dev/null
+++ b/meta-oe/recipes-test/bats/files/0001-install.sh-consider-multilib.patch
@@ -0,0 +1,43 @@
+From 6e3d01f1ff199383b78a7504858c374fbce05f4e Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Thu, 10 Jun 2021 11:11:07 +0800
+Subject: [PATCH] install.sh: consider multilib
+
+It may install files to /usr/lib64 when multilib is enabled. Add an
+optional parameter for install.sh to support it.
+
+Upstream-Status: Submitted [https://github.com/bats-core/bats-core/pull/452]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ install.sh | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/install.sh b/install.sh
+index e660866..d91159e 100755
+--- a/install.sh
++++ b/install.sh
+@@ -4,6 +4,7 @@ set -e
+ 
+ BATS_ROOT="${0%/*}"
+ PREFIX="$1"
++BASELIB="${2:-lib}"
+ 
+ if [[ -z "$PREFIX" ]]; then
+   printf '%s\n' \
+@@ -12,10 +13,10 @@ if [[ -z "$PREFIX" ]]; then
+   exit 1
+ fi
+ 
+-install -d -m 755 "$PREFIX"/{bin,libexec/bats-core,lib/bats-core,share/man/man{1,7}}
++install -d -m 755 "$PREFIX"/{bin,libexec/bats-core,${BASELIB}/bats-core,share/man/man{1,7}}
+ install -m 755 "$BATS_ROOT/bin"/* "$PREFIX/bin"
+ install -m 755 "$BATS_ROOT/libexec/bats-core"/* "$PREFIX/libexec/bats-core"
+-install -m 755 "$BATS_ROOT/lib/bats-core"/* "$PREFIX/lib/bats-core"
++install -m 755 "$BATS_ROOT/lib/bats-core"/* "$PREFIX/${BASELIB}/bats-core"
+ install -m 644 "$BATS_ROOT/man/bats.1" "$PREFIX/share/man/man1"
+ install -m 644 "$BATS_ROOT/man/bats.7" "$PREFIX/share/man/man7"
+ 
+-- 
+2.17.1
+
-- 
2.17.1

