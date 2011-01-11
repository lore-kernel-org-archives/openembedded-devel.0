Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcgaw-0000ZV-L1
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 16:57:14 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so19263452fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 07:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=9qvURbfAhjZ/8XUJdMSOzjTR1PJRnE5xSsBQPAXNvz0=;
	b=WnhwTp+s7loXoBgOkJAlLOt4464GQg5eEtK5a81H6SIjbp+IN2HDqrpr+wW37HjMVu
	B49nlpswebbF724I9rLCPiFznj+gJ1FZJnLNAEhLKl9zUt2Ct75yEBqLTiGYXY2WV3Cu
	lzOqy7iBitlbvj4CNENMAw0Pm6CFqjIGwsH5c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=IvVmj5Td/ByyRoyJ36mNPAQEBDaxN3FnBvQ5/kB86rjW33xGryYNa6oKOyYObtmWJm
	TexQdFHM2m6if2b5DdCZfvjZY67uO/CPr9k8yb8qKf6eJWe5M1fArbPDONe/hErYlYt6
	HdYo682kLQChHZJJURZ5sox/ey9Q8fd14TJFk=
Received: by 10.223.73.202 with SMTP id r10mr3345299faj.133.1294761405985;
	Tue, 11 Jan 2011 07:56:45 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y3sm7443762fai.38.2011.01.11.07.56.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 07:56:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 16:56:29 +0100
Message-Id: <1294761389-13634-12-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
In-Reply-To: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1294761389-13634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 12/12] xproxymanagementprotocol: drop PROVIDES xproxymngproto and update other recipes DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jan 2011 15:57:14 -0000

* now xproxymanagementprotocol-sdk also provided xproxymngproto which is wrong
* other option would be to add PROVIDES_virtclass-sdk = xproxymngproto-sdk

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/obsolete/xorg-app/proxymngr_1.0.1.bb       |    2 +-
 recipes/obsolete/xorg-app/xrx_1.0.3.bb             |    2 +-
 recipes/xorg-app/lbxproxy_1.0.2.bb                 |    2 +-
 recipes/xorg-app/proxymngr_1.0.2.bb                |    2 +-
 recipes/xorg-app/xrx_1.0.4.bb                      |    2 +-
 .../xorg-proto/xproxymanagementprotocol_1.0.3.bb   |    1 -
 6 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/recipes/obsolete/xorg-app/proxymngr_1.0.1.bb b/recipes/obsolete/xorg-app/proxymngr_1.0.1.bb
index a7cea51..df77a59 100644
--- a/recipes/obsolete/xorg-app/proxymngr_1.0.1.bb
+++ b/recipes/obsolete/xorg-app/proxymngr_1.0.1.bb
@@ -1,5 +1,5 @@
 require xorg-app-common.inc
-DEPENDS += " libice libxt xproxymngproto"
+DEPENDS += " libice libxt xproxymanagementprotocol"
 PE = "1"
 PR = "${INC_PR}.0"
 
diff --git a/recipes/obsolete/xorg-app/xrx_1.0.3.bb b/recipes/obsolete/xorg-app/xrx_1.0.3.bb
index a412479..0e16f12 100644
--- a/recipes/obsolete/xorg-app/xrx_1.0.3.bb
+++ b/recipes/obsolete/xorg-app/xrx_1.0.3.bb
@@ -1,5 +1,5 @@
 require xorg-app-common.inc
-DEPENDS += " libxaw libxt libxext xtrans xproxymngproto libxau"
+DEPENDS += " libxaw libxt libxext xtrans xproxymanagementprotocol libxau"
 PE = "1"
 PR = "${INC_PR}.0"
 
diff --git a/recipes/xorg-app/lbxproxy_1.0.2.bb b/recipes/xorg-app/lbxproxy_1.0.2.bb
index 428cb58..359c7fc 100644
--- a/recipes/xorg-app/lbxproxy_1.0.2.bb
+++ b/recipes/xorg-app/lbxproxy_1.0.2.bb
@@ -1,7 +1,7 @@
 require xorg-app-common.inc
 DESCRIPTION = "Applications that would like to take advantage of the Low Bandwidth \
 extension to X (LBX) must make their connections to an lbxproxy."
-DEPENDS += " xtrans libxext liblbxutil libice xproxymngproto bigreqsproto zlib"
+DEPENDS += " xtrans libxext liblbxutil libice xproxymanagementprotocol bigreqsproto zlib"
 PE = "1"
 PR = "${INC_PR}.0"
 
diff --git a/recipes/xorg-app/proxymngr_1.0.2.bb b/recipes/xorg-app/proxymngr_1.0.2.bb
index 71643ba..41b09c8 100644
--- a/recipes/xorg-app/proxymngr_1.0.2.bb
+++ b/recipes/xorg-app/proxymngr_1.0.2.bb
@@ -1,5 +1,5 @@
 require xorg-app-common.inc
-DEPENDS += " libice libxt xproxymngproto"
+DEPENDS += " libice libxt xproxymanagementprotocol"
 PE = "1"
 PR = "${INC_PR}.0"
 
diff --git a/recipes/xorg-app/xrx_1.0.4.bb b/recipes/xorg-app/xrx_1.0.4.bb
index 8bc67f7..7df5119 100644
--- a/recipes/xorg-app/xrx_1.0.4.bb
+++ b/recipes/xorg-app/xrx_1.0.4.bb
@@ -1,5 +1,5 @@
 require xorg-app-common.inc
-DEPENDS += " libxaw libxt libxext xtrans xproxymngproto libxau"
+DEPENDS += " libxaw libxt libxext xtrans xproxymanagementprotocol libxau"
 PE = "1"
 PR = "${INC_PR}.0"
 
diff --git a/recipes/xorg-proto/xproxymanagementprotocol_1.0.3.bb b/recipes/xorg-proto/xproxymanagementprotocol_1.0.3.bb
index d5bcd6d..095f133 100644
--- a/recipes/xorg-proto/xproxymanagementprotocol_1.0.3.bb
+++ b/recipes/xorg-proto/xproxymanagementprotocol_1.0.3.bb
@@ -1,5 +1,4 @@
 require xorg-proto-common.inc
-PROVIDES = "xproxymngproto"
 PE = "1"
 PR = "${INC_PR}.0"
 
-- 
1.7.4.rc1



