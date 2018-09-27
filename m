Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id E613D7987A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2018 12:55:25 +0000 (UTC)
Received: from heron.blarg.de (p5DE2B75B.dip0.t-ipconnect.de [93.226.183.91])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id 9F47C22080F;
	Thu, 27 Sep 2018 14:55:26 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Sep 2018 14:55:19 +0200
Message-Id: <20180927125519.2567-2-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180927125519.2567-1-max+openembedded@blarg.de>
References: <20180927125519.2567-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH 2/2] php: fix linker errors by setting `ac_cv_func_dlopen=no`
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
X-List-Received-Date: Thu, 27 Sep 2018 12:55:26 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

The autoconf variable `ac_cv_func_dlopen` controls whether `dlopen()`
is available without linking `libdl.so`.  But that doesn't work:

 tmp-glibc/work/aarch64-oe-linux/php/7.2.10-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/8.2.0/ld: ext/sqlite3/libsqlite/sqlite3.o: undefined reference to symbol 'dlsym@@GLIBC_2.17'
 tmp-glibc/work/aarch64-oe-linux/php/7.2.10-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../libexec/aarch64-oe-linux/gcc/aarch64-oe-linux/8.2.0/ld: tmp-glibc/work/aarch64-oe-linux/php/7.2.10-r0/recipe-sysroot/lib/libdl.so.2: error adding symbols: DSO missing from command line

Leave `ac_cv_lib_dl_dlopen=yes`, because that's the one which controls
whether `-ldl` is needed.
---
 meta-oe/recipes-devtools/php/php.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 99a25b94b..bfd0ddfb8 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -58,7 +58,7 @@ EXTRA_OECONF = "--enable-mbstring \
                 ${COMMON_EXTRA_OECONF} \
 "
 
-CACHED_CONFIGUREVARS += "ac_cv_func_dlopen=yes ac_cv_lib_dl_dlopen=yes"
+CACHED_CONFIGUREVARS += "ac_cv_func_dlopen=no ac_cv_lib_dl_dlopen=yes"
 
 EXTRA_OECONF_class-native = " \
                 --with-zlib=${STAGING_LIBDIR_NATIVE}/.. \
-- 
2.19.0


