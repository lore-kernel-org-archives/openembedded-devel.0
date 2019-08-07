Return-Path: <rbilovol@cisco.com>
X-Greylist: delayed 377 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 Aug 2019 12:30:08 UTC
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
	by mail.openembedded.org (Postfix) with ESMTP id E18FF7F45D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1804; q=dns/txt; s=iport;
	t=1565181010; x=1566390610;
	h=from:to:cc:subject:date:message-id;
	bh=9ucCUTYWXAy0i3ECFV70rVqc3jy3x6fKGQ6K5ET+T2A=;
	b=X2/BArx6s+kKzPxOGd3IMsNLEwZRZoK0dRGOqji1av1nxXi1a5GGE5WF
	XGoPNE4b148kaKIzFQpYPPFTsLvEcHkaRCcrgKrrUFyye81PL2jySG0za
	22xXbinVzODpJdu2jrXlbuj68eay3UkSUWQmjnQ9LHi06Aj4Kug9/huQe Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BdAgAbw0pd/xbLJq1lHQEBBQEHBQG?=
	=?us-ascii?q?BVgUBCwGDBFIgEiqNGodymgeBZwkBAQEOIwwBAYQ/gnc3Bg4BBAEBBAEBAwE?=
	=?us-ascii?q?GbYUnDIZKgVGDIgGCCg+sDoQ0AQsBgQiDOIFJFIEgAYcKhHCBQD+BEYNQgmE?=
	=?us-ascii?q?CgSYjZYUWBJVNlV8Jgh6GXY1FAhmDHJUUAZREY5BCgWYigVgzGggbFYMnCYJ?=
	=?us-ascii?q?GFoIpgSWFFIVCPAMwjyQBAQ?=
X-IronPort-AV: E=Sophos;i="5.64,357,1559520000"; d="scan'208";a="15189924"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com)
	([173.38.203.22])
	by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	07 Aug 2019 12:30:09 +0000
Received: from localhost ([10.63.15.140])
	by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id x77CU8Wb026703;
	Wed, 7 Aug 2019 12:30:09 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Aug 2019 15:30:07 +0300
Message-Id: <1565181007-2883-1-git-send-email-rbilovol@cisco.com>
X-Mailer: git-send-email 1.9.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.63.15.140, [10.63.15.140]
X-Outbound-Node: aer-core-4.cisco.com
Cc: xe-linux-external@cisco.com
Subject: [PATCH] libnss-nisplus: Add recipe
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
X-List-Received-Date: Wed, 07 Aug 2019 12:30:09 -0000

Same as with libnss-nis - this will substitute
the glibc nisplus module which has been removed

SRCREV points to 1.3 release plus patch on top which
allows to build with recent glibc versions

Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
---

Resent to meta-oe as was discussed here:
https://patchwork.openembedded.org/patch/159586/

 .../libnss-nisplus/libnss-nisplus.bb               | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb

diff --git a/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb b/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb
new file mode 100644
index 0000000..2dbeee7
--- /dev/null
+++ b/meta-oe/recipes-extended/libnss-nisplus/libnss-nisplus.bb
@@ -0,0 +1,31 @@
+# Copyright (C) 2019 Ruslan Bilovol <rbilovol@cisco.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "NSS module for glibc, to provide NIS+ support for glibc"
+
+DESCRIPTION = "This package contains the NSS NIS+ plugin for glibc.\
+This code was formerly part of glibc, but is now standalone to\
+be able to link against TI-RPC for IPv6 support."
+
+HOMEPAGE = "https://github.com/thkukuk/libnss_nisplus"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+SECTION = "libs"
+DEPENDS += "libtirpc libnsl2"
+
+PV = "1.3+git${SRCPV}"
+
+SRCREV = "c6934373c7bac91499ff7bbe7d2439599325ca63"
+
+SRC_URI = "git://github.com/thkukuk/libnss_nisplus \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND += "native nativesdk"
+#
+# We will skip parsing this packagegeoup for non-glibc systems
+#
+COMPATIBLE_HOST_libc-musl = 'null'
-- 
1.9.1


