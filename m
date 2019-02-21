Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D74C57CB45
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 02:02:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1L22kkt016053
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 18:02:46 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 18:02:45 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Feb 2019 10:02:17 +0800
Message-ID: <1550714538-415016-5-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550714538-415016-1-git-send-email-changqing.li@windriver.com>
References: <1550714538-415016-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/5] unixodbc: upgrade 2.3.6 -> 2.3.7
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
X-List-Received-Date: Thu, 21 Feb 2019 02:02:45 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../unixodbc/{unixodbc_2.3.6.bb => unixodbc_2.3.7.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/unixodbc/{unixodbc_2.3.6.bb => unixodbc_2.3.7.bb} (75%)

diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.6.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.7.bb
similarity index 75%
rename from meta-oe/recipes-support/unixodbc/unixodbc_2.3.6.bb
rename to meta-oe/recipes-support/unixodbc/unixodbc_2.3.7.bb
index 2674d35..563badf 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.6.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.7.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d7b37bf80a3df5a65b355433ae36d206"
 
 DEPENDS = "libtool mysql5"
 
-SRC_URI = "ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-${PV}.tar.gz \
+SRC_URI = "http://ftp.unixodbc.org/unixODBC-${PV}.tar.gz \
            file://do-not-use-libltdl-source-directory.patch \
 "
-SRC_URI[md5sum] = "a8629fd2953b04b4639d0a9d8a5cf9d1"
-SRC_URI[sha256sum] = "88b637f647c052ecc3861a3baa275c3b503b193b6a49ff8c28b2568656d14d69"
+SRC_URI[md5sum] = "274a711b0c77394e052db6493840c6f9"
+SRC_URI[sha256sum] = "45f169ba1f454a72b8fcbb82abd832630a3bf93baa84731cf2949f449e1e3e77"
 
 UPSTREAM_CHECK_REGEX = "unixODBC-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4


