Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B71D97D278
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 06:41:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x686fItj007273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Jul 2019 23:41:18 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 7 Jul 2019 23:41:17 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Jul 2019 14:38:57 +0800
Message-ID: <20190708063901.13914-5-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20190708063901.13914-1-yongxin.liu@windriver.com>
References: <20190708063901.13914-1-yongxin.liu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3 5/9] keyutils: fix QA WARNING
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
X-List-Received-Date: Mon, 08 Jul 2019 06:41:16 -0000
Content-Type: text/plain

From: Armin Kuster <akuster808@gmail.com>

WARNING: keyutils-1.6-r0 do_package: QA Issue: keyutils: Files/directories were installed but not shipped in any package:
  /lib/pkgconfig
  /lib/pkgconfig/libkeyutils.pc

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 keyutils_1.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/keyutils_1.6.bb b/keyutils_1.6.bb
index 730e1741e..054e0c139 100644
--- a/keyutils_1.6.bb
+++ b/keyutils_1.6.bb
@@ -35,6 +35,7 @@ EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} -Wall' \
     "
 
 do_install () {
+    install -d ${D}/${nonarch_base_libdir}/pkgconfig
     oe_runmake DESTDIR=${D} install
 }
 
@@ -43,4 +44,6 @@ do_install_ptest () {
     sed -i -e 's/OSDIST=Unknown/OSDIST=${DISTRO}/' ${D}${PTEST_PATH}/tests/prepare.inc.sh
 }
 
+FILES_${PN}-dev += "${nonarch_base_libdir}/pkgconfig/libkeyutils.pc"
+
 RDEPENDS_${PN}-ptest += "glibc-utils lsb"
-- 
2.14.4


