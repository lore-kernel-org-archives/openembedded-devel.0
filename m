Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 57E4E60767
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 15:51:19 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id a186so3340005qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 08:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0OWBEP/dnLCt1tOdwZJStrZKVdFxhf3z9PQtfftbq4c=;
	b=aY+GC4ZXEYv0JaXEL6PuFJvbQhBcbapV33keRk9H6oHa5HK1tHebJKJ0qjoj9NsaQn
	R3MyNuX8ONUu8yt7Ur7r8vuP8YLUxCUqfRtaru0DOB2rbcNsNo0PZIKiqA+hJONRu0Wr
	TEjnRu/+Uxks1G831tsBZQrZinfQy3MrLM9Y4tsBDtug7NUUpqmxkFSIyg86Pqcsim8E
	T0IpA4QbK6EkEPp77HhM4LSNWSzODGiScflyGwSGu5u41QVlQ0GKuuRSCIO6YE1e939w
	DsDKjHjL+WKFz0559BV0fu6HO7bLPuwc6NHuUugGZVIp5gFYfhzP2Fgwky0iO+FbmLjB
	NtpQ==
X-Gm-Message-State: ALyK8tI413Q2IS5M7SvQPfIY7d8arJ52jTFxsRhZUdTtSHy7MJRHACR1YFr/Rk1cydYhuQ==
X-Received: by 10.200.39.142 with SMTP id w14mr26255138qtw.59.1466005879382;
	Wed, 15 Jun 2016 08:51:19 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id z9sm4187931qge.40.2016.06.15.08.51.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jun 2016 08:51:18 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2016 11:51:11 -0400
Message-Id: <1466005871-18413-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] iperf: resolve issues with gcc6
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
X-List-Received-Date: Wed, 15 Jun 2016 15:51:20 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch        | 16 ++++++++++++++++
 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb           |  4 +---
 2 files changed, 17 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch

diff --git a/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
new file mode 100644
index 0000000..348e316
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
@@ -0,0 +1,16 @@
+--- iperf-2.0.5/m4/dast.m4.orig	2016-06-15 11:42:03.945581785 -0400
++++ iperf-2.0.5/m4/dast.m4	2016-06-15 11:42:11.053581641 -0400
+@@ -11,7 +11,12 @@
+ 
+ AC_DEFUN(DAST_CHECK_BOOL, [
+ 
+-AC_CHECK_SIZEOF(bool)
++if test "$ac_cv_header_stdbool_h" = yes; then
++  AC_CHECK_SIZEOF(bool,,[#include <stdbool.h>])
++else
++    AC_CHECK_SIZEOF(bool)
++fi
++
+ if test "$ac_cv_sizeof_bool" = 0 ; then
+   AC_DEFINE(bool, int)
+ fi
diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
index b9709f1..a9e0d87 100644
--- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
+++ b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
 SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/${BP}.tar.gz \
             file://iperf-2.0.5_ManPage.patch \
             file://0001-fix-out-of-tree-config.patch \
+            file://0002-fix-bool-size-m4.patch \
           "
 
 SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
@@ -17,6 +18,3 @@ S = "${WORKDIR}/${BP}"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
-
-# http://errors.yoctoproject.org/Errors/Details/68671/
-PNBLACKLIST[iperf] ?= "BROKEN: fails to build with gcc-6"
-- 
1.9.1


