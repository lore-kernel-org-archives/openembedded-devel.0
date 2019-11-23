Return-Path: <leon.anavi@konsulko.com>
Received: from anavi.org (anavi.technology [91.215.217.29])
	by mail.openembedded.org (Postfix) with ESMTP id 1CAC27FC4A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Nov 2019 13:05:52 +0000 (UTC)
Received: from [78.130.245.67] (port=48302 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-SHA256:128) (Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1iYV6m-0001WN-BM; Sat, 23 Nov 2019 15:05:52 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Nov 2019 15:05:41 +0200
Message-Id: <1574514341-32435-1-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [meta-oe][PATCH] stalonetray: Add a simple stand-alone system tray
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
X-List-Received-Date: Sat, 23 Nov 2019 13:05:53 -0000

Stalonetray is a simple and convenient stand-alone freedesktop.org
and KDE system tray for X11 with minimal dependencies.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb

diff --git a/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb b/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
new file mode 100644
index 0000000..8851729
--- /dev/null
+++ b/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Stand-alone system tray"
+DESCRIPTION = "Stalonetray is a stand-alone freedesktop.org and KDE system tray"
+SECTION = "x11/graphics"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "virtual/libx11"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "ae95dbbacc2620e032acea8abab8c9ef"
+SRC_URI[sha256sum] = "36548a588b2d466913423245dda6ffb6313132cd0cec635a117d37b3dab5fd4c"
+
+inherit autotools
-- 
2.7.4


