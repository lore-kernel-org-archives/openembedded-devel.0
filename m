Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9C1667F971
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:38:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,402,1571673600"; d="scan'208";a="81374704"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2020 17:38:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 289EB49E932C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 17:29:46 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 6 Jan 2020 17:38:45 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 6 Jan 2020 17:38:50 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Jan 2020 05:54:56 -0800
Message-ID: <1578318898-25525-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578318898-25525-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1578318898-25525-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 289EB49E932C.A5358
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] opensaf: upgrade 5.19.07 -> 5.19.10
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
X-List-Received-Date: Mon, 06 Jan 2020 09:38:48 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../opensaf/{opensaf_5.19.07.bb => opensaf_5.19.10.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.19.07.bb => opensaf_5.19.10.bb} (95%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
similarity index 95%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
index efa2bf5eb..a7eb4c849 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.07.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
@@ -27,8 +27,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Add-configure-time-check-for-gettid-API.patch \
            file://0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch \
            "
-SRC_URI[md5sum] = "e9ae9de803a99b7ab33757a49858542f"
-SRC_URI[sha256sum] = "caed672d03ab1fe3f27d333429c7ca03022714e7c6350500208b7bd7349f03ce"
+SRC_URI[md5sum] = "9b61df01d1a092101c4a626692edae19"
+SRC_URI[sha256sum] = "6da9af96e8ee58d11031d305bf4804a00deb6108e12e422722882a2091bd34bd"
 
 inherit autotools useradd systemd pkgconfig
 
-- 
2.17.1




