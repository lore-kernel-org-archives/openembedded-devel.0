Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1EE76639
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 07:22:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8B7M1M3017379
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 00:22:01 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Fri, 11 Sep 2015 00:22:01 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Sep 2015 15:22:09 +0800
Message-ID: <1441956129-8191-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] libxfce4ui: add RDEPENDS on PN for PN-gtk2 and PN-gtk3
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
X-List-Received-Date: Fri, 11 Sep 2015 07:22:03 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

gtk libs was separated into PN-gtk after commit:
d4e5b33 libxfce4ui: build gtk3 libs and pack gtk2/gtk3 libs in separate packages

but config files such as xfce4-keyboard-shortcuts.xml
is in PN, it works without this, but there no any keyboard
shortcut, add the RDEPENDS so that the libs and config
files will be both installed.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
index 26d21c1..723c20d 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
@@ -28,3 +28,6 @@ FILES_${PN}-dev += "${libdir}/glade3/modules/*.la \
 PACKAGES += "${PN}-glade"
 FILES_${PN}-glade = "${libdir}/glade3 \
                      ${datadir}/glade3"
+
+RDEPENDS_${PN}-gtk2 = "${PN}"
+RDEPENDS_${PN}-gtk3 = "${PN}"
-- 
1.9.1


