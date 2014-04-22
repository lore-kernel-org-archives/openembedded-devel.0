Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4423B60DD7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Apr 2014 06:49:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3M6n1sT005513
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Apr 2014 23:49:01 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 21 Apr 2014 23:49:00 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Apr 2014 14:48:55 +0800
Message-ID: <999dfca62f8060ab79736cf85a2e892da346c3b3.1398149249.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1398149249.git.hongxu.jia@windriver.com>
References: <cover.1398149249.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] lib32-libcanberra: fix QA Warning Files/directories were installed but not shipped
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
X-List-Received-Date: Tue, 22 Apr 2014 06:49:04 -0000
Content-Type: text/plain

...
WARNING: QA Issue: lib32-libcanberra: Files/directories were installed but not shipped
  /usr/lib/libcanberra-0.29/libcanberra-gstreamer.so
  /usr/lib/libcanberra-0.29/libcanberra-multi.so
  /usr/lib/libcanberra-0.29/libcanberra-pulse.so
  /usr/lib/libcanberra-0.29/libcanberra-null.so
  /usr/lib/libcanberra-0.29/libcanberra-alsa.so
  /usr/lib/libcanberra-0.29/.debug
  /usr/lib/libcanberra-0.29/.debug/libcanberra-gstreamer.so
  /usr/lib/libcanberra-0.29/.debug/libcanberra-multi.so
  /usr/lib/libcanberra-0.29/.debug/libcanberra-pulse.so
  /usr/lib/libcanberra-0.29/.debug/libcanberra-null.so
  /usr/lib/libcanberra-0.29/.debug/libcanberra-alsa.so
...

The dynamic libraries were installed into '${BPN}-${PV}' rather than '${P}'.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
index 332b62b..b10c3fd 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
@@ -32,7 +32,7 @@ PACKAGECONFIG[alsa] = "--enable-alsa, --disable-alsa, alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse, --disable-pulse, pulseaudio"
 
 python populate_packages_prepend() {
-    plugindir = d.expand('${libdir}/${P}/')
+    plugindir = d.expand('${libdir}/${BPN}-${PV}/')
     do_split_packages(d, plugindir, '^libcanberra-(.*)\.so$', 'libcanberra-%s', '%s support library', extra_depends='' )
     do_split_packages(d, plugindir, '^libcanberra-(.*)\.la$', 'libcanberra-%s', '%s support library', extra_depends='' )
 }
@@ -44,7 +44,7 @@ FILES_${PN} = "${bindir}/ ${libdir}/${BPN}.so.*"
 
 FILES_${PN}-dev += "${datadir}/vala/vapi ${libdir}/*/modules/*.la ${libdir}/*/*.la"
 
-FILES_${PN}-dbg += "${libdir}/${P}/.debug ${libdir}/gtk-*/modules/.debug"
+FILES_${PN}-dbg += "${libdir}/${BPN}-${PV}/.debug ${libdir}/gtk-*/modules/.debug"
 
 FILES_${PN}-gtk2 = "${libdir}/${BPN}-gtk.so.* \
                     ${libdir}/gtk-2.0/modules/*.so \
-- 
1.8.1.2


