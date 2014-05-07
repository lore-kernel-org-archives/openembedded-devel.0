Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id E100260897
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 11:43:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,1002,1389740400"; d="scan'208";a="50836921"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 07 May 2014 13:43:19 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Wed, 7 May 2014 13:43:19 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 7 May 2014 13:43:19 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 May 2014 13:43:27 +0200
Message-ID: <1399463007-14787-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xdelta3: add optional lzma support
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
X-List-Received-Date: Wed, 07 May 2014 11:43:21 -0000
Content-Type: text/plain

Using PACKAGECONFIG. Disabled by default.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb b/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
index 16a72ee..f3b4754 100644
--- a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
+++ b/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb
@@ -13,3 +13,7 @@ SRC_URI[md5sum] = "c3ae3286ce4193de8e03d5bcaccf3bc3"
 SRC_URI[sha256sum] = "3a86f29c95664fb44b8a40ff22d9bcc3e87aa8c01f0ff75931a7fa78ed3d2e55"
 
 inherit autotools
+
+# Optional secondary compression
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[lzma] = ",,xz"
-- 
1.8.5.4


