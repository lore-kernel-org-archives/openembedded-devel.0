Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6911875201
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 16:51:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5IGosNQ010927
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 09:51:30 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 18 Jun 2018 09:51:06 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Jun 2018 12:51:01 -0400
Message-ID: <1529340661-6337-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] thunar: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 16:51:39 -0000
Content-Type: text/plain

Since commit eb0fe21c1535 [thunar: upgrade 1.6.15 -> 1.8.0] we see a
QA Error/Warning regarding files 'installed-vs-shipped':

    ERROR: QA Issue: thunar: Files/directories were installed but not
    shipped in any package:
      /usr/lib
      /usr/lib/systemd
      /usr/lib/systemd/user
      /usr/lib/systemd/user/thunar.service

Correct the path to the systemd service file to match what we see in
other recipes which include "user" service files.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

This issue and patch is for master-next to match the
merge status of commit eb0fe21c1535.

 meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
index f03fd63..c2f6f59 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb
@@ -21,7 +21,7 @@ FILES_${PN} += " \
     ${libdir}/thunarx-3/* \
     ${libdir}/xfce4/panel/plugins/* \
     ${libdir}/Thunar/[Tt]hunar* \
-    ${libdir}/systemd \
+    ${systemd_user_unitdir} \
     ${datadir}/dbus-1 \
     ${datadir}/metainfo \
     ${datadir}/polkit-1 \
-- 
2.7.4


