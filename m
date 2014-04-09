Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7993865DED
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 06:01:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3961JSd025482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Apr 2014 23:01:24 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Tue, 8 Apr 2014 22:59:14 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Apr 2014 13:58:31 +0800
Message-ID: <1397023113-29936-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1397023113-29936-1-git-send-email-kai.kang@windriver.com>
References: <1397023113-29936-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 1/3] libyaml: update to 0.1.5
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

Update libyaml from 0.1.4 to latest version 0.1.5.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libyaml/{libyaml_0.1.4.bb => libyaml_0.1.5.bb}           | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/libyaml/{libyaml_0.1.4.bb => libyaml_0.1.5.bb} (36%)

diff --git a/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb b/meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb
similarity index 36%
rename from meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb
rename to meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb
index af8d63f..c44eda4 100644
--- a/meta-oe/recipes-support/libyaml/libyaml_0.1.4.bb
+++ b/meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb
@@ -1,12 +1,16 @@
-SUMMARY = "LibYAML is a YAML parser and emitter written in C"
+SUMMARY = "LibYAML is a YAML 1.1 parser and emitter written in C."
+DESCRIPTION = "LibYAML is a C library for parsing and emitting data in YAML 1.1, \
+a human-readable data serialization format. "
 HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
 SECTION = "libs/devel"
+
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
 
-SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz;name=libyaml"
-SRC_URI[libyaml.md5sum] = "36c852831d02cf90508c29852361d01b"
-SRC_URI[libyaml.sha256sum] = "7bf81554ae5ab2d9b6977da398ea789722e0db75b86bffdaeb4e66d961de6a37"
+SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "24f6093c1e840ca5df2eb09291a1dbf1"
+SRC_URI[sha256sum] = "fa87ee8fb7b936ec04457bc044cd561155e1000a4d25029867752e543c2d3bef"
 
 S = "${WORKDIR}/yaml-${PV}"
 
-- 
1.8.4


