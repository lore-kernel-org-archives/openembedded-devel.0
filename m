Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B8B37850C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 03:14:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA93E4Fq020036
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Nov 2017 19:14:05 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 8 Nov 2017 19:14:04 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Nov 2017 11:12:29 +0800
Message-ID: <20171109031229.21299-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] xfce4-screenshooter: create src dir before build
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
X-List-Received-Date: Thu, 09 Nov 2017 03:14:04 -0000
Content-Type: text/plain

From: Catalin Enache <catalin.enache@windriver.com>

In some case the output directory for xfce4-screenshooter.appdata.xml file
doesn't exist.

Create directory before build.

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
index 06dea64b3..e449dceed 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
@@ -12,6 +12,7 @@ SRC_URI[sha256sum] = "e62b31d9cf06a7414a26400c2ebe7a2ae7c2b22aa60f997f25145ea9eb
 
 do_compile_prepend() {
     mkdir -p lib
+    mkdir -p src
 }
 
 FILES_${PN} += " \
-- 
2.11.0


