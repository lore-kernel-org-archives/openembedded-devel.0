Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D625B60796
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 09:04:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBO94xw3018740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Dec 2015 01:04:59 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 01:04:58 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Dec 2015 16:51:56 +0800
Message-ID: <1450947116-25359-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] libtalloc: fix SRC_URI
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
X-List-Received-Date: Thu, 24 Dec 2015 09:05:00 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to fetch source of libtalloc:

| ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
| https://www.samba.org/ftp/libtalloc/talloc-2.1.3.tar.gz:
| 2015-12-21 10:22:09 ERROR 404: Not Found.

Fix it by replace ${BPN} with original package name talloc.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-support/libtalloc/libtalloc_2.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.3.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.3.bb
index f24d376..db6560a 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.3.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.3.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-3.0+ & GPL-3.0+"
 
 DEPENDS += "libbsd"
 
-SRC_URI = "http://samba.org/ftp/${BPN}/talloc-${PV}.tar.gz"
+SRC_URI = "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
                     file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
 
-- 
2.6.1


