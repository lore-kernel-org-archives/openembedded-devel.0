Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E33FA7E8F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 16:35:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45dVGX1PCcz23
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 18:35:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562085332;
	bh=53ZWFvtnDtLboU42KL6XnfovvnY8ckpNDw1MSphFWWo=;
	h=From:To:Subject:Date:From;
	b=WaBuofsI2tTDOOF+x4aRBnd1Ff52W8J2Xa1nWJvv8gQW+Xg0Os83K+As6sT7R9TRs
	VA7+ZGdiSO+XN+g7trFTE6ayHl2wshvQFN7HEqMKsOgeg0jTD22vYBo7nkoIhquZFg
	F3lMJPwzaw33j6LWQIPV8k53V2kVKBGqucrDmrsHBKJIpImFmnXYr1upeyE8Sy8RET
	RMAI1fl3B91WlnQU3rDfm3fnmML651cspSVjNjgX7fPjxb+QpCtdsB0RBjw7Ir39o6
	S3WngYYl1MXJnKAk48dNLQi1w5DOrL5eSobFKa5v9JnkhPnMJws55zrhP7sImuJg7Y
	9O9I8w5x3+ppYhx7WbPKyWy0KKh69Ng7TEAqOiWt5VS6eovNXlsr/+Wej9lzUvilga
	m9QCEI320rmfUekkdVinW0ZlJ0qagoTc4qHl1rZBXqSZP/8+NCQ1FjhfhQGuavJvuc
	i80rTWXlj8UEN5InS1z9He0BvwB89Rjy1UtrL+f4gP0Ops1n3PSwAPMIZRxqsG6Rt5
	xkud7ouK+lpXabFnIuPOoAtvVDM8MKjA2rMcgC9O9jI8AgvQXBT9Pv88BGZzKuAOPP
	OAYSryTTjzpvvIRJJ3X60zLO3SO0n38ReKTrOTaErUc0UdrEpwKiGt1jeXMxURqsVb
	qxbU5Iel8iyHCid4I73JfUYI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2019 19:35:31 +0300
Message-Id: <20190702163531.14061-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] cpprest: Fix build failure with gcc 8
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
X-List-Received-Date: Tue, 02 Jul 2019 16:35:32 -0000

The workaround for gcc 9 broke building with gcc 8:
     cc1plus: error: -Werror=deprecated-copy: no option -Wdeprecated-copy
     cc1plus: error: -Werror=redundant-move: no option -Wredundant-move
     ninja: build stopped: subcommand failed.

-Werror is often problematic in distribution builds,
disable it globally and permanently.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb
index 070451211..3e42a002e 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb
@@ -18,6 +18,4 @@ S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
 
-# Temporary until https://github.com/Microsoft/cpprestsdk/issues/1099
-# is fixed properly
-CXXFLAGS += "-Wno-error=deprecated-copy -Wno-error=redundant-move"
+CXXFLAGS += "-Wno-error"
-- 
2.17.1


