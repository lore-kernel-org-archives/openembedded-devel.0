Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A24E74966
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 May 2018 18:12:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w43ICICt031970
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 May 2018 11:12:33 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 3 May 2018 11:12:07 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 3 May 2018 14:11:54 -0400
Message-ID: <1525371114-30249-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] networkmanager: fix "installed-vs-shipped" QA issue
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
X-List-Received-Date: Thu, 03 May 2018 18:12:43 -0000
Content-Type: text/plain

When building we can see the following QA issue:
  QA Issue: networkmanager: Files/directories were installed but
    not shipped in any package:
  [2018-05-02 23:01:40.442528079-07:00]   /usr/lib/NetworkManager
  [2018-05-02 23:01:40.450990449-07:00]   /usr/lib/NetworkManager/conf.d
  [2018-05-02 23:01:40.456642738-07:00]   /usr/lib/NetworkManager/VPN

The upstream project moved these to $prefix/lib as part of upstream
commit 74818b155c32 [build: fix $nmlibdir to be
"/usr/lib/NetworkManager"] and here we adapt the recipe to take this
change into effect.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.10.6.bb      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
index d90b782..91636ec 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
@@ -100,8 +100,8 @@ FILES_${PN} += " \
     ${libexecdir} \
     ${libdir}/pppd/*/nm-pppd-plugin.so \
     ${libdir}/NetworkManager/*.so \
-    ${libdir}/NetworkManager/VPN \
-    ${libdir}/NetworkManager/conf.d \
+    ${prefix}/lib/NetworkManager/VPN \
+    ${prefix}/lib/NetworkManager/conf.d \
     ${datadir}/polkit-1 \
     ${datadir}/dbus-1 \
     ${base_libdir}/udev/* \
-- 
2.7.4


