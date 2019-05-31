Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 627BE7E562
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 08:45:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4V8jwSo025942
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2019 01:45:58 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 31 May 2019 01:45:58 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 31 May 2019 04:44:21 -0400
Message-ID: <20190531084423.172617-9-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190531084423.172617-1-kai.kang@windriver.com>
References: <20190531084423.172617-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 08/10] xfconf: 4.13.6 -> 4.13.7
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
X-List-Received-Date: Fri, 31 May 2019 08:45:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfconf/{xfconf_4.13.6.bb => xfconf_4.13.7.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.6.bb => xfconf_4.13.7.bb} (82%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.7.bb
similarity index 82%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.13.7.bb
index ded3c44e5..9f08f74ed 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.7.bb
@@ -8,8 +8,8 @@ inherit xfce gtk-doc
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[md5sum] = "da19df12dbc494c8a4da3974e376d639"
-SRC_URI[sha256sum] = "d1a3d442dae188b5a7380b5815377e5488578cdafb03ae363e9426e3b01185df"
+SRC_URI[md5sum] = "ea4c070c4ed8387e6435b56d0e871559"
+SRC_URI[sha256sum] = "5deb13fc48a4116f5ebdee5c21d0fd3deb85bec2f69602beb3c3adb4f85e5bde"
 
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
-- 
2.20.0


