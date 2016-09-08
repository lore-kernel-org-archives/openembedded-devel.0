Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B03C3731BE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Sep 2016 02:28:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u882SMCc023303
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Sep 2016 19:28:22 -0700 (PDT)
Received: from yow-rmacleod-lx3.wrs.com (128.224.56.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 7 Sep 2016 19:28:21 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Sep 2016 22:25:34 -0400
Message-ID: <1473301534-32004-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe] zile: uprev from 2.4.9 to 2.4.11 and add acl support
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
X-List-Received-Date: Thu, 08 Sep 2016 02:28:23 -0000
Content-Type: text/plain

Add support for the acl DISTRO_FEATURE using PACKAGECONFIG
Inherit pkgconfig since zile-2.4.11 uses that to find bdwgc (aka libgc).

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../recipes-support/zile/{zile_2.4.9.bb => zile_2.4.11.bb}    | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/zile/{zile_2.4.9.bb => zile_2.4.11.bb} (47%)

diff --git a/meta-oe/recipes-support/zile/zile_2.4.9.bb b/meta-oe/recipes-support/zile/zile_2.4.11.bb
similarity index 47%
rename from meta-oe/recipes-support/zile/zile_2.4.9.bb
rename to meta-oe/recipes-support/zile/zile_2.4.11.bb
index 2551a80..b3f1918 100644
--- a/meta-oe/recipes-support/zile/zile_2.4.9.bb
+++ b/meta-oe/recipes-support/zile/zile_2.4.11.bb
@@ -9,7 +9,12 @@ SRC_URI = "http://ftp.gnu.org/gnu/zile/${BP}.tar.gz \
            file://remove-help2man.patch \
 "
 
-SRC_URI[md5sum] = "84a0af58fb4fbe3af16bde2ef2b8f5ae"
-SRC_URI[sha256sum] = "c71959c7aca02ac66be526ecccbc7954fb0ea7591ed3c13311a95e8f040b0049"
+SRC_URI[md5sum] = "7a460ccec64e3bec2835697b2eae533c"
+SRC_URI[sha256sum] = "1fd27bbddc61491b1fbb29a345d0d344734aa9e80cfa07b02892eedf831fa9cc"
 
-inherit autotools
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}"
+
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
-- 
1.9.1


