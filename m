Return-Path: <tom.rini@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id D5BB0660F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 11:59:46 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id l6so7765935qcy.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 04:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=V3oMNyfQZeIG/QIkmxond0+t1lh/rLzaEOTxprUo2j0=;
	b=wn+xa61WzfbOECeTnGTIMqv6hrLnQ+hUN1xjD4zUZJebiWODlG6WAHzcq3mkVpHV3f
	nIWrHJrRWFAIYn61ctELHNim6hfJ8cdoaQR9eqdyUqxlXPKtzsiQbxwywWaukY89rkyj
	vmz0NnkgoGBmRibK+g0DAzKBlN1Y7CDo4tqPwuhQQGGpbyASs0Fr6qI28bMhaBU/VWxN
	CFCW3lsI9GUAC9Q12DIbTMWA3l4QknPRzAtj5kesyhVHTYiwqySrvuf2FgQPW3XFdMlf
	bnH6HXmWGOqn2V0RXn1n9QiQ8RiaKlm6kq6DdoCoHDrhdfU6OCmVo9hub8tLoxkWsG75
	6Vbw==
X-Received: by 10.224.223.135 with SMTP id ik7mr25177873qab.26.1402919987011; 
	Mon, 16 Jun 2014 04:59:47 -0700 (PDT)
Received: from oliver.localdomain (cpe-098-121-186-226.ec.res.rr.com.
	[98.121.186.226])
	by mx.google.com with ESMTPSA id e3sm21395629qas.43.2014.06.16.04.59.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jun 2014 04:59:46 -0700 (PDT)
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jun 2014 07:59:40 -0400
Message-Id: <1402919980-2506-1-git-send-email-tom.rini@gmail.com>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-filesystems][PATCH] unionfs-fuse: A FUSE based implementation of UnionFS
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
X-List-Received-Date: Mon, 16 Jun 2014 11:59:54 -0000

Cc: Koen Kooi <koen@dominion.thruhere.net>
Cc: Philip Balister <philip@balister.org>
Cc: hongxu jia <hongxu.jia@windriver.com>
Signed-off-by: Tom Rini <tom.rini@gmail.com>
---
 .../recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb

diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
new file mode 100644
index 0000000..1d50364
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A FUSE based implemention of unionfs"
+HOMEPAGE = "http://podgorny.cz/moin/UnionFsFuse"
+SECTION = "console/network"
+LICENSE = "BSD-3-Clause"
+DEPENDS = "fuse"
+LIC_FILES_CHKSUM = "file://src/unionfs.c;beginline=3;endline=8;md5=30fa8de70fd8abab00b483a1b7943a32"
+
+SRC_URI = "http://podgorny.cz/unionfs-fuse/releases/${PN}-${PV}.tar.xz"
+
+SRC_URI[md5sum] = "689c636484756f6f7a728ef354cbeac2"
+SRC_URI[sha256sum] = "8d5c9dcb51ecb9a9b03890e16d17e37d602b0c1f23ed6a9ddec2b0f719c9f662"
+
+do_install() {
+	oe_runmake install DESTDIR=${D} PREFIX=${exec_prefix}
+}
-- 
1.9.3


