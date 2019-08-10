Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 453 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 10 Aug 2019 21:37:17 UTC
Received: from 6.mo173.mail-out.ovh.net (6.mo173.mail-out.ovh.net
	[46.105.43.93])
	by mail.openembedded.org (Postfix) with ESMTP id C1CC37E3AA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 21:37:17 +0000 (UTC)
Received: from player750.ha.ovh.net (unknown [10.109.159.178])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id B066D1152FC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 23:21:01 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id 4CE348DD8AFB;
	Sat, 10 Aug 2019 21:20:56 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Aug 2019 23:20:14 +0200
Message-Id: <20190810212014.23197-7-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
References: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3836222458559082056
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudduledgudeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [meta-python][PATCH 7/7] python-socketio.inc: add missing RDEPENDS
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
X-List-Received-Date: Sat, 10 Aug 2019 21:37:18 -0000
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
index a23e780795c6..c69963f1a6a9 100644
--- a/meta-python/recipes-devtools/python/python-socketio.inc
+++ b/meta-python/recipes-devtools/python/python-socketio.inc
@@ -12,6 +12,17 @@ PYPI_PACKAGE = "python-socketio"
 SRC_URI[md5sum] = "0b57da61a9464d2e0dc9a8d0164d86d2"
 SRC_URI[sha256sum] = "64feb0817f1bf7e3e7fc05f6f65e28d76146d8061cb7de25b63502717f80e908"
 
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


