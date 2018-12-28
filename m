Return-Path: <athoik@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0C17F6B12B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 19:42:09 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id y56so18225617edd.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Dec 2018 11:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3CXRZeSy227gvzvsNAH1h8kIAdf6wiA/2F3B60FoYfc=;
	b=GkipO89eWpKWdw6l2Z2xXLcnMVtvQt0Dn48LCkshlahcjZ0IFcLK3COl/30fZAu2vX
	HX+yMXQV6/Ciya+Oh4ZxVSpPJndF57+vKFK+49hfV7o1A5SVZA4Hty90h39jZaA4a/Wp
	DrEiSBlnwKX4fjQS4MZxgUg+L/PSs81vdM3DM/15lgLQTJ2UnETE/Fl7a1ooC8DuRC7c
	xQWfKi9yzPyAEbha1akZxgUVNVEmBbcDw6trXEq3ZvC0IMy31DG+MthKGXKAo4E0nxn8
	jHW+YPVfjP1LUp5Whr6kw5jzyqC8k+gB2IahAWpG5wW6cv0SJHl8UbarBwoyXxxusOa7
	lRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3CXRZeSy227gvzvsNAH1h8kIAdf6wiA/2F3B60FoYfc=;
	b=XnJjhtK88d3pitHYislX/4gMLfL39naQvCcbHe1udKlrf0CUUUCZ9d3hNfodpTf+in
	1HpIJsLXAmxCXlZf9QYVGaNQm5cdiRI3b6XK+HE47QvbUqoGy0Qozl3yESc+UkEH8zDo
	SzNGh5tGhTdAGE13F14PAk4/8R6usd5e0Ju1f3pTQcoaa00aDRrwnX6H1CRcUXm1kos6
	g+dr2EGaswQN8J3Qbxjc403ybHRYFzBDng11pJo0WMALUecdPOcN4m86mh3duBs0D/vb
	1u6QfY7C+SBWiGagtCUE7pjE2mLe9JA5o72PEBUjNgLIdTge88LSQ3hVVzYk6Ufhq1mE
	GNiA==
X-Gm-Message-State: AA+aEWaxFJ3gpgd4Y82FODybYIQBTQ5kC9lvsEjw4KvtuTDeqMjTSOib
	0alKwtSkczlPsqLsBLGUeT46XUShj9s7
X-Google-Smtp-Source: AFSGD/XgOKuzz4c4GvbJ8KUz92v1ggwbLbtVZMFESAvtH2ykeOEI3NonbitJwpNI5em11sY6PQHxYg==
X-Received: by 2002:a50:c408:: with SMTP id v8mr23316613edf.144.1546026130316; 
	Fri, 28 Dec 2018 11:42:10 -0800 (PST)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	g21sm13614077edc.63.2018.12.28.11.42.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Dec 2018 11:42:09 -0800 (PST)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Dec 2018 21:37:42 +0200
Message-Id: <1546025862-17332-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-multimedia][PATCH v2] faac: update 1.29 -> 1.29.9.2
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
X-List-Received-Date: Fri, 28 Dec 2018 19:42:10 -0000

Remove not required patch and extra EXTRA_OECONF "--without-mp4v2".
Previously not required mp4v2 library was dropped on 1.29.9.2.

While being there also fix issue with multilib build on aarch64
using FILES_lib${BPN} instead of FILES_lib${PN}.

WARNING: lib32-faac-1.29.9.2-r0 do_package: QA Issue: lib32-faac: Files/directories were installed but not shipped in any package:
  /usr/lib/libfaac.so.0
  /usr/lib/libfaac.so.0.0.0
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-faac: 2 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 .../faac/{faac_1.29.bb => faac_1.29.9.2.bb}        | 11 ++++-----
 ...Define-__STRING-if-cdefs.h-does-not-exist.patch | 28 ----------------------
 2 files changed, 4 insertions(+), 35 deletions(-)
 rename meta-multimedia/recipes-multimedia/faac/{faac_1.29.bb => faac_1.29.9.2.bb} (65%)
 delete mode 100644 meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch

diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
similarity index 65%
rename from meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
rename to meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
index d36f2f4..278bda9 100644
--- a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
+++ b/meta-multimedia/recipes-multimedia/faac/faac_1.29.9.2.bb
@@ -11,19 +11,16 @@ inherit autotools
 
 SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/faac/${BP}.tar.gz \
-    file://0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch \
 "
 
-SRC_URI[md5sum] = "78603720f655180059d6970c582a3005"
-SRC_URI[sha256sum] = "8cc7b03ceb2722223a6457e95d4c994731d80214a03ba33d1af76ba53f4b3197"
-
-EXTRA_OECONF += "--without-mp4v2"
+SRC_URI[md5sum] = "2b58d621fad8fda879f07b7cad8bfe10"
+SRC_URI[sha256sum] = "d45f209d837c49dae6deebcdd87b8cc3b04ea290880358faecf5e7737740c771"
 
 PACKAGES =+ "lib${BPN} lib${BPN}-dev"
 
 FILES_${PN} = " ${bindir}/faac "
-FILES_lib${PN} = " ${libdir}/*.so.*"
-FILES_lib${PN}-dev = " \
+FILES_lib${BPN} = " ${libdir}/*.so.*"
+FILES_lib${BPN}-dev = " \
     ${includedir} \
     ${libdir}/*.so \
     ${libdir}/*.la \
diff --git a/meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch b/meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
deleted file mode 100644
index d845ddf..0000000
--- a/meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 46cc9298c38b9dd735fec3f39aa2d6e56a362410 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Mar 2017 21:33:36 -0700
-Subject: [PATCH 2/2] mp4v2: Define __STRING if cdefs.h does not exist
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- common/mp4v2/mp4util.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/common/mp4v2/mp4util.h b/common/mp4v2/mp4util.h
-index 1f9cb64..1e7aced 100644
---- a/common/mp4v2/mp4util.h
-+++ b/common/mp4v2/mp4util.h
-@@ -23,6 +23,10 @@
- #define __MP4_UTIL_INCLUDED__
- #include <assert.h>
- 
-+#ifndef __STRING
-+#define __STRING(x)     #x
-+#endif
-+
- #ifndef ASSERT
- #define ASSERT(expr) \
- 	if (!(expr)) { \
--- 
-2.12.1
-
-- 
2.1.4


