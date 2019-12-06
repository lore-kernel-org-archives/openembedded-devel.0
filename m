Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53BBB7D41F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 08:21:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xB68LJdl012044
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 6 Dec 2019 00:21:19 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 6 Dec 2019 00:21:18 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
Date: Fri, 6 Dec 2019 16:21:00 +0800
Message-ID: <20191206082100.14071-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206082100.14071-1-kai.kang@windriver.com>
References: <20191206082100.14071-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 2/2] exo: 0.12.9 -> 0.12.10
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
X-List-Received-Date: Fri, 06 Dec 2019 08:21:19 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade exo from 0.12.9 to 0.12.10.

Release notes:
* Bug Fixes:
  - Fix typeahead search regression (Xfce #16191)
* Translation Updates: Spanish

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-xfce/recipes-xfce/exo/{exo_0.12.9.bb => exo_0.12.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.9.bb => exo_0.12.10.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.9.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.10.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/exo/exo_0.12.9.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.12.10.bb
index 8d59be13b..246504b6d 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.9.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.10.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "9730f9d270b4968a8bbebe73e6de934f"
-SRC_URI[sha256sum] = "9ba0bf0fd59aeb1cd32ae3863e7a78222655eb15eb675ba08f3b3fb933b6fbfe"
+SRC_URI[md5sum] = "ef1db71eb24cf24f6870444ccfc2345d"
+SRC_URI[sha256sum] = "848fd65175118786e994fcf8b28f8c804f58d21cc9d961e00897cd97dc257cac"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG_class-target ??= "gtk"
-- 
2.17.1


