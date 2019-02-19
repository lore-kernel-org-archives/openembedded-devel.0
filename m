Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D3C87C78B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 03:19:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1J3Jb5k013588
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2019 19:19:47 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Mon, 18 Feb 2019 19:19:26 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Feb 2019 11:19:25 +0800
Message-ID: <1550546365-305659-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] xdebug: upgrade 2.6.1 -> 2.7.0RC2
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
X-List-Received-Date: Tue, 19 Feb 2019 03:19:57 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

License-Update: Change http://xdebug.org to https://xdebug.org everywhere

php upgrade to 3.7.2, 2.6.1 not support php 3.x, need
upgrade to 2.7 which support php 3.x.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-php/xdebug/{xdebug_2.6.1.bb => xdebug_2.7.0RC2.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_2.6.1.bb => xdebug_2.7.0RC2.bb} (79%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.6.1.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.7.0RC2.bb
similarity index 79%
rename from meta-webserver/recipes-php/xdebug/xdebug_2.6.1.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_2.7.0RC2.bb
index 773dbf3..7be62cb 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.6.1.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.7.0RC2.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Debugging and profiling extension for PHP"
 LICENSE = "Xdebug"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=34df3a274aa12b795417c65634c07f16"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=92d94a330d34ee6edc2638450736f119"
 
 DEPENDS = "php re2c-native"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[md5sum] = "35cc0f2e8b7d40556a9ad9afd9c49aee"
-SRC_URI[sha256sum] = "dae691d6c052073b886e0c6e1306a707bca9fd18a1e3485384ef6c4aacf1bd77"
+SRC_URI[md5sum] = "e8cabe003d6990b157d0d8caee374844"
+SRC_URI[sha256sum] = "5aa6d1772937e9f11b91ad8ced586aa0e16281dc178c405ac380d45d4731f8b0"
 
 UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-- 
2.7.4


