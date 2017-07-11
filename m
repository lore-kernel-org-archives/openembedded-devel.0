Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8637477E94
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 06:31:11 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id e199so17588184pfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 23:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xHx5EkzLQmw4g4Q4l0h5hM/G13Y4jQ/Urs5I5gwYi64=;
	b=Q+pwVyAQpv0xP0ZQqwPgmsIBYNI9AieceGKBmO14JTg1uTcz3Re8iQ4hzf6ixZP0q8
	RmOpGo07p3dW0S9MPA3088LkvmxzDhisFj3dayeUjpwsjEMpG8WMOZ4K5N7Nj8sGy9Ni
	kZkfdmeZnPc/uU6/N1BloYZ5WctIt+q6e0e5lbyppeBAITMltrlQ16Jpa3yvLinIzTsb
	MSca17sEHvRMJtCymVYDSx81p+IBvM7tyWPyx4QgNyNLAatqk+Syc2ZabGwGVwdlhpDb
	SWnygRTI3hZDXXTUBB2pSfNZmrEAny/LoonZ64ArAyHvqhl7OvVkE3v6W2f4MkyDLgg6
	+CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xHx5EkzLQmw4g4Q4l0h5hM/G13Y4jQ/Urs5I5gwYi64=;
	b=RsFnMCIESmEHROeLfAz/P9bJdo7wHzlhqfTgVX4RxUlAy+WE+LEbM/tDVnowu4DOKp
	USXXCET02wjfYW9ui6t9F3sM/C5ba4vb7RwNSEphEFxe983j9XWvfZHWIqim6PwyeaTH
	G25y2PKh+b7d2aUfOLONFShfBtCKClX0m5zfyQaKJw7c42YrElaRaLgRIYhmCgWQfodg
	1BUiTgftIlKaA1oUDyMvj6evfi6W5Hr1B336iVM44BGWaUK2CRY8WYiKehDnXmYWbwPf
	NF2/RrMUaOSNceYHvXqtSaW5vS+K1JluYB30oq4tBloOvbmgzBaMhdotYcnteiJ+6/dZ
	/Beg==
X-Gm-Message-State: AIVw1106bbxJu8OvIXrghfrNQxqzMRd+KPPw6tDbhPm1qACwjJ21a4qw
	VIMsxA8RrgqMoFI9
X-Received: by 10.98.17.84 with SMTP id z81mr48820353pfi.38.1499754673131;
	Mon, 10 Jul 2017 23:31:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	x85sm28651488pff.92.2017.07.10.23.31.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 23:31:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jul 2017 23:31:02 -0700
Message-Id: <20170711063102.10384-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-qt5][PATCH] qwt-qt5: Fix rpath issues
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
X-List-Received-Date: Tue, 11 Jul 2017 06:31:12 -0000

It errors out
usr/plugins/designer/libqwt_designer_plugin.so [rpaths]
QA Issue: qwt-qt5-plugins: found library in wrong location: /usr/plugins/designer/libqwt_designer_plugin.so

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-qt/qwt/qwt-qt5.inc                |  5 +++--
 recipes-qt/qwt/qwt-qt5/remove_rpath.patch | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 recipes-qt/qwt/qwt-qt5/remove_rpath.patch

diff --git a/recipes-qt/qwt/qwt-qt5.inc b/recipes-qt/qwt/qwt-qt5.inc
index ee4fbd7..90bd9f7 100644
--- a/recipes-qt/qwt/qwt-qt5.inc
+++ b/recipes-qt/qwt/qwt-qt5.inc
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dac2743472b0462ff3cfb4af42051c88"
 DEPENDS = "qtbase qtsvg qttools"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt \
+           file://remove_rpath.patch \
           "
-#           file://qwt6.patch 
-#           file://qwt6-fix-linking-with-ld-gold.patch"
 
 S = "${WORKDIR}/qwt-${PV}"
 
@@ -45,3 +44,5 @@ FILES_${PN}-plugins = "${prefix}/plugins/designer/*.so"
 FILES_${PN}-dbg += "${prefix}/plugins/designer/.debug"
 FILES_${PN}-doc += "${prefix}/doc"
 
+INSANE_SKIP_${PN}-plugins += "libdir"
+
diff --git a/recipes-qt/qwt/qwt-qt5/remove_rpath.patch b/recipes-qt/qwt/qwt-qt5/remove_rpath.patch
new file mode 100644
index 0000000..14b65d6
--- /dev/null
+++ b/recipes-qt/qwt/qwt-qt5/remove_rpath.patch
@@ -0,0 +1,17 @@
+Remove rpath from library, it points to build area which is not
+ok
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: qwt-6.1.3/designer/designer.pro
+===================================================================
+--- qwt-6.1.3.orig/designer/designer.pro
++++ qwt-6.1.3/designer/designer.pro
+@@ -83,7 +83,6 @@ contains(QWT_CONFIG, QwtDesigner) {
+         # compile the path for finding the Qwt library
+         # into the plugin. Not supported on Windows !
+ 
+-        QMAKE_RPATHDIR *= $${QWT_INSTALL_LIBS}
+         qwtAddLibrary($${QWT_OUT_ROOT}/lib, qwt)
+ 
+         contains(QWT_CONFIG, QwtDll) {
-- 
2.13.2


