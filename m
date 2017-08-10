Return-Path: <stefan@agner.ch>
X-Greylist: delayed 396 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 10 Aug 2017 03:10:11 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 4551377BBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 03:10:11 +0000 (UTC)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 8DE015C0B98;
	Thu, 10 Aug 2017 05:00:39 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 20:03:24 -0700
Message-Id: <1502334204-27713-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.7.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1502334040; bh=ez1ea+vqVkJ3FQ1b6lBnAsWRb4MNV25+uXlhRrVsaE8=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=LrSTCSns+J9Vg1hxI0ZNUT4hdh0LqjuTg/nJ6qhPLCO0T2kXzhpNZ4L/nKYmDSfpJZQE2907NIEo/oBpxstSocTDQdT2F1PPbuHcW6LSqOiPKoaH8LvA2fpbpa7XAu7zgC26kUO/1iH3S9mG8NIfHYtIvtBUVHiEG7ZOqT3GOwU=
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-oe][PATCH] rapidjson: avoid dependency to non-existing package
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
X-List-Received-Date: Thu, 10 Aug 2017 03:10:12 -0000

From: Stefan Agner <stefan.agner@toradex.com>

RapidJSON is a header only library. The automatic package split
leads to no 'rapidjson' package but a 'rapidjson-dev' package with
a dependency to the 'rapidjson' package, leading to errors like:
 * Solver encountered 1 problem(s):
 * Problem 1/1:
 *   - nothing provides rapidjson = 1.1.0+git0+e5635fb27f-r0 needed by rapidjson-dev-1.1.0+git0+e5635fb27f-r0.core2-64

Clear rapidjson-dev dependencies.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 4cded07..8ab35d2 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -21,5 +21,6 @@ EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJ
 # RapidJSON is a header-only C++ library, so the main package will be empty.
 
 FILES_${PN}-dev += "${libdir}/cmake"
+RDEPENDS_${PN}-dev = ""
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


