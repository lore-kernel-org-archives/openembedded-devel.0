Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web10.928.1588876059918675901
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 11:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==3967e7612ff==cbing@cybernetics.com)
X-ASG-Debug-ID: 1588876045-0fb3b0649e655f30001-aWHRdb
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id EGsCMszk9Ev3IRRZ for <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2020 14:27:25 -0400 (EDT)
X-Barracuda-Envelope-From: cbing@cybernetics.com
X-ASG-Whitelist: Client
Received: from [10.157.1.18] (account cbing HELO cy-rd-cb)
  by cybernetics.com (CommuniGate Pro SMTP 5.1.14)
  with ESMTPA id 9946295 for openembedded-devel@lists.openembedded.org; Thu, 07 May 2020 14:27:25 -0400
Date: Thu, 7 May 2020 14:28:06 -0400
From: "Claude Bing" <cbing@cybernetics.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] php: fix opcache link error in 7.4
Message-ID: <20200507142806.48643a47@cy-rd-cb>
X-ASG-Orig-Subj: [meta-oe][PATCH] php: fix opcache link error in 7.4
Organization: Cybernetics
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1588876045
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 1555
X-Barracuda-BRTS-Status: 1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Explicitly specifying -lrt is required for opcache to be linked against
the proper dependencies.  Additionally, PHP disables libdl when it
detects a cross-compilation environment for some reason.  In order to
load any type of extension, re-enabling libdl is required.

Signed-off-by: Claude Bing <cbing@cybernetics.com>
---
 meta-oe/recipes-devtools/php/php_7.4.4.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.4.bb
index 48149304c..68005c0bb 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -111,6 +111,17 @@ export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
 CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
 
+# link against librt (libc) if opcache is specified in order to avoid the
+# following error:
+# Failed loading /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: undefined symbol: shm_unlink
+LDFLAGS += "${@ " -lrt " if bb.utils.contains('PACKAGECONFIG', 'opcache', 'true', 'false', d) else "" }"
+
+# Adding these flags enables dynamic library support, which is disabled by
+# default when cross compiling
+# See https://bugs.php.net/bug.php?id=60109
+CFLAGS += " -DHAVE_LIBDL "
+LDFLAGS += " -ldl "
+
 EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
 
 acpaths = ""
-- 
2.17.1

