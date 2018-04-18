Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66364744E2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 08:22:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3I8MRvp001037
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 01:22:28 -0700 (PDT)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 18 Apr 2018 01:22:27 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Apr 2018 16:22:24 +0800
Message-ID: <1524039745-12148-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [meta-networking][PATCH 1/2] networkmanager: fix QA issue error for multilib
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
X-List-Received-Date: Wed, 18 Apr 2018 08:22:27 -0000
Content-Type: text/plain

When enable multilib build, there is a QA Issue error:
ERROR: networkmanager-1.10.6-r0 do_package: QA Issue: networkmanager: Files/directories were installed but not shipped in any package:
  /usr/lib/NetworkManager
  /usr/lib/NetworkManager/VPN
  /usr/lib/NetworkManager/conf.d
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
networkmanager: 3 installed and not shipped files.  [installed-vs-shipped]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.10.6.bb      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
index 6538e7b..074a0af 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
@@ -96,8 +96,8 @@ FILES_${PN} += " \
     ${libexecdir} \
     ${libdir}/pppd/*/nm-pppd-plugin.so \
     ${libdir}/NetworkManager/*.so \
-    ${libdir}/NetworkManager/VPN \
-    ${libdir}/NetworkManager/conf.d \
+    ${nonarch_libdir}/NetworkManager/VPN \
+    ${nonarch_libdir}/NetworkManager/conf.d \
     ${datadir}/polkit-1 \
     ${datadir}/dbus-1 \
     ${base_libdir}/udev/* \
-- 
2.7.4


