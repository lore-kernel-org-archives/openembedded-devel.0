Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F39171E53
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:04:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1DA4fYH001930
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Feb 2017 02:04:41 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Feb 2017 02:04:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 02:04:27 -0800
Message-ID: <db602c87c0d88a7dc7cf5a37d9c2316532ccd0ac.1486980187.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1486980186.git.liezhi.yang@windriver.com>
References: <cover.1486980186.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/13] libnet-ssleay-perl: fix EXTRALIBS and LDLOADLIBS
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
X-List-Received-Date: Mon, 13 Feb 2017 10:04:41 -0000
Content-Type: text/plain

Fixed:
recipe-sysroot-native/usr/bin/i586-wrs-linux/../../libexec/i586-wrs-linux/gcc/i586-wrs-linux/6.3.0/ld: cannot find -lssl -lcrypto -lz
collect2: error: ld returned 1 exit status
make: *** [blib/arch/auto/Net/SSLeay/SSLeay.so] Error 1

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
index cfd6f51..4695ae4 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
@@ -32,8 +32,8 @@ inherit cpan ptest
 
 EXTRA_CPANFLAGS = "LIBS='-L=${STAGING_LIBDIR} -L=${STAGING_BASELIBDIR}' \
                    INC=-I=${STAGING_INCDIR} \
-                   'EXTRALIBS=-lssl -lcrypto -lz' \
-                   'LDLOADLIBS=-lssl -lcrypto -lz' \
+                   'EXTRALIBS=-L=${STAGING_LIBDIR} -lssl -lcrypto -lz' \
+                   'LDLOADLIBS=-L=${STAGING_LIBDIR} -lssl -lcrypto -lz' \
                   "
 
 do_configure_prepend() {
-- 
2.9.0


