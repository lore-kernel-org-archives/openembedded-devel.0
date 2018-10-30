Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5946479C6C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 01:50:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9U1o3Gu001987
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 18:50:03 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 29 Oct 2018 18:50:02 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Oct 2018 09:07:45 +0800
Message-ID: <20181030010748.3266-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20181030010748.3266-1-kai.kang@windriver.com>
References: <20181030010748.3266-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 1/4] xfconf: 4.13.5 -> 4.13.6
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
X-List-Received-Date: Tue, 30 Oct 2018 01:50:05 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade xfconf from 4.13.5 to 4.13.6.
* update FILES

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfconf/{xfconf_4.13.5.bb => xfconf_4.13.6.bb}            | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.5.bb => xfconf_4.13.6.bb} (67%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.5.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
similarity index 67%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.13.5.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
index 615350240..191d0fd78 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.5.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
@@ -8,8 +8,9 @@ inherit xfce gtk-doc
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[md5sum] = "1ce1a7f694fb6a4a4a32000f72131ea9"
-SRC_URI[sha256sum] = "90b4eb0cdf407339c091e9811f7a40b4cfa215ebb03a921503b7e21f0f4f63cb"
+SRC_URI[md5sum] = "da19df12dbc494c8a4da3974e376d639"
+SRC_URI[sha256sum] = "d1a3d442dae188b5a7380b5815377e5488578cdafb03ae363e9426e3b01185df"
 
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
+                ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
                 ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
-- 
2.18.0


