Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 17A9A65CBC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 20:07:02 +0000 (UTC)
Received: by wmec201 with SMTP id c201so99405223wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Nov 2015 12:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2O0EJBTPcZol6W3h8N79p52iGs4cnw6ILGrrDQbVz70=;
	b=SgvgcRCBmshQ6zM3yYbAf2kp0ZpGuXezZVB/UpSxqxD7APi3+lU/Qk7IlvRCdRYYMq
	JrQjW+PbiYyBCbh1Z94F8MRdofLwJmZb1J0g+pOeaCfS8HDjQspU6Xys7hVg9G70e9h9
	jOkROdU4BDOlWTEWkp9jlBj8rJsIE1I/nZURnSGiDvQ5TsS0aY9GAjwwY/9CV8IcBNqR
	K46/xBMsU5R2ncMJVjTCJu7n2Rw3u2RV8NzPksSTa6k7l4rqi5nE9q5Sa5LmjSccFkHa
	KLclWCjnHrI4RRWYxtnq+LpSXCoSkjPqs6juG16WTzlyy+7vKYsqR2nJiJ5AEWpqRQmc
	X3iw==
X-Received: by 10.28.129.131 with SMTP id c125mr23723096wmd.21.1447099620608; 
	Mon, 09 Nov 2015 12:07:00 -0800 (PST)
Received: from Saturn.local.all (212-41-93-146.adsl.solnet.ch. [212.41.93.146])
	by smtp.gmail.com with ESMTPSA id
	z10sm11132324wmg.4.2015.11.09.12.06.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Nov 2015 12:06:59 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Nov 2015 21:04:59 +0100
Message-Id: <1447099499-4029-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [meta-browser][PATCH] cef3: rework "fix build with gcc 4.9.4"
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
X-List-Received-Date: Mon, 09 Nov 2015 20:07:03 -0000

The link errors addressed with commit 
'7887e66d5df998b91d4df24a150c32a692784451 fix build with gcc 4.9.4'
occur only when linking with gold.
Thus apply the fix only if distro features contain ld-is-gold.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>

Upstream-Status: Inappropriate configuration
---
 recipes-browser/chromium/cef3_280796.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Hi

This addresses the review comment by Khem
http://lists.openembedded.org/pipermail/openembedded-devel/2015-November/104408.html

Max
diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
index 079e820..d827b8e 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -35,7 +35,7 @@ export BUILD_TARGET_ARCH="${TARGET_ARCH}"
 export GYP_DEFINES="${GYP_ARCH_DEFINES} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
 
 EXTRA_OEGYP =	" \
-    -Ddisable_fatal_linker_warnings=1 \
+    ${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '-Ddisable_fatal_linker_warnings=1', '', d)} \
 "
 
 do_configure_prepend() {
-- 
1.8.4.5


