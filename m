Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AD1B073E36
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 07:40:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98212411"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jul 2015 15:44:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t687cfpC004986
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jul 2015 15:38:41 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 8 Jul 2015 15:40:23 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jul 2015 15:40:15 +0800
Message-ID: <1436341215-1648-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] libssh2: upgrade 1.4.3 -> 1.6.0
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
X-List-Received-Date: Wed, 08 Jul 2015 07:40:30 -0000
Content-Type: text/plain

Update the checksum of COPYING,since the date in it has been changed,
but the LICENSE has not been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-support/libssh2/{libssh2_1.4.3.bb => libssh2_1.6.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libssh2/{libssh2_1.4.3.bb => libssh2_1.6.0.bb} (60%)

diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
similarity index 60%
rename from meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
rename to meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
index b537663..022482c 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
@@ -5,11 +5,11 @@ SECTION = "libs"
 DEPENDS = "zlib openssl"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d00afe44f336a79a2ca7e1681ce14509"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
-SRC_URI[md5sum] = "071004c60c5d6f90354ad1b701013a0b"
-SRC_URI[sha256sum] = "eac6f85f9df9db2e6386906a6227eb2cd7b3245739561cad7d6dc1d5d021b96d"
+SRC_URI[md5sum] = "00aabd6e714a5f42a4fb82ace20db1dd"
+SRC_URI[sha256sum] = "5a202943a34a1d82a1c31f74094f2453c207bf9936093867f41414968c8e8215"
 
 inherit autotools pkgconfig
 
-- 
1.8.4.2


