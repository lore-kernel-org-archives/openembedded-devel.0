Return-Path: <Quanyang.Wang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4607F79C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 07:14:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBN7ENRP005137
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Dec 2019 23:14:23 -0800 (PST)
Received: from pek-qwang2-d1.wrs.com (128.224.162.199) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 22 Dec 2019 23:14:22 -0800
From: <quanyang.wang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Dec 2019 15:14:21 +0800
Message-ID: <20191223071421.24530-1-quanyang.wang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] glog: fix do_fetch error
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
X-List-Received-Date: Mon, 23 Dec 2019 07:14:22 -0000
Content-Type: text/plain

From: Quanyang Wang <quanyang.wang@windriver.com>

This fixes the build error as below:
WARNING: glog-0.3.5-r0 do_fetch: Failed to fetch URL git://github.com/google/glog.git;branch=v035, attempting MIRRORS if available
ERROR: glog-0.3.5-r0 do_fetch: Fetcher failure: Unable to find revision a6a166db069520dbbd653c97c2e5b12e08a8bb26 in branch v035 even from upstream
ERROR: glog-0.3.5-r0 do_fetch: Fetcher failure for URL: 'git://github.com/google/glog.git;branch=v035'. Unable to fetch URL from any source.

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
---
 meta-oe/recipes-support/glog/glog_0.3.5.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/glog/glog_0.3.5.bb b/meta-oe/recipes-support/glog/glog_0.3.5.bb
index 3de01ef5b..cd1370c64 100644
--- a/meta-oe/recipes-support/glog/glog_0.3.5.bb
+++ b/meta-oe/recipes-support/glog/glog_0.3.5.bb
@@ -9,14 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
 DEPENDS = "libunwind"
 
 SRC_URI = " \
-    git://github.com/google/glog.git;branch=v035 \
+    git://github.com/google/glog.git;nobranch=1;tag=v0.3.5 \
     file://0001-Rework-CMake-glog-VERSION-management.patch \
     file://0002-Find-Libunwind-during-configure.patch \
     file://0003-installation-path-fix.patch \
 "
 
-SRCREV = "a6a166db069520dbbd653c97c2e5b12e08a8bb26"
-
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.17.1


