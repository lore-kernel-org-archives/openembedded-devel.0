Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 715F46D3E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2013 06:37:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9P6biSo003432
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 23:37:44 -0700 (PDT)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.200) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 24 Oct 2013 23:37:43 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Oct 2013 14:37:40 +0800
Message-ID: <641f84ddf82621150dafaa26554754beb47a70b9.1382682617.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1382682617.git.wenzong.fan@windriver.com>
References: <cover.1382682617.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] mariadb-native: depends on zlib-native
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
X-List-Received-Date: Fri, 25 Oct 2013 06:37:42 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Mariadb will provide zlib.* if it can't find zlib binaries and headers
from sysroots path. We have set it to use external zlib.* firstly with
these definitions/configs in inc file:

    + DEPENDS = "ncurses zlib"
    + --with-zlib-dir=${STAGING_EXECPREFIXDIR}

But native bb file overrides the dependencies with:

    + DEPENDS = "ncurses-native"

If mariadb-naitve was built before zlib-native, its own zlib will be
built and provide zlib.la which will brake other packages link to real
zlib with errors like:

    * .../usr/lib/libz.a(gzclose.o): relocation R_X86_64_32 against \
      `a local symbol' can not be used when making a shared object; \
      recompile with -fPIC
    * .../usr/lib/libz.a: could not read symbols: Bad value

By removing the DEPENDS = "ncurses-native" from the native bb file,
mariadb-native will still have the DEPENDS (ncurses zlib) from the
inc file, and since the recipe is mariadb-native, this is equivalent
to DEPENDS = "ncurses-native zlib-native" due to the map_dependencies()
inner fuction for native_virtclass_handler() in "oe-core/meta/classes/
native.bbclass".

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
index 01eb964..a55c2ab 100644
--- a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
+++ b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
@@ -5,7 +5,6 @@ PROVIDES += "mysql5-native"
 
 RDEPENDS_${PN} = ""
 PACKAGES = ""
-DEPENDS = "ncurses-native"
 EXTRA_OEMAKE = ""
 EXTRA_OECONF = " --with-embedded-server "
 
-- 
1.7.10.4


