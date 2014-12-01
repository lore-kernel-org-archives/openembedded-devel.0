Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75F0065D53
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 07:34:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB17Xxm0029751
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 23:34:00 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Sun, 30 Nov 2014 23:33:59 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Dec 2014 15:32:44 +0800
Message-ID: <1417419164-5354-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [meta-perl][PATCH] libnet-ssleay-perl: avoid host contamination
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
X-List-Received-Date: Mon, 01 Dec 2014 07:34:03 -0000
Content-Type: text/plain

Check the configure log, libnet-ssleay-perl uses host's openssl:

*** Found OpenSSL-1.0.1 installed in /usr

Export OPENSSL_PREFIX to find the native openssl to use.

Replace library pathes '/lib', '/usr/lib' and header path with correct
staging pathes at same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
index 63594b9..f6c4b8b 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
@@ -28,12 +28,16 @@ S = "${WORKDIR}/Net-SSLeay-${PV}"
 
 inherit cpan ptest
 
-EXTRA_CPANFLAGS = "LIBS='-L=${libdir} -L=${base_libdir}' \
-                   INC=-I=${includedir} \
+EXTRA_CPANFLAGS = "LIBS='-L=${STAGING_LIBDIR} -L=${STAGING_BASELIBDIR}' \
+                   INC=-I=${STAGING_INCDIR} \
                    'EXTRALIBS=-lssl -lcrypto -lz' \
                    'LDLOADLIBS=-lssl -lcrypto -lz' \
                   "
 
+do_configure_prepend() {
+    export OPENSSL_PREFIX=${STAGING_DIR_NATIVE}${prefix_native}
+}
+
 do_install_ptest() {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
-- 
1.9.1


