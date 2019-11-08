Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 316467FC50
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 10:22:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xA8AMhNH006860
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Nov 2019 02:22:43 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Fri, 8 Nov 2019 02:22:42 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
Date: Fri, 8 Nov 2019 18:22:35 +0800
Message-ID: <20191108102237.34824-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108102237.34824-1-kai.kang@windriver.com>
References: <20191108102237.34824-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 2/4] xfce-panel-plugin.bbclass: correct SRC_URI with xfce_verdir
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
X-List-Received-Date: Fri, 08 Nov 2019 10:22:43 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The SRC_URI is wrongly calculated in xfce-panel-plugin.bbclass when the
length of first 2 parts(separated by dot(.)) of PV is longer than 3 such
as 0.10. It should use function xfce_verdir() instead which is
introduced by xfce.bbclass.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-xfce/classes/xfce-panel-plugin.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/classes/xfce-panel-plugin.bbclass b/meta-xfce/classes/xfce-panel-plugin.bbclass
index 29c1245ca..f34ee0739 100644
--- a/meta-xfce/classes/xfce-panel-plugin.bbclass
+++ b/meta-xfce/classes/xfce-panel-plugin.bbclass
@@ -4,11 +4,11 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libxfce4ui libxfce4util xfce4-panel"
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 
 FILES_${PN} += "${datadir}/xfce4/panel-plugins/"
 FILES_${PN} += "${datadir}/xfce4/panel/plugins/"
 FILES_${PN} += "${libdir}/xfce4/panel-plugins/*.so"
 FILES_${PN} += "${libdir}/xfce4/panel/plugins/*.so"
 
-FILES_${PN}-dev += "${libdir}/xfce4/panel/plugins/*.la"
\ No newline at end of file
+FILES_${PN}-dev += "${libdir}/xfce4/panel/plugins/*.la"
-- 
2.17.1


