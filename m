Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA96360234
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 15:06:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8RF3qfd025603
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Sep 2018 08:06:20 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 27 Sep 2018 08:05:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 27 Sep 2018 11:04:29 -0400
Message-ID: <1538060669-69466-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1538059505-31813-1-git-send-email-hongxu.jia@windriver.com>
References: <1538059505-31813-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V2] libblockdev: correct PACKAGECONFIG
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
X-List-Received-Date: Thu, 27 Sep 2018 15:06:50 -0000
Content-Type: text/plain

Since commit `6cc057d libblockdev: make various features optional' applied,
it introduced issues:

1. As configure.ac told us, mpath/dm/lvm/lvm-dbus should have the
same depends, runtime depends
[configure.ac]
|AS_IF([test "x$with_dm" != "xno" -o "x$with_lvm" != "xno" -o "x$with_lvm_dbus" != "xno" -o "x$with_mpath" != "xno"],
|      [LIBBLOCKDEV_PKG_CHECK_MODULES([DEVMAPPER], [devmapper >= 1.02.93])],
|      [])
[configure.ac]

2. Remove duplicated PACKAGECONFIG tags `lvm-dbus'

3. Remove `lvm-dbus' from PACKAGECONFIG since recipe lvm2 does not support dbus

4. Align with previous configure options, we should add `mpath'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
index 021f641..35f0cc0 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.18.bb
@@ -19,12 +19,12 @@ S = "${WORKDIR}/git"
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 
-PACKAGECONFIG ??= "python3 lvm dm kmod parted fs escrow btrfs crypto mdraid kbd lvm-dbus"
+PACKAGECONFIG ??= "python3 lvm dm kmod parted fs escrow btrfs crypto mdraid kbd mpath"
 PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
 PACKAGECONFIG[python2] = "--with-python2, --without-python2,,python2"
 PACKAGECONFIG[lvm] = "--with-lvm, --without-lvm, multipath-tools, lvm2"
 PACKAGECONFIG[lvm-dbus] = "--with-lvm_dbus, --without-lvm_dbus, multipath-tools, lvm2"
-PACKAGECONFIG[dm] = "--with-dm, --without-dm"
+PACKAGECONFIG[dm] = "--with-dm, --without-dm, multipath-tools, lvm2"
 PACKAGECONFIG[dmraid] = "--with-dmraid, --without-dmraid"
 PACKAGECONFIG[kmod] = "--with-kbd, --without-kbd, kmod"
 PACKAGECONFIG[parted] = "--with-part, --without-part, parted"
@@ -37,8 +37,7 @@ PACKAGECONFIG[btrfs] = "--with-btrfs,--without-btrfs,libbytesize btrfs-tools"
 PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,cryptsetup nss volume-key"
 PACKAGECONFIG[mdraid] = "--with-mdraid,--without-mdraid,libbytesize"
 PACKAGECONFIG[kbd] = "--with-kbd,--without-kbd,libbytesize"
-PACKAGECONFIG[lvm-dbus] = "--with-lvm_dbus,--without-lvm_dbus"
-PACKAGECONFIG[mpath] = "--with-mpath,--without-mpath"
+PACKAGECONFIG[mpath] = "--with-mpath,--without-mpath, multipath-tools, lvm2"
 
 export GIR_EXTRA_LIBS_PATH="${B}/src/utils/.libs"
 
-- 
2.8.1


