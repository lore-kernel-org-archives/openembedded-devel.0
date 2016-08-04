Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BDDA76536
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Aug 2016 03:42:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u743gSQY014112
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Aug 2016 20:42:28 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Aug 2016 20:42:27 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Aug 2016 23:42:23 -0400
Message-ID: <0e19635f8f456a39a2d1ce19cfb85356e4f9df9e.1470281253.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1470281253.git.jackie.huang@windriver.com>
References: <cover.1470281253.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 1/2] meta-gnome/layer.conf: enable gtk for avahi-ui
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
X-List-Received-Date: Thu, 04 Aug 2016 03:42:30 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

avahi-ui enables gtk3 be default, but gnome-disk-utility
in meta-gnome needs gtk, so add gtk here.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-gnome/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 58e12a9..fce5627 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -13,3 +13,5 @@ BBFILE_PRIORITY_gnome-layer = "7"
 LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer"
+
+AVAHI_GTK_pn-avahi-ui = "gtk gtk3"
-- 
2.8.1


