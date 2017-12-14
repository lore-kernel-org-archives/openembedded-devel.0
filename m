Return-Path: <tobias.olausson@pelagicore.com>
X-Greylist: delayed 327 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Dec 2017 09:45:00 UTC
Received: from ORO-EDGE-03.luxoft.com (oro-edge-03.luxoft.com [109.166.244.23])
	by mail.openembedded.org (Postfix) with ESMTP id D4AC471A35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 09:45:00 +0000 (UTC)
Received: from ORO-HUBT-01.luxoft.com (172.30.115.41) by
	oro-edge-03.luxoft.com (172.30.19.23) with Microsoft SMTP Server (TLS)
	id 14.3.319.2; Thu, 14 Dec 2017 11:39:33 +0200
Received: from vagra2.luxoft.com (172.31.240.124) by ORO-HUBT-01.luxoft.com
	(172.30.115.101) with Microsoft SMTP Server (TLS) id 14.3.319.2;
	Thu, 14 Dec 2017 11:39:33 +0200
From: <tobias.olausson@pelagicore.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Dec 2017 10:39:20 +0100
Message-ID: <20171214093920.19604-1-tobias.olausson@pelagicore.com>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
X-Originating-IP: [172.31.240.124]
Subject: [meta-oe][PATCH] Move RDEPENDS on libasound-module to bluez4 since it has been removed from bluez5
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
X-List-Received-Date: Thu, 14 Dec 2017 09:45:01 -0000
Content-Type: text/plain

From: Tobias Olausson <tobias.olausson@pelagicore.com>

See also: https://patchwork.openembedded.org/patch/139422/

Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>
---
 .../recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
index 317f9728b..f2a16dcf7 100644
--- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
+++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
@@ -15,13 +15,13 @@ inherit bluetooth
 
 RDEPENDS_bluez4 = " \
     obexftp \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'libasound-module-bluez', '', d)} \
 "
 
 RDEPENDS_bluez5 = " \
     bluez5-noinst-tools \
     bluez5-obex \
     bluez5-testtools  \
-    libasound-module-bluez \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', \
         'pulseaudio-module-bluetooth-discover \
          pulseaudio-module-bluetooth-policy \
-- 
2.15.1


