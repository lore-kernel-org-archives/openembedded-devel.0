Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C31487602E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 05:42:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6O5gtG9019018
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 22:42:55 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 23 Jul 2018 22:42:54 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Jul 2018 22:42:54 -0700
Message-ID: <20180724054254.36340-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] iperf3: Upgrade to 3.6
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
X-List-Received-Date: Tue, 24 Jul 2018 05:42:54 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Licence-Update:
  - Copyright years are updated to 2018
  - Remove the part about src/tcp_window_size.{c,h}
    as iperf3 uses get/setsockopt() with SO_SNDBUF
    and SO_RCVBUF directly now
* Update the path parameter for --with-openssl as
  ${RECIPE_SYSROOT}/usr to fix the below do_configure
  error
  | checking for openssl/ssl.h in /poky-build/tmp/work/i586-poky-linux/iperf3/3.6-r0/recipe-sysroot... no
  | checking whether compiling and linking against OpenSSL works... no
  | configure: error: in `/poky-build/tmp/work/i586-poky-linux/iperf3/3.6-r0/build':
  | configure: error: --with-openssl was given, but test for OpenSSL failed

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../iperf3/{iperf3_3.2.bb => iperf3_3.6.bb}                 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.2.bb => iperf3_3.6.bb} (83%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.6.bb
similarity index 83%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.6.bb
index 2ed08110f..a575d465e 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.6.bb
@@ -9,7 +9,7 @@ SECTION = "console/network"
 BUGTRACKER = "https://github.com/esnet/iperf/issues"
 AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d098223e44bdd19585315ee75cd9d2d7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a9a036136b748453e839c0eb8906ef2e"
 
 DEPENDS = "openssl"
 
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/esnet/iperf.git \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            "
 
-SRCREV = "88d907f7fb58bfab5d086c5da60c922e1c582c92"
+SRCREV = "88f3ad87f38762081a6d7127890ff5c3a052b06a"
 
 S = "${WORKDIR}/git"
 
@@ -28,6 +28,6 @@ PACKAGECONFIG[lksctp] = "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sc
 
 CFLAGS += "-D_GNU_SOURCE"
 
-EXTRA_OECONF = "--with-openssl=${RECIPE_SYSROOT}"
+EXTRA_OECONF = "--with-openssl=${RECIPE_SYSROOT}/usr"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1


