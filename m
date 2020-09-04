Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.38437.1599227250262837024
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 06:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38492 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kEC3r-0000aK-0b; Fri, 04 Sep 2020 16:47:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] gyp: Consolidate in a single file
Date: Fri,  4 Sep 2020 16:47:11 +0300
Message-Id: <20200904134713.13164-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904134713.13164-1-leon.anavi@konsulko.com>
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Consolidate inc and bb files into a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/gyp/gyp.inc    | 13 -------------
 meta-python/recipes-devtools/gyp/gyp_git.bb | 15 ++++++++++++++-
 2 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/gyp/gyp.inc

diff --git a/meta-python/recipes-devtools/gyp/gyp.inc b/meta-python/recipes-devtools/gyp/gyp.inc
deleted file mode 100644
index 98ed42cc9..000000000
--- a/meta-python/recipes-devtools/gyp/gyp.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "GYP is a Meta-Build system: a build system that generates other build systems."
-HOMEPAGE = "https://gyp.gsrc.io/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd"
-SECTION = "devel"
-
-SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https"
-SRCREV = "fcd686f1880fa52a1ee78d3e98af1b88cb334528"
-
-S = "${WORKDIR}/git"
-PV = "0.1+git${SRCPV}"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/gyp/gyp_git.bb b/meta-python/recipes-devtools/gyp/gyp_git.bb
index 8e48a27fa..61f3c8637 100644
--- a/meta-python/recipes-devtools/gyp/gyp_git.bb
+++ b/meta-python/recipes-devtools/gyp/gyp_git.bb
@@ -1,2 +1,15 @@
+DESCRIPTION = "GYP is a Meta-Build system: a build system that generates other build systems."
+HOMEPAGE = "https://gyp.gsrc.io/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ab828cb8ce4c62ee82945a11247b6bbd"
+SECTION = "devel"
+
+SRC_URI = "git://chromium.googlesource.com/external/gyp;protocol=https"
+SRCREV = "fcd686f1880fa52a1ee78d3e98af1b88cb334528"
+
+S = "${WORKDIR}/git"
+PV = "0.1+git${SRCPV}"
+
 inherit setuptools3
-require gyp.inc
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

