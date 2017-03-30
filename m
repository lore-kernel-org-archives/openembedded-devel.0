Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3795077BDE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:49:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2U8nq02015611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:49:52 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 30 Mar 2017 01:49:52 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Mar 2017 04:49:51 -0400
Message-ID: <1490863791-130455-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] xdebug: 2.2.6 -> 2.5.1
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
X-List-Received-Date: Thu, 30 Mar 2017 08:49:52 -0000
Content-Type: text/plain

Upgrade the xdebug to fix the build failure with php 7.1

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../recipes-php/xdebug/{xdebug_2.2.6.bb => xdebug_2.5.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_2.2.6.bb => xdebug_2.5.1.bb} (85%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.2.6.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
similarity index 85%
rename from meta-webserver/recipes-php/xdebug/xdebug_2.2.6.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
index 1ecac88..e2a1fb4 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.2.6.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
@@ -6,8 +6,8 @@ DEPENDS = "php"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[md5sum] = "f216356861e27284580d0208060ea7fa"
-SRC_URI[sha256sum] = "6dd1cba0605e75009331aa3625a19ef49ade5a75aa9fe2ff8a818108d2cce84e"
+SRC_URI[md5sum] = "6167b1e104f1108d77f08eb561a12b22"
+SRC_URI[sha256sum] = "7fda9020fd5a2c549ae5a692fcabbb00f74e39dda81d53d25e622bdab4880ec2"
 
 inherit autotools
 
-- 
2.8.1


