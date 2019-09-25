Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66CEE7E269
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:36:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8P9a973000828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:36:09 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 02:36:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2019 17:35:37 +0800
Message-ID: <fe791155a0b0577ed40322093d4259f237f0f0b6.1569403988.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569403988.git.liezhi.yang@windriver.com>
References: <cover.1569403988.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] keyutils: Fix installed-vs-shipped for nativesdk
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
X-List-Received-Date: Wed, 25 Sep 2019 09:36:08 -0000
Content-Type: text/plain

Fixed:
$ bitbake nativesdk-keyutils
ERROR: nativesdk-keyutils-1.6-r0 do_package: QA Issue: nativesdk-keyutils: Files/directories were installed but not shipped in any package:
  /usr
  /etc
  /usr/share
  /usr/share/man
  /usr/share/keyutils
  [snip]
  /etc/request-key.conf
  /etc/request-key.d

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-security/keyutils/keyutils_1.6.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.bb
index dca86f3..572143a 100644
--- a/meta-oe/recipes-security/keyutils/keyutils_1.6.bb
+++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.bb
@@ -40,6 +40,18 @@ do_install () {
     oe_runmake DESTDIR=${D} install
 }
 
+do_install_append_class-nativesdk() {
+    install -d ${D}${datadir}
+    src_dir="${D}${target_datadir}"
+    mv $src_dir/* ${D}${datadir}
+    par_dir=`dirname $src_dir`
+    rmdir $src_dir $par_dir
+
+    install -d ${D}${sysconfdir}
+    mv ${D}/etc/* ${D}${sysconfdir}/
+    rmdir ${D}/etc
+}
+
 do_install_ptest () {
     cp -r ${S}/tests ${D}${PTEST_PATH}/
     sed -i -e 's/OSDIST=Unknown/OSDIST=${DISTRO}/' ${D}${PTEST_PATH}/tests/prepare.inc.sh
-- 
2.7.4


