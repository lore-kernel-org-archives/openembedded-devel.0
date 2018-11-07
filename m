Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2588079D62
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 16:40:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA7Ge3d4003734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Nov 2018 08:40:35 -0800
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 7 Nov 2018 08:40:08 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 Nov 2018 11:40:02 -0500
Message-ID: <1541608802-6985-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] meta-xfce: xfconf: fixup installed-vs-shipped QA issue
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
X-List-Received-Date: Wed, 07 Nov 2018 16:40:45 -0000
Content-Type: text/plain

Since the xfconf uprev, commit 4222cac97678 [xfconf: 4.13.5 ->
4.13.6], we are getting a QA issue:

  ERROR: xfconf-4.13.6-r0 do_package: QA Issue: xfconf: Files/directories were installed but not shipped in any package:
  /usr/lib64/gio/modules/libxfconfgsettingsbackend.la
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  xfconf: 1 installed and not shipped files. [installed-vs-shipped]
  ERROR: xfconf-4.13.6-r0 do_package: Fatal QA errors found, failing task.
  ERROR: xfconf-4.13.6-r0 do_package: Function failed: do_package

We need to include the .la file in the -dev package to avoid this.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
index 191d0fd..2667ff9 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
@@ -14,3 +14,5 @@ SRC_URI[sha256sum] = "d1a3d442dae188b5a7380b5815377e5488578cdafb03ae363e9426e3b0
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
                 ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
+
+FILES_${PN}-dev += "${libdir}/gio/modules/libxfconfgsettingsbackend.la"
-- 
2.7.4


