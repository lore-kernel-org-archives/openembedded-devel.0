Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2AEF860053
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 14:39:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8AEclqJ019506
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Sep 2018 07:39:18 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 10 Sep 2018 07:38:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 10 Sep 2018 22:48:46 +0800
Message-ID: <1536590926-25893-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libpwquality: clean up python3-libpwquality
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
X-List-Received-Date: Mon, 10 Sep 2018 14:39:43 -0000
Content-Type: text/plain

Since `8d3d529 libpwquality: Inherit distutils3-base' applied, sub
package python3-libpwquality was merged into package libpwquality.

So clean up obsolete python3-libpwquality definition.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
index 7e82bd6..9fb25cd 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
@@ -16,8 +16,7 @@ UPSTREAM_CHECK_URI = "https://github.com/libpwquality/libpwquality/releases"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-DEPENDS = "cracklib virtual/gettext python3"
-RDEPENDS_python3-libpwquality = "${PN}"
+DEPENDS = "cracklib virtual/gettext"
 
 inherit autotools distutils3-base gettext
 
@@ -26,8 +25,6 @@ B = "${S}"
 export PYTHON_DIR
 export BUILD_SYS
 export HOST_SYS
-export STAGING_LIBDIR
-export STAGING_INCDIR
 
 EXTRA_OECONF += "--with-python-rev=${PYTHON_BASEVERSION} \
                  --with-python-binary=${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
@@ -38,10 +35,7 @@ EXTRA_OECONF += "--with-python-rev=${PYTHON_BASEVERSION} \
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam"
 
-PACKAGES += "python3-libpwquality python3-libpwquality-dbg"
 FILES_${PN} += "${libdir}/security/pam_pwquality.so"
 FILES_${PN}-dbg += "${libdir}/security/.debug"
 FILES_${PN}-staticdev += "${libdir}/security/pam_pwquality.a"
 FILES_${PN}-dev += "${libdir}/security/pam_pwquality.la"
-FILES_python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
-FILES_python3-${PN}-dbg = "${PYTHON_SITEPACKAGES_DIR}/.debug"
-- 
2.7.4


