Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F16546AC37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 08:59:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3I8xeHY020174
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Apr 2018 01:59:40 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 18 Apr 2018 01:59:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Apr 2018 17:07:09 +0800
Message-ID: <1524042429-22741-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] xfce4-screenshooter: fix parallel build issue
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
X-List-Received-Date: Wed, 18 Apr 2018 08:59:42 -0000
Content-Type: text/plain

While do an out-of-tree build, if dir panel-plugin is not created
in time, there is a compile failure:
...
| intltool-merge  -d -u -c ./po/.intltool-merge-cache ../xfce4-screenshooter-1.9.1/po
../xfce4-screenshooter-1.9.1/panel-plugin/screenshooter.desktop.in
panel-plugin/screenshooter.desktop
| Died at intltool-merge line 1184, <PO_FILE> line 22700.
...
Ensure panel-plugin subdirectory exists fixes the issue.

The fix refers the following commit:
...
commit 754754b53bbf4c72d7855e9209f1ccecce5cd8dd
Author: Catalin Enache <catalin.enache@windriver.com>
Date:   Thu Nov 9 11:12:29 2017 +0800

    xfce4-screenshooter: create src dir before build
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
index e449dce..6702d73 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "e62b31d9cf06a7414a26400c2ebe7a2ae7c2b22aa60f997f25145ea9eb
 
 do_compile_prepend() {
     mkdir -p lib
-    mkdir -p src
+    mkdir -p src panel-plugin
 }
 
 FILES_${PN} += " \
-- 
2.7.4


