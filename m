Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F03177E963
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 16:53:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45SvKL3v9Wz4t
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 18:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560876790;
	bh=WqH4YMaCuD/byzi0+ONe7ihs+swgkkCfmGLWW+hGHoo=;
	h=From:To:Subject:Date:From;
	b=j984WsXvn8j3teEzdewjKrzv8y9H3NLeDvRpjaFe0ObiUInxVVAkhuu/1bNh8kI87
	C/xHEx+lEeCiP/S0bTLsMnup2p/f1BxJO+1kJdAVREqDXj8OoveT3WuihIW20m9jjD
	yhSjZMDMYnau0Q8FszKdYW82TBrHK4RZW0xdL70G+tbnQj/LGICbySEfmOrC8jUtwy
	dFtnfTgHco4A+s0OMevnTKdhvwoiJC44Yd1RYkssTcUvW4K/tOi0ygV1rJneUX248e
	eHnTZNeoeLJvGS5DiCFiJxKx04VnGAJ5NlyYaMzHT2Qvxe1G5bD4sZhDC7OBw/hNg+
	v6mVvAIzPdeeFTp0aDUVGO58Gnr6t8dsKcBTZdX2GKGiXObIDEwfgxKrNzSH5UrB8q
	uOYniEKrI8LTzIhIKzTfsg4juk2QvR879wVoq8NfwQ3SOeB82Wo4awgxJElchY0/vp
	Pk8t8ICJ4uczQ0ve5xXku+GPDkLZdNlEwowIN0NI62fBKg212bu1/vSsJX9uYJkyul
	GUHPvxdN+4EW4v+t/yMBhBupLBlEj7VZ8hF2hILPUcwb8ilSbvw9NNf2hXO7nKV6Ng
	WHo8dGgfEpONmlFxJ7NoLFSfXLp8yE+pY+7j6m4qmPPx6xA0nugJmVcMKfr9JDDedu
	6C7AfvH9NEKCGzAw3hTvqZYM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2019 19:53:11 +0300
Message-Id: <20190618165311.31663-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] tipcutils: Remove the unnecessary dependency on virtual/kernel
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
X-List-Received-Date: Tue, 18 Jun 2019 16:53:10 -0000

This also makes it no longer specific to MACHINE_ARCH.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-extended/tipcutils/tipcutils_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
index 54ed043f4..054e0acc8 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
@@ -10,10 +10,6 @@ SRC_URI = "git://git.code.sf.net/p/tipc/tipcutils \
 SRCREV = "7ab2211b87414ba240b0b2e4af219c1057c9cf9a"
 PV = "2.2.0+git${SRCPV}"
 
-DEPENDS="virtual/kernel"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 inherit autotools pkgconfig
 
 DEPENDS += "libdaemon"
-- 
2.17.1


