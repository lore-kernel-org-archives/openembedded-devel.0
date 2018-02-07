Return-Path: <tomasz.meresinski@comarch.pl>
Received: from odzwierny3.comarch.com (odzwierny3.comarch.com [217.74.69.18])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1796FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Feb 2018 16:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	authenticated as tomasz.meresinski@comarch.com
	by odzwierny3.comarch.com with esmtpsa (TLSv1:AES128-SHA:128)(ComArch
	ESMTP) id 1ejSpD-000NK4-Ne; Wed, 07 Feb 2018 17:43:59 +0100
From: =?UTF-8?q?Tomasz=20Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Feb 2018 17:43:52 +0100
Message-Id: <1518021832-6779-1-git-send-email-tomasz.meresinski@comarch.pl>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CA-Antivirus: Scanned by ComArch Antivirus on odzwierny3.comarch.com
X-CA-Is-Spam: No
Cc: =?UTF-8?q?Tomasz=20Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
Subject: [meta-python][PATCH] python3-twisted: remove python3-twisted-src
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
X-List-Received-Date: Wed, 07 Feb 2018 16:44:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In python2 .py files are not necessary when importing a module.
In python3 it's impossible to import without them.
Removing python3-twisted-src makes .py files appear in packages again.

Signed-off-by: Tomasz Meresiński<tomasz.meresinski@comarch.pl>
---
 meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb b/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
index dfb9d4a..6bd8c52 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_17.9.0.bb
@@ -1,6 +1,8 @@
 inherit pypi setuptools3
 require python-twisted.inc
 
+PACKAGES_remove = "${PN}-src"
+
 FILES_${PN}-core_append += " \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__pycache__/*pyc \
-- 
2.7.4


