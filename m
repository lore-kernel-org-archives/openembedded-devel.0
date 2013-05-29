Return-Path: <net147@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 79DAB6A4D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2013 07:01:11 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id rl6so8931199pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2013 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8quMYKzLeLq06TN0pLBNpkFUTQnB73OpEilAIEWob8o=;
	b=uURIYW+NLEY31f6dHZ3iYr0rsD/Cs2izZhCXEA1fIwftZ6+hSEFedGXdFohVAU0b7Q
	sD94l9ScuyDymoYkZYxgTmNFHQFnwc6xVM3FirpqUlD0ckKiwLdaWek3uSTKGxVHU8tY
	gcX2dTY4H2nA9QrT6I851c0nfo3GcoPCkj2bTEt8BqYQC1p5ClTEYTH9vHbaM8e7ibNJ
	bw0QDK3mAhh+Y9smp6NCsZ/cagWLvr3P1ZjpLT7Z/yarb00oiaFs/H6OmarkPe+oeFTZ
	iMUilRgNvifxVyMa+wMaQZzgLfQRfEOHsGEIRx16pZgADjPlzwLrFy6B+aGQJPmxilzq
	kbUQ==
X-Received: by 10.68.248.100 with SMTP id yl4mr1460421pbc.125.1369810872592;
	Wed, 29 May 2013 00:01:12 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	fp2sm36130443pbb.36.2013.05.29.00.01.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 May 2013 00:01:11 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 May 2013 17:14:09 +1000
Message-Id: <1369811649-14728-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [meta-oe][PATCH] llvm: move cross script install to separate sysroot preprocess function
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
X-List-Received-Date: Wed, 29 May 2013 07:01:12 -0000

The llvm-config2.x script doesn't get placed in the target sysroot
crosscripts directory otherwise.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index b2ab935..546a40b 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -136,6 +136,13 @@ do_install() {
         # later for native case
         install -d ${D}${bindir}
         install -m 0755 bin/llvm-config ${D}${bindir}
+}
+
+SYSROOT_PREPROCESS_FUNCS += "llvm_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS_virtclass-native += ""
+
+llvm_sysroot_preprocess() {
+    cd ${OECMAKE_BUILDPATH}
 
     # Fix the paths in the config script to make it find the binaries and
     # library files. Doing so allows 3rd party configure scripts working
-- 
1.8.2.3


