Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97DB5734DA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jun 2015 06:23:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t516Nt8A028770
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 May 2015 23:23:55 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Sun, 31 May 2015 23:23:54 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Jun 2015 14:17:56 +0800
Message-ID: <1433139476-13265-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] znc: upgrade to 1.6.0
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
X-List-Received-Date: Mon, 01 Jun 2015 06:23:56 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. upgrade to 1.6.0 to fix CVE-2014-9403
2. Remove the backup patch
3. not git version, otherwise it requires "git submodule" command,
since Csocket is moved into git submodule
4. update the checksum of LICENSE, since the date in it was changed

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...-Fix-NULL-pointer-dereference-in-webadmin.patch | 58 ----------------------
 .../recipes-irc/znc/{znc_git.bb => znc_1.6.0.bb}   | 14 ++----
 2 files changed, 5 insertions(+), 67 deletions(-)
 delete mode 100644 meta-networking/recipes-irc/znc/znc/0001-Fix-NULL-pointer-dereference-in-webadmin.patch
 rename meta-networking/recipes-irc/znc/{znc_git.bb => znc_1.6.0.bb} (47%)

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
diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_1.6.0.bb
similarity index 47%
rename from meta-networking/recipes-irc/znc/znc_git.bb
rename to meta-networking/recipes-irc/znc/znc_1.6.0.bb
index 77db25b..ca3c606 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.6.0.bb
@@ -1,17 +1,13 @@
 SUMMARY = "ZNC, an advanced IRC bouncer"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl zlib"
 
-PV = "1.0+git"
-
-SRCREV = "ef59c23068547c132cb678092fba9a21317fd5f2"
-SRC_URI = "git://github.com/znc/znc.git \
-           file://0001-Fix-NULL-pointer-dereference-in-webadmin.patch \
+SRC_URI = "http://znc.in/releases/${BP}.tar.gz \
           "
-
-S = "${WORKDIR}/git"
+SRC_URI[md5sum]="674d8c1277752dcc627b96e33a63376e"
+SRC_URI[sha256sum]="df622aeae34d26193c738dff6499e56ad669ec654484e19623738d84cc80aba7"
 
 inherit autotools-brokensep pkgconfig
 
-- 
1.9.1


