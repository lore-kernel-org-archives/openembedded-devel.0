Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC9974BC3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 08:29:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w698TYLv014206
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jul 2018 01:29:34 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 9 Jul 2018 01:29:33 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Jul 2018 01:29:33 -0700
Message-ID: <20180709082933.118989-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] iozone3: Upgrade to 482
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
X-List-Received-Date: Mon, 09 Jul 2018 08:29:34 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Licence-Update:
The copyright info is located in source file
iozone.c.
Previously in v465, the copyright info is located
between lines 37 to 48 and lines 260 to 266, but
now in v482, it is located between lines 37 to 48
and lines 269 to 275 instead.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../iozone3/{iozone3_465.bb => iozone3_482.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_465.bb => iozone3_482.bb} (95%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
similarity index 95%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
index 191b93425..db79dff0a 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_465.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_482.bb
@@ -4,14 +4,14 @@ AUTHOR = "Don Capps <don.capps2@verizon.net>, William D. Norcott <wnorcott@us.or
 SECTION = "console/tests"
 LICENSE = "iozone3"
 LIC_FILES_CHKSUM = "file://iozone.c;beginline=37;endline=48;md5=7331260091868dcad0f9edea735b5f4b \
-    file://iozone.c;beginline=260;endline=266;md5=77f9ee51e45b57a7e7519c4fa0b4f00b \
+    file://iozone.c;beginline=269;endline=275;md5=77f9ee51e45b57a7e7519c4fa0b4f00b \
 "
 SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://parallelism.patch \
     file://copyright.txt \
 "
-SRC_URI[md5sum] = "c924e5e46fb1cf8145f420e8e57eb954"
-SRC_URI[sha256sum] = "2e3d72916e7d7340a7c505fc0c3d28553fcc5ff2daf41d811368e55bd4e6a293"
+SRC_URI[md5sum] = "31ca1d3d28bc375c20a2808217cf212c"
+SRC_URI[sha256sum] = "2733feb63c96f77177c68f3d938f2294d5394d8554b2767c45cbe138b2f3ae30"
 
 UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
 
-- 
2.17.1


