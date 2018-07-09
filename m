Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2618374813
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 02:37:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w692bKcv007534
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 8 Jul 2018 19:37:21 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Sun, 8 Jul 2018 19:37:20 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 8 Jul 2018 19:37:20 -0700
Message-ID: <20180709023720.15694-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3] mcelog: Upgrade to 159
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
X-List-Received-Date: Mon, 09 Jul 2018 02:37:20 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Licence-Update:
* mcelog.org link changed to https://www.mcelog.org
* Add the package version overridden support as below:
  By default mcelog reports its version as the git tag. This
  can be overridden by setting up a .os_release file in the
  source directory. A build system could write the OS version
  to this file to mark the binary.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-support/mcelog/{mcelog_1.49.bb => mcelog_159.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_1.49.bb => mcelog_159.bb} (89%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_1.49.bb b/meta-oe/recipes-support/mcelog/mcelog_159.bb
similarity index 89%
rename from meta-oe/recipes-support/mcelog/mcelog_1.49.bb
rename to meta-oe/recipes-support/mcelog/mcelog_159.bb
index 84633a76c..236ad7d00 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_1.49.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_159.bb
@@ -9,10 +9,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;
     file://run-ptest \
 "
 
-SRCREV = "2cfdf29b2ef98ccd5ed42cdde8bbe437e0d6412f"
+SRCREV = "2ed5cc0489d20cbffdc6d2e08b1fe49973f0ee34"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://README.md;md5=279840fabb191e6cd9150492d31b0e20"
+LIC_FILES_CHKSUM = "file://README.md;md5=74bb47b9a68850cb398665cf78b31de6"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


