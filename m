Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A8C0E601E9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 02:39:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,562,1574092800"; d="scan'208";a="86439527"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 10:39:08 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 3DD7D50A9990
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 10:29:02 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 10:39:05 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 17 Mar 2020 10:39:04 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Mar 2020 10:41:31 +0800
Message-ID: <20200317024131.31570-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 3DD7D50A9990.A8EDA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-oe] [PATCH] sdparm: upgrade 1.10 -> 1.11
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
X-List-Received-Date: Tue, 17 Mar 2020 02:39:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

-Refresh the following patch:
	files/make-sysroot-work.patch

-License-Update: Copyright year updated to 2019 and removed the
following description：

 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/sdparm/files/make-sysroot-work.patch    | 4 ++--
 .../sdparm/{sdparm_1.10.bb => sdparm_1.11.bb}               | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/sdparm/{sdparm_1.10.bb => sdparm_1.11.bb} (78%)

diff --git a/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch b/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch
index 3fd85d9e2..f58091ad7 100644
--- a/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch
+++ b/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch
@@ -17,13 +17,13 @@ diff --git a/src/Makefile.am b/src/Makefile.am
 index 61dd9f8..42c911f 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -41,7 +41,7 @@ sglib_SOURCES =		../lib/sg_lib.c \
+@@ -53,7 +53,7 @@ sglib_SOURCES =		../lib/sg_lib.c \
  			../lib/sg_pt_common.c
  
  if HAVE_SGUTILS
 -INCLUDES = -I/scsi
 +INCLUDES = -I=@includedir@/scsi
- sdparm_LDADD = @GETOPT_O_FILES@ @os_libs@ @SGUTILS_LIBS@
+ sdparm_LDADD = @GETOPT_O_FILES@ @SGUTILS_LIBS@
  sdparm_DEPENDENCIES = @GETOPT_O_FILES@
  else
 -- 
diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.10.bb b/meta-oe/recipes-support/sdparm/sdparm_1.11.bb
similarity index 78%
rename from meta-oe/recipes-support/sdparm/sdparm_1.10.bb
rename to meta-oe/recipes-support/sdparm/sdparm_1.11.bb
index c09b495be..7fc87db2b 100644
--- a/meta-oe/recipes-support/sdparm/sdparm_1.10.bb
+++ b/meta-oe/recipes-support/sdparm/sdparm_1.11.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://sg.danny.cz/sg/sdparm.html"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecab6c36b7ba82c675581dd0afde36f7 \
-                    file://lib/BSD_LICENSE;md5=1d52f4a66f1e0ed96776bf354ab7a2ed"
+                    file://lib/BSD_LICENSE;md5=12cde17a04c30dece2752f36b7192c64"
 DEPENDS="sg3-utils"
 SRC_URI = "http://sg.danny.cz/sg/p/${BPN}-${PV}.tgz \
            file://make-sysroot-work.patch \
@@ -17,8 +17,8 @@ UPSTREAM_CHECK_REGEX = "sdparm-(?P<pver>\d+(\.\d+)+)\.tgz"
 PACKAGES =+ "${PN}-scripts"
 RDEPENDS_${PN}-scripts += "bash ${PN}"
 
-SRC_URI[md5sum] = "bdae64375376ce8fe4bf9521c1db858f"
-SRC_URI[sha256sum] = "1ea1ed1bb1ee2aef62392618fa42da9ed027d5e655f174525c39235778292ab3"
+SRC_URI[md5sum] = "cd998d1c12a4ec11652d0af580f06b4d"
+SRC_URI[sha256sum] = "432fdbfe90f0c51640291faf7602489b0ae56dfb96d0c02ed02308792adc7fb0"
 
 inherit autotools
 
-- 
2.20.1




