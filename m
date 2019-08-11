Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 537 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 11 Aug 2019 15:25:56 UTC
Received: from 9.mo5.mail-out.ovh.net (9.mo5.mail-out.ovh.net [178.32.96.204])
	by mail.openembedded.org (Postfix) with ESMTP id 4CD947ECB5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 15:25:56 +0000 (UTC)
Received: from player760.ha.ovh.net (unknown [10.109.160.5])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 29341248A97
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 17:17:00 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player760.ha.ovh.net (Postfix) with ESMTPSA id B66F98CC09BD;
	Sun, 11 Aug 2019 15:16:56 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Aug 2019 17:16:23 +0200
Message-Id: <20190811151626.13990-4-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190811151626.13990-1-maciej.pijanowski@3mdeb.com>
References: <20190811151626.13990-1-maciej.pijanowski@3mdeb.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3561221408611053128
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddvvddgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenuc
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [meta-python][PATCH v2 4/7] python-socketio: upgrade to 4.3.1
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
X-List-Received-Date: Sun, 11 Aug 2019 15:25:56 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 meta-python/recipes-devtools/python/python-socketio.inc       | 4 ++--
 .../{python-socketio_4.0.0.bb => python-socketio_4.3.1.bb}    | 0
 .../{python3-socketio_4.0.0.bb => python3-socketio_4.3.1.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-socketio_4.0.0.bb => python-socketio_4.3.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-socketio_4.0.0.bb => python3-socketio_4.3.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-socketio.inc b/meta-python/recipes-devtools/python/python-socketio.inc
index a23e780795c6..fa62afce1546 100644
--- a/meta-python/recipes-devtools/python/python-socketio.inc
+++ b/meta-python/recipes-devtools/python/python-socketio.inc
@@ -9,8 +9,8 @@ inherit pypi
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[md5sum] = "0b57da61a9464d2e0dc9a8d0164d86d2"
-SRC_URI[sha256sum] = "64feb0817f1bf7e3e7fc05f6f65e28d76146d8061cb7de25b63502717f80e908"
+SRC_URI[md5sum] = "86cd47dddea1785ce7a6c72f55c93fe7"
+SRC_URI[sha256sum] = "506b2cf7a520b40ea0b3f25e1272eff8de134dce6f471c1f6bc0de8c90fe8c57"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-engineio \
diff --git a/meta-python/recipes-devtools/python/python-socketio_4.0.0.bb b/meta-python/recipes-devtools/python/python-socketio_4.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-socketio_4.0.0.bb
rename to meta-python/recipes-devtools/python/python-socketio_4.3.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.0.0.bb b/meta-python/recipes-devtools/python/python3-socketio_4.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-socketio_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_4.3.1.bb
-- 
2.20.1


