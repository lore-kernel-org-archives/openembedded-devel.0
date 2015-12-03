Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1320D6FF9F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2015 08:30:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB38UVV0023911
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Dec 2015 00:30:32 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 3 Dec 2015 00:30:31 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 3 Dec 2015 16:18:48 +0800
Message-ID: <1449130728-4066-5-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1449130728-4066-1-git-send-email-kai.kang@windriver.com>
References: <1449130728-4066-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/4] meta-networking: depends on layer meta-perl
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
X-List-Received-Date: Thu, 03 Dec 2015 08:30:31 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Package mime-construct in layer meta-networking depends on some perl
modules in layer meta-perl. So make meta-networking depends on layer
meta-perl.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 63bb07d..b7fc183 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -16,5 +16,6 @@ LAYERVERSION_networking-layer = "1"
 LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
+LAYERDEPENDS_networking-layer += "perl-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.6.1


