Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D6376FF60
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:17:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7A9H8RX009368
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:17:08 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 10 Aug 2016 02:17:07 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Aug 2016 17:16:40 +0800
Message-ID: <1470820600-3825-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] snort: Add lzma to PACKAGECONFIG
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
X-List-Received-Date: Wed, 10 Aug 2016 09:17:08 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Add lzma to PACKAGECONFIG to remove below warning:
WARNING: snort-2.9.7.5-r0 do_package_qa: QA Issue:
snort rdepends on liblzma, but it isn't a build dependency,
missing xz in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
index fb71799..c62a8d3 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
@@ -42,8 +42,9 @@ EXTRA_OECONF = " \
 # if you want to disable it, you need to patch configure.in first
 # AC_CHECK_HEADERS([openssl/sha.h],, SHA_H="no")
 # is called even with --without-openssl-includes
-PACKAGECONFIG ?= "openssl"
+PACKAGECONFIG ?= "openssl lzma"
 PACKAGECONFIG[openssl] = "--with-openssl-includes=${STAGING_INCDIR} --with-openssl-libraries=${STAGING_LIBDIR}, --without-openssl-includes --without-openssl-libraries, openssl,"
+PACKAGECONFIG[lzma] = "--with-lzma-includes=${STAGING_INCDIR} --with-lzma-libraries=${STAGING_LIBDIR}, --without-lzma-includes --without-lzma-libraries, xz,"
 
 do_install_append() {
     install -d ${D}${sysconfdir}/snort/rules
-- 
2.8.1


