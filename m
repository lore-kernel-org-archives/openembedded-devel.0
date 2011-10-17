Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RFr0B-0003nY-Ri
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 19:29:28 +0200
Received: by eyd9 with SMTP id 9so3120227eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 10:23:32 -0700 (PDT)
Received: by 10.213.27.79 with SMTP id h15mr1956714ebc.98.1318872207110;
	Mon, 17 Oct 2011 10:23:27 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id x45sm31189939eeh.11.2011.10.17.10.23.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 10:23:26 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Oct 2011 19:23:18 +0200
Message-Id: <1318872201-26433-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-xfce 1/4] libxfcegui4: add 4.8.1
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
X-List-Received-Date: Mon, 17 Oct 2011 17:29:28 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-xfce/libxfcegui4/libxfcegui4_4.8.1.bb  |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/libxfcegui4/libxfcegui4_4.8.1.bb

diff --git a/meta-xfce/recipes-xfce/libxfcegui4/libxfcegui4_4.8.1.bb b/meta-xfce/recipes-xfce/libxfcegui4/libxfcegui4_4.8.1.bb
new file mode 100644
index 0000000..1273880
--- /dev/null
+++ b/meta-xfce/recipes-xfce/libxfcegui4/libxfcegui4_4.8.1.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Xfce4 Widget library and X Window System interaction"
+DEPENDS = "intltool virtual/libx11 libxfce4util xfconf libxml2 gtk+ libglade"
+
+LICENSE = "GPLv2 LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee \
+                    file://COPYING.LIB;md5=b8081563814865b09774a6915b594a71 \
+                   "
+
+SECTION = "x11/libs"
+
+inherit xfce gettext
+
+SRC_URI[md5sum] = "ca0cdeff99f1732307d0fc0672d382ef"
+SRC_URI[sha256sum] = "309a81823cdfdb7301bc6a5199e14f0df29b58dae89a9302c7839b9b94812443"
+
+LEAD_SONAME = "libxfcegui4.so.4"
+
+FILES_${PN} += "${libdir}/xfce4/modules ${libdir}/libglade/2.0/*.so ${datadir}/xfce4/mime ${datadir}/icons/hicolor"
+RDEPENDS_${PN} = "xfconf startup-notification "
+
-- 
1.6.6.1



