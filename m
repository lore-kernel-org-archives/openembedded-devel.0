Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97BE771985
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:19:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v658JRJg016689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:19:27 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Jul 2017 01:19:26 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jul 2017 16:11:28 +0800
Message-ID: <20170705081133.6496-6-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170705081133.6496-1-kai.kang@windriver.com>
References: <20170705081133.6496-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 05/10] libp11: fix compile error if OPENSSL_NO_EC defined
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
X-List-Received-Date: Wed, 05 Jul 2017 08:19:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Function compute_key_fn src/p11_ec.c uses types EC_POINT and EC_KEY which are
defined in ec.h. If OPENSSL_NO_EC is defined, no header file ec.h exists and
causes compile errors.

../../git/src/p11_ec.c:45:8: error: unknown type name 'EC_POINT'
const EC_POINT *, const EC_KEY *,
    ^~~~~~~~
../../git/src/p11_ec.c:45:26: error: unknown type name 'EC_KEY'
const EC_POINT *, const EC_KEY *,
                      ^~~~~~

So check OPENSSL_NO_EC earlier in src/p11_ec.c to fix the error.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...-src-p11_ec.c-check-OPENSSL_NO_EC-earlier.patch | 46 ++++++++++++++++++++++
 meta-oe/recipes-support/libp11/libp11_0.4.0.bb     |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libp11/libp11/0001-src-p11_ec.c-check-OPENSSL_NO_EC-earlier.patch

diff --git a/meta-oe/recipes-support/libp11/libp11/0001-src-p11_ec.c-check-OPENSSL_NO_EC-earlier.patch b/meta-oe/recipes-support/libp11/libp11/0001-src-p11_ec.c-check-OPENSSL_NO_EC-earlier.patch
new file mode 100644
index 0000000..180a91f
--- /dev/null
+++ b/meta-oe/recipes-support/libp11/libp11/0001-src-p11_ec.c-check-OPENSSL_NO_EC-earlier.patch
@@ -0,0 +1,46 @@
+Upstream-Status: Submitted [https://github.com/OpenSC/libp11]
+
+src/p11_ec.c: check OPENSSL_NO_EC earlier
+
+Function compute_key_fn uses types EC_POINT and EC_KEY which are defined
+in ec.h. If OPENSSL_NO_EC is defined, no header file ec.h exists and
+causes compile errors.
+
+../../git/src/p11_ec.c:45:8: error: unknown type name 'EC_POINT'
+const EC_POINT *, const EC_KEY *,
+    ^~~~~~~~
+../../git/src/p11_ec.c:45:26: error: unknown type name 'EC_KEY'
+const EC_POINT *, const EC_KEY *,
+		      ^~~~~~
+So check OPENSSL_NO_EC earlier in src/p11_ec.c.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/p11_ec.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/p11_ec.c b/src/p11_ec.c
+index 6b49775..fdf1f59 100644
+--- a/src/p11_ec.c
++++ b/src/p11_ec.c
+@@ -37,6 +37,8 @@
+ #include <openssl/ecdh.h>
+ #endif
+ 
++#ifndef OPENSSL_NO_EC
++
+ #if OPENSSL_VERSION_NUMBER >= 0x10100004L
+ typedef int (*compute_key_fn)(unsigned char **, size_t *,
+ 	const EC_POINT *, const EC_KEY *);
+@@ -49,8 +51,6 @@ static compute_key_fn ossl_ecdh_compute_key;
+ 
+ static int ec_ex_index = 0;
+ 
+-#ifndef OPENSSL_NO_EC
+-
+ /********** Manage EC ex_data */
+ 
+ /* NOTE: ECDH also uses ECDSA ex_data and *not* ECDH ex_data */
+-- 
+2.10.1
+
diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.0.bb b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
index d88006c..2961e0a 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
@@ -8,7 +8,9 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
-SRC_URI = "git://github.com/OpenSC/libp11.git"
+SRC_URI = "git://github.com/OpenSC/libp11.git \
+           file://0001-src-p11_ec.c-check-OPENSSL_NO_EC-earlier.patch \
+           "
 SRCREV = "22de793340ab73cafc92f8238afb51a06d8411c3"
 
 S = "${WORKDIR}/git"
-- 
2.10.1


