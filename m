Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10DCB60053
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 05:55:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G5toWW019334
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 22:55:51 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 15 Sep 2015 22:55:50 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Sep 2015 13:56:00 +0800
Message-ID: <1442382960-16294-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] xfce4-pulseaudio-plugin: add packageconfig for libnotify
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
X-List-Received-Date: Wed, 16 Sep 2015 05:55:54 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add PACKAGECONFIG for libnotify and disable it by default
to avoid the QA issue:

WARNING: QA Issue: xfce4-pulseaudio-plugin rdepends on libnotify, but it isn't a build dependency? [build-deps]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb
index f9ad32f..9a95cde 100644
--- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb
@@ -11,4 +11,7 @@ DEPENDS += "pulseaudio"
 SRC_URI[md5sum] = "13a47ba5a72c16fb06f7e1cc89858cc7"
 SRC_URI[sha256sum] = "e82836bc8cf7d905b4e60d43dc630ba8e32dea785989700c71d4aeee9f583b33"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
+
 RRECOMMENDS_${PN} = "pavucontrol"
-- 
1.9.1


