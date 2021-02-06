Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.13758.1612653433614588646
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:17:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bnAqPE1K;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id u15so5535804plf.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=K4G3tgUKGR9aiqW21t6dYCu0SXay/oalN1lnc1qJzk8=;
        b=bnAqPE1Ktor1GPyNkkBeb9chbNpBOdVEsdTXc7B0G3WlMjJB4NqfdPWalW2nnrnwRB
         M5R02O/d76LCz+etIrF5O+9mNl9gM5jRGj6aoWtq2nNRnuAK9jM4KANXKno/fED1vSe/
         KJvy/DJU9IQygv2r0OWKRef1sp1bpA8q9gpj2G+ApjqQKS/CslWkJrmmmUiAI2WpTUmf
         VKH0r/cSq2mSYUTluuqXd7zxLFJA2PNOpRVKdkqmatRYrt1+Fx1RjI7Uw5JI5RCf1Ujw
         ZgKU8QduIvPBz9X6/+uA3UUxSOXVKChUXDRszDIAmatZ9LsvZqTUoeGWU9NJj+Tg/jld
         U8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=K4G3tgUKGR9aiqW21t6dYCu0SXay/oalN1lnc1qJzk8=;
        b=NvXYecX+1iBsvBAVYy4Ai9FwEp4c8Z9oCbwC3CkrafW5I+1UhLSUBJ+LHbK99niV+/
         nR8Ow073igT41F2WUlvVW3qt8pEsW1F6ysrrEPp7T8lLamlYBntxh7u/KeZpAbzGxFwi
         AYYIPpFWawGgxfDDDOsGDR37GfOYRbHiLFzfTGlYu4fV54yoCxK0stfB2r68d313BiZd
         HeFhYpkbAMFJ7+uP+smZbCv7jW14mZETy3rC7gaWXe/ttIFB2TKQN1yLgFRoHS5fUtA7
         tvbzXRjNs8lTTHiCmoaI2xkcvq7HGkQpVp7tDzvjsENPY57j5yIuO09s+xqazdDMj+cX
         /cLA==
X-Gm-Message-State: AOAM530Ej+GBk3/u6Hp4DfppD38pW+DcSs0ZKupxKlBQjdayVdMjNSN6
	X/HvG8x/GhXl1nEtP87k0FVp1lIaXGn98A==
X-Google-Smtp-Source: ABdhPJyanu55RUhqk5EB10hlUSnS00eJaLVUQxrQuW3JlQdnFzn74kBqxna+EpAz0rCBQ2gI5TDP8g==
X-Received: by 2002:a17:90a:c006:: with SMTP id p6mr4898601pjt.18.1612653432904;
        Sat, 06 Feb 2021 15:17:12 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c5c4:f80e:4f44:b02e])
        by smtp.gmail.com with ESMTPSA id b65sm14331882pfg.3.2021.02.06.15.17.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:17:12 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgargh 03/10] xmlsec1: Fix configure QA error caused by host lookup path
Date: Sat,  6 Feb 2021 15:16:59 -0800
Message-Id: <027407dfdc5a9cdab33eb4abc5fd0da350093e84.1612652802.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612652802.git.akuster808@gmail.com>
References: <cover.1612652802.git.akuster808@gmail.com>

From: Anatol Belski <anbelski@linux.microsoft.com>

The configure script contains hardcoded lookup paths to /usr and other
paths that might interfere with the host. These are overwritten with the
staging dir locations for Poky compatibility.

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 74b66d1911118bac53033f77ba6d3923f4809d5a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 93b0d6a67f..2a74d18899 100644
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
2.17.1

