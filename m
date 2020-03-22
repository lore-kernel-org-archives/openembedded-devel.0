Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.32684.1584894586629053576
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2020 09:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02MGTPuH023139
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2020 09:29:36 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Sun, 22 Mar 2020
 09:29:15 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-twisted: add python3-appdirs to RDEPENDS
Date: Sun, 22 Mar 2020 12:29:14 -0400
Message-ID: <20200322162914.23834-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

python3-twisted requires python3-appdirs to support some
submodules:

|root@intel-x86-64:~# python3
|Python 3.7.4 (default, Oct 28 2019, 02:05:50)
|[GCC 9.2.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import twisted.python._appdirs
|
|Error message :
|File "<frozen importlib._bootstrap>", line 219, in
|_call_with_frames_removed
|File "/usr/lib64/python3.7/site-packages/twisted/python/_appdirs.py",
|line 11, in <module>
|import appdirs
|No module named 'appdirs'

Also rearranged the RDEPENDS list for twisted-core to be in alphabetical
order.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python-twisted.inc      | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index f830dee60..7537bafd3 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -61,16 +61,17 @@ RDEPENDS_${PN} = "\
     ${PN}-zsh \
 "
 
-RDEPENDS_${PN}-core = "${PYTHON_PN}-core \ 
-                       ${PYTHON_PN}-zopeinterface \
-                       ${PYTHON_PN}-incremental \
+RDEPENDS_${PN}-core = "${PYTHON_PN}-appdirs \
+                       ${PYTHON_PN}-automat \
                        ${PYTHON_PN}-constantly \
+                       ${PYTHON_PN}-core \ 
+                       ${PYTHON_PN}-debugger \
                        ${PYTHON_PN}-hyperlink \
-                       ${PYTHON_PN}-automat \
-                       ${PYTHON_PN}-pyserial \
+                       ${PYTHON_PN}-incremental \
                        ${PYTHON_PN}-pyhamcrest \
-                       ${PYTHON_PN}-debugger \
+                       ${PYTHON_PN}-pyserial \
                        ${PYTHON_PN}-unixadmin \
+                       ${PYTHON_PN}-zopeinterface \
 "
 RDEPENDS_${PN}-test = "${PN}"
 RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols ${PYTHON_PN}-bcrypt ${PYTHON_PN}-cryptography ${PYTHON_PN}-pyasn1 ${PYTHON_PN}-pickle"
-- 
2.24.1

