Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.1012.1629567351065022573
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Aug 2021 10:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OT2kTE5w;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id n5so9308808pjt.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Aug 2021 10:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DcppAACARFOMnwsuFNdi/J4I/1z0LFMrKROBJQJtlUI=;
        b=OT2kTE5wocKl4vTazOwRiPkfdoSDKKjSPQL8Pbf/96PSMJBrHbrKdA14g1BNC32uHT
         xLiLSJRNfG4FlRYswSbVMPudiMvJvHt6p8ZGVwZs6PWTEIYng9vBHjDEiyWt5lICGs0E
         jykU52pi+dMS4n/07i3NcUqHvuCGNpLgB461N17K/sDDaby3uXPWAyuJWLJI+vTzuQxf
         yYl7LzCfST3oWhOcZgaflroWmRVyQEci8l60UdSCS95RQz6IvaG/ckEUoTCJToGXlCZh
         OWl0uMbgRuDqZKEnUYXHYZxhkntO77PDauJP696OCEGd83tfvdoDoWvx3HZPZT9RZe5a
         od9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DcppAACARFOMnwsuFNdi/J4I/1z0LFMrKROBJQJtlUI=;
        b=KiS/z3sOqee0ocFBZ4gw+xATJhJMpGePiUYuwSryl8Xu5m8QWaoW7aG+Bi4JEPDlZW
         xCpcbSIOgMYy7R5CS2xOo/+7Cu+aFSCKye45WUvFcMiYk7XFD9Z8QlKOO3ireJ8/E+Jr
         vcQ2KAuuNoGwusLcci01GFwnyR2XCaPOevQ1DZ/weaDSkF1GnF/o/oKbuC5LNh+hHjKv
         yUxjhUPlJNXl3WWiFebnD/VkLqgMEIPl+IA6fKMrCgAt8MqwswExpQNri9HL52XcvdA1
         /+IL5o3oGYLvvEsP5PminWl4HuVpaETqGVOVmUbi7S7EVuv+c4vAWn2F5PkuGMB4b+/9
         A3fA==
X-Gm-Message-State: AOAM531dRYxBu6X2yUiz4CUzzXRaWyj2VEZa6ZKtocu0Jnvrg/pLS5PP
	oLbhiH7xfgTTAC2fvjxAkK8k0bQBo7w=
X-Google-Smtp-Source: ABdhPJyBOFHK215aE+KQ8Bwh0N6Ixya8oBEC1TChAvIpevmxNjjKQe7XOIFdsMHE4WfOeckEB3JBBg==
X-Received: by 2002:a17:902:7681:b0:12d:8f52:3d55 with SMTP id m1-20020a170902768100b0012d8f523d55mr21160559pll.70.1629567350413;
        Sat, 21 Aug 2021 10:35:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id n18sm10993315pfu.3.2021.08.21.10.35.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 10:35:50 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 6/7] backport: xmlsec1: Fix configure QA error caused by host lookup path
Date: Sat, 21 Aug 2021 10:35:40 -0700
Message-Id: <b472160c77dcfdf46e4d4eca69428b971238f4a9.1629567241.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629567241.git.akuster808@gmail.com>
References: <cover.1629567241.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anatol Belski <anbelski@linux.microsoft.com>

The configure script contains hardcoded lookup paths to /usr and other
paths that might interfere with the host. These are overwritten with the
staging dir locations for Poky compatibility.

Backport from meta-oe master rev. 74b66d1911118bac53033f77ba6d3923f4809d5a

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
---
 .../xmlsec1/ensure-search-path-non-host.patch | 22 +++++++++++++++++++
 .../recipes-support/xmlsec1/xmlsec1_1.2.30.bb |  1 +
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
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb
index 20c7b2d371..391614b5f2 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
     file://xmlsec1-examples-allow-build-in-separate-dir.patch \
     file://0001-nss-nspr-fix-for-multilib.patch \
     file://run-ptest \
+    file://ensure-search-path-non-host.patch \
     "
 
 SRC_URI[md5sum] = "b66ec21e0a0ac331afb4b1bc5c9ef966"
-- 
2.25.1

