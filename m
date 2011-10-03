Received: from mail-dy0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAiea-0004SD-UL
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:33:56 +0200
Received: by dyk17 with SMTP id 17so79064dyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=TV7ZevUs67g932DejgzwKD9qdGOEDcXbRziMfFkmKNk=;
	b=LZIm+qMU5RNsCLoV0VXI0A3jtGhK2a/njuBJeXWW9/KcLkZUxRHe16TGbGNlRCXFPN
	t5vjrYm/hZ7peQdB94aHkE/7GPz9gsJRIDn7X4VFXcrAaJTuwa5/CQvPAFTwudYDQxz4
	AhKRjvUtjjAhlAkepR5xHPuGIKt1ur7SLf8DU=
Received: by 10.223.5.76 with SMTP id 12mr207955fau.103.1317648501321;
	Mon, 03 Oct 2011 06:28:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m26sm21292241fac.6.2011.10.03.06.28.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:28:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:05 +0200
Message-Id: <b73241308330af404ef9aa908ee810708dc88ef9.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 07/25] talloc: drop from meta-oe, no longer needed by mesa
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
X-List-Received-Date: Mon, 03 Oct 2011 13:33:57 -0000

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
1.7.7



