Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5E42A60912
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Jun 2013 08:11:25 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id z11so4275237pdj.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Jun 2013 01:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=1F3Txfjo3rsh+25CzwUtsujUYI7D2u0Yl2EcIwiZldE=;
	b=RkKYbPCuh/R2YvjSC7bGNwj+x+IW6i5OqsOqURBeYwD/DIxBHRAbeR/t/LnrY65MMy
	9KpkkA3MJz+FbvdFSyqq57phJGGc4UlQTjoZrXLzGC+b9ZxZ2GYIgwEGfpiUB0sek7Ps
	uBuwm4O4t3qXQEcOtMUt4fXVwyrPhcVFi60gf8u9PMAMVy/Tnm8SgC27lTWV2hapIEDx
	fUUhd2LLw+byz0mLofxmUxzyMLhLQ7TWSOSayqUWH7W1vsnbYzKmPF9+OhfSVLc2PWl4
	w9Tqhl0G1Gr4smnZeMFUJNLUboozt2BrkSvA+bnIK3eIEFnMFj0lWO5KmzFZZV4ucnEN
	pUEQ==
X-Received: by 10.66.87.5 with SMTP id t5mr20583180paz.169.1370160686460;
	Sun, 02 Jun 2013 01:11:26 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	yj2sm54128369pbb.40.2013.06.02.01.11.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Jun 2013 01:11:25 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Jun 2013 18:06:15 +1000
Message-Id: <1370160375-14609-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [meta-oe][PATCH v2] llvm-common: move cross script install to sysroot preprocess function
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
X-List-Received-Date: Sun, 02 Jun 2013 08:11:25 -0000

The llvm-config script doesn't get placed in the target sysroot
crossscripts directory otherwise.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm-common.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/llvm/llvm-common.bb b/meta-oe/recipes-core/llvm/llvm-common.bb
index 612fd34..3a4232f 100644
--- a/meta-oe/recipes-core/llvm/llvm-common.bb
+++ b/meta-oe/recipes-core/llvm/llvm-common.bb
@@ -6,7 +6,11 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 SRC_URI = "file://llvm-config"
 
-do_install() {
+ALLOW_EMPTY_${PN} = "1"
+SYSROOT_PREPROCESS_FUNCS += "llvm_common_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS_virtclass-native += ""
+
+llvm_common_sysroot_preprocess() {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
     install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
-- 
1.8.3


