Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.25333.1613351623160752789
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BhFBYQ+6;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id g20so2837332plo.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+q30pijWyMD8UXrU7SgI/NXLLSBLXGjOTKnuyhikCYM=;
        b=BhFBYQ+6ibCWc9k7zAPH/WBg3DfgNR9L/ejXrgl2gQ8VC0kp7hDLlURKzgEDNuX4n6
         QzMDRi1zdyxucZYg/MPoRk9O+K1LBE32gIzZ1w7EsD9AU1x4dFk0D/Mwa99Z3hcinLxn
         oS5vL76jbJhwyZh6qwiEENhgwNxtT3sIV4uBb4F2CjWv3hnqsbpofTNtqde8vGfhTPoG
         sX4MXGPOg+HHCjfqbVj4V7ae86w/QTyq+oXF63FuQq3NV7hstbLL9+QTACXkDOsJa0g2
         Spjb07Bj5ZbNYK1eakP0D64LL9UVgkMvYyiRay7Y0+HPomkAGQN0wX3KYopBUQxRugIz
         LXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+q30pijWyMD8UXrU7SgI/NXLLSBLXGjOTKnuyhikCYM=;
        b=lyzx0DDAWIIsrMpS//Z5t7Olzw3e7a4HzdVFIyQmiLcypWEd8uI96YJyOozb5DPfYl
         iOHaNPFUf5nq0/1YzDmqsC0AfsSwvjA/4h6RoJev2MHg74MUX1EQJ8qARz5JK8B3qCiJ
         RnOv2as2zBTJKF+NvQm1pwD+0Dsce0+XuEY8Cr6KZWzd/A+sPQBbJrwON3yNspuA13LY
         /D8uFA/J7BSx1s3FLCySKrlhfxNlwb3lp63O0gy1/IVvInBv3+zd5zfGL2krACo/+iDD
         5t+2wZxs7Z+H078Y+xnE2fiZHF+GnQcLQhVuSIzWTASkmKjkiT88QMZ1aqhIi8Z/rnPz
         0bow==
X-Gm-Message-State: AOAM5318azIFMxpVe8eWeM4XszQ7VvCpbIkedY8VLGgrpGTnxPlD6jVy
	jXcdHeAc731YGSBgeefHkQSy0HQu3+cuvg==
X-Google-Smtp-Source: ABdhPJz+7APYCoYTH3gTj43FogwqQnIYcf5J5ykef+Hteb19MQ1prOnPlSuOedmn7Qa4/WBRhNfkig==
X-Received: by 2002:a17:903:20d1:b029:e2:bc1c:2840 with SMTP id i17-20020a17090320d1b02900e2bc1c2840mr13119125plb.43.1613351622580;
        Sun, 14 Feb 2021 17:13:42 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:42 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 10/15] dnsmasq: upgrade 2.82 -> 2.84
Date: Sun, 14 Feb 2021 17:13:24 -0800
Message-Id: <5eb538cd50a365f3df0c36f6fe75787c7c1a5a2e.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Refresh the following patch:
lua.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3e28a31bb479f292b9a052a3d2eee84c49319ee3)
[ Bug fix only changes mostly CVEs
 CVE-2020-25681, CVE-2020-25682, CVE-2020-25683
 CVE-2020-25687, CVE-2020-25684, CVE-2020-25685
 CVE-2020-25686 ]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/dnsmasq/dnsmasq/lua.patch            | 9 +++++----
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb  | 8 --------
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb  | 8 ++++++++
 3 files changed, 13 insertions(+), 12 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
index 1bf0f75c12..be2bb42fc2 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/lua.patch
@@ -14,7 +14,7 @@ diff --git a/Makefile b/Makefile
 index 73ea23e..ed3eeb9 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -59,8 +59,8 @@ idn2_cflags =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(PKG_CONFI
+@@ -60,8 +60,8 @@ idn2_cflags =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(PKG_CONFI
  idn2_libs =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(PKG_CONFIG) --libs libidn2`
  ct_cflags =     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --cflags libnetfilter_conntrack`
  ct_libs =       `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --libs libnetfilter_conntrack`
@@ -22,9 +22,10 @@ index 73ea23e..ed3eeb9 100644
 -lua_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua5.2` 
 +lua_cflags =    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua`
 +lua_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua`
- nettle_cflags = `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(PKG_CONFIG) --cflags nettle hogweed`
- nettle_libs =   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(PKG_CONFIG) --libs nettle hogweed`
- gmp_libs =      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC NO_GMP --copy -lgmp`
+ nettle_cflags = `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC     $(PKG_CONFIG) --cflags 'nettle hogweed' \
+                                                         HAVE_CRYPTOHASH $(PKG_CONFIG) --cflags nettle \
+                                                         HAVE_NETTLEHASH $(PKG_CONFIG) --cflags nettle`
+
 -- 
 2.9.5
 
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb
deleted file mode 100644
index 4ca1f3cc91..0000000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.82.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI[dnsmasq-2.82.md5sum] = "3c710dee3edba510ed11a6e3d9e0d9cb"
-SRC_URI[dnsmasq-2.82.sha256sum] = "62f33bfac1a1b4a5dab8461b4664e414f7d6ced1d2cf141e9cdf9c3c2a424f65"
-SRC_URI += "\
-    file://lua.patch \
-"
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb
new file mode 100644
index 0000000000..3dd9154f3d
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.84.bb
@@ -0,0 +1,8 @@
+require dnsmasq.inc
+
+SRC_URI[dnsmasq-2.84.md5sum] = "6bf24b5bcf9293db2941fbdb545c1133"
+SRC_URI[dnsmasq-2.84.sha256sum] = "4caf385376f34fae5c55244a1f870dcf6f90e037bb7c4487210933dc497f9c36"
+SRC_URI += "\
+    file://lua.patch \
+"
+
-- 
2.17.1

