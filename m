Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB44772DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 10:04:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tADA4MWh021732
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 13 Nov 2015 02:04:22 -0800
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 02:04:22 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Nov 2015 18:04:12 +0800
Message-ID: <1447409052-30874-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] meta-xfce/layer: explicitly set networkmanager to NETWORK_MANAGER
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
X-List-Received-Date: Fri, 13 Nov 2015 10:04:27 -0000
Content-Type: text/plain

The NETWORK_MANAGER is connman-gnome in oe-core by default,
which conflicts with networkmanager. And networkmanager is
required by xfce4-power-manager in meta-xfce. So we explicitly
set networkmanager to NETWORK_MANAGER for meta-xfce.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-xfce/conf/layer.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 55bcef6..e38d85d 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -17,3 +17,6 @@ LAYERDEPENDS_xfce-layer += "openembedded-layer"
 LAYERDEPENDS_xfce-layer += "gnome-layer"
 LAYERDEPENDS_xfce-layer += "openembedded-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
+
+# It is required by xfce4-power-manager
+NETWORK_MANAGER = "networkmanager"
-- 
1.9.1


