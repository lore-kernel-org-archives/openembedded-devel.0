Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OddyK-0001OP-79
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 08:49:25 +0200
Received: by iwn34 with SMTP id 34so3565381iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 23:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=XCkcZFEXWy0ZtRpSGg276YxlUvsedxUcO77Szudh7kQ=;
	b=ZiIVNR7n7Q52YhEQ/okq4Dp9yURRf7NBdokkxaP9ZqVbb9zO/tMuGgicjoZmdeeQLF
	PM8vns7K3xG03VQFla+ma6dRKhj6yhuJf7Xur4gT+QGmw0Ey01BU5U/tE+c38CxTwxjB
	zzvgY9ZZR+qCl5mGeCL8MqSPHPq/2EikUKjew=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Abt/hLLZKZNewyDHAUMQN+51xuV3JlJz+DFj3BIYOt4UiZHtUUJhcLy9k+7SElQ80p
	M8ZQMZeQ7MtGxBi+7o2vlsvc4qAi/qbcI586qwwkR3pqva/Y437Z9TTeOtpaqtP/JIxj
	xq4ruRp+2jUByALi5UUjiBnpI4r3OB67wuwiw=
Received: by 10.231.172.205 with SMTP id m13mr10075524ibz.35.1280213328819;
	Mon, 26 Jul 2010 23:48:48 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n20sm4506941ibe.5.2010.07.26.23.48.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Jul 2010 23:48:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jul 2010 23:48:30 -0700
Message-Id: <1280213315-5513-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
References: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/8] gcc-cross: Use EXTRA_OECONF_PATHS in initial and intermediate recipes.
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
X-List-Received-Date: Tue, 27 Jul 2010 06:49:26 -0000

* Add new configure time option --with-build-time-tools

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-configure-cross.inc    |    5 +++--
 recipes/gcc/gcc-cross-initial.inc      |    3 +--
 recipes/gcc/gcc-cross-intermediate.inc |    3 +--
 3 files changed, 5 insertions(+), 6 deletions(-)

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
diff --git a/recipes/gcc/gcc-cross-initial.inc b/recipes/gcc/gcc-cross-initial.inc
index 25d7ba5..b153322 100644
--- a/recipes/gcc/gcc-cross-initial.inc
+++ b/recipes/gcc/gcc-cross-initial.inc
@@ -13,8 +13,7 @@ EXTRA_OECONF = "--with-local-prefix=${STAGING_DIR_TARGET}${target_prefix} \
 		--disable-__cxa_atexit \
 		--enable-languages=c \
 		--program-prefix=${TARGET_PREFIX} \
-		--with-sysroot=${STAGING_DIR_TARGET} \
-		--with-build-sysroot=${STAGING_DIR_TARGET} \
+		${EXTRA_OECONF_PATHS} \
 		${EXTRA_OECONF_INITIAL} \
 		${OPTSPACE} \
 		${@get_gcc_fpu_setting(bb, d)} \
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



