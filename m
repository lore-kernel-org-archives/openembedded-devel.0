Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D04D7CC95
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 09:39:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1Q9d7Iq009523
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 01:39:38 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Tue, 26 Feb 2019 01:39:33 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Feb 2019 04:38:57 -0500
Message-ID: <20190226093857.133900-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190226093857.133900-1-kai.kang@windriver.com>
References: <20190226093857.133900-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] pv: 1.5.3 -> 1.6.6
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
X-List-Received-Date: Tue, 26 Feb 2019 09:39:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update pv from 1.5.3 to 1.6.6.

* export LDEMULATION for mipsn32 to fix compile error

   MACHINE ?= "qemumips64"
   DEFAULTTUNE = "mips64-n32"

   | mips64-poky-linux-gnun32-ld
   --sysroot=/home/kkang/buildarea/Yocto/build/tmp/work/mips64-n32-poky-linux-gnun32/pv/1.5.3-r0/recipe-sysroot
   -r -o src/library.o  src/library/getopt.o src/library/gettext.o
   | mips64-poky-linux-gnun32-ld: src/library/getopt.o: ABI is incompatible with that of the selected emulation
   | mips64-poky-linux-gnun32-ld: failed to merge target specific data of file src/library/getopt.o
   | mips64-poky-linux-gnun32-ld: src/library/gettext.o: ABI is incompatible with that of the selected emulation
   | mips64-poky-linux-gnun32-ld: failed to merge target specific data of file src/library/gettext.o
   | mips64-poky-linux-gnun32-ld: attempt to do relocatable link with elf32-ntradbigmips input and elf64-tradbigmips output
   | mips64-poky-linux-gnun32-ld: src/library/gettext.o: file class ELFCLASS32 incompatible with ELFCLASS64
   | mips64-poky-linux-gnun32-ld: final link failed: file in wrong format

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/pv/pv_1.5.3.bb | 11 -----------
 meta-oe/recipes-support/pv/pv_1.6.6.bb | 13 +++++++++++++
 2 files changed, 13 insertions(+), 11 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pv/pv_1.5.3.bb
 create mode 100644 meta-oe/recipes-support/pv/pv_1.6.6.bb

diff --git a/meta-oe/recipes-support/pv/pv_1.5.3.bb b/meta-oe/recipes-support/pv/pv_1.5.3.bb
deleted file mode 100644
index 5e3dd67c5..000000000
--- a/meta-oe/recipes-support/pv/pv_1.5.3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Terminal-based tool for monitoring the progress of data through a pipeline"
-
-LICENSE = "Artistic-2.0"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
-
-SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.bz2"
-SRC_URI[md5sum] = "efe8e9e4cad5f3264a32258a63bf2c8e"
-SRC_URI[sha256sum] = "76f3999b1c3b3027163dce6ef667cdf8dafb75218ee25e54a03bfe590478f90e"
-
-inherit autotools
-
diff --git a/meta-oe/recipes-support/pv/pv_1.6.6.bb b/meta-oe/recipes-support/pv/pv_1.6.6.bb
new file mode 100644
index 000000000..9649555b8
--- /dev/null
+++ b/meta-oe/recipes-support/pv/pv_1.6.6.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Terminal-based tool for monitoring the progress of data through a pipeline"
+
+LICENSE = "Artistic-2.0"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
+
+SRC_URI = "http://www.ivarch.com/programs/sources/${BP}.tar.bz2"
+SRC_URI[md5sum] = "ff3564fddcc2b9bd4a9c1d143aba4b4c"
+SRC_URI[sha256sum] = "608ef935f7a377e1439c181c4fc188d247da10d51a19ef79bcdee5043b0973f1"
+
+inherit autotools
+
+LDEMULATION_mipsarchn32 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'elf32btsmipn32', 'elf32ltsmipn32', d)}"
+export LDEMULATION
-- 
2.20.0


