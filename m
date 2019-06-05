Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C53ED7DE75
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 03:04:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5534Q50022847
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Jun 2019 20:04:26 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 4 Jun 2019 20:04:26 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jun 2019 11:03:56 +0800
Message-ID: <1559703841-263740-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
References: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] python-pygobject: upgrade 3.28.3 -> 3.32.1
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
X-List-Received-Date: Wed, 05 Jun 2019 03:04:28 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

switch to meson build

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...thon-pygobject_3.28.3.bb => python-pygobject_3.32.1.bb} | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-pygobject_3.28.3.bb => python-pygobject_3.32.1.bb} (64%)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.32.1.bb
similarity index 64%
rename from meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
rename to meta-oe/recipes-devtools/python/python-pygobject_3.32.1.bb
index 348a039..c26b383 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.28.3.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.32.1.bb
@@ -4,6 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
+GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gobject-introspection distutils-base upstream-version-is-even
 
 DEPENDS += "python glib-2.0"
@@ -13,16 +14,19 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "3bac63c86bb963aa401f97859464aa90"
-SRC_URI[sha256sum] = "3dd3e21015d06e00482ea665fc1733b77e754a6ab656a5db5d7f7bfaf31ad0b0"
+SRC_URI[md5sum] = "9d5dbca10162dd9b0d03fed0c6cf865d"
+SRC_URI[sha256sum] = "32c99def94b8dea5ce9e4bc99576ef87591ea779b4db77cfdca7af81b76d04d8"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-BBCLASSEXTEND = "native"
+UNKNOWN_CONFIGURE_WHITELIST = "introspection"
+
+PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo python-pycairo, python-pycairo"
+PACKAGECONFIG[tests] = "-Dtests=true, -Dtests=false, , "
 
-EXTRA_OECONF = "--disable-cairo"
 
-RDEPENDS_${PN} += "python-setuptools"
+BBCLASSEXTEND = "native"
+RDEPENDS_${PN} = "python-setuptools"
 RDEPENDS_${PN}_class-native = ""
 
 do_install_append() {
-- 
2.7.4


