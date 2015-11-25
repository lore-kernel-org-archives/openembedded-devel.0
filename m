Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 623A56011F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 08:28:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAP8S01K025009
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2015 00:28:00 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 25 Nov 2015 00:27:59 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Nov 2015 16:27:58 +0800
Message-ID: <1448440079-4533-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] iscsitarget: split the kernel module into separate package
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
X-List-Received-Date: Wed, 25 Nov 2015 08:28:03 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

inherit module instead of module-base, so the module is
split into kernel-module-iscsi-trgt and make PN rdepends
on it.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb                 | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index c96810b..9d49759 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -15,10 +15,7 @@ SRC_URI = "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/${BPN}_${P
 SRC_URI[md5sum] = "ef9bc823bbabd3c772208c00d5f2d089"
 SRC_URI[sha256sum] = "d3196ccb78a43266dce28587bfe30d8ab4db7566d7bce96057dfbb84100babb5"
 
-inherit module-base
-
-# Add make_scripts task to create kernel scripts
-addtask make_scripts after do_patch before do_compile
+inherit module
 
 do_configure[noexec] = "1"
 
@@ -26,9 +23,6 @@ do_configure[noexec] = "1"
 # kernel scripts
 do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
 
-# Make sure we don't have race condition against "make scripts"
-do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-
 do_compile() {
     oe_runmake KSRC=${STAGING_KERNEL_DIR} CFLAGS='${CFLAGS}' LDFLAGS='' \
     CC="${CC}" V=1
@@ -56,7 +50,7 @@ do_install() {
 }
 
 FILES_${PN} += "${sbindir} \
-                /lib \
                 ${sysconfdir}"
 
+RDEPENDS_${PN} = "kernel-module-iscsi-trgt"
 RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
-- 
2.3.5


