Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E52E79EEC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2018 02:22:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA22MDD4013666
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Nov 2018 19:22:13 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 1 Nov 2018 19:22:12 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Nov 2018 10:22:11 +0800
Message-ID: <1541125331-409202-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-gnome][PATCH V2] network-manager-applet: change default buildclass
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
X-List-Received-Date: Fri, 02 Nov 2018 02:22:12 -0000
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
 .../network-manager-applet/network-manager-applet_1.8.18.bb             | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb
index fffb57f..cfb742c 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.18.bb
@@ -11,6 +11,8 @@ inherit distro_features_check gnomebase gsettings gtk-icon-cache gobject-introsp
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+GNOMEBASEBUILDCLASS = "autotools-brokensep"
+
 SRC_URI[archive.md5sum] = "34923579b39360db64649342ee6735d8"
 SRC_URI[archive.sha256sum] = "23dc1404f1e0622b7c4718b6d978b101d5e4d9be0b92133b3863a4dc29786178"
 
-- 
2.7.4


