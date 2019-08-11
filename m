Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 63996 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 11 Aug 2019 15:17:11 UTC
Received: from 6.mo69.mail-out.ovh.net (6.mo69.mail-out.ovh.net
	[46.105.50.107])
	by mail.openembedded.org (Postfix) with ESMTP id 0125E6BC19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 15:17:11 +0000 (UTC)
Received: from player760.ha.ovh.net (unknown [10.109.146.5])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 7E0096547E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 17:17:12 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player760.ha.ovh.net (Postfix) with ESMTPSA id 1A9258CC0A15;
	Sun, 11 Aug 2019 15:17:09 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Aug 2019 17:16:26 +0200
Message-Id: <20190811151626.13990-7-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190811151626.13990-1-maciej.pijanowski@3mdeb.com>
References: <20190811151626.13990-1-maciej.pijanowski@3mdeb.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3564599107172904520
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddvvddgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [meta-python][PATCH v2 7/7] python-socketio.inc: add missing RDEPENDS
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
X-List-Received-Date: Sun, 11 Aug 2019 15:17:12 -0000
Content-Transfer-Encoding: 8bit

Without additional RDEPENDS module could not be properly imported on
python 3.7.4. Additional RDEPENDS had to be added in order to start the
most basic examples from documentation:
https://python-socketio.readthedocs.io/en/latest/client.html

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../recipes-devtools/python/python-socketio.inc       | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-socketio.inc b/meta-python/recipes-devtools/python/python-socketio.inc
index fa62afce1546..7ebc4eac7a28 100644
--- a/meta-python/recipes-devtools/python/python-socketio.inc
+++ b/meta-python/recipes-devtools/python/python-socketio.inc
@@ -12,6 +12,17 @@ PYPI_PACKAGE = "python-socketio"
 SRC_URI[md5sum] = "86cd47dddea1785ce7a6c72f55c93fe7"
 SRC_URI[sha256sum] = "506b2cf7a520b40ea0b3f25e1272eff8de134dce6f471c1f6bc0de8c90fe8c57"
 
+PACKAGECONFIG ?= "asyncio_client client"
+PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"
+PACKAGECONFIG[client] = ",,,python3-requests python3-websocket-client"
+
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-engineio \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-pickle \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-attrs \
     "
-- 
2.20.1


