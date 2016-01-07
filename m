Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 62599731E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 05:02:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2310470"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Jan 2016 13:02:34 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C44ED41887F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2016 13:02:21 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 7 Jan 2016 13:02:21 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jan 2016 21:02:04 -0800
Message-ID: <1452142924-881-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: C44ED41887F7.ACCB6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
Subject: [meta-networking][PATCH] opensaf: 4.6.0 -> 4.7.0
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
X-List-Received-Date: Thu, 07 Jan 2016 05:02:39 -0000
Content-Type: text/plain

1) Upgrade opensaf from 4.6.0 to 4.7.0.
2) Delete two patches,since they are not needed any more.
   Revert_imma_client_node_replyPending_to_unsigned_char.patch
   Fix_GCC_5.1.0_compiler_warning.patch

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../recipes-daemons/opensaf/{opensaf_4.6.0.bb => opensaf_4.7.0.bb}  | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_4.6.0.bb => opensaf_4.7.0.bb} (89%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.7.0.bb
similarity index 89%
rename from meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_4.7.0.bb
index 9084524..42e883a 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.6.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.7.0.bb
@@ -16,12 +16,10 @@ inherit autotools useradd systemd pkgconfig
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://install-samples-from-srcdir.patch \
            file://0001-plmcd-error-fix.patch \
-           file://Revert_imma_client_node_replyPending_to_unsigned_char.patch \
-           file://Fix_GCC_5.1.0_compiler_warning.patch \
            "
 
-SRC_URI[md5sum] = "a1ceddb517c0972aa7e899b092d7f464"
-SRC_URI[sha256sum] = "f6ea754a145ae42552f328f96c32f38429ad06478a351b9d0aed812adcecb2b4"
+SRC_URI[md5sum] = "82dd2777a672140e22b8205f10aa55d3"
+SRC_URI[sha256sum] = "da9e138650b835728ad51d99268d3a31419b254c4cb4e87c6ec90bc45266d7d2"
 
 SECTION = "admin"
 LICENSE = "LGPLv2.1"
-- 
1.9.1




