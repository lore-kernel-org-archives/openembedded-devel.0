Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E76C16A9FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 08:14:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6S8EIGh022526
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 01:14:19 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 28 Jul 2014 01:14:18 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Jul 2014 04:14:16 -0400
Message-ID: <1406535256-20652-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] znc: Fix for CVE-2013-2130
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jul 2014 08:14:24 -0000
Content-Type: text/plain

From: Xufeng Zhang <xufeng.zhang@windriver.com>

ZNC 1.0 allows remote authenticated users to cause a denial of service
(NULL pointer reference and crash) via a crafted request to the (1) editnetwork,
(2) editchan, (3) addchan, or (4) delchan page in modules/webadmin.cpp.
Per: http://cwe.mitre.org/data/definitions/476.html
CWE-476: NULL Pointer Dereference

Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...-Fix-NULL-pointer-dereference-in-webadmin.patch | 58 ++++++++++++++++++++++
 meta-networking/recipes-irc/znc/znc_git.bb         |  4 +-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch

diff --git a/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch b/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
new file mode 100644
index 0000000..68e4414
--- /dev/null
+++ b/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
@@ -0,0 +1,58 @@
+Subject: [PATCH] Fix NULL pointer dereference in webadmin.
+
+Upstream-Status: Backport
+
+commit 2bd410ee5570cea127233f1133ea22f25174eb28 upstream
+
+Triggerable by any non-admin, if webadmin is loaded.
+
+The only affected version is 1.0
+
+Thanks to ChauffeR (Simone Esposito) for reporting this.
+---
+ modules/webadmin.cpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/modules/webadmin.cpp b/modules/webadmin.cpp
+index b793c02..816f217 100644
+--- a/modules/webadmin.cpp
++++ b/modules/webadmin.cpp
+@@ -419,7 +419,7 @@ public:
+ 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
+ 
+ 			// Admin||Self Check
+-			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
++			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
+ 				return false;
+ 			}
+ 
+@@ -448,7 +448,7 @@ public:
+ 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
+ 
+ 			// Admin||Self Check
+-			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
++			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
+ 				return false;
+ 			}
+ 
+@@ -472,7 +472,7 @@ public:
+ 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
+ 
+ 			// Admin||Self Check
+-			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
++			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
+ 				return false;
+ 			}
+ 
+@@ -486,7 +486,7 @@ public:
+ 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
+ 
+ 			// Admin||Self Check
+-			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
++			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
+ 				return false;
+ 			}
+ 
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
index c8a19dc..77db25b 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_git.bb
@@ -7,7 +7,9 @@ DEPENDS = "openssl"
 PV = "1.0+git"
 
 SRCREV = "ef59c23068547c132cb678092fba9a21317fd5f2"
-SRC_URI = "git://github.com/znc/znc.git"
+SRC_URI = "git://github.com/znc/znc.git \
+           file://0001-Fix-NULL-pointer-dereference-in-webadmin.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.0.0


