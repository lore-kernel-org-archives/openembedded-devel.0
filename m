Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E7FAF7456D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 05:24:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9G5OpJd008350
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Oct 2018 22:24:52 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 15 Oct 2018 22:24:51 -0700
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Oct 2018 22:24:51 -0700
Message-ID: <20181016052451.49822-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] cpupower: Update LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 16 Oct 2018 05:24:52 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Update LIC_FILES_CHKSUM for cpupower as
the COPYING file which is used for LIC_FILES_CHKSUM
has been changed in below commit:
commit bf02d491237eea10290bd379bf7fc8c37ac6c3b4
Author: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Date:   Fri Mar 23 06:51:06 2018 -0300

    COPYING: use the new text with points to the license files

    Now that we have a new COPYING file with points to the
    Linux license files, replace it with the old content.

    This patch does:
     1 file changed, 0 insertions(+), 0 deletions(-)
     rename COPYING.new => COPYING (100%)

    Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
    Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
    Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-kernel/cpupower/cpupower.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index 4abd273fa..4544f5b2e 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -2,7 +2,7 @@ SUMMARY = "Shows and sets processor power related values"
 DESCRIPTION = "cpupower is a collection of tools to examine and tune power \
 saving related features of your processor."
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 DEPENDS = "pciutils gettext-native"
 PROVIDES = "virtual/cpupower"
 
-- 
2.17.1


