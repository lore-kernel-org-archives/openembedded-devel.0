Return-Path: <sven.ebenfeld@vaillant-group.com>
Received: from mailgw01.hp-net.de (mailgw01.hp-net.de [213.15.0.25])
	by mail.openembedded.org (Postfix) with ESMTP id 41FAB6FFAB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2016 06:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailgw01.hp-net.de (Postfix) with ESMTP id 54A552290C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:17:07 +0200 (CEST)
X-Virus-Scanned: Virusscanner at mailgw01
Received: from mailgw01.hp-net.de ([127.0.0.1])
	by localhost (mailgw01.hp-net.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id phzwqbkFXmvG
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:17:07 +0200 (CEST)
Received: from jv-de-dc-fideas01.vaillant.vhgroup.lan
	(jv-de-dc-fideas01.vaillant.vhgroup.lan [10.107.7.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mailgw01.hp-net.de (Postfix) with ESMTPS id 42DFE22908B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:17:07 +0200 (CEST)
Received: from vadeff07.vaillant.vhgroup.lan (unknown [10.107.77.149])
	by jv-de-dc-fideas01.vaillant.vhgroup.lan (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:17:06 +0200 (CEST)
Received: from ubuntu.vaillant.vhgroup.lan (10.107.185.224) by
	vadeff07.vaillant.vhgroup.lan (10.107.77.149) with Microsoft SMTP
	Server id 14.3.301.0; Mon, 25 Jul 2016 08:17:06 +0200
From: Sven Ebenfeld <sven.ebenfeld@vaillant-group.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Jul 2016 08:16:57 +0200
Message-ID: <1469427417-45044-1-git-send-email-sven.ebenfeld@vaillant-group.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OLX-Disclaimer: Done
Cc: Sven Ebenfeld <sven.ebenfeld@vaillant-group.com>
Subject: [meta-java][PATCH v3] openjdk-8: ignore wrong GCCVERSION-flag
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
X-List-Received-Date: Mon, 25 Jul 2016 06:17:10 -0000
Content-Type: text/plain

During my recipe parsing, GCCVERSION in the cross case seems to
be 'l' this leads to a ValueError during recipe parsing. Therefore
check type before trying to parse the version flag.

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@vaillant-group.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 7ad802a..c2f9eb4 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -271,8 +271,10 @@ def version_specific_cflags(d):
         # doesn't work anyway.
         version = d.getVar('GCCVERSION', expand=True)[0]
 
-    extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
-    return extraflags
+    if version.isdigit():
+        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
+        return extraflags
+    return ''
 
 CFLAGS_append = " ${@version_specific_cflags(d)}"
 CXXFLAGS_append = " ${@version_specific_cflags(d)}"
-- 
1.9.1


