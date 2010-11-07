Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1PEzB1-0002CS-8M
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 07:56:33 +0100
Received: from localhost.localdomain (unknown [192.168.1.27])
	by mail.altell.local (Postfix) with ESMTP id 84A5E543D;
	Sun,  7 Nov 2010 09:55:26 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Nov 2010 09:56:56 +0300
Message-Id: <1289113016-26867-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1288773858.3980.10.camel@mattotaupa>
References: <1288773858.3980.10.camel@mattotaupa>
X-Altell-MailScanner-ID: 84A5E543D.36BD1
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libprelude: workaroung build failures with libtool 2.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Nov 2010 06:56:33 -0000

Like:

In file included from prelude-plugin.c:56:0:
/include/prelude-plugin.h:66:20: error: conflicting types for 'lt__PROGRAM__LTX_preloaded_symbols'
/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/ltdl.h:106:36: note: previous declaration of 'lt__PROGRAM__LTX_preloaded_symbols' was here
make[4]: *** [prelude-plugin.lo] Error 1

Originally reported by Paul Menzel <paulepanter@users.sourceforge.net>.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 .../libprelude-1.0.0/fix-ltdl-hack.patch           |   21 ++++++++++++++++++++
 recipes/libprelude/libprelude_1.0.0.bb             |    3 +-
 2 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 recipes/libprelude/libprelude-1.0.0/fix-ltdl-hack.patch

diff --git a/recipes/libprelude/libprelude-1.0.0/fix-ltdl-hack.patch b/recipes/libprelude/libprelude-1.0.0/fix-ltdl-hack.patch
new file mode 100644
index 0000000..c6f147f
--- /dev/null
+++ b/recipes/libprelude/libprelude-1.0.0/fix-ltdl-hack.patch
@@ -0,0 +1,21 @@
+libtool 2.4 changed lt__PROGRAM__LTX_preloaded_symbols definition to
+
+extern LT_DLSYM_CONST lt_dlsymlist lt__PROGRAM__LTX_preloaded_symbols[];
+
+but there is no easy way to find its version to fix it properly, so it's a
+temporary hack to make at least libprelude compile.
+Index: libprelude-1.0.0/src/include/prelude-plugin.h
+===================================================================
+--- libprelude-1.0.0.orig/src/include/prelude-plugin.h	2010-11-06 21:30:18.000000000 +0300
++++ libprelude-1.0.0/src/include/prelude-plugin.h	2010-11-06 21:30:47.000000000 +0300
+@@ -61,9 +61,8 @@
+  */
+ #ifdef PRELUDE_APPLICATION_USE_LIBTOOL2
+ # define lt_preloaded_symbols lt__PROGRAM__LTX_preloaded_symbols
+-#endif
+-
+ extern const void *lt_preloaded_symbols[];
++#endif
+ 
+ #define PRELUDE_PLUGIN_SET_PRELOADED_SYMBOLS()         \
+         prelude_plugin_set_preloaded_symbols(lt_preloaded_symbols)
diff --git a/recipes/libprelude/libprelude_1.0.0.bb b/recipes/libprelude/libprelude_1.0.0.bb
index d99af1c..85f7acd 100644
--- a/recipes/libprelude/libprelude_1.0.0.bb
+++ b/recipes/libprelude/libprelude_1.0.0.bb
@@ -2,13 +2,14 @@ DESCRIPTION = "Libprelude is a library that guarantees secure connections betwee
 SECTION = "net"
 DEPENDS = "gnutls libgcrypt zlib perl perl-native"
 LICENSE = "GPLv2"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = " \
 	http://www.prelude-ids.com/download/releases/libprelude/${PN}-${PV}.tar.gz \
 	file://libprelude-dont-regenerate-perl-makefile.patch \
 	file://libprelude-perl-build-with-gnu-hash.patch \
 	file://libprelude-fix-uid-gid-conflicting-types.patch \
+	file://fix-ltdl-hack.patch \
 	"
 SRC_URI[md5sum] = "a5bb76538d240e5fac5f6ab0b7fabfe5"
 SRC_URI[sha256sum] = "e16d83a6a7bcc43a02d6f2bd40c91a03a258a9a86bab42262cbb5adaba8c4640"
-- 
1.5.6.5



