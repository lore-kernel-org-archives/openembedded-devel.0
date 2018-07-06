Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E4669787B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 08:41:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w668fDw3021147
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Jul 2018 01:41:14 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 6 Jul 2018 01:41:13 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Jul 2018 01:41:13 -0700
Message-ID: <20180706084113.95133-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] mcelog: Upgrade to 159
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
X-List-Received-Date: Fri, 06 Jul 2018 08:41:13 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Update LIC_FILES_CHKSUM as license file README.md
updated as below:

diff a.orig/README.md a/README.md

< see [mcelog.org](http://www.mcelog.org).
---
> see [mcelog.org](https://www.mcelog.org).
56a57,60
>
> By default mcelog reports its version as the git tag. This can be overridden
> by setting up a .os_release file in the source directory. A build system
> could write the OS version to this file to mark the binary.

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


