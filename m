Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id F1ACD7632C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:54:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99027313"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2015 17:58:09 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6T9qhH5016481
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2015 17:52:43 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 29 Jul 2015 17:54:34 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Jul 2015 17:54:11 +0800
Message-ID: <1438163651-3294-4-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1438163651-3294-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438163651-3294-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH 4/4] tiptop: upgrade 2.2 -> 2.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jul 2015 09:54:37 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/tiptop/{tiptop_2.2.bb => tiptop_2.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/tiptop/{tiptop_2.2.bb => tiptop_2.3.bb} (87%)

diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb b/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
similarity index 87%
rename from meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
rename to meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
index a803e26..5a98116 100644
--- a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
+++ b/meta-oe/recipes-extended/tiptop/tiptop_2.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "ncurses libxml2"
 
 SRC_URI = "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "74255a29acf44569db021b080ad3e3f7"
-SRC_URI[sha256sum] = "965cb99b16cb59df78363d83b62877ce8501b0aac1116a86bed8a16aa96b171d"
+SRC_URI[md5sum] = "f1fba1e90465b0e5a3865b19133fa19d"
+SRC_URI[sha256sum] = "3f07e958b40acaeab98e9eb1326c9f91b0be0a782c1cc2bd7a9e18d31fab18ca"
 
 inherit autotools-brokensep
 EXTRA_OECONF = "CFLAGS="$CFLAGS -I${STAGING_INCDIR}/libxml2""
-- 
1.8.4.2


