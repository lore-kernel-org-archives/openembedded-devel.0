Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E692874803
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 06:27:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4O6Rgos016100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 May 2018 23:27:42 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 23 May 2018 23:27:41 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <schnitzeltony@googlemail.com>
Date: Thu, 24 May 2018 14:27:39 +0800
Message-ID: <1527143259-6532-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-multimedia][PATCH] meta-multimedia: update LAYERDEPENDS
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
X-List-Received-Date: Thu, 24 May 2018 06:27:43 -0000
Content-Type: text/plain

Add meta-oe as LAYERDEPENDS to fix ParseError:
meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb:13:
Could not inherit file classes/dos2unix.bbclass

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-multimedia/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index cfedf2f..24d7a6d 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -28,5 +28,6 @@ BBFILE_PRIORITY_multimedia-layer = "6"
 LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core"
+LAYERDEPENDS_multimedia-layer += "openembedded-layer"
 
 LAYERSERIES_COMPAT_multimedia-layer = "sumo"
-- 
2.7.4


