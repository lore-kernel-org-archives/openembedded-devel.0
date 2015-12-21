Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC396FFEA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2015 08:37:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBL8b7JT003717
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 21 Dec 2015 00:37:07 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 21 Dec 2015 00:37:06 -0800
From: <kai.kang@windriver.com>
To: <Martin.Jansa@gmail.com>
Date: Mon, 21 Dec 2015 16:24:14 +0800
Message-ID: <1450686254-23383-3-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1450686254-23383-1-git-send-email-kai.kang@windriver.com>
References: <1450686254-23383-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] Revert "meta-networking: depends on layer meta-perl"
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
X-List-Received-Date: Mon, 21 Dec 2015 08:37:11 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

This reverts commit d896712df00b7126b81d4cb123d27c1509ac9cc4.

Package mime-construct which involves the layer dependency has been
moved from layer meta-networking to meta-perl. So revert the dependency.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/conf/layer.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index b7fc183..63bb07d 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -16,6 +16,5 @@ LAYERVERSION_networking-layer = "1"
 LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
-LAYERDEPENDS_networking-layer += "perl-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.6.1


