Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56938713A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 12:16:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sABCGFtQ004425
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Nov 2014 04:16:16 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 11 Nov 2014 04:16:15 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Nov 2014 20:16:10 +0800
Message-ID: <68ac9dc860f1f0a75c5c1dfcd8d199403c845b2f.1415708064.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415708064.git.hongxu.jia@windriver.com>
References: <cover.1415708064.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libbonobo.inc: add libbonobo-bin package
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
X-List-Received-Date: Tue, 11 Nov 2014 12:16:18 -0000
Content-Type: text/plain

The previous libbonobo package contains perl scripts, while installing
libbonobo, package management detected perl required, but it actually
not needed as lib. So add libbonobo-bin package to contain these scripts.
It refers debian:
https://packages.debian.org/sid/libbonobo2-bin

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
index 8b6007e..57e6986 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
@@ -9,6 +9,9 @@ inherit gnomebase gtk-doc
 
 ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
 
+PACKAGES =+ "${PN}-bin"
+RDEPENDS_${PN}-bin = "${PN} perl"
+FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"
 FILES_${PN} += "${libdir}/orbit-2.0/*.so ${libdir}/bonobo/monikers/*.so"
 FILES_${PN}-dbg += "${libdir}/bonobo/monikers/.debug \
     ${libdir}/bonobo-2.0/samples/.debug ${libdir}/orbit-2.0/.debug"
-- 
1.9.1


