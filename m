Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2997F32F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2019 07:44:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7N7iJ4i029771
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Aug 2019 00:44:19 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 23 Aug 2019 00:44:08 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Fri, 23 Aug 2019 03:43:33 -0400
Message-ID: <20190823074335.162124-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190823074335.162124-1-kai.kang@windriver.com>
References: <20190823074335.162124-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 1/3] xfce-panel-plugin.bbclass: correct SRC_URI with xfce_verdir
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
X-List-Received-Date: Fri, 23 Aug 2019 07:44:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The SRC_URI in xfce-panel-plugin.bbclass is not right when first 2
parts(separated by dot(.)) of PV is longer than 3 such as 0.10. It
should use function xfce_verdir() which introduced by xfce.bbclass.

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
2.20.0


