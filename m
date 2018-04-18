Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4448974554
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 08:22:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3I8MV4W009362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 01:22:31 -0700 (PDT)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 18 Apr 2018 01:22:30 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Apr 2018 16:22:25 +0800
Message-ID: <1524039745-12148-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524039745-12148-1-git-send-email-yi.zhao@windriver.com>
References: <1524039745-12148-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [meta-networking][PATCH 2/2] networkmanager-openvpn: fix QA issue error for multilib
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
X-List-Received-Date: Wed, 18 Apr 2018 08:22:30 -0000
Content-Type: text/plain

When enable multilib build, there is a QA Issue error:
ERROR: networkmanager-openvpn-1.2.8-r0 do_package: QA Issue: networkmanager-openvpn: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/NetworkManager
  /usr/lib/NetworkManager/VPN
  /usr/lib/NetworkManager/VPN/nm-openvpn-service.name
Please set FILES such that these items are packaged.  Alternatively if they are unneeded, avoid installing them or delete them within do_install.
networkmanager-openvpn: 4 installed and not shipped files.  [installed-vs-shipped]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
index cce3f91..1b604ad 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.8.bb
@@ -26,7 +26,7 @@ USERADD_PARAM_${PN} = "--system nm-openvpn"
 
 FILES_${PN} += " \
     ${libdir}/NetworkManager/*.so \
-    ${libdir}/NetworkManager/VPN/nm-openvpn-service.name \
+    ${nonarch_libdir}/NetworkManager/VPN/nm-openvpn-service.name \
 "
 
 FILES_${PN}-staticdev += " \
-- 
2.7.4


