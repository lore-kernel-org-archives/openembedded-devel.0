Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 81FAD6AA18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 13:30:24 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2014 13:30:15 +0000
Message-Id: <1389965415-4912-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.5.2
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: [meta-oe][PATCHv2] opus-tools: add 0.1.8
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
X-List-Received-Date: Fri, 17 Jan 2014 13:30:26 -0000

From: Jack Mitchell <jack@embed.me.uk>

Signed-off-by: Jack Mitchell <jack@embed.me.uk>
---
 meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb

diff --git a/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
new file mode 100644
index 0000000..ff63111
--- /dev/null
+++ b/meta-oe/recipes-multimedia/opus-tools/opus-tools_0.1.8.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Opus Audio Tools"
+HOMEPAGE = "http://www.opus-codec.org/"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=843a066da9f1facfcc6ea6f616ffecb1"
+
+SRC_URI = "http://downloads.xiph.org/releases/opus/opus-tools-${PV}.tar.gz"
+SRC_URI[md5sum] = "b424790eda9357a4df394e2d7ca19eac"
+SRC_URI[sha256sum] = "e4e188579ea1c4e4d5066460d4a7214a7eafe3539e9a4466fdc98af41ba4a2f6"
+
+S = "${WORKDIR}/opus-tools-${PV}"
+
+DEPENDS = "libopus flac"
+
+inherit autotools pkgconfig
-- 
1.8.5.2


