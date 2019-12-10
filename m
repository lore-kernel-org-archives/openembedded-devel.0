Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 61F5F6D6F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 22:22:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBAMN0ml028053
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 14:23:00 -0800 (PST)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 10 Dec 2019 14:22:59 -0800
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Dec 2019 17:22:59 -0500
Message-ID: <20191210222259.22811-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-twisted: add missing RDEPENDS for conch
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
X-List-Received-Date: Tue, 10 Dec 2019 22:22:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

import twisted.conch.checkers outputs error messages like the
following for multiple modules:

|Python 3.7.4 (default, Oct 28 2019, 02:05:50)
|[GCC 9.2.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import twisted.conch.checkers
|
|Error message :
|File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
|File "/usr/lib64/python3.7/site-packages/twisted/conch/checkers.py", line 32, in
|<module>
|from twisted.conch.ssh import keys
|File "/usr/lib64/python3.7/site-packages/twisted/conch/ssh/keys.py", line 18, in
|<module>
|import bcrypt
|No module named 'bcrypt'

Add the missing RDEPENDS so that it works (bcrypt, cryptography, pyasn1,
pickle).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python-twisted.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index 67c90e32a..084123b97 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -58,7 +58,7 @@ RDEPENDS_${PN} = "\
 
 RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink ${PYTHON_PN}-automat ${PYTHON_PN}-pyserial"
 RDEPENDS_${PN}-test = "${PN}"
-RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
+RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols ${PYTHON_PN}-bcrypt ${PYTHON_PN}-cryptography ${PYTHON_PN}-pyasn1 ${PYTHON_PN}-pickle"
 RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
 RDEPENDS_${PN}-names = "${PN}-core"
 RDEPENDS_${PN}-news = "${PN}-core ${PN}-protocols"
-- 
2.24.0


