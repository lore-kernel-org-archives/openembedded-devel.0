Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1788D605C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 07:33:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAM7XOZT007468
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 23:33:24 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 21 Nov 2016 23:33:23 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Nov 2016 15:31:02 +0800
Message-ID: <bb400be87fcb27915ae0b18e6e864d62b0b70da3.1479795970.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1479795970.git.jackie.huang@windriver.com>
References: <cover.1479795970.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 17/27] gtk-xfce-engine: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 22 Nov 2016 07:33:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

gtk-xfce-engine depends on gtk+ which requires
x11 distro feature.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
index b9835ab..ae7f99f 100644
--- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
+++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
@@ -4,7 +4,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+ xfce4-dev-tools-native"
 
-inherit xfce
+inherit xfce distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "363d6c16a48a00e26d45c45c2e1fd739"
 SRC_URI[sha256sum] = "875c9c3bda96faf050a2224649cc42129ffb662c4de33add8c0fd1fb860b47ed"
-- 
2.8.3


