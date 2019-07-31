Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 45C6E7ECB9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 06:04:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,328,1559491200"; d="scan'208";a="72570415"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2019 14:04:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 22CFD4B4041E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 14:04:37 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 31 Jul 2019 14:04:40 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Jul 2019 14:03:55 +0800
Message-ID: <20190731060355.24511-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 22CFD4B4041E.A7639
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking] [PATCH] opensaf: upgrade 5.19.03 -> 5.19.07
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
X-List-Received-Date: Wed, 31 Jul 2019 06:04:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../opensaf/{opensaf_5.19.03.bb => opensaf_5.19.07.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.19.03.bb => opensaf_5.19.07.bb} (95%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.03.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
similarity index 95%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.19.03.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
index 0cccebd..0f2ba2f 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.03.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
@@ -25,8 +25,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch \
            file://0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch \
            "
-SRC_URI[md5sum] = "4dd1497ccd82d275735853bf0db5c510"
-SRC_URI[sha256sum] = "de42c8dd850990716ca494ca598165cc7a23b5b7f2bc21af5d71a3d971ddd595"
+SRC_URI[md5sum] = "e9ae9de803a99b7ab33757a49858542f"
+SRC_URI[sha256sum] = "caed672d03ab1fe3f27d333429c7ca03022714e7c6350500208b7bd7349f03ce"
 
 inherit autotools useradd systemd pkgconfig
 
-- 
2.7.4




