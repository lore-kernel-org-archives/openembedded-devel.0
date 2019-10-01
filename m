Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2CE7DFE4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2019 05:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C68F540BF9;
	Tue,  1 Oct 2019 05:28:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ai-sBrj7v1gs; Tue,  1 Oct 2019 05:28:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AFBD440BF0;
	Tue,  1 Oct 2019 05:28:45 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DEC49174274;
	Tue,  1 Oct 2019 01:28:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Oct 2019 01:28:39 -0400
Message-Id: <1569907719-30159-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] rwmem: add recipe
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
X-List-Received-Date: Tue, 01 Oct 2019 05:28:46 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is being moved from meta-ti as it's a rather generic tool to be useful
on other platforms.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb

diff --git a/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb b/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb
new file mode 100644
index 0000000..0a15134
--- /dev/null
+++ b/meta-oe/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -0,0 +1,26 @@
+SUMMARY = "A small tool to read/write memory"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS += "python3 python3-pybind11"
+
+PV .= "+git${SRCPV}"
+
+SRCREV_rwmem = "cc296c5366a35a4c4271cfa3cc9831f6f34bfd9d"
+SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
+
+SRCREV_FORMAT = "rwmem_inih"
+
+SRC_URI = " \
+    git://github.com/tomba/rwmem.git;protocol=https;name=rwmem \
+    git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
+"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+do_install() {
+	install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
+	install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
+}
-- 
2.7.4


