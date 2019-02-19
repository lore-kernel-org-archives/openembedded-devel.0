Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E0727C78B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 03:21:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1J3KxP8013616
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2019 19:21:09 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Mon, 18 Feb 2019 19:20:48 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Feb 2019 11:20:47 +0800
Message-ID: <1550546447-307031-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ndctl: disable ndctl-monitor service by default
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
X-List-Received-Date: Tue, 19 Feb 2019 03:21:18 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

ndctl-monitor service will start failed if there is no
nvdimm device like on qemux86, so disable it by default,
user can enable it if their machine support this device.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-core/ndctl/ndctl_v63.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v63.bb b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
index 0c62743..1f3abf5 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v63.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v63.bb
@@ -27,3 +27,4 @@ do_configure_prepend() {
 }
 
 SYSTEMD_SERVICE_${PN} = "ndctl-monitor.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
-- 
2.7.4


