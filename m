Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.5213.1610645798850106199
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 09:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=q+vjqFiS;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from anbelski-lsg-linux-yocto-1.irsgb21fvobu5fvmalxug44hib.xx.internal.cloudapp.net (unknown [52.247.218.173])
	by linux.microsoft.com (Postfix) with ESMTPSA id 13AEA20B6C40
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Jan 2021 09:36:38 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 13AEA20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1610645798;
	bh=dUrxCq8DPxl52ftgE9phGFnWG7fuV6P6+N/cq61CELQ=;
	h=From:To:Subject:Date:From;
	b=q+vjqFiSR24B/ExjBBfh62qfqPN1o8A3dZrrAMuAO87X8Hgup2EidAYAsLvVenW0o
	 gxfC31ev0UWeDpQmDg8DfOnLFzy1rbOARa3coVdXLZcIgLypb4M6U5NpZ61ki0EZP9
	 vnm4w+bljA0NEaOsGCXEHDPskQot95Z+V1xEKtfg=
From: "Anatol Belski" <anbelski@linux.microsoft.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] xmlsec1: Fix configure QA error caused by host lookup path
Date: Thu, 14 Jan 2021 17:36:23 +0000
Message-Id: <20210114173623.26233-1-anbelski@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

The configure script contains hardcoded lookup paths to /usr and other
paths that might interfere with the host. These are overwritten with the
staging dir locations for Poky compatibility.

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
---
 .../xmlsec1/ensure-search-path-non-host.patch | 22 +++++++++++++++++++
 .../recipes-support/xmlsec1/xmlsec1_1.2.31.bb |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
new file mode 100644
index 0000000000..a5a298af0d
--- /dev/null
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
@@ -0,0 +1,22 @@
+xmlsec1: Fix configure QA error caused by host lookup path
+
+ERROR: mc:my-sdk:xmlsec1-1.2.30-r0 do_configure: QA Issue: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
+
+It will eventually arise after the configure QA as the configure script should only look at the staging sysroot dir, not at the host.
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
+
+--- a/configure.ac.orig   2021-01-13 14:37:42.254991177 +0000
++++ b/configure.ac        2021-01-13 14:40:56.546269330 +0000
+@@ -250,8 +250,8 @@
+ dnl ==========================================================================
+ dnl Common installation locations
+ dnl ==========================================================================
+-COMMON_INCLUDE_DIR="/usr/include /usr/local/include"
+-COMMON_LIB_DIR="/usr/lib /usr/lib64 /usr/local/lib"
++COMMON_INCLUDE_DIR="${STAGING_INCDIR}"
++COMMON_LIB_DIR="${STAGING_LIBDIR}"
+ case $host in
+     i*86-*-linux-gnu)   COMMON_LIB_DIR="$COMMON_LIB_DIR /usr/lib/i386-linux-gnu" ;;
+     x86_64-*-linux-gnu) COMMON_LIB_DIR="$COMMON_LIB_DIR /usr/lib/x86_64-linux-gnu" ;;
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
index 803016c96e..3464f2f43c 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
     file://xmlsec1-examples-allow-build-in-separate-dir.patch \
     file://0001-nss-nspr-fix-for-multilib.patch \
     file://run-ptest \
+    file://ensure-search-path-non-host.patch \
     "
 
 SRC_URI[md5sum] = "182f5cbdfb8ddbac535c04470c170dc3"
-- 
2.17.1

