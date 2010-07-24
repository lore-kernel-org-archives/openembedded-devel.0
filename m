Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ocb6e-0005wC-MG
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 11:33:24 +0200
Received: by pvg13 with SMTP id 13so4289085pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 02:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=bdsEzj5RFyOO/2qrgpNPZ6MMAjxEpcqD33vxbGramYY=;
	b=eOIYOFsoQ1UziwY38MePiCDrdXMOkcccBn+4b27tzwqd7wl1uZd3yZaC/LCqJPOd9l
	6NMJ2Xel7NN+9ZnIiMHHPjYp76JC6UP151+a1dcYZmq4h5gBoTYsZNWKXCTgguPyccJM
	rfGqIbB87WXBJ9a4O1Z2eAOEoAZASyjKVQNi0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=o3PYzOXciypKYe8piEhhz1NXI0PQoChxULGqmGTk2b0fJRPDfBCEaKQ4QZ/KfHqNVA
	t4UFB+yZmsa+srIux0GfdgIYEwStK/Q+UjPtRYjvUsoLY1u0I8f3vGDGGy1TyU5cvl0R
	H5NNq2HNF13XrC7tenQdHIXiqOX6fiWxZALpQ=
Received: by 10.114.78.3 with SMTP id a3mr7242766wab.12.1279963985922;
	Sat, 24 Jul 2010 02:33:05 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d39sm2139120wam.4.2010.07.24.02.33.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 24 Jul 2010 02:33:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Jul 2010 02:32:55 -0700
Message-Id: <1279963975-3736-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>
References: <1279963975-3736-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] gcc-cross: Use EXTRA_OECONF_PATHS in initial and intermediate recipes.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 24 Jul 2010 09:33:24 -0000

* Add new configure time option --with-build-time-tools

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-configure-cross.inc    |    5 +++--
 recipes/gcc/gcc-cross-intermediate.inc |    3 +--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/gcc/gcc-configure-cross.inc b/recipes/gcc/gcc-configure-cross.inc
index 8b97b09..869ac5e 100644
--- a/recipes/gcc/gcc-configure-cross.inc
+++ b/recipes/gcc/gcc-configure-cross.inc
@@ -3,9 +3,10 @@ require gcc-configure-common.inc
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
 
 EXTRA_OECONF_PATHS = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
-		      --with-gxx-include-dir=${STAGING_DIR_TARGET}/${target_includedir}/c++ \
+		      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \
                       --with-sysroot=${STAGING_DIR_TARGET} \
-                      --with-build-sysroot=${STAGING_DIR_TARGET}"
+                      --with-build-sysroot=${STAGING_DIR_TARGET} \
+		      --with-build-time-tools=${bindir}"
 
 do_configure_prepend () {
 	export CC="${BUILD_CC}"
diff --git a/recipes/gcc/gcc-cross-intermediate.inc b/recipes/gcc/gcc-cross-intermediate.inc
index cbc8638..6dbdb94 100644
--- a/recipes/gcc/gcc-cross-intermediate.inc
+++ b/recipes/gcc/gcc-cross-intermediate.inc
@@ -11,8 +11,7 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--disable-threads \
 		--enable-languages=c \
 		--program-prefix=${TARGET_PREFIX} \
-		--with-sysroot=${STAGING_DIR_TARGET} \
-		--with-build-sysroot=${STAGING_DIR_TARGET} \
+		${EXTRA_OECONF_PATHS} \
 		${OPTSPACE} \
 		${EXTRA_OECONF_INTERMEDIATE} \
 		${@get_gcc_fpu_setting(bb, d)} \
-- 
1.7.1



