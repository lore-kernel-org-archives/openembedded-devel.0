Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF8D719C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 07:33:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAM7XXk7010610
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 23:33:33 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 21 Nov 2016 23:33:32 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Nov 2016 15:31:08 +0800
Message-ID: <f4fced63711f3623009f6c7d6d284e382c71d8f8.1479795970.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1479795970.git.jackie.huang@windriver.com>
References: <cover.1479795970.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 23/27] xfce4-power-manager: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 22 Nov 2016 07:33:31 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

xfce4-power-manager depends on virtual/libx11 so it requires
x11 distro feature.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb
index 71df34c..e69118c 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb
@@ -5,7 +5,9 @@ SECTION = "x11"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-inherit xfce
+inherit xfce distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "gtk+3 glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
            libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
-- 
2.8.3


