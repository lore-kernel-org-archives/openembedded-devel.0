Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id C6B6477E62
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:37 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id g2so75165625pge.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gJu5sKoTy1nuaTGfUbQra6HMevmQRJ+pBq4LiFDZ6js=;
	b=jESSDuIEKxrRQZx7ILDGh143mTsFd/MmT5oQgMcOis2zPGSr6gxxxAWMDWBsGxBEQt
	p2plEMs9Qa86kaPRipO6/pSoq2ZQdzDFTZYWkRlEFiyvhW6cSLfbwX9efHy10h4Ayt84
	AlCu9+Qhm/3twdevAuV5Qvn4jwRyeVBWep9yC+PKt4AiEB2HxPL4rfEFRMIF8+/jIaec
	TAJaiv7c4tW3DZ6bdcRtorSyosk0H4N5DDA+GkISWqEoN0aD8oDEhOVlzoivDf2qYFOF
	jhZAop/wdDSWwo46fqLvVtUZaa5Dvrs06fYUyhTxtRudLhtU0DkNtzJe2o55Off8Z6Nh
	xHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gJu5sKoTy1nuaTGfUbQra6HMevmQRJ+pBq4LiFDZ6js=;
	b=nNPs+113XIUp+friZOzry2W1iZLPPAB+3kXaimRbDlUq+kHhO05rWrMl8WtMM75uPl
	Cd8rAvAAXwdO3j2hguOqFr0nnXx96YQi3hfD9tieWvCpwwI5xYwg0lFAFP7/F/73mKKH
	QLXMdfZdaCo85r5kdh+hqktYGAnjDasPI0nGSB4h2w/kWa1hSjNke0paYOYiL2Wd2moz
	Cw9U3HDblDN7yAQ4/JoGi4VRGfNMrJBAcQOALBh9YL1y9IzZUSV96EXsfUqL9EMZ6+LW
	uVRdRw0O4pgX8JWnYtLIbtRAUV2G8i188KM+ABeI/436FJ3gppuGzC0CYhvJTuo9kO9B
	IVjA==
X-Gm-Message-State: AFeK/H3oeGJNf7vHuYYlvQyz8ReJ5E9sglDN+2o5iCaCv8D3kZXMLlpUjWbojDlVsAZJOQ==
X-Received: by 10.98.20.203 with SMTP id 194mr3681578pfu.70.1490978617987;
	Fri, 31 Mar 2017 09:43:37 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:33 -0700
Message-Id: <20170331164247.5052-29-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 29/43] libqb: Upgrade to 1.0.1 release
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:38 -0000

Add a patch needed for cross compiling

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Remove-runtime-check-for-CLOCK_MONOTONIC.patch | 43 ++++++++++++++++++++++
 .../libqb/{libqb_0.17.2.bb => libqb_1.0.1.bb}      | 14 +++----
 2 files changed, 49 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch
 rename meta-oe/recipes-extended/libqb/{libqb_0.17.2.bb => libqb_1.0.1.bb} (67%)

diff --git a/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch b/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch
new file mode 100644
index 000000000..28bc5c07d
--- /dev/null
+++ b/meta-oe/recipes-extended/libqb/libqb/0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch
@@ -0,0 +1,43 @@
+From e6fbad0c122ba8e87b67a9e2447505adcaafe204 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 29 Mar 2017 16:31:38 -0700
+Subject: [PATCH] Remove runtime check for CLOCK_MONOTONIC
+
+Does not work during cross compile
+
+use a compile-time check to detect whether the
+monotonic clock is available. This check can run just fine when we are
+cross-compiling.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fa13ae6..f4f0f46 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -175,9 +175,17 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
+                  )
+ 
+ AC_MSG_CHECKING(for a working clock_getres(CLOCK_MONOTONIC, &ts))
+-AC_RUN_IFELSE([AC_LANG_PROGRAM(
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
+ [[#include <time.h>]],
+-[[struct timespec ts; if(clock_getres(CLOCK_MONOTONIC, &ts)) return -1;]])],
++[[
++#include <unistd.h>
++int main() {
++#if !(defined(_POSIX_MONOTONIC_CLOCK) && _POSIX_MONOTONIC_CLOCK >= 0 && defined(CLOCK_MONOTONIC))
++        #error No monotonic clock
++#endif
++    return 0;
++
++]])],
+                     [
+                       AC_MSG_RESULT([yes])
+                       AC_DEFINE_UNQUOTED([HAVE_CLOCK_GETRES_MONOTONIC], 1, [Define to 1 if clock_getres(CLOCK_MONOTONIC, &ts) works])
+-- 
+2.12.1
+
diff --git a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb b/meta-oe/recipes-extended/libqb/libqb_1.0.1.bb
similarity index 67%
rename from meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
rename to meta-oe/recipes-extended/libqb/libqb_1.0.1.bb
index 94030b2ea..e26bb7c19 100644
--- a/meta-oe/recipes-extended/libqb/libqb_0.17.2.bb
+++ b/meta-oe/recipes-extended/libqb/libqb_1.0.1.bb
@@ -4,22 +4,20 @@ It provides high performance logging, tracing, ipc, and poll."
 
 HOMEPAGE = "https://github.com/clusterlabs/libqb/wiki"
 SECTION = "libs"
-
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 
-inherit autotools-brokensep pkgconfig
-
-PV = "0.17.2+git${SRCPV}"
+inherit autotools pkgconfig
 
-SRCREV = "bd2c587f6ccacd8a5644b275d99324d200c2b378"
-SRC_URI = "git://github.com/ClusterLabs/${BPN}.git"
+PV .= "+git${SRCPV}"
 
+SRCREV = "0a329683a76bc6aeb36f20f2bf6b43ba0440c4dc"
+SRC_URI = "git://github.com/ClusterLabs/${BPN}.git \
+           file://0001-Remove-runtime-check-for-CLOCK_MONOTONIC.patch \
+          "
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
     ( cd ${S}
     ${S}/autogen.sh )
 }
-
-
-- 
2.12.1


