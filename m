Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22DCA719B8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Nov 2016 02:16:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA72GF71016301
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 6 Nov 2016 18:16:15 -0800 (PST)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 6 Nov 2016 18:16:14 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 7 Nov 2016 10:16:13 +0800
Message-ID: <1478484973-23628-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] python-pyserial: remove serialjava.py
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
X-List-Received-Date: Mon, 07 Nov 2016 02:16:15 -0000
Content-Type: text/plain

The serialjava.py depends on jpython, we don't support jpython now.So remove it.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta-python/recipes-devtools/python/python-pyserial.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta-python/recipes-devtools/python/python-pyserial.inc
index a4c7728..61f3776 100644
--- a/meta-python/recipes-devtools/python/python-pyserial.inc
+++ b/meta-python/recipes-devtools/python/python-pyserial.inc
@@ -14,3 +14,11 @@ SRC_URI[md5sum] = "2f72100de3e410b36d575e12e82e9d27"
 SRC_URI[sha256sum] = "d657051249ce3cbd0446bcfb2be07a435e1029da4d63f53ed9b4cdde7373364c"
 
 inherit pypi
+
+do_install_append() {
+	# We don't support jpython now.
+	if [ -e ${D}${PYTHON_SITEPACKAGES_DIR}/serial/serialjava.py ]; then
+		rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/serial/serialjava.py
+		rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/serial/serialjava.pyc
+	fi
+}
-- 
2.7.4


