Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 293B86AAAF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 13:40:45 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so3669583pab.39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 06:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/i2MMJXG/0BVOsKPBK58kMYpbTEbG5KTltLvSsDyeCk=;
	b=T9UAR8oWSxakuB0+jEMi992HWEFRBf53iyEOLB3BvPG1VcCwiBKYR92/+VnInS8Bh6
	G2Kiu0BN/LXOd2YZQa7Ki4iDdkLa1yLCAo2a8pWZOwDgimfeyweyp4a/qpNsEGoeiO9N
	0wSAJ9FQryDfedFkS34qgg7FWKOQb27tRiPgj6SuXb8Rvo8vxjmxjMHAkDa7TTFs9Uf9
	0j3J80eDIgqIZVf+QAd/R5Vwe6q5HiBnkHrBPcXHlHcLze80M2xdCppDNh+Ee+vUFx/3
	cAI8QV3Ihy4/YLLD5RyyhSygUgf+WXSO9AahY37rgjxmZPB9i4WMUWL/xFHBH4WcGXR8
	mmAg==
X-Received: by 10.68.125.227 with SMTP id mt3mr20269581pbb.153.1371044445915; 
	Wed, 12 Jun 2013 06:40:45 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	so3sm21382838pac.14.2013.06.12.06.40.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 06:40:45 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jun 2013 23:55:05 +1000
Message-Id: <1371045305-11765-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [meta-oe][PATCH v3] llvm-common: move cross script install to sysroot preprocess function
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
X-List-Received-Date: Wed, 12 Jun 2013 13:40:45 -0000

The llvm-config script doesn't get placed in the target sysroot
crossscripts directory otherwise.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm-common.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/llvm/llvm-common.bb b/meta-oe/recipes-core/llvm/llvm-common.bb
index 612fd34..192919e 100644
--- a/meta-oe/recipes-core/llvm/llvm-common.bb
+++ b/meta-oe/recipes-core/llvm/llvm-common.bb
@@ -6,7 +6,10 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 SRC_URI = "file://llvm-config"
 
-do_install() {
+ALLOW_EMPTY_${PN} = "1"
+SYSROOT_PREPROCESS_FUNCS_append_class-target = " llvm_common_sysroot_preprocess"
+
+llvm_common_sysroot_preprocess() {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
     install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
-- 
1.8.3


