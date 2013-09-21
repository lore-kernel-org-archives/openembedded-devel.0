Return-Path: <superandy@localhost.localdomain>
Received: from localhost.localdomain (p5B0A2F3E.dip0.t-ipconnect.de
	[91.10.47.62])
	by mail.openembedded.org (Postfix) with ESMTP id 6788B6C99E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2013 10:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.7/8.14.7) with ESMTP id r8LAg1rI013450; 
	Sat, 21 Sep 2013 12:42:01 +0200
Received: (from superandy@localhost)
	by localhost.localdomain (8.14.7/8.14.7/Submit) id r8LAg0jr013449;
	Sat, 21 Sep 2013 12:42:00 +0200
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Sep 2013 12:41:37 +0200
Message-Id: <1379760101-13380-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 06/10] libcanberra: move libtool librarties for modules to dev package
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
X-List-Received-Date: Sat, 21 Sep 2013 10:42:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
index 8b771bf..332b62b 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
@@ -47,14 +47,12 @@ FILES_${PN}-dev += "${datadir}/vala/vapi ${libdir}/*/modules/*.la ${libdir}/*/*.
 FILES_${PN}-dbg += "${libdir}/${P}/.debug ${libdir}/gtk-*/modules/.debug"
 
 FILES_${PN}-gtk2 = "${libdir}/${BPN}-gtk.so.* \
-                    ${libdir}/gtk-2.0/modules/*.la \
                     ${libdir}/gtk-2.0/modules/*.so \
                     ${bindir}/canberra-gtk-play"
 
 # -gtk3 ships a symlink to a .so
 INSANE_SKIP_${PN}-gtk3 = "dev-so"
 FILES_${PN}-gtk3 = "${libdir}/${BPN}-gtk3.so.* \
-                    ${libdir}/gtk-3.0/modules/*.la \
                     ${libdir}/gtk-3.0/modules/*.so \
                     ${bindir}/canberra-gtk3-play"
 
-- 
1.8.3.1


