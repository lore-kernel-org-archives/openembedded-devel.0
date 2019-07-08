Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23D8F7D1E9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 01:55:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x681sifo031776
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Jul 2019 18:54:54 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 7 Jul 2019 18:54:33 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Jul 2019 09:52:36 +0800
Message-ID: <20190708015236.42034-2-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20190708015236.42034-1-yongxin.liu@windriver.com>
References: <20190708015236.42034-1-yongxin.liu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 2/2] ndctl: v63 -> v65
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
X-List-Received-Date: Mon, 08 Jul 2019 01:55:19 -0000
Content-Type: text/plain

Add keyutils to DEPENDS.
Set FILES to package /usr/share/daxctl/daxctl.conf.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta-oe/recipes-core/ndctl/{ndctl_v63.bb => ndctl_v65.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/ndctl/{ndctl_v63.bb => ndctl_v65.bb} (88%)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v63.bb b/meta-oe/recipes-core/ndctl/ndctl_v65.bb
similarity index 88%
rename from meta-oe/recipes-core/ndctl/ndctl_v63.bb
rename to meta-oe/recipes-core/ndctl/ndctl_v65.bb
index 2f299b1ba..69ee1d476 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v63.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v65.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
 
 inherit autotools-brokensep pkgconfig bash-completion systemd
 
-SRCREV = "cb2d678dd6d286dd96d31548c32449a8b883ae32"
+SRCREV = "ed17fd14608d8de072c8c090ffc5fcf78c4f48ff"
 SRC_URI = "git://github.com/pmem/ndctl.git"
 
-DEPENDS = "kmod udev json-c"
+DEPENDS = "kmod udev json-c keyutils"
 
 S = "${WORKDIR}/git"
 
@@ -28,3 +28,5 @@ do_configure_prepend() {
 
 SYSTEMD_SERVICE_${PN} = "ndctl-monitor.service"
 SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+
+FILES_${PN} += "${datadir}/daxctl/daxctl.conf"
-- 
2.14.4


