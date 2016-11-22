Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 189CA719BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 07:32:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAM7X1DM007421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 23:33:01 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 21 Nov 2016 23:33:00 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Nov 2016 15:30:47 +0800
Message-ID: <71b5cbe4a9b1d7274e344a16cdfa47733b993629.1479795970.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1479795970.git.jackie.huang@windriver.com>
References: <cover.1479795970.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 02/27] pavucontrol: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 22 Nov 2016 07:33:00 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

pavucontrol depends on gtkmm which requires x11 distro feature.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
index bdffb2a..51e24c4 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "intltool-native gtkmm libcanberra pulseaudio"
 
-inherit gnome
+inherit gnome distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz"
 SRC_URI[md5sum] = "176308d2c03f8f3a7b2bd4f4d284fe71"
-- 
2.8.3


