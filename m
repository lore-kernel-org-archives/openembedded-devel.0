Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC6474242
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:06:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8OB6Q4Z013744
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 04:06:26 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 24 Sep 2015 04:06:26 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Sep 2015 07:06:25 -0400
Message-ID: <1443092785-217209-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] gd: cleanup buildpaths from gdlib.pc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Sep 2015 11:06:26 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* gdlib.pc:
  -L/path/to/tmp/sysroots/qemux86-64/usr/lib64 -> -L/usr/lib64

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-support/gd/gd_2.1.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/gd/gd_2.1.1.bb b/meta-oe/recipes-support/gd/gd_2.1.1.bb
index 62008df..85c7e6a 100644
--- a/meta-oe/recipes-support/gd/gd_2.1.1.bb
+++ b/meta-oe/recipes-support/gd/gd_2.1.1.bb
@@ -32,6 +32,11 @@ EXTRA_OECONF += " --disable-rpath \
 
 EXTRA_OEMAKE = 'LDFLAGS="${LDFLAGS}"'
 
+do_install_append() {
+	# cleanup buildpaths from gdlib.pc
+	sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${libdir}/pkgconfig/gdlib.pc
+}
+
 PACKAGES += "${PN}-tools"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-- 
1.9.1


