Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F42560781
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 09:26:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3N9QU5S026552
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 02:26:30 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 23 Apr 2014 02:26:30 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Apr 2014 05:26:26 -0400
Message-ID: <1398245186-27365-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] collectd: add threshold.so, load.so and disk.so in PRIVATE_LIBS
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
X-List-Received-Date: Wed, 23 Apr 2014 09:26:33 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

to avoid the folloing warnings:
log.world.20140418_190059.log/bitbake.log:WARNING: gegl-0.2.0 was registered as shlib provider for load.so, changing it to collectd-5.2.2 because it was built later
log.world.20140418_190059.log/bitbake.log:WARNING:
libgphoto2-camlibs-2.4.11 was registered as shlib provider for disk.so, changing it to collectd-5.2.2 because it was built later
log.world.20140418_190059.log/bitbake.log:WARNING: gegl-0.2.0 was registered as shlib provider for threshold.so, changing it to
collectd-5.2.2 because it was built later

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-extended/collectd/collectd_5.2.2.bb    |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
index 7cb41b9..8585ff3 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
@@ -56,3 +56,6 @@ do_install_append() {
 INITSCRIPT_NAME = "collectd"
 INITSCRIPT_PARAMS = "defaults"
 
+# threshold.so load.so are also provided by gegl
+# disk.so is also provided by libgphoto2-camlibs
+PRIVATE_LIBS = "threshold.so load.so disk.so"
-- 
1.7.9.5


