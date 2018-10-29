Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31BE565CF3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 02:12:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9T2CYQa021128
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Oct 2018 19:12:45 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Sun, 28 Oct 2018 19:12:12 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Oct 2018 10:12:10 +0800
Message-ID: <1540779130-71208-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] network-manager-applet: change default buildclass
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
X-List-Received-Date: Mon, 29 Oct 2018 02:12:54 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

network-manager-applet don't have good support of out-of-tree
build. refer this link:
https://gitlab.gnome.org/GNOME/network-manager-applet/issues/30#note_353935

change default buildclass to fix below occasionally compile failed
problem.

can't write to file src/wireless-security/ws-resources.hcan't write to file
src/wireless-security/ws-resources.cMakefile:5299: recipe for target
'src/wireless-security/ws-resources.h' failed

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../network-manager-applet/network-manager-applet_1.8.14.bb             | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
index 957516e..f200495 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
@@ -2,6 +2,8 @@ SUMMARY = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
+GNOMEBASEBUILDCLASS = "autotools-brokensep"
+
 DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib \
            gconf libgnome-keyring iso-codes nss \
            intltool-native \
-- 
2.7.4


