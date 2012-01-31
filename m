Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RsJwC-00067Z-7t
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 21:04:20 +0100
Received: by eaao11 with SMTP id o11so114264eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 11:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8PvHBfqCwDahXtgPBLD2PxL9ncX6611XEk9dRXnJcVk=;
	b=pOLAVz3flFrddsisS9862RyC/zRkPjQPk/9UDZWeZ21uDxSfNmhNBULvvVZt1c0C7h
	tMJnMQlg3LhMM/xqDjcqCga2RF3rr4PIdQM/dgpWtgw3bakLsrTLP5NznawTkEUyKg+7
	0xD/Qf4yIrRtLtSp4dReqshM0i+3Iv8SFYcgE=
Received: by 10.213.15.211 with SMTP id l19mr623767eba.46.1328039785862;
	Tue, 31 Jan 2012 11:56:25 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id n17sm89765521eei.3.2012.01.31.11.56.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 11:56:24 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jan 2012 20:54:17 +0100
Message-Id: <1328039657-3070-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-xfce][PATCH v2] Add recipe for xarchiver 0.5.2.
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
X-List-Received-Date: Tue, 31 Jan 2012 20:04:20 -0000

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../recipes-apps/xarchiver/xarchiver_0.5.2.bb      |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
new file mode 100644
index 0000000..66e9273
--- /dev/null
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.2.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Lightweight, desktop independent GTK+ archive manager"
+HOMEPAGE = "http://xarchiver.sourceforge.net"
+SECTION = "x11"
+
+LICENSE = "GPLv2"
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



