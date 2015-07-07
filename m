Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD2873BB4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 01:56:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t671uc27008183
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jul 2015 18:56:38 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 6 Jul 2015 18:56:38 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jul 2015 09:55:52 +0800
Message-ID: <1436234152-4937-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking][v2] znc: upgrade to 1.6.0
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
X-List-Received-Date: Tue, 07 Jul 2015 01:56:38 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Remove backport patch
Add CSocket submodule
Add the dependency on icu

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...-Fix-NULL-pointer-dereference-in-webadmin.patch | 58 ----------------------
 meta-networking/recipes-irc/znc/znc_git.bb         | 12 ++---
 2 files changed, 6 insertions(+), 64 deletions(-)
 delete mode 100644 meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch

diff --git a/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch b/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
deleted file mode 100644
index 68e4414..0000000
--- a/meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Subject: [PATCH] Fix NULL pointer dereference in webadmin.
-
-Upstream-Status: Backport
-
-commit 2bd410ee5570cea127233f1133ea22f25174eb28 upstream
-
-Triggerable by any non-admin, if webadmin is loaded.
-
-The only affected version is 1.0
-
-Thanks to ChauffeR (Simone Esposito) for reporting this.
----
- modules/webadmin.cpp | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/modules/webadmin.cpp b/modules/webadmin.cpp
-index b793c02..816f217 100644
---- a/modules/webadmin.cpp
-+++ b/modules/webadmin.cpp
-@@ -419,7 +419,7 @@ public:
- 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
- 
- 			// Admin||Self Check
--			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
-+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
- 				return false;
- 			}
- 
-@@ -448,7 +448,7 @@ public:
- 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
- 
- 			// Admin||Self Check
--			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
-+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
- 				return false;
- 			}
- 
-@@ -472,7 +472,7 @@ public:
- 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
- 
- 			// Admin||Self Check
--			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
-+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
- 				return false;
- 			}
- 
-@@ -486,7 +486,7 @@ public:
- 			CIRCNetwork* pNetwork = SafeGetNetworkFromParam(WebSock);
- 
- 			// Admin||Self Check
--			if (!spSession->IsAdmin() && (!spSession->GetUser() || spSession->GetUser() != pNetwork->GetUser())) {
-+			if (!spSession->IsAdmin() && (!spSession->GetUser() || !pNetwork || spSession->GetUser() != pNetwork->GetUser())) {
- 				return false;
- 			}
- 
--- 
-1.8.5.2.233.g932f7e4
-
diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
index 2e35e4d..f5bed08 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_git.bb
@@ -1,16 +1,16 @@
 SUMMARY = "ZNC, an advanced IRC bouncer"
 SECTION = "net"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl zlib icu"
 
-PV = "1.0+git"
+PV = "1.6.0+git"
 
-SRCREV = "ef59c23068547c132cb678092fba9a21317fd5f2"
-SRC_URI = "git://github.com/znc/znc.git \
-           file://0001-Fix-NULL-pointer-dereference-in-webadmin.patch \
+SRC_URI = "git://github.com/znc/znc.git;rev=f47e8465efa4e1cd948b9caae93ac401b4355df8  \
+           git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket \
           "
+SRCREV_Csocket = "07b4437396122650e5b8fb3d014e820a5decf4ee"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


