Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DCDE7FCD6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 09:00:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBJ8xlYG024497
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 01:00:07 -0800
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 19 Dec 2019 00:59:39 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Dec 2019 16:59:12 +0800
Message-ID: <20191219085912.139105-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [meta-networking][PATCH] openl2tp: Update SRC_URI for "Failed to fetch URL" warning
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
X-List-Received-Date: Thu, 19 Dec 2019 09:00:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update SRC_URI for solving below warning:
WARNING: openl2tp-1.8-r0 do_fetch: Failed to fetch URL
ftp://ftp.openl2tp.org/releases/openl2tp-1.8/openl2tp-1.8.tar.gz,
attempting MIRRORS if available

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 90e8b111d..38d0554e1 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9d9259cbbf00945adc25a470c1d3585 \
 
 DEPENDS = "popt flex readline rpcsvc-proto-native bison-native"
 
-SRC_URI = "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
+SRC_URI = "https://sourceforge.net/projects/openl2tp/files/openl2tp/${PV}/${BP}.tar.gz \
            file://Makefile-modify-CFLAGS-to-aviod-build-error.patch \
            file://openl2tp-simplify-gcc-warning-hack.patch \
            file://Makefile-obey-LDFLAGS.patch \
-- 
2.23.0


