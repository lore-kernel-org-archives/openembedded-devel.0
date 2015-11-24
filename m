Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8616B6F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 21:50:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAOLokGn021487
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 13:50:47 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 24 Nov 2015 13:50:46 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <randy.macleod@windriver.com>
Date: Tue, 24 Nov 2015 13:50:46 -0800
Message-ID: <1448401846-28979-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-perl][PATCH 1/1] recipes-perl: inherit allarch
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
X-List-Received-Date: Tue, 24 Nov 2015 21:50:51 -0000
Content-Type: text/plain

allarch packages should inherit the class, not
set PACKAGE_ARCH to "all".

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../libauthen/libauthen-sasl-perl_2.16.bb          |    3 +--
 .../libdigest/libdigest-hmac-perl_1.03.bb          |    3 +--
 .../libio/libio-socket-ssl-perl_1.997.bb           |    4 +---
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
index 361bdf1..637320d 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
@@ -19,12 +19,11 @@ SRC_URI[sha256sum] = "6614fa7518f094f853741b63c73f3627168c5d3aca89b1d02b1016dc32
 
 S = "${WORKDIR}/Authen-SASL-${PV}"
 
-inherit cpan ptest
+inherit cpan ptest allarch
 
 do_install_ptest () {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
 
-PACKAGE_ARCH = "all"
 BBCLASSEXTEND = "native"
 
diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
index affc9f6..7859c8c 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
@@ -16,11 +16,10 @@ SRC_URI[sha256sum] = "3bc72c6d3ff144d73aefb90e9a78d33612d58cf1cd1631ecfb8985ba96
 
 S = "${WORKDIR}/Digest-HMAC-${PV}"
 
-inherit cpan ptest
+inherit cpan ptest allarch
 
 do_install_ptest () {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
 
-PACKAGE_ARCH = "all"
 BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
index 19dec83..3c49bb6 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_1.997.bb
@@ -22,9 +22,7 @@ SRC_URI[sha256sum] = "acdb67b5b63aea5b7e70c3e4c70a16128810329592b63753a38c794aff
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-inherit cpan ptest
-
-PACKAGE_ARCH = "all"
+inherit cpan ptest allarch
 
 do_install_append () {
     mkdir -p ${D}${docdir}/${PN}/
-- 
1.7.9.5


