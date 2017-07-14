Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id AF50578152
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:38 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id u62so9393490pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pCuvorYrSH+iU+SgCEftk8MF7dDshkppunByBb5nxrI=;
	b=kalWSY7fxzmImxnZXU2R2P9v0n/bUeiChhM/rduL9pbCLB2UANcKVf3XVp3pwYH2mE
	VJ3qzMCvwk2HSV48eilr0whNJZ+rFE4MFiyeSU1WjMZ6L0NtLLELokTM9uR7XZsVUYHy
	NSgs8tyZbFNis2uFldHGmumrUynb0tIu1HrVUt7dGpy/+X0y89ZqBavS1hlyUJa/qiUx
	rTHzs/5zZO1wwnNU1Wbwt313nfDZcelQYiJAPYWI5tR2q9WYlwD5J+80hNK3xUZ1A9+f
	fNyKEihwnvJVsxR0wTuD5ygJDjMTMWK4T+HMdohTMbZjnqaIAWp7h/zr3EeFfuPP1HMP
	DSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pCuvorYrSH+iU+SgCEftk8MF7dDshkppunByBb5nxrI=;
	b=S8UOBLpzC3Y+BRnVBNXAiyVGn4Bgj5G7bQKLYQqWvLHnjRiB0Ga6CJFqs6yMJqzp5g
	DzSYRwiyhpK0H5/4EDas9MF69OrK3idYPCe351N3cjqx12/0SXHVM9hJ797ruDJ/ncxf
	LGLDr9uB1ua+aG6UVS700D0FSEcswHCZ5F0EbPOOVSb2jdW8tTf6tKiudVwJMGOZE9Wr
	dJvGAM9xtLwrmN/QUit7lc5su9tmk/QfiEJ2T52HGCxngLg6h5VOgmd5bqmmk7W9Tb9O
	HEmC7pcKa2Y484fw1Z/tM1vLtg2xP/LD5pcGohiY6cQMXAJsrCIIk2VdSAT8OjvD5qdg
	N8Qg==
X-Gm-Message-State: AIVw110xeqKf7h0fyPg1Jjw5Y4a7PffzDxEKVTcpYa7uOEY24sBWJwRB
	0p1OoispwaWge6Bw
X-Received: by 10.84.169.67 with SMTP id g61mr13908491plb.155.1500010839540;
	Thu, 13 Jul 2017 22:40:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:06 -0700
Message-Id: <20170714054013.34458-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 11/18] onboard: Fix build with musl
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...m-Define-error-API-if-platform-does-not-h.patch | 67 ++++++++++++++++++++++
 .../recipes-support/onboard/onboard_1.4.1.bb       |  4 +-
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch

diff --git a/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch b/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
new file mode 100644
index 000000000..fda37895c
--- /dev/null
+++ b/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
@@ -0,0 +1,67 @@
+From 1c95f64aa342147387ce4b1b7269a5c8b34bd898 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 09:01:04 -0700
+Subject: [PATCH] pypredict/lm: Define error API if platform does not have it
+
+error() API is not implemented across all libcs on linux
+e.g. musl does not provide it.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Onboard/pypredict/lm/lm.cpp         |  1 -
+ Onboard/pypredict/lm/lm.h           | 13 +++++++++++++
+ Onboard/pypredict/lm/lm_dynamic.cpp |  2 --
+ 3 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/Onboard/pypredict/lm/lm.cpp b/Onboard/pypredict/lm/lm.cpp
+index 2e64296..37ae241 100644
+--- a/Onboard/pypredict/lm/lm.cpp
++++ b/Onboard/pypredict/lm/lm.cpp
+@@ -19,7 +19,6 @@
+ 
+ #include <stdlib.h>
+ #include <stdio.h>
+-#include <error.h>
+ #include <algorithm>
+ #include <cmath>
+ #include <string>
+diff --git a/Onboard/pypredict/lm/lm.h b/Onboard/pypredict/lm/lm.h
+index ed4164a..b8b63ee 100644
+--- a/Onboard/pypredict/lm/lm.h
++++ b/Onboard/pypredict/lm/lm.h
+@@ -32,6 +32,19 @@
+ #include <algorithm>
+ #include <string>
+ 
++#if defined(HAVE_ERROR_H)
++#include <error.h>
++#else
++#include <err.h>
++#define _onboard_error(S, E, F, ...) do { \
++       if (E) \
++               err(S, F ": %s", ##__VA_ARGS__, strerror(E)); \
++       else \
++               err(S, F, ##__VA_ARGS__); \
++} while(0)
++
++#define error _onboard_error
++#endif
+ 
+ // break into debugger
+ // step twice to come back out of the raise() call into known code
+diff --git a/Onboard/pypredict/lm/lm_dynamic.cpp b/Onboard/pypredict/lm/lm_dynamic.cpp
+index 7c62824..e7c7f40 100644
+--- a/Onboard/pypredict/lm/lm_dynamic.cpp
++++ b/Onboard/pypredict/lm/lm_dynamic.cpp
+@@ -17,8 +17,6 @@
+  * along with this program. If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
+-#include <error.h>
+-
+ #include "lm_dynamic.h"
+ 
+ using namespace std;
+-- 
+2.13.2
+
diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
index 3a4f18971..10765ee0c 100644
--- a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
+++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL3;md5=8521fa4dd51909b407c5150498d34f4e"
 
 DEPENDS += "gtk+3 hunspell libcanberra libxkbfile dconf python3-distutils-extra-native intltool-native"
 
-SRC_URI = "https://launchpad.net/onboard/1.4/${PV}/+download/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://launchpad.net/onboard/1.4/${PV}/+download/${BPN}-${PV}.tar.gz \
+           file://0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch \
+           "
 SRC_URI[md5sum] = "1a2fbe82e934f5b37841d17ff51e80e8"
 SRC_URI[sha256sum] = "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc1bb191e43a231a3865"
 
-- 
2.13.2


