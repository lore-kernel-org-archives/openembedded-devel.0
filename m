Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6EEB72D5D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jan 2015 08:41:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0O8fAPT005032
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jan 2015 00:41:10 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sat, 24 Jan 2015 00:41:09 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 24 Jan 2015 16:41:13 +0800
Message-ID: <1422088873-6575-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] php: Look for libraries in ${baselib} rather than lib
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
X-List-Received-Date: Sat, 24 Jan 2015 08:41:14 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

It fails to look for libraries when we use lib64 for baselib,
use --with-libdir option to specify the correct directory.

$ ./configure --help|grep '\-\-with-libdir'
 --with-libdir=NAME      Look for libraries in .../NAME rather than .../lib

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-devtools/php/php_5.5.20.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php_5.5.20.bb b/meta-oe/recipes-devtools/php/php_5.5.20.bb
index 1c0557f..cfda14b 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.20.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.20.bb
@@ -56,6 +56,7 @@ EXTRA_OECONF = "--enable-mbstring \
                 --enable-wddx \
                 --enable-fpm \
                 --enable-zip \
+                --with-libdir=${baselib} \
                 --with-gettext=${STAGING_LIBDIR}/.. \
                 --with-zlib=${STAGING_LIBDIR}/.. \
                 --with-iconv=${STAGING_LIBDIR}/.. \
-- 
1.9.1


