Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 2204 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 10 Aug 2019 21:57:17 UTC
Received: from 8.mo173.mail-out.ovh.net (8.mo173.mail-out.ovh.net
	[46.105.46.122])
	by mail.openembedded.org (Postfix) with ESMTP id 89FC37F30F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 21:57:17 +0000 (UTC)
Received: from player750.ha.ovh.net (unknown [10.109.143.223])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id 8B065115309
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 23:20:33 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id 068AE8DD8ABA;
	Sat, 10 Aug 2019 21:20:30 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Aug 2019 23:20:08 +0200
Message-Id: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3828341162285542984
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudduledgudeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [meta-python][PATCH 1/7] python3-websockets: upgrade to 8.0.2
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
X-List-Received-Date: Sat, 10 Aug 2019 21:57:17 -0000
Content-Transfer-Encoding: 8bit

The present version was not compatible with python 3.7 because async is
now the proper keyword. The reported werror was:

    asyncio_ensure_future = asyncio.async           # Python < 3.5
                                        ^
SyntaxError: invalid syntax

Issues like this one: https://github.com/psf/requests-html/issues/65
explains the reason of that.

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 ...hon3-websockets_4.0.1.bb => python3-websockets_8.0.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websockets_4.0.1.bb => python3-websockets_8.0.2.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb b/meta-python/recipes-devtools/python/python3-websockets_8.0.2.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-websockets_8.0.2.bb
index 414129c59d2f..6da73ce35836 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_8.0.2.bb
@@ -2,12 +2,12 @@ SUMMARY = "An implementation of the WebSocket Protocol (RFC 6455)"
 HOMEPAGE = "https://github.com/aaugustin/websockets"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5070256738c06d2e59adbec1f4057dac"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ad5c6d36b3d0098b2f33a5ab69a9e750"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "9e8c6b3c70def4146d75fbb0f52bdfc7"
-SRC_URI[sha256sum] = "da4d4fbe059b0453e726d6d993760065d69b823a27efc3040402a6fcfe6a1ed9"
+SRC_URI[md5sum] = "a37f0e22c3aa5f1cf12a6a3ae22b36ca"
+SRC_URI[sha256sum] = "882a7266fa867a2ebb2c0baaa0f9159cabf131cf18c1b4270d79ad42f9208dc5"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.20.1


