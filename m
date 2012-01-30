Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RrxnL-00020E-FY
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 21:25:43 +0100
Received: by eekd41 with SMTP id d41so1277060eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 12:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=4YVJA9EdohpKFX6tNyH8nva086ZhkjaS6ZCZkzhBKu8=;
	b=nLgaBGmOF1tKzTuUUQ5FJIIryrkcPEqH1RgVbBx76eC8SQhgGnIecATF/Z2Tb0RKjI
	pN9MecE9rIoiTKn1QCiJRsITlAW2BSE/gZOBv7FB4/iCexr+Ewa2k//rXbMRLEgyOZuT
	a1Q4v8bepBJyVPVfbu8ktvhvk30le4TF19Wew=
Received: by 10.14.52.15 with SMTP id d15mr108483eec.105.1327954670402;
	Mon, 30 Jan 2012 12:17:50 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id y12sm76701237eeb.11.2012.01.30.12.17.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 12:17:49 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2012 21:15:36 +0100
Message-Id: <1327954536-29427-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-xfce][PATCH] Add recipe for xarchiver 0.5.2.
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
X-List-Received-Date: Mon, 30 Jan 2012 20:25:43 -0000

Run tested on netbookpro.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
new file mode 100644
index 0000000..b2e5fb6
--- /dev/null
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Lightweight desktop independent, GTK+ archive manager"
+HOMEPAGE = "http://xarchiver.sourceforge.net"
+SECTION = "x11"
+PR = "r0"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools"
+RRECOMMENDS = "lzop zip"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2"
+SRC_URI[md5sum] = "2bc7f06403cc6582dd4a8029ec9d038d"
+SRC_URI[sha256sum] = "cea932ff9d505969201fd502470bbebbc5726ab3d6765e142fc8295aa677ad2a"
+
+inherit gettext pkgconfig autotools gtk-icon-cache
-- 
1.7.3.4



