Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id ACDE5770E0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Nov 2015 12:22:58 +0000 (UTC)
Received: by wmww144 with SMTP id w144so25331wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2015 04:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=95y9lBiV24QrNqI8qRrBbyq/dsiggQrKXToYzynxqyQ=;
	b=D1YmPV8by1pIDo4k3na/ITur3X4c+A+6jH3hkZqbNexeK3HGYO5K8mCTOPOmJQcNfR
	yn811DUy4y3dD1lYCObY+HqjYfJy4rjboRo1ZtCehC4mMmhVFoLJX6fvCcnU3aGYdnuW
	LW3zGfreykXytFEgSFOGyd2S/FleoSPKtkuMZ0QXMFRmL9TSXVD50o/gIVbwVMV4ZCrX
	4tNqhxXs1Cq50e2WC+ZKhTWPMFttxqTagnVpbvjqyXd+v5o92Ye2faaf7Nf+bN8un8xn
	GPQwSPkxqtCwGDUYqlrq5ET4AjeQKisrSYxjjeiwYW8y1gqZ4VDCYVj2cj7tll5CmZjK
	zeQA==
X-Received: by 10.28.138.148 with SMTP id m142mr16325432wmd.2.1446898978219;
	Sat, 07 Nov 2015 04:22:58 -0800 (PST)
Received: from Saturn.local.all (212-41-102-22.adsl.solnet.ch. [212.41.102.22])
	by smtp.gmail.com with ESMTPSA id ly4sm4899190wjb.4.2015.11.07.04.22.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Nov 2015 04:22:57 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Nov 2015 13:20:26 +0100
Message-Id: <1446898829-21243-3-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
References: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-browser][PATCH v2 2/5] cef3_280796.bb: change indent to 4 spaces
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
X-List-Received-Date: Sat, 07 Nov 2015 12:22:59 -0000

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-browser/chromium/cef3_280796.bb | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
index b7b2de6..939602b 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -31,21 +31,21 @@ export BUILD_TARGET_ARCH="${TARGET_ARCH}"
 export GYP_DEFINES="${GYP_ARCH_DEFINES} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
 
 do_configure_append() {
-	export PATH=${WORKDIR}/depot_tools:"$PATH"
-	# End of LD Workaround
-	#-----------------------
-	# Configure cef
-	#------------------------
-	cd cef
-	./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi --depth ../
-	cd -
+    export PATH=${WORKDIR}/depot_tools:"$PATH"
+    # End of LD Workaround
+    #-----------------------
+    # Configure cef
+    #------------------------
+    cd cef
+    ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi --depth ../
+    cd -
 }
 
 # Workaround to disable qa_configure
 do_qa_configure() {
-	echo "do_qa_configure"
+    echo "do_qa_configure"
 }
 
 do_compile() {
-	ninja -C out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS} cefsimple
+    ninja -C out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS} cefsimple
 }
-- 
1.8.4.5


