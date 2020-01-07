Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id E002C7FD1B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2020 17:13:08 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1001-35.w90-120.abo.wanadoo.fr
	[90.120.192.35]) by koncepto.io (Postfix) with ESMTPSA id 7662A60300;
	Tue,  7 Jan 2020 18:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1578417186;
	bh=rAg8ljvZVrvo3EK/Uq5ex37rUWiFERfYPafoTNen5s4=;
	h=From:To:Cc:Subject:Date:From;
	b=PytlwpAD4dLFPWN0oxfI9CRanu9BDFlGKzLC7p/L8llxu/7OP17FHwP5WSQfxRozE
	ERcQcn7zyfTj5E4W1HKznvmlnkiyaMVKqJvdt4bbLuFZm2w/ZoZ2gwvifXT90Oo6XT
	BarmFXe77sdbqEsCpiCPd9Eg4jNE5+1PCAj0ZIGZkEbH1Ju3S5EwJXmzGe516OyC2T
	umdJF1Ls24krPheSfM7HvPYorLt5aRFHmDO4Amc7R5N58S8mO6OnxhOJx2wmeNOyxJ
	uMamG6odZUud9qSLc32vrkSMfo4rfcMR8WKRTl3RbtIo3vPoU+pvKMDhQ+b1RFouwl
	wDVzu4RKNnkOQ==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jan 2020 18:13:02 +0100
Message-Id: <1578417182-16151-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] libmxml: upgrade 3.0 -> 3.1
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
X-List-Received-Date: Tue, 07 Jan 2020 17:13:09 -0000

See https://github.com/michaelrsweet/mxml/releases/tag/v3.1

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/libmxml/{libmxml_3.0.bb => libmxml_3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libmxml/{libmxml_3.0.bb => libmxml_3.1.bb} (95%)

diff --git a/meta-oe/recipes-support/libmxml/libmxml_3.0.bb b/meta-oe/recipes-support/libmxml/libmxml_3.1.bb
similarity index 95%
rename from meta-oe/recipes-support/libmxml/libmxml_3.0.bb
rename to meta-oe/recipes-support/libmxml/libmxml_3.1.bb
index 5ca2dda..4e77d6c 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_3.0.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_3.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://www.msweet.org/mxml/"
 BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
 
 SRC_URI = "git://github.com/michaelrsweet/mxml.git"
-SRCREV = "c7755b6992a2afdd34dde47fc9be97f1237cfded"
+SRCREV = "e483e5fd8a33386fd46967681521bdd2da2b548f"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.7.4


