Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 43A9577424
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 23:39:04 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id w33so220491442qtc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 15:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XqvPw8Kdd+yWdGiH0+leVR8g8ZohasytL1Rm1iM8tIs=;
	b=VmNM9oxjuUvpJ+rcGhYvSOPEDSVGETvxsZXbuR67zELPiXL8bYW9ixdgihnmpZjtoL
	1tDnogWGH1QtRbN/yLOFHlUq8upAuI8AwGBhd8tIiBqPpL61MF/tY4m2ibMHJB+2YZP7
	y3UoHwxOJGkN275/+3c7YHbQcGmqUz6tPs9YUtyBt9usEOKPsYhHkaGjdjljHdIHA+Xn
	w+8FnTjk3axVVzdL9AR+hVvqY47L2xNc0U3QqOsbSkTmFO0++8r7U2eAd4gLmo1m38mt
	Nb4JtNySdeGp1QYlXh+cfBMm2ty8PMw+fGXLgg9RhMk8ms1TR91FSU72E+SOM8NV4DKp
	O3Jw==
X-Gm-Message-State: AIkVDXJoKr0O7VJ97Ryzup0D6jk0x7W75mpT0ynV8hsnqR38bug8f/eCXiiLkaxiScn29g==
X-Received: by 10.200.50.209 with SMTP id a17mr7172461qtb.41.1482363545860;
	Wed, 21 Dec 2016 15:39:05 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	s89sm16647056qkl.27.2016.12.21.15.39.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 15:39:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Dec 2016 18:38:58 -0500
Message-Id: <1482363538-28271-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] apache2: update to version 2.4.25
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
X-List-Received-Date: Wed, 21 Dec 2016 23:39:07 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...2-native_2.4.23.bb => apache2-native_2.4.25.bb} |  4 ++--
 .../apache2/apache2/cve-2016-5387.patch            | 25 ----------------------
 .../{apache2_2.4.23.bb => apache2_2.4.25.bb}       |  5 ++---
 3 files changed, 4 insertions(+), 30 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.23.bb => apache2-native_2.4.25.bb} (91%)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/cve-2016-5387.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.23.bb => apache2_2.4.25.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
similarity index 91%
rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
index b227f19..ca8ebaf 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.25.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
 S = "${WORKDIR}/httpd-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "04f19c60e810c028f5240a062668a688"
-SRC_URI[sha256sum] = "0c1694b2aad7765896faf92843452ee2555b9591ae10d4f19b245f2adfe85e58"
+SRC_URI[md5sum] = "2826f49619112ad5813c0be5afcc7ddb"
+SRC_URI[sha256sum] = "f87ec2df1c9fee3e6bfde3c8b855a3ddb7ca1ab20ca877bd0e2b6bf3f05c80b2"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
                 --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/cve-2016-5387.patch b/meta-webserver/recipes-httpd/apache2/apache2/cve-2016-5387.patch
deleted file mode 100644
index dbcdfc6..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/cve-2016-5387.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-This patch has been copied from https://www.apache.org/security/asf-httpoxy-response.txt
-as a mitigation of CVE-2016-5387.
-
-Upstream-Status: Backport - fixed in 2.4.24
-
-Signed-off-by: Joe Slater<jslater@windriver.com>
-
-
---- a/server/util_script.c	(revision 1752426)
-+++ b/server/util_script.c	(working copy)
-@@ -186,6 +186,14 @@ AP_DECLARE(void) ap_add_common_vars(request_rec *r
-         else if (!strcasecmp(hdrs[i].key, "Content-length")) {
-             apr_table_addn(e, "CONTENT_LENGTH", hdrs[i].val);
-         }
-+        /* HTTP_PROXY collides with a popular envvar used to configure
-+         * proxies, don't let clients set/override it.  But, if you must...
-+         */
-+#ifndef SECURITY_HOLE_PASS_PROXY
-+        else if (!strcasecmp(hdrs[i].key, "Proxy")) {
-+            ;
-+        }
-+#endif
-         /*
-          * You really don't want to disable this check, since it leaves you
-          * wide open to CGIs stealing passwords and people viewing them
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
index b78ff51..3bd8579 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.25.bb
@@ -17,15 +17,14 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://httpd-2.4.3-fix-race-issue-of-dir-install.patch \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
            file://configure-allow-to-disable-selinux-support.patch \
-           file://cve-2016-5387.patch \
            file://init \
            file://apache2-volatile.conf \
            file://apache2.service \
           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "04f19c60e810c028f5240a062668a688"
-SRC_URI[sha256sum] = "0c1694b2aad7765896faf92843452ee2555b9591ae10d4f19b245f2adfe85e58"
+SRC_URI[md5sum] = "2826f49619112ad5813c0be5afcc7ddb"
+SRC_URI[sha256sum] = "f87ec2df1c9fee3e6bfde3c8b855a3ddb7ca1ab20ca877bd0e2b6bf3f05c80b2"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.7.4


