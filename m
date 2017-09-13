Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1F87865F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:05:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id AAA5A2602D5
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Sep 2017 22:05:36 +0200
Message-Id: <1b7c6305d2988b6e9eb10a861cfe25d8143a5225.1505333001.git.fabien.lahoudere@collabora.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
References: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
In-Reply-To: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
References: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
Subject: [meta-multimedia][PATCH v4 1/2] libupnp: Add recipe for version 1.8.2
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
X-List-Received-Date: Wed, 13 Sep 2017 20:05:49 -0000

This version is needed for gerbera, however this version break mpd.
So we keep both recipe.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
---
 .../recipes-connectivity/libupnp/libupnp1.8.bb       | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp1.8.bb

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp1.8.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp1.8.bb
new file mode 100644
index 000000000..7a524f2d5
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp1.8.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Portable SDK for UPnP* Devices"
+DESCRIPTION = "The Portable SDK for UPnP Devices is an SDK for development of \
+UPnP device and control point applications. It consists of the core UPnP \
+protocols along with a UPnP-specific eXtensible Markup Language (XML) parser \
+supporting the Document Object Model (DOM) Level 2 API and an optional, \
+integrated mini web server for serving UPnP related documents."
+HOMEPAGE = "http://pupnp.sourceforge.net/"
+LICENSE = "BSD"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
+
+PV = "1.8.2+git${SRCPV}"
+SRCREV = "56d6042abae861e8838a4e6b6b5b575b99e38f34"
+SRC_URI = "git://github.com/mrjimenez/pupnp.git;protocol=https"
+
+S="${WORKDIR}/git"
+
+inherit autotools
+
+EXTRA_OECONF += "--enable-reuseaddr"
\ No newline at end of file
-- 
2.11.0


