Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8172265CBA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2016 08:30:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8M8ULlT016731
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2016 01:30:21 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Sep 2016 01:30:20 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Sep 2016 16:13:06 +0800
Message-ID: <20160922081306.23381-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mpich: fix QA issue and remove blacklist
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
X-List-Received-Date: Thu, 22 Sep 2016 08:30:25 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Remove the reference of S from .la and DEBUG_PREFIX_MAP
from .pc file to avoid QA issues.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
index ead1f61..1dee6bd 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.1.1.bb
@@ -36,5 +36,7 @@ do_configure_prepend() {
     exit
 }
 
-# http://errors.yoctoproject.org/Errors/Details/35146/
-PNBLACKLIST[mpich] ?= "BROKEN: QA Issue: libmpi.la failed sanity test (workdir), QA Issue: mpich.pc failed sanity test (tmpdir)"
+do_install_append() {
+    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
+    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
+}
-- 
2.8.3


