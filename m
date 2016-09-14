Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7B2C460851
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 03:40:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8E3en6B013839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 20:40:49 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 13 Sep 2016 20:40:48 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Haiqing.Bai@windriver.com>
Date: Wed, 14 Sep 2016 11:37:53 +0800
Message-ID: <1473824273-29398-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] networkmanager: Fix package splitting and systemd service issue
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
X-List-Received-Date: Wed, 14 Sep 2016 03:40:49 -0000
Content-Type: text/plain

From: Haiqing Bai <Haiqing.Bai@windriver.com>

* Put binary "/usr/bin/nm-online" into main package
  as the systemd service "NetworkManager-wait-online.service"
  is provided by main package and it needs to run
  "/usr/bin/nm-online"
* Correct "NetworkManager-wait-online.service.in"
  to avoid dependency circle and get right service status

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...ger-fixed-issues-of-NetworkManager-wait-o.patch | 44 ++++++++++++++++++++++
 .../networkmanager/networkmanager_1.0.12.bb        |  7 +---
 2 files changed, 46 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-networkmanager-fixed-issues-of-NetworkManager-wait-o.patch

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-networkmanager-fixed-issues-of-NetworkManager-wait-o.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-networkmanager-fixed-issues-of-NetworkManager-wait-o.patch
new file mode 100644
index 0000000..4eb9e21
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-networkmanager-fixed-issues-of-NetworkManager-wait-o.patch
@@ -0,0 +1,44 @@
+From 0690452b863286e524d2037427816b7850301f93 Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Tue, 6 Sep 2016 09:27:38 +0800
+Subject: [PATCH] networkmanager: fixed issues of
+ NetworkManager-wait-online.service.in.
+
+Remove network.target in "Before" to avoid circle dependency.
+Wants=network.target
+Before=network.target network-online.target
+
+Correct the "WantedBy" to network-online.target.
+
+Upstream-status: Pending
+
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ data/NetworkManager-wait-online.service.in | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/data/NetworkManager-wait-online.service.in b/data/NetworkManager-wait-online.service.in
+index 6ad6942..1753d20 100644
+--- a/data/NetworkManager-wait-online.service.in
++++ b/data/NetworkManager-wait-online.service.in
+@@ -1,13 +1,14 @@
+ [Unit]
+ Description=Network Manager Wait Online
++Documentation=man:nm-online(1)
+ Requisite=NetworkManager.service
+ After=NetworkManager.service
+-Wants=network.target
+-Before=network.target network-online.target
++Before=network-online.target
+ 
+ [Service]
+ Type=oneshot
+ ExecStart=@bindir@/nm-online -s -q --timeout=30
++RemainAfterExit=yes
+ 
+ [Install]
+-WantedBy=multi-user.target
++WantedBy=network-online.target
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb
index 56ca847..9134880 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
     file://0002-add-pkg-config-for-libgcrypt.patch \
     file://0006-Fix-nm-version-macro-includes.patch \
+    file://0002-networkmanager-fixed-issues-of-NetworkManager-wait-o.patch \
 "
 SRC_URI[md5sum] = "ebb273456a81ccf9dfaf2461061b0e96"
 SRC_URI[sha256sum] = "3a470f8c60109b1acb5784ddc2423501706b5fe34c793a6faee87e591eb04a9e"
@@ -62,7 +63,7 @@ PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
 PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
 
-PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests \
+PACKAGES =+ "libnmutil libnmglib libnmglib-vpn \
   ${PN}-nmtui ${PN}-nmtui-doc \
   ${PN}-adsl \
 "
@@ -99,10 +100,6 @@ FILES_${PN}-dev += " \
     ${libdir}/NetworkManager/*.la \
 "
 
-FILES_${PN}-tests = " \
-    ${bindir}/nm-online \
-"
-
 FILES_${PN}-nmtui = " \
     ${bindir}/nmtui \
     ${bindir}/nmtui-edit \
-- 
2.8.1


