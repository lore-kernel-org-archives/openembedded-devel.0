Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9622960721
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 05:40:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5L5e1XF025329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 20 Jun 2016 22:40:01 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 20 Jun 2016 22:40:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jun 2016 01:39:52 -0400
Message-ID: <8f05b4ccbfed5d0b80bfd37f0db339bdd8a7cc9e.1466487409.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1466487409.git.hongxu.jia@windriver.com>
References: <cover.1466487409.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] python-pygobject: fix do_configure failed
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
X-List-Received-Date: Tue, 21 Jun 2016 05:40:02 -0000
Content-Type: text/plain

Fix build failure since it was moved to meta-oe

http://lists.openembedded.org/pipermail/openembedded-devel/2016-June/107798.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
index e4eeafb..52ef425 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 inherit autotools pkgconfig gnomebase distutils-base gobject-introspection
 
+PYTHON_BASEVERSION = "2.7"
+PYTHON_PN = "python"
+
 DEPENDS += "python glib-2.0"
 
 SRCNAME="pygobject"
@@ -20,7 +23,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 BBCLASSEXTEND = "native"
 
-EXTRA_OECONF = "--disable-cairo --with-python=python2.7"
+EXTRA_OECONF = "--disable-cairo --with-python=${PYTHON}"
 
 RDEPENDS_${PN} += "python-setuptools python-importlib"
 
-- 
2.8.1


