Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3098E76104
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Nov 2015 12:23:02 +0000 (UTC)
Received: by wmec201 with SMTP id c201so37950779wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2015 04:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Yw37Y4r+mIlmJXql3wzwwD97fEDJuqOMzidrOA2g2/k=;
	b=VfgeL5e4Yd2WYQQ9Vk6o7dBInay/ZiTL3BFwoHdx1oofnUkLXXKSiZzqD3Vl9GGBHV
	2iO4MPWoyoEd/vOfB2SLdsa3NB5uCKeXsWLpU+8W7RLk1TK87rlJRMVi+bRm4q0fx+s3
	35ka5fxFXuXAqBSekU0luOnLYJt2EE462MSv9af+xpY6e4aAywJBc4eQNwmx4bq45R47
	cUo2hRVgp4QNmtFeBSWpotGc/NxN76BeCefVgTeJP+pGWnlBq9+V99sZ/4pQwo+5utiz
	4A5ZFMywgpcjnOr2ROIamI7X/6ekZiqLE2RezszPE/fNadldPIh1+47ERJqvIfMIJ2vY
	cAVA==
X-Received: by 10.28.138.148 with SMTP id m142mr14682967wmd.79.1446898982903; 
	Sat, 07 Nov 2015 04:23:02 -0800 (PST)
Received: from Saturn.local.all (212-41-102-22.adsl.solnet.ch. [212.41.102.22])
	by smtp.gmail.com with ESMTPSA id ly4sm4899190wjb.4.2015.11.07.04.23.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Nov 2015 04:23:02 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Nov 2015 13:20:29 +0100
Message-Id: <1446898829-21243-6-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
References: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
Subject: [meta-browser][PATCH v2 5/5] cef3: fix build with gcc 4.9.4
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
X-List-Received-Date: Sat, 07 Nov 2015 12:23:03 -0000

During the final link we get errors like this:
.../4.9.4/ld: warning: hidden symbol 'sqlite3_temp_directory' in obj/.../sqlite.sqlite3.o) is referenced by DSO .../usr/lib/libsoftokn3.so
.../4.9.4/ld: error: treating warnings as errors
collect2: error: ld returned 1 exit status

Use chromium.bb solution to not treat linker warnings as errors.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>

Upstream-Status: Inappropriate configuration
Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-browser/chromium/cef3_280796.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
index df4a80f..828605b 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -34,6 +34,10 @@ export GYP_GENERATORS="ninja"
 export BUILD_TARGET_ARCH="${TARGET_ARCH}"
 export GYP_DEFINES="${GYP_ARCH_DEFINES} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
 
+EXTRA_OEGYP =	" \
+    -Ddisable_fatal_linker_warnings=1 \
+"
+
 do_configure_prepend() {
     # there is no rule for the x86-64 architecture, recycle the i586 one
     cp  cef/i586_ozone.gypi  cef/x86_64_ozone.gypi
@@ -46,7 +50,7 @@ do_configure_append() {
     # Configure cef
     #------------------------
     cd cef
-    ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi --depth ../
+    ./cef_create_projects.sh -I ${BUILD_TARGET_ARCH}_ozone.gypi --depth ../ ${EXTRA_OEGYP}
     cd -
 }
 
-- 
1.8.4.5


