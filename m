Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1193.1795158516432826382
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 20 Nov 2026 16:08:33 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.122.207)
	by 156.147.1.127 with ESMTP; 20 Nov 2026 16:08:33 +0900
X-Original-SENDERIP: 10.177.122.207
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-python][PATCH] python3-m2crypto: fix build with musl multilib
Date: Fri, 20 Nov 2026 16:08:31 +0900
Message-ID: <20261120070831.2825518-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 07:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132764
Content-Type: text/plain; charset="utf-8"

From: "mark.yang" <mark.yang@lge.com>

Fix this do_compile failure with musl multilib:

  openssl/configuration.h:19: Error: Unable to find 'bits/wordsize.h'
  openssl/configuration.h:43: Error: CPP #error ""Unknown __WORDSIZE
  detected""

oe-core f296632258 ("multilib_header_wrapper.h: support musl") detects
musl with __has_include. swig has no __has_include, so the wrapper
includes bits/wordsize.h as on glibc. musl does not have this header.

Pass -D__MHWORDSIZE to swig. The wrapper uses a predefined
__MHWORDSIZE as is (rule 1 in f296632258).

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.51.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.51.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.51.0.bb
index edf38afd2a..a826dabfbc 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.51.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.51.0.bb
@@ -30,7 +30,7 @@ RDEPENDS:${PN} += "\
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}"
 
-SWIG_FEATURES ?= "-D__${HOST_ARCH}__ ${@['-D__ILP32__','-D__LP64__'][d.getVar('SITEINFO_BITS') != '32']} -DOPENSSL_NO_FILENAMES"
+SWIG_FEATURES ?= "-D__${HOST_ARCH}__ ${@['-D__ILP32__','-D__LP64__'][d.getVar('SITEINFO_BITS') != '32']} -DOPENSSL_NO_FILENAMES -D__MHWORDSIZE=${SITEINFO_BITS}"
 
 SWIG_FEATURES:append:riscv64 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__riscv_xlen=${SITEINFO_BITS}"
 SWIG_FEATURES:append:riscv32 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__riscv_xlen=${SITEINFO_BITS}"
