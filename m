Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA587F30F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 08:03:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7U82vgj004856
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 01:03:08 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 30 Aug 2019 01:02:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Aug 2019 01:02:46 -0700
Message-ID: <20190830080246.46005-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netcf: Fix Manifest not found issue
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
X-List-Received-Date: Fri, 30 Aug 2019 08:03:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixed:
$ bitbake netcf
WARNING: netcf-0.2.8+gitAUTOINC+2c5d425585-r0 do_package: Manifest /path/sstate-control/manifest-x86_64_x86_64-nativesdk-gnulib.packagedata not found in intel_x86_64 corei7-64 core2-64 x86_64 allarch x86_64_x86_64-nativesdk (variant '')?

This is because gnulib has no related tasks:
do_package[noexec] = "1"
do_packagedata[noexec] = "1"
deltask package_write_ipk
deltask package_write_deb
deltask package_write_rpm
deltask do_deploy_archives

Depends on gnulib:do_populate_sysroot explicitly to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-support/netcf/netcf_0.2.8.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
index a4a9c91c6..0f49d6060 100644
--- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
+++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
@@ -14,7 +14,9 @@ SRC_URI = "git://pagure.io/netcf.git;protocol=https \
 
 UPSTREAM_CHECK_GITTAGREGEX = "release-(?P<pver>(\d+(\.\d+)+))"
 
-DEPENDS += "augeas libnl libxslt libxml2 gnulib"
+DEPENDS += "augeas libnl libxslt libxml2"
+
+do_configure[depends] += "gnulib:do_populate_sysroot"
 
 S = "${WORKDIR}/git"
 
-- 
2.21.0


