Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3D065CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 05:43:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7K5hBxA025203
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 22:43:11 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 19 Aug 2015 22:43:10 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Aug 2015 13:39:15 +0800
Message-ID: <1440049155-4314-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440049155-4314-1-git-send-email-rongqing.li@windriver.com>
References: <1440049155-4314-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2][meta-oe] zeromq: upgrade to 4.1.3
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
X-List-Received-Date: Thu, 20 Aug 2015 05:43:15 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

4.1.3 has the dependence on libsodium,
4.1.3 asks pkgconfig bbclass to configure,
add a target to build ptest, since the orignial check will build and run
which is not suitable for cross-compile, and change the ptest installation
directories

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../zeromq/{zeromq_4.0.4.bb => zeromq_4.1.3.bb}            | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.0.4.bb => zeromq_4.1.3.bb} (62%)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
similarity index 62%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
index 80907fa..5d0e2d5 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.0.4.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.1.3.bb
@@ -2,12 +2,13 @@ DESCRIPTION = "ZeroMQ looks like an embeddable networking library but acts like
 HOMEPAGE = "http://www.zeromq.org"
 LICENSE = "LGPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=d5311495d952062e0e4fbba39cbf3de1"
+DEPENDS = "libsodium"
 
 SRC_URI = "http://download.zeromq.org/zeromq-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[md5sum] = "f3c3defbb5ef6cc000ca65e529fdab3b"
-SRC_URI[sha256sum] = "1ef71d46e94f33e27dd5a1661ed626cd39be4d2d6967792a275040e34457d399"
+SRC_URI[md5sum] = "d0824317348cfb44b8692e19cc73dc3a"
+SRC_URI[sha256sum] = "61b31c830db377777e417235a24d3660a4bcc3f40d303ee58df082fcd68bf411"
 
 S = "${WORKDIR}/zeromq-${PV}"
 
@@ -16,9 +17,14 @@ S = "${WORKDIR}/zeromq-${PV}"
 #CFLAGS_append += "-O0"
 #CXXFLAGS_append += "-O0"
 
-inherit autotools ptest
+inherit autotools ptest pkgconfig
+
+do_compile_ptest () {
+	echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${B}/Makefile
+	oe_runmake buildtest-TESTS
+}
 
 do_install_ptest () {
         install -d ${D}${PTEST_PATH}/tests
-        install -m 0755 ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests
+        install -m 0755 ${B}/.libs/test_* ${D}${PTEST_PATH}/tests
 }
-- 
1.9.1


