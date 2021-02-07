Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.24620.1612725015260087489
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YWt/0R5H;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id q72so7015506pjq.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 11:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=K4G3tgUKGR9aiqW21t6dYCu0SXay/oalN1lnc1qJzk8=;
        b=YWt/0R5Hjg8/lAct58Bc9+7dLE3SVzPuYQ5ACkuxY3gfPPU7jBl034HhM26ACrwZ8j
         06mTJNavfa1+M11cZ6ScC19fBT7uRl6vXzuquSC1Hik8WoAcvdSRbUojOZbON5nKcGCj
         JCuBZOrW6md6P3VrHJ6HROnntsZOriItWSvee8Er4VkXoiBItw55jRM8fsk/XMvB5m0K
         B2yRCYRDFmZrAiORXUWRNWttahnb7OCxuhbBR23c2efAN+QnZTqytFpVnKcFjXprvS1X
         s5PMc6oqJdGOgJAqWCB1haB65ODebvJmxZoGrYZ0UopDMBkXBKhaFHjM2GtwWF6wUE7N
         whKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=K4G3tgUKGR9aiqW21t6dYCu0SXay/oalN1lnc1qJzk8=;
        b=kd01DyjQ1LyWwlNwKpKmm0BtZpVtJN7jidjlp31RK5bPATcye738OunXJioeYjPmyX
         OxT7lU+vS9jyvweseVvebxCNmQKtuBhzBixYASY+EmtibyhBVzt742c0i8iL8429Fbtm
         C4rAOo4s2UV3jC0pRyME3XgiEIrfWnxjrIYYha9eb6qEhLB84FXkra0GeATXSymy2MKs
         PJTyCQe9cvq8p/fN8h7WMXv1FzfWuq7h5QlvDSC3h3kEDzL9k6Pt8lMYRizUxB7Ht2K1
         U6THz6+4n4kzQ88g9nF1yPYIPegm4r/AUBAHbl35f9FVjvGtii9FX2vMt6d5xMm9GRH7
         1ODA==
X-Gm-Message-State: AOAM532uwEip2gT7QLjzMW2qV/dPxXrc7mnfc0JxWHpLL/9fVW7H746T
	zSLNBHP+aI6MfR72zduH+WXhy+zsHor61g==
X-Google-Smtp-Source: ABdhPJwhbk6J/IBlBllciu+t3y6xCL4LVzG4HCHDOldYIS19d4j+z/XIojjJmFAdlTtzpkOPIZ12ow==
X-Received: by 2002:a17:90a:ee8a:: with SMTP id i10mr13513756pjz.210.1612725014678;
        Sun, 07 Feb 2021 11:10:14 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:1d07:684d:b210:7d14])
        by smtp.gmail.com with ESMTPSA id 123sm16371911pfd.91.2021.02.07.11.10.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 11:10:14 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 03/10] xmlsec1: Fix configure QA error caused by host lookup path
Date: Sun,  7 Feb 2021 11:10:01 -0800
Message-Id: <027407dfdc5a9cdab33eb4abc5fd0da350093e84.1612724878.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612724878.git.akuster808@gmail.com>
References: <cover.1612724878.git.akuster808@gmail.com>

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

