Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7051C6C268
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 19:47:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wADJlO24009616
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Nov 2018 11:47:24 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 13 Nov 2018 11:47:23 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 Nov 2018 14:47:13 -0500
Message-ID: <1542138433-24272-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] networkmanager: package additional .la files
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
X-List-Received-Date: Tue, 13 Nov 2018 19:47:24 -0000
Content-Type: text/plain

This fixes:
     ERROR: networkmanager-1.14.4-r0 do_package: QA Issue: networkmanager: Files/directories were installed but not shipped in any package:
       /usr/lib64/NetworkManager/1.14.4/libnm-settings-plugin-ifupdown.la
       /usr/lib64/NetworkManager/1.14.4/libnm-device-plugin-adsl.la
       /usr/lib64/NetworkManager/1.14.4/libnm-device-plugin-wifi.la
       /usr/lib64/NetworkManager/1.14.4/libnm-device-plugin-ovs.la
     Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
     networkmanager: 4 installed and not shipped files. [installed-vs-shipped]

As with similar changes in the past, if the distro makes use of
'remove-libtool' this issue is not seen but we should add .la files to
the -dev package when they do exist.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

 .../recipes-connectivity/networkmanager/networkmanager_1.14.4.bb         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
index 348ce9e..4cc4dba 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
@@ -121,6 +121,7 @@ FILES_${PN}-dev += " \
     ${datadir}/NetworkManager/gdb-cmd \
     ${libdir}/pppd/*/*.la \
     ${libdir}/NetworkManager/*.la \
+    ${libdir}/NetworkManager/${PV}/*.la \
 "
 
 FILES_${PN}-nmtui = " \
-- 
2.7.4


