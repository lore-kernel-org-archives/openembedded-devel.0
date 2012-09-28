Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1THUFV-0001Mb-NP
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Sep 2012 08:40:33 +0200
Received: by weyt44 with SMTP id t44so1122878wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Sep 2012 23:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=g0hp7XMiiZNj2nX/klH0LLsulxSEM87CMOEw3hUfZvY=;
	b=UBiiQR0ZF1elaSOOXtieJ8LrqbYYUIAPaEykNKHDrM1duFbQlNTaIqa5QfC/rOQUOR
	tlxE1uZW1tdSlRSt+F2zQSwDNTtixteKswCQGf1RnM8TGwqXog4gy+Gv2Jsv/slJGjFF
	fdIo+s+5P+jsjBlVVtgDfI2ZjBW+sS5Q8DMOf66N9HilX+nXLpQmiNizlwpE8FRp3nLE
	MbBmEPovkuDgsIrDzj1FLCn1mSsWWRc1wjJ4iF/WcndX+zHKQHT72ISM9EjqsAT4p/9k
	fG8YqotKhOAA0kUjoIWfqy64t6JqrED9dgwN+3nL75fcVIw/LaRx/DG8l+LYUwCbS5ov
	/4ag==
Received: by 10.216.101.72 with SMTP id a50mr2916880weg.210.1348813661270;
	Thu, 27 Sep 2012 23:27:41 -0700 (PDT)
Received: from localhost.localdomain (p5B0A31AA.dip.t-dialin.net.
	[91.10.49.170])
	by mx.google.com with ESMTPS id cu1sm35004550wib.6.2012.09.27.23.27.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 23:27:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Sep 2012 08:35:50 +0200
Message-Id: <1348814151-31167-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1348814151-31167-1-git-send-email-schnitzeltony@googlemail.com>
References: <1348814151-31167-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, meta-xfce 2/3] libxfce4ui: add glade package
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
X-List-Received-Date: Fri, 28 Sep 2012 06:40:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* To edit glade files for xfce-packages it needs libxfce4ui's catalog [1].
* Unfortunately some host distributions do not supply a libxfce4ui-glade package.
* By installing glade3 + libxfce4ui-glade it is now possible to edit xfce's
  glade-files on target machine.

[1] http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/20021

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb   |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
index 32505de..b5eb604 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
@@ -2,12 +2,18 @@ DESCRIPTION = "Xfce4 Widget library and X Window System interaction"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "gtk+ intltool libxfce4util startup-notification xfconf"
+PR = "r1"
+DEPENDS = "gtk+ intltool libxfce4util startup-notification xfconf glade3"
 
 inherit xfce
 
 SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
-
 SRC_URI[md5sum] = "6df1ce474a3d4885aee31cda9dbc9192"
 SRC_URI[sha256sum] = "a2b9fa288ccb5f16fa13264e507ba3f7b8da0176da259a11239f21538c0ea3e2"
 
+FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
+FILES_${PN}-dev += "${libdir}/glade3/modules/*.la \
+                   ${datadir}/glade3/catalogs/*.in"
+PACKAGES += "${PN}-glade"
+FILES_${PN}-glade = "${libdir}/glade3 \
+                     ${datadir}/glade3"
-- 
1.7.4.4



