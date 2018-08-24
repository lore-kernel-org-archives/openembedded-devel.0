Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1435F748D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 19:34:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7OJYtI7000914
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 12:34:56 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 24 Aug 2018 12:34:54 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Aug 2018 12:34:54 -0700
Message-ID: <20180824193454.146236-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] php: specify no valgrind
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
X-List-Received-Date: Fri, 24 Aug 2018 19:34:55 -0000
Content-Type: text/plain

configure will look by default for valgrind.h in some host directories.
We override this by setting --with-valgrind=no.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-devtools/php/php.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 4231fcc..ef03e66 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -47,6 +47,7 @@ EXTRA_OECONF = "--enable-mbstring \
                 --enable-wddx \
                 --enable-fpm \
                 --enable-zip \
+                --with-valgrind=no \
                 --with-libdir=${baselib} \
                 --with-gettext=${STAGING_LIBDIR}/.. \
                 --with-zlib=${STAGING_LIBDIR}/.. \
-- 
2.7.4


