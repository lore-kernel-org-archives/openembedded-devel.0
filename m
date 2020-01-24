Return-Path: <tgamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB1DC7FDC0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 21:24:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 00OLOqfP007125
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 13:24:52 -0800 (PST)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 24 Jan 2020 13:24:52 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 6EBB4901B0D;
	Fri, 24 Jan 2020 13:24:52 -0800 (PST)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Jan 2020 13:24:52 -0800
Message-ID: <20200124212452.133281-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200124212452.133281-1-trevor.gamblin@windriver.com>
References: <20200124212452.133281-1-trevor.gamblin@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/2] python-twisted.inc: add missing core dependencies
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
X-List-Received-Date: Fri, 24 Jan 2020 21:24:52 -0000
Content-Type: text/plain

/usr/bin/twistd doesn't execute correctly if the pyhamcrest, pdb, and
getpass modules are not present, so add them to core RDEPENDS. Also
reformat the RDEPENDS list across multiple lines for easier reading.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python-twisted.inc       | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-twisted.inc b/meta-python/recipes-devtools/python/python-twisted.inc
index d005a2ac2..f830dee60 100644
--- a/meta-python/recipes-devtools/python/python-twisted.inc
+++ b/meta-python/recipes-devtools/python/python-twisted.inc
@@ -61,7 +61,17 @@ RDEPENDS_${PN} = "\
     ${PN}-zsh \
 "
 
-RDEPENDS_${PN}-core = "${PYTHON_PN}-core ${PYTHON_PN}-zopeinterface ${PYTHON_PN}-incremental ${PYTHON_PN}-constantly ${PYTHON_PN}-hyperlink ${PYTHON_PN}-automat ${PYTHON_PN}-pyserial"
+RDEPENDS_${PN}-core = "${PYTHON_PN}-core \ 
+                       ${PYTHON_PN}-zopeinterface \
+                       ${PYTHON_PN}-incremental \
+                       ${PYTHON_PN}-constantly \
+                       ${PYTHON_PN}-hyperlink \
+                       ${PYTHON_PN}-automat \
+                       ${PYTHON_PN}-pyserial \
+                       ${PYTHON_PN}-pyhamcrest \
+                       ${PYTHON_PN}-debugger \
+                       ${PYTHON_PN}-unixadmin \
+"
 RDEPENDS_${PN}-test = "${PN}"
 RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols ${PYTHON_PN}-bcrypt ${PYTHON_PN}-cryptography ${PYTHON_PN}-pyasn1 ${PYTHON_PN}-pickle"
 RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
-- 
2.17.1


