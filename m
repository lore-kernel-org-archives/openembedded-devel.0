Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9clK-0007eY-NR
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 15:04:23 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1747506bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=gAVN25l0Tktckz7FcHBLgFTtlxSV4iwh87lvG1KM/yM=;
	b=nJArXhcnMchMFEC1HMkXPXeLWhwCTr6hGgLfsJfT8ao3xxnvjrbOZcOH5LHx021hyZ
	n2oTsUmxx8GqGjpGksq2+2xwhXHE4lYCqL59BPLdrSfeEKp+Y2Ts4bRejzDszzQ+HODz
	wku3HgBwOhkjaPVXrYZjeS/76Cxhf3qqWHc8U=
Received: by 10.204.144.67 with SMTP id y3mr2072891bku.322.1317387532945;
	Fri, 30 Sep 2011 05:58:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j16sm4899693bks.3.2011.09.30.05.58.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 05:58:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 14:56:50 +0200
Message-Id: <7a2d65fd6991953d7529740c35295b9835bbb41b.1317387144.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
References: <7a73a24c82f9d721c3342a14097cb105ba82a3ca.1317387144.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317387144.git.Martin.Jansa@gmail.com>
References: <cover.1317387144.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 14/15] talloc: drop from meta-oe, no longer needed by mesa
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
X-List-Received-Date: Fri, 30 Sep 2011 13:07:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb |   27 ------------------------
 1 files changed, 0 insertions(+), 27 deletions(-)
 delete mode 100644 meta-oe/recipes-support/talloc/talloc_2.0.1.bb

diff --git a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
deleted file mode 100644
index a69bd40..0000000
--- a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Hierarchical, reference counted memory pool system with destructors"
-HOMEPAGE = "http://talloc.samba.org"
-LICENSE = "LGPL"
-LIC_FILES_CHKSUM = "file://NEWS;md5=5fe776b23a711c9153ee94bc87e47334"
-
-inherit autotools pkgconfig
-
-SRC_URI = "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "c6e736540145ca58cb3dcb42f91cf57b"
-SRC_URI[sha256sum] = "5b810527405f29d54f50efd78bf2c89e318f2cd8bed001f22f2a1412fd27c9b4"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-PR = "r1"
-
-# autoreconf doesn't work well while reconfiguring included libreplace
-do_configure () {
-       gnu-configize
-       oe_runconf
-}
-
-do_install_append() {
-       install -d ${D}${libdir}
-       ln -s libtalloc.so.2.0.1 ${D}${libdir}/libtalloc.so.2.0
-       ln -s libtalloc.so.2.0 ${D}${libdir}/libtalloc.so.2
-       ln -s libtalloc.so.2 ${D}${libdir}/libtalloc.so
-}
-- 
1.7.6.1



