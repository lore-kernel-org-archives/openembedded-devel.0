Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 78A1665D0A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 06:01:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3961JSe025482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Apr 2014 23:01:24 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Tue, 8 Apr 2014 22:59:49 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Apr 2014 13:58:32 +0800
Message-ID: <1397023113-29936-3-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1397023113-29936-1-git-send-email-kai.kang@windriver.com>
References: <1397023113-29936-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 2/3] sg3-utils: update to 1.38
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
X-List-Received-Date: Wed, 09 Apr 2014 06:01:28 -0000
Content-Type: text/plain

Update sg3-utils to version 1.38.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../sg3-utils/{sg3-utils_1.31.bb => sg3-utils_1.38.bb}        | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.31.bb => sg3-utils_1.38.bb} (46%)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
similarity index 46%
rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb
rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
index 29fe132..beee36c 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.31.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
@@ -1,15 +1,16 @@
 SUMMARY = "Utilities for working with generic SCSI devices"
+
+DESCRIPTION = "This package contains low level utilities for devices that use the SCSI command set"
+
 HOMEPAGE = "http://sg.danny.cz/sg/sg3_utils.html"
 SECTION = "console/admin"
 
 LICENSE = "GPLv2+ & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1cc481c050dc92e12db9c8145043d5dc"
-
-PR = "r1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f90da7fc52172599dbf082d7620f18ca"
 
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
-SRC_URI[md5sum] = "9431e1944cde829a24dedf027e1364b5"
-SRC_URI[sha256sum] = "d84b38b61f0ca3941eb1c48a5858f93d1d1b70a623e579f5ecce2440e18410a4"
+SRC_URI[md5sum] = "e532a3d6648c422347f6d84cac469263"
+SRC_URI[sha256sum] = "d7d3a8b4b698e2c17c8f16bb876946720260d4d659d471c5d7c12ce652ba38f1"
 
 inherit autotools
 
-- 
1.8.4


