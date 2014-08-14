Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 604C56ACD6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 07:54:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7E7sDAO006060
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 00:54:13 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 14 Aug 2014 00:54:12 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Aug 2014 15:49:52 +0800
Message-ID: <1408002596-9778-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1408002596-9778-1-git-send-email-kai.kang@windriver.com>
References: <1408002596-9778-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 2/6] libdigest-hmac-perl: add recipe
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
X-List-Received-Date: Thu, 14 Aug 2014 07:54:17 -0000
Content-Type: text/plain

Add recipe for libdigest-hmac-perl and enable to create -ptest sub-package.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libdigest/libdigest-hmac-perl_1.03.bb          | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb

diff --git a/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
new file mode 100644
index 0000000..6ca6814
--- /dev/null
+++ b/meta-perl/recipes-perl/libdigest/libdigest-hmac-perl_1.03.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Keyed-Hashing for Message Authentication"
+DESCRIPTION = "Keyed-Hashing for Message Authentication"
+HOMEPAGE = "http://search.cpan.org/~gaas/Digest-HMAC-1.03/"
+SECTION = "libs"
+
+LICENSE = "Artistic-1.0|GPLv1+"
+LIC_FILES_CHKSUM = "file://README;beginline=13;endline=17;md5=da980cdc026faa065e5d5004115334e6"
+
+RDEPENDS_${PN} = "libdigest-sha1-perl perl-module-extutils-makemaker perl-module-digest-md5"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-HMAC-${PV}.tar.gz \
+           file://run-ptest \
+          "
+SRC_URI[md5sum] = "e6a5d6f552da16eacb5157ea4369ff9d"
+SRC_URI[sha256sum] = "3bc72c6d3ff144d73aefb90e9a78d33612d58cf1cd1631ecfb8985ba96da4a59"
+
+S = "${WORKDIR}/Digest-HMAC-${PV}"
+
+inherit cpan ptest
+
+do_install_ptest () {
+       cp -r ${B}/t ${D}${PTEST_PATH}
+}
+
+PACKAGE_ARCH = "all"
+BBCLASSEXTEND = "native"
-- 
1.9.1


