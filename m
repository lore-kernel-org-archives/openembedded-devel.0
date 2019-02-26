Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E607A7CC8D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 01:01:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,413,1544457600"; d="scan'208";a="55236835"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2019 09:01:19 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 4927F40269D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2019 09:01:09 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 26 Feb 2019 09:01:27 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Feb 2019 09:02:34 +0800
Message-ID: <20190226010234.4667-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 4927F40269D9.ADB4C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-networking][PATCH]dovecot:upgrade to 2.2.36
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
X-List-Received-Date: Tue, 26 Feb 2019 01:01:30 -0000
Content-Type: text/plain

1.Upgrade dovecot from 2.2.33 to 2.2.36.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../dovecot/{dovecot_2.2.33.bb => dovecot_2.2.36.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.2.33.bb => dovecot_2.2.36.bb} (95%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.33.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.bb
similarity index 95%
rename from meta-networking/recipes-support/dovecot/dovecot_2.2.33.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.2.36.bb
index 882d5d554..39bfb912e 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.33.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://0001-doveadm-Fix-parallel-build.patch \
            "
 
-SRC_URI[md5sum] = "d61d1e923a22f9062cc9f47696882666"
-SRC_URI[sha256sum] = "e9483d68a7698d701bc06124fcf6e1b1f16380c2986c7ec0cf4e1475b9d0c218"
+SRC_URI[md5sum] = "a8d6492584025b2413e82ea48de3cd5f"
+SRC_URI[sha256sum] = "e9aba89bb1ac1e9581b84e4a7a50f53142539614eaf7cc4c80007ebea4988be5"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
-- 
2.17.2




