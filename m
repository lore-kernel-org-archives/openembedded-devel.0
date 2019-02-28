Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 38B737C4BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 08:21:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1S8K2ED016662
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 00:21:04 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 28 Feb 2019 00:20:53 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Feb 2019 03:20:49 -0500
Message-ID: <20190228082049.156017-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] xmlrpc-c: inherit binconfig
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
X-List-Received-Date: Thu, 28 Feb 2019 08:21:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

libreport calls xmlrpc-c-config from package xmlrpc-c-native to get
cflags and libs. But it gets dirs in ${STAGING_DIR_NATIVE} which make
lib32-libreport compile failed with config:

  require conf/multilib.conf
  MACHINE = "qemuarm64"
  MULTILIBS = "multilib:lib32"
  DEFAULTTUNE_virtclass-multilib-lib32 = "armv7vethf"

| arm-wrs-linux-gnueabi-libtool: link: (cd ".libs" && rm -f "libabrt_dbus.so"
  && ln -s "libabrt_dbus.so.0.0.1" "libabrt_dbus.so")
| .../tmp-glibc/work/armv5e-wrs-linux-gnueabi/libreport/2.9.7-r0/recipe-sysroot-native/usr/lib/libxml2.so:
  file not recognized: file format not recognized
| collect2: error: ld returned 1 exit status
| make[3]: *** [Makefile:780: libreport-web.la] Error 1

Make xmlrpc-c inherit binconfig to avoid such kind of errors.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
index 02ea8cc5f..524263760 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.51.03.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/git/stable"
 DEPENDS = "libxml2"
 RDEPENDS_${PN} = "perl"
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep binconfig pkgconfig
 
 TARGET_CFLAGS += "-Wno-narrowing"
 
-- 
2.20.0


