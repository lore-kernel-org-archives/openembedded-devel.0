Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99BA3605C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 07:33:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAM7XYqR005571
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 23:33:34 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 21 Nov 2016 23:33:33 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Nov 2016 15:31:09 +0800
Message-ID: <db5a84199da398db0b2c6f03f316d5de7bc0ce01.1479795970.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1479795970.git.jackie.huang@windriver.com>
References: <cover.1479795970.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 24/27] xfce4-session: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 22 Nov 2016 07:33:32 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

xfce4-session depends on virtual/libx11 so it requires
x11 distro feature.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
index 215aec3..a247206 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf polkit"
 RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth upower"
 
-inherit xfce update-alternatives
+inherit xfce update-alternatives distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "f4921fb2e606e74643daf1212263076c"
 SRC_URI[sha256sum] = "97d7f2a2d0af7f3623b68d1f04091e02913b28f9555dab8b0d26c8a1299d08fd"
-- 
2.8.3


