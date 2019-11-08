Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F2A707FC79
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 10:22:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA8AMlds014421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Nov 2019 02:22:47 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Fri, 8 Nov 2019 02:22:46 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
Date: Fri, 8 Nov 2019 18:22:37 +0800
Message-ID: <20191108102237.34824-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108102237.34824-1-kai.kang@windriver.com>
References: <20191108102237.34824-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 4/4] xfce4-screensaver: 0.1.5 -> 0.1.8
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
X-List-Received-Date: Fri, 08 Nov 2019 10:22:46 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-screensaver from 0.1.5 to 0.1.8.

* add dependency libwnck3
* add runtime depenency python3-core

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ce4-screensaver_0.1.5.bb => xfce4-screensaver_0.1.8.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screensaver/{xfce4-screensaver_0.1.5.bb => xfce4-screensaver_0.1.8.bb} (81%)

diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.5.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.8.bb
similarity index 81%
rename from meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.5.bb
rename to meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.8.bb
index 4a1aae764..9c9c327b7 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.5.bb
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.8.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     "
 
-DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf"
+DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3"
 
 inherit xfce-app
 
@@ -16,11 +16,12 @@ SRC_URI_append = " \
     file://fix-cross-compile.patch \
     file://fix-pam-config.patch \
 "
-SRC_URI[md5sum] = "982f9a355456320933ec08313523a567"
-SRC_URI[sha256sum] = "fdecf0fc432b59defba2dd706051696d47227ca0744c7971014021190126f2d5"
+SRC_URI[md5sum] = "0fea7b676e6e533a3f305c6f642fe0cd"
+SRC_URI[sha256sum] = "4056045ea5fd3eccfe328b86ae245ee4949b9e3044e42ca29c492c0f4ac860d7"
 
 do_install_append() {
     install -D -m 0644 ${S}/data/xfce4-screensaver.common-auth ${D}${sysconfdir}/pam.d/xfce4-screensaver
 }
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/desktop-directories"
+RDEPENDS_${PN} += "python3-core"
-- 
2.17.1


