Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkInm-0007XJ-Ex
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:19:02 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1966204eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 10:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vtM9c6b/DQp0g+TWcZtjWgbyj6ujnKXR+DQKkLdIGQg=;
	b=IXXnA5PYyGGDts5e4YpsBltf1Dngpxb6x6OruLs/NSSv5cwBD1GIa+xIxnPEB2cf+V
	b55NNhmgkj1IMBefln1yRHXQY0PVemBFgM34yNjEmTSiJmcxCN5b1R2HfKIUccfwVeMV
	3EtJb1bcp20M1bgoOO8pECzbruFrmLyb8zzAw18c8fW3B//emiV9P/MCZNjC7ONsucUn
	3Hisups2m0ISRNPE/A5TweHxBLCWBoFGoANvZouoKobL9OR8eqEY0ZLB/kVjqkdYd4M3
	w2wobnfkTinDtWaJNpF+lMdsKk/OcCrT7n6CcZ9VxpCrqxCp43xP/x7E0MZNR1hmJCNx
	z7AQ==
Received: by 10.14.225.194 with SMTP id z42mr34044612eep.22.1355680719243;
	Sun, 16 Dec 2012 09:58:39 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l3sm23871372eem.14.2012.12.16.09.58.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:58:04 +0100
Message-Id: <41fb98b129602a22b034c94f06975325f39040b1.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 21/26] gcc-cross-canadian 4.6: fix dependencies to be nativesdk-* not *-nativesdk
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
X-List-Received-Date: Sun, 16 Dec 2012 18:19:02 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
index e0af4aa..788391a 100644
--- a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
+++ b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
@@ -5,8 +5,8 @@ require recipes-devtools/gcc/gcc-cross-canadian.inc
 require recipes-devtools/gcc/gcc-configure-sdk.inc
 require recipes-devtools/gcc/gcc-package-sdk.inc
 
-DEPENDS += "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
-RDEPENDS_${PN} += "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
+DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc nativesdk-elfutils"
+RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc nativesdk-elfutils"
 
 SYSTEMHEADERS = "/usr/include"
 SYSTEMLIBS = "/lib/"
-- 
1.8.0.2



