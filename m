Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA0227F979
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 18:08:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xB6I8BjI023931
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Dec 2019 10:08:11 -0800 (PST)
Received: from yow-tgamblin-fedora1.wrs.com (128.224.56.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 6 Dec 2019 10:08:11 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Dec 2019 13:08:10 -0500
Message-ID: <20191206180810.2423062-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-twisted: add python3-pyserial to RDEPENDS
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
X-List-Received-Date: Fri, 06 Dec 2019 18:08:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

twisted's internet submodule has serial port functionality that relies
on python3-pyserial to be available, but this isn't in twisted's RDEPENDS
list, so imports of the serial port functionality will fail:

|root@qemux86-64:~# python3
|Python 3.7.5 (default, Dec  5 2019, 23:01:22)
|[GCC 9.2.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import twisted.internet.serialport
|Traceback (most recent call last):
|  File "<stdin>", line 1, in <module>
|  File "/usr/lib/python3.7/site-packages/twisted/internet/serialport.py", line 21, in <module>
|    import serial
|ModuleNotFoundError: No module named 'serial'
|>>>

Since the internet submodule is part of the twisted-core split, add
python3-pyserial to RDEPENDS for that part of the recipe.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python-twisted.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index 34f8846b0..67c90e32a 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -56,7 +56,7 @@ RDEPENDS_${PN} = "\
     ${PN}-zsh \
 "
 
-RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink ${PYTHON_PN}-automat"
+RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink ${PYTHON_PN}-automat ${PYTHON_PN}-pyserial"
 RDEPENDS_${PN}-test = "${PN}"
 RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
 RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
-- 
2.23.0


