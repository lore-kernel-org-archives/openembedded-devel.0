Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1AF2174C3E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 May 2018 18:35:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w44IZ79J000632
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 4 May 2018 11:35:23 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 4 May 2018 11:34:57 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 4 May 2018 14:34:53 -0400
Message-ID: <1525458893-13527-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2] networkmanager: fix "installed-vs-shipped" QA issue
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
X-List-Received-Date: Fri, 04 May 2018 18:35:33 -0000
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

** V2 **
* Use $nonarch_libdir instead of $prefix/lib

 .../recipes-connectivity/networkmanager/networkmanager_1.10.6.bb      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
index d90b782..7268ce1 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
@@ -100,8 +100,8 @@ FILES_${PN} += " \
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


