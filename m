Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C1D726AE84
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 May 2014 14:44:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 May 2014 07:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,901,1392192000"; d="scan'208";a="517119211"
Received: from ohreyal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.77])
	by orsmga001.jf.intel.com with ESMTP; 24 May 2014 07:44:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 May 2014 15:44:15 +0100
Message-Id: <81914e4e11bb343e1ed991ae72870c3c11089b1f.1400942629.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1400942629.git.paul.eggleton@linux.intel.com>
References: <cover.1400942629.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1400942629.git.paul.eggleton@linux.intel.com>
References: <cover.1400942629.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/1] openobex: fix detection of IrDA during configure with B!=S
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
X-List-Received-Date: Sat, 24 May 2014 14:44:26 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../obex/openobex-1.5/separate_builddir.patch            | 16 ++++++++++++++++
 meta-oe/recipes-connectivity/obex/openobex_1.5.bb        |  3 ++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch

diff --git a/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch b/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch
new file mode 100644
index 0000000..8abf8ae
--- /dev/null
+++ b/meta-oe/recipes-connectivity/obex/openobex-1.5/separate_builddir.patch
@@ -0,0 +1,16 @@
+Fix detection of IrDA failing with B!=S
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+--- a/acinclude.m4	2014-05-24 14:05:41.757796816 +0100
++++ b/acinclude.m4	2014-05-24 14:03:06.556795536 +0100
+@@ -54,6 +54,7 @@
+ ])
+ 
+ AC_DEFUN([AC_PATH_IRDA_LINUX], [
++	CPPFLAGS="${CPPFLAGS} -I${srcdir}"
+ 	AC_CACHE_CHECK([for IrDA support], irda_found, [
+ 		AC_TRY_COMPILE([
+ 				#include <sys/socket.h>
diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
index 0d5cfef..bf30817 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/openobex-${PV}.tar.gz \
            file://disable-cable-test.patch \
-           file://libusb_crosscompile_check.patch"
+           file://libusb_crosscompile_check.patch \
+           file://separate_builddir.patch"
 
 SRC_URI[md5sum] = "0d83dc86445a46a1b9750107ba7ab65c"
 SRC_URI[sha256sum] = "e602047570799a47ecb028420bda8f2cef41310e5a99d084de10aa9422935e65"
-- 
1.9.0


