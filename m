Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3416F6D290
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 05:52:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA45q5Kp014607
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 3 Nov 2013 21:52:05 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.89) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 21:52:05 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Nov 2013 00:52:04 -0500
Message-ID: <1383544324-12917-2-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1383544324-12917-1-git-send-email-bruce.ashfield@windriver.com>
References: <1383544324-12917-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] python-greenlet: uprev to 0.4.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Nov 2013 05:52:03 -0000
Content-Type: text/plain

During runtime testing of meta-cloud-services several python scripts were
continunously segfaulting the interpreter. corefiles and gdb pointed at
the greenlet implementation.

Moving to 0.4.1 fixed the segfaults, and showed no regressions.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/{python-greenlet_0.3.4.bb => python-greenlet_0.4.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-greenlet_0.3.4.bb => python-greenlet_0.4.1.bb} (76%)

diff --git a/meta-oe/recipes-devtools/python/python-greenlet_0.3.4.bb b/meta-oe/recipes-devtools/python/python-greenlet_0.4.1.bb
similarity index 76%
rename from meta-oe/recipes-devtools/python/python-greenlet_0.3.4.bb
rename to meta-oe/recipes-devtools/python/python-greenlet_0.4.1.bb
index 4a240fa..a6db8ab 100644
--- a/meta-oe/recipes-devtools/python/python-greenlet_0.3.4.bb
+++ b/meta-oe/recipes-devtools/python/python-greenlet_0.4.1.bb
@@ -5,8 +5,8 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 SRC_URI = "http://pypi.python.org/packages/source/g/greenlet/greenlet-${PV}.zip"
-SRC_URI[md5sum] = "530a69acebbb0d66eb5abd83523d8272"
-SRC_URI[sha256sum] = "259ed0f34de9b0c948f42bdaffe378ea53d210d38377c6dcb0c6b728fccad1b0"
+SRC_URI[md5sum] = "c2deda75bdda59c38cae12a77cc53adc"
+SRC_URI[sha256sum] = "ea671592f8460541286b133ed46a6cf5311a6b75051cc31b53e2bc38992b775a"
 
 S = "${WORKDIR}/greenlet-${PV}"
 
-- 
1.8.1.2


