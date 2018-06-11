Return-Path: <leon.anavi@konsulko.com>
Received: from voyager.icnhost.net (ns13.icndns.net [78.142.50.13])
	by mail.openembedded.org (Postfix) with ESMTP id E505F78BB0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2018 12:36:36 +0000 (UTC)
Received: from [78.130.197.63] (port=39254 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89_1)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1fSM3m-00025T-V7; Mon, 11 Jun 2018 15:36:34 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jun 2018 15:35:22 +0300
Message-Id: <20180611123522.16109-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.14.1
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [meta-oe][PATCH] nano: Upgrade 2.9.7 -> 2.9.8
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
X-List-Received-Date: Mon, 11 Jun 2018 12:36:37 -0000

Upgrade nano to 2.9.8, the latest version as of 2 June 2018:
https://www.nano-editor.org/dist/v2.9/ChangeLog

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-support/nano/nano_2.9.7.bb | 8 --------
 meta-oe/recipes-support/nano/nano_2.9.8.bb | 4 ++++
 2 files changed, 4 insertions(+), 8 deletions(-)
 delete mode 100644 meta-oe/recipes-support/nano/nano_2.9.7.bb
 create mode 100644 meta-oe/recipes-support/nano/nano_2.9.8.bb

diff --git a/meta-oe/recipes-support/nano/nano_2.9.7.bb b/meta-oe/recipes-support/nano/nano_2.9.7.bb
deleted file mode 100644
index 419e5406b..000000000
--- a/meta-oe/recipes-support/nano/nano_2.9.7.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-include nano.inc
-
-do_install_append_libc-musl () {
-	rm -rf ${D}${libdir}/charset.alias
-	rmdir ${D}${libdir}
-}
-SRC_URI[md5sum] = "e0c6d76c93932f6c41c40842952495f7"
-SRC_URI[sha256sum] = "b64ab017305b1777e97b5b9b07b31db8aeebfc3e8719f61e8da1cf3866d344bd"
diff --git a/meta-oe/recipes-support/nano/nano_2.9.8.bb b/meta-oe/recipes-support/nano/nano_2.9.8.bb
new file mode 100644
index 000000000..aa6e9ff16
--- /dev/null
+++ b/meta-oe/recipes-support/nano/nano_2.9.8.bb
@@ -0,0 +1,4 @@
+include nano.inc
+
+SRC_URI[md5sum] = "31714360342f9baa344e2fa574c144db"
+SRC_URI[sha256sum] = "c2deac31ba4d3fd27a42fafcc47ccf499296cc69a422bbecab63f2933ea85488"
-- 
2.14.1


