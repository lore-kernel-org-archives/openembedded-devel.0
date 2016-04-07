Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85369731BC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 09:14:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u379EXwp021869
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 7 Apr 2016 02:14:33 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Apr 2016 02:14:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Apr 2016 05:14:31 -0400
Message-ID: <1460020471-37317-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] libbonobo.inc: add libbonobo-bin package by lib_package class
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
X-List-Received-Date: Thu, 07 Apr 2016 09:14:37 -0000
Content-Type: text/plain

Fix QA issue:
...
|WARNING: libbonobo-2.32.1-r0 do_package_qa: QA Issue:
/usr/bin/bonobo-slay contained in package libbonobo requires
/usr/bin/perl, but no providers found in RDEPENDS_libbonobo? [file-rdeps]
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
index 8b6007e..e0f6168 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
@@ -5,10 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "x11/gnome/libs"
 DEPENDS = "glib-2.0 orbit2 intltool-native libxml2 dbus dbus-glib"
 
-inherit gnomebase gtk-doc
+inherit gnomebase gtk-doc lib_package
 
 ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
 
+RDEPENDS_${PN}-bin = "${PN} perl"
 FILES_${PN} += "${libdir}/orbit-2.0/*.so ${libdir}/bonobo/monikers/*.so"
 FILES_${PN}-dbg += "${libdir}/bonobo/monikers/.debug \
     ${libdir}/bonobo-2.0/samples/.debug ${libdir}/orbit-2.0/.debug"
-- 
1.9.1


