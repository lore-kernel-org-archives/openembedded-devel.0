Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1398E71DEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 07:19:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3H7Jxiv024932
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Apr 2018 00:19:59 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 17 Apr 2018 00:19:58 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <akuster808@gmail.com>
Date: Tue, 17 Apr 2018 15:27:27 +0800
Message-ID: <1523950047-18434-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH] xfce4-notifyd: fix parallel build issue
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
X-List-Received-Date: Tue, 17 Apr 2018 07:19:59 -0000
Content-Type: text/plain

While do an out-of-tree build, if xfce4-notifyd-config is not created
in time, there is a compile failure:
...
|LC_ALL=C intltool-merge -d -u -c ./po/.intltool-merge-cache
../xfce4-notifyd-0.4.0/po ../xfce4-notifyd-0.4.0/xfce4-notifyd-config/
xfce4-notifyd-config.desktop.in xfce4-notifyd-config/xfce4-notifyd-config.desktop
|Died at intltool-merge line 1184.
...

Ensure xfce4-notifyd-config subdirectory exists fixes the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb
index 54e702e..15ec51b 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.4.2.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "f6f28af47fdfb41db84bd003f0d76f5f4abf2137d1e27e9d378f063bb8
 EXTRA_OECONF = "--disable-dbus-start-daemon"
 
 do_compile_prepend() {
-    mkdir -p xfce4-notifyd
+    mkdir -p xfce4-notifyd xfce4-notifyd-config
 }
 
 FILES_${PN} += " \
-- 
2.7.4


