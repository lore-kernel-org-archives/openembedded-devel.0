Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rsi0x-0007QH-LM
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Feb 2012 22:46:51 +0100
Received: by eaal10 with SMTP id l10so176498eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Feb 2012 13:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=rolFrCRGWCiooC1DnEHvruB0V78noCpcUefKmUeqC3k=;
	b=IP0KiV/50scs2iHJozCwvi+oKoVPbLcxShtir9UpG+seRilwRo9ZOTRw3Wsl4oI1s1
	K7LRi8pdhDI64AD732XpL9xMOVuDTxHmh/2e7UF2djwWnQjxbXgAbG115rJoGZKP3F9j
	JgR+r04ZUkwA15V20KsU4R9LzcdXrXbpBYh1M=
Received: by 10.213.22.78 with SMTP id m14mr1353253ebb.51.1328132336192;
	Wed, 01 Feb 2012 13:38:56 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id b3sm1119017een.2.2012.02.01.13.38.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 13:38:55 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Feb 2012 22:36:48 +0100
Message-Id: <1328132208-15877-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-xfce][PATCH v3] xarchiver: Add version 0.5.2.
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
X-List-Received-Date: Wed, 01 Feb 2012 21:46:51 -0000

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
new file mode 100644
index 0000000..5c6b7f5
--- /dev/null
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Lightweight, desktop independent GTK+ archive manager"
+HOMEPAGE = "http://xarchiver.sourceforge.net"
+SECTION = "x11"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools-native"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2"
+SRC_URI[md5sum] = "2bc7f06403cc6582dd4a8029ec9d038d"
+SRC_URI[sha256sum] = "cea932ff9d505969201fd502470bbebbc5726ab3d6765e142fc8295aa677ad2a"
+
+inherit gettext pkgconfig autotools gtk-icon-cache
+
+RRECOMMENDS_${PN} = "lzop zip tar"
-- 
1.7.3.4



