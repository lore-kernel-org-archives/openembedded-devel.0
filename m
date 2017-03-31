Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id CE03877E41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:31 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 79so18586584pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=koDygER7f7e+RLQiihvo53lm3jFuDXRsUJmDp3KQoD4=;
	b=Y7mSltfRrglKYOeMSFVDpGZW0VN9oZ0ypeolznd0H4sBV+KGQb7d5D+ZhZm2CpEqko
	oqJq8SE6TkWbedurqar79yoUk3gkD7xIXt+DTV4ZIRedKx1Ts6gUYQI9S4vYTmgVZy8X
	qiqGTkz5u5XLlSzIgrroXsqxBznRYZkpHttf1GfR1z2SRlfbIBZX+hVl/g/M3H+3NpMx
	AmQNo6NSEfiah/jNrfG7o6oIvkU8JG5L2pNMP0CSPhuqpyP+AWK1Poa883z8Mr+m5qhB
	1dDFkl1DHA2F89OVN6za8mGTniK/AIEha0hbyUcWcDu9Ux5SL1jzjiQ1Yg1G3WHjyxMo
	u9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=koDygER7f7e+RLQiihvo53lm3jFuDXRsUJmDp3KQoD4=;
	b=TQd8dhwZChv1FAQgV4y4t5Y6swCpi8cZm5uSOFmfJOTnwOY/BXp86uPxn+cWtFmCxz
	WkkVf7TtjWDHIKSycW3mI/6MOAM6Mph+/49jI42jSPHa1Pi+tLIWlXXB9NpYvVf3GS+M
	1CmwNgRfym8rjVNJUwzf2FJBx7LtPmdJZVaQM5ooyDw3xkyznySM0+/xM57qyfb3g6CD
	B9EXru4u4SINopgigCRNEJrsKLxC5TRJjP4a+nUM7MyvJK1fPKUpbTV/tSWtAXOeXxvI
	aJKge5NZP7995840b/TYckf0kQddAEmFcyMqH+qLUDmaCznWoJmwUbd4O/SjnazmJ8mh
	Wn5g==
X-Gm-Message-State: AFeK/H0rxsYtzl5fbCrKnP5wygFGrcgtX0e5NppItZrWtMkyGVW2aLt6DzXqgObB6+ZR9w==
X-Received: by 10.98.211.81 with SMTP id q78mr3652527pfg.97.1490978613460;
	Fri, 31 Mar 2017 09:43:33 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:30 -0700
Message-Id: <20170331164247.5052-26-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 26/43] faac: Fix with with security flags and on musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/faac/faac_1.28.bb           |  6 ++++-
 ...frontend-Fix-format-string-security-error.patch | 26 ++++++++++++++++++++
 ...Define-__STRING-if-cdefs.h-does-not-exist.patch | 28 ++++++++++++++++++++++
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/faac/files/0001-frontend-Fix-format-string-security-error.patch
 create mode 100644 meta-multimedia/recipes-multimedia/faac/files/0002-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch

diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
index 2f048af0e..5c9477f18 100644
--- a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
+++ b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
@@ -9,11 +9,15 @@ inherit autotools-brokensep
 SRC_URI = "${SOURCEFORGE_MIRROR}/faac/${BP}.tar.gz \
            file://build-fix.patch \
            file://address-gcc-6-narrowing-errors.patch \
-"
+           file://0001-frontend-Fix-format-string-security-error.patch \
+           file://0002-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch \
+           "
 
 SRC_URI[md5sum] = "80763728d392c7d789cde25614c878f6"
 SRC_URI[sha256sum] = "c5141199f4cfb17d749c36ba8cfe4b25f838da67c22f0fec40228b6b9c3d19df"
 
+EXTRA_OECONF += "--without-mp4v2"
+
 PACKAGES =+ "lib${BPN} lib${BPN}-dev"
 
 FILES_${PN} = " ${bindir}/faac "
diff --git a/meta-multimedia/recipes-multimedia/faac/files/0001-frontend-Fix-format-string-security-error.patch b/meta-multimedia/recipes-multimedia/faac/files/0001-frontend-Fix-format-string-security-error.patch
new file mode 100644
index 000000000..75e003eac
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/faac/files/0001-frontend-Fix-format-string-security-error.patch
@@ -0,0 +1,26 @@
+From c1d7a8b992dc36d0012cc3d54b7d3abf4ad4d5d8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Mar 2017 21:33:01 -0700
+Subject: [PATCH 1/2] frontend: Fix format string security error
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ frontend/main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/frontend/main.c b/frontend/main.c
+index 02146a8..cb9329c 100644
+--- a/frontend/main.c
++++ b/frontend/main.c
+@@ -715,7 +715,7 @@ int main(int argc, char *argv[])
+         break;
+ #endif
+         case 'L':
+-        fprintf(stderr, faac_copyright_string);
++        fprintf(stderr, "%s", faac_copyright_string);
+         dieMessage = license;
+         break;
+     case 'X':
+-- 
+2.12.1
+
diff --git a/meta-multimedia/recipes-multimedia/faac/files/0002-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch b/meta-multimedia/recipes-multimedia/faac/files/0002-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
new file mode 100644
index 000000000..d845ddf59
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/faac/files/0002-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
@@ -0,0 +1,28 @@
+From 46cc9298c38b9dd735fec3f39aa2d6e56a362410 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Mar 2017 21:33:36 -0700
+Subject: [PATCH 2/2] mp4v2: Define __STRING if cdefs.h does not exist
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ common/mp4v2/mp4util.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/common/mp4v2/mp4util.h b/common/mp4v2/mp4util.h
+index 1f9cb64..1e7aced 100644
+--- a/common/mp4v2/mp4util.h
++++ b/common/mp4v2/mp4util.h
+@@ -23,6 +23,10 @@
+ #define __MP4_UTIL_INCLUDED__
+ #include <assert.h>
+ 
++#ifndef __STRING
++#define __STRING(x)     #x
++#endif
++
+ #ifndef ASSERT
+ #define ASSERT(expr) \
+ 	if (!(expr)) { \
+-- 
+2.12.1
+
-- 
2.12.1


