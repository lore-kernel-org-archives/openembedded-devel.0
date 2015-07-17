Return-Path: <joe@deserted.net>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5D56AC3D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 14:46:15 +0000 (UTC)
Received: by igcqs7 with SMTP id qs7so38841948igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 07:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=Bnq+/V8VpUz4BkAjeXWlh6+aXdJDmTYzPCleOyKm9/g=;
	b=jSHlphJyh7+5st5y48CGTzvBorLBDwUdmYqUUGDakNBdrFRIbW5qxPE8j/dRuaHnWI
	U1lb6KWjCuHMuN+ClYrd/Hpapw6D+XSl33qoWOTuJ5N5CPDuhEXzo5F62LuIBkgBigVN
	xGw+OzvWJudZi1LhBgNv92geTFXWGu/i9djWh0bFpbM25DZUjHw4L9CyCTGzc0odywD4
	fTBt4pVnClDY/TB8g6OjnEWiDGFIXrE7pQSN8tdGdvhjIpoY7i95j2Xdcj4GdUqUntuh
	JhYzFfFQ/hc7jmMOFw3PlS5XpBDjer5ao8Zd9Ak3qbMPQ+T16K9Ewn/j14zrer+rxxwM
	oQCA==
X-Gm-Message-State: ALoCoQm5kjSztMgPZpjBC04luAAKjy64RjA7CiD1/JlhtMhnjSFK2BwqfomYXDiCG7WcSwA2NFQ7
X-Received: by 10.107.6.231 with SMTP id f100mr10547839ioi.61.1437144375945;
	Fri, 17 Jul 2015 07:46:15 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id i7sm3790089igt.18.2015.07.17.07.46.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jul 2015 07:46:15 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jul 2015 10:46:17 -0400
Message-Id: <1437144377-3538-3-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437144377-3538-1-git-send-email-joe_macdonald@mentor.com>
References: <1437144377-3538-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 3/3] znc: upgrade to 1.6.0
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
X-List-Received-Date: Fri, 17 Jul 2015 14:46:17 -0000

From: Roy Li <rongqing.li@windriver.com>

Upgrade to fix CVE-2014-9403
Remove backport patch
Add CSocket submodule, which split from znc
Add the dependency on icu

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

This is the cherry-pick of the cleaned-up version from master-next, it seems to
have addressed the issues brought up on the list, so even though the patch has
been rejected in patchworks, I think it's probably worth integrating these
changes since it updates the recipe and resolves at least one CVE.

 ...-Fix-NULL-pointer-dereference-in-webadmin.patch | 58 ----------------------
 meta-networking/recipes-irc/znc/znc_git.bb         | 13 ++---
 2 files changed, 7 insertions(+), 64 deletions(-)
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
index 2e35e4d..d81c170 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_git.bb
@@ -1,16 +1,17 @@
 SUMMARY = "ZNC, an advanced IRC bouncer"
 SECTION = "net"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl zlib icu"
 
-PV = "1.0+git"
+PV = "1.6.0"
 
-SRCREV = "ef59c23068547c132cb678092fba9a21317fd5f2"
-SRC_URI = "git://github.com/znc/znc.git \
-           file://0001-Fix-NULL-pointer-dereference-in-webadmin.patch \
+SRC_URI = "git://github.com/znc/znc.git;name=znc \
+           git://github.com/jimloco/Csocket.git;destsuffix=git/third_party/Csocket;name=Csocket \
           "
+SRCREV_znc = "f47e8465efa4e1cd948b9caae93ac401b4355df8"
+SRCREV_Csocket = "07b4437396122650e5b8fb3d014e820a5decf4ee"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


