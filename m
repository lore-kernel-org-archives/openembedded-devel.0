Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 625447FAAD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 05:03:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="78047885"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 13:03:42 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A69E64CE1A05
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 12:55:35 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 8 Nov 2019 13:03:42 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2019 13:04:11 +0800
Message-ID: <20191108050411.16249-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: A69E64CE1A05.A927E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-flask-socketio: upgrade 3.3.2 -> 4.2.1
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
X-List-Received-Date: Fri, 08 Nov 2019 05:03:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-flask-socketio.inc | 4 ++--
 ...flask-socketio_3.3.2.bb => python-flask-socketio_4.2.1.bb} | 0
 ...lask-socketio_3.3.2.bb => python3-flask-socketio_4.2.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-socketio_3.3.2.bb => python-flask-socketio_4.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_3.3.2.bb => python3-flask-socketio_4.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-socketio.inc b/meta-python/recipes-devtools/python/python-flask-socketio.inc
index 251d13ede..8d778d4bf 100644
--- a/meta-python/recipes-devtools/python/python-flask-socketio.inc
+++ b/meta-python/recipes-devtools/python/python-flask-socketio.inc
@@ -9,8 +9,8 @@ inherit pypi
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[md5sum] = "298965a43f6534e8a5b24d1ba1fc4186"
-SRC_URI[sha256sum] = "8d8f9f104db5ddff1b06ba322d8e158881d590144199c993fe26cf53218c7edd"
+SRC_URI[md5sum] = "b23222fb7dd2f0676d78bbe24153fd80"
+SRC_URI[sha256sum] = "2172dff1e42415ba480cee02c30c2fc833671ff326f1598ee3d69aa02cf768ec"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-flask \
diff --git a/meta-python/recipes-devtools/python/python-flask-socketio_3.3.2.bb b/meta-python/recipes-devtools/python/python-flask-socketio_4.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-socketio_3.3.2.bb
rename to meta-python/recipes-devtools/python/python-flask-socketio_4.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_3.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
-- 
2.20.1




