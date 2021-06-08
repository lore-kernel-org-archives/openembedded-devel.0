Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.1144.1623168887640060110
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 09:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XPqkROBB;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id b15-20020a17090a550fb029015dad75163dso2624293pji.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 09:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BtqViM4WhIMPfawbizwq7ncU+DdqU5bOuYO2aahfgoc=;
        b=XPqkROBB3Zb1wFn2rMYZ/xRhN+OAQ/LP2ydBXGp8nYz4RuffMPkbUs9i5GeoC76jSB
         VdvVlRPK34ALQssyRnr9P8ty56DgOEWBXxsBFaWOThU1HH7TtoDcBFRZhRyaH0zi8s02
         Sn7KBkbW0C0LxI5y3Yxm3NPWNb6CzqkP/dtnTKc9KvyZA72EzfGlTiBVIHt/qjrvSu7d
         RZXhlxlZMTZES9Iu4WAbQET3gAnp6YcZPzmvPvXO7AlTitB8QGFxAAXbJ7KwoM9BtQIT
         0HsjflGvGsgMponmBEAlEZq3xyZFa76XdKeXxMSbtHVORPfTCYf2Ff5pldXSoZR0ugUw
         ao+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BtqViM4WhIMPfawbizwq7ncU+DdqU5bOuYO2aahfgoc=;
        b=h3ZHZDwkU8zGC/g7jA0nNlMnPrcc01Ejr0rMY3Sv8Ae4hEwCrPr9AdX3icslSczq+e
         5yCIvPPNve5MOWQL0OZVmYF3c/I9TCRqhaebOr2O9s5BgB2PBUmbpG2RDEJkC1/ZZxYg
         IUvS5okeKBIj4lxh/83eFu9Z/EFgepDPi4bfIfYqXamRknXULpRLI/VwHlJyUqwuNRVQ
         XNWCwZ5y+s1bxZB4IbxCSqtfLwe87jb924oh5Ct4l8vlBbLJoFZooxqEP38KXZIhQ/2b
         2RIKHINsSZApDBqzU5Dz9Ukp9atemrzzuvW57qdAtTcBF6C3zYqRHKzd+x8WNSD/Vcyk
         rIRA==
X-Gm-Message-State: AOAM532Il/phZSn1tCoWO9P7us8apJsgHXUyTR9EAOCXRDJt//1JBaYF
	QQ+fMfAKw8lgBHfNCU1WeYMf68oWyqrcsQ==
X-Google-Smtp-Source: ABdhPJyRESU97suSflj/HIvAeKphWE+zH358/Zs0icgzWuu9R1VNvwRYGCDubY1dhMa8sFPYK0Tzeg==
X-Received: by 2002:a17:902:ee4c:b029:10e:f98c:2b83 with SMTP id 12-20020a170902ee4cb029010ef98c2b83mr386574plo.62.1623168886765;
        Tue, 08 Jun 2021 09:14:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id j5sm9646662pgl.70.2021.06.08.09.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 09:14:46 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Zang Ruochen <zangrc.fnst@fujitsu.com>
Subject: [meta-networking][PATCH] netplan: Fix a warning with clang
Date: Tue,  8 Jun 2021 09:14:44 -0700
Message-Id: <20210608161444.1212225-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh musl patch to avoid fuzz

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../0001-Handle-enum-element-override.patch   | 34 +++++++++++++++++++
 ...-t-fail-if-GLOB_BRACE-is-not-defined.patch |  9 ++---
 .../netplan/netplan_0.102.bb                  |  1 +
 3 files changed, 37 insertions(+), 7 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-Handle-enum-element-override.patch

diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-Handle-enum-element-override.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-Handle-enum-element-override.patch
new file mode 100644
index 0000000000..dfc6f90c4c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-Handle-enum-element-override.patch
@@ -0,0 +1,34 @@
+From 6d284f1ff81494a5fca91a399b92b218ea1a9ea8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Jun 2021 08:53:30 -0700
+Subject: [PATCH] Handle enum element override
+
+NETPLAN_DEF_TYPE_VIRTUAL and NETPLAN_DEF_TYPE_BRIDGE point
+to same value in enum, however here they are assigned individually
+which results in overriding the initialization of the objects
+
+Fixes
+src/netplan.h:85:33: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
+    [NETPLAN_DEF_TYPE_BRIDGE] = "bridges",
+                                ^~~~~~~~~
+Upstream-Status: Submitted [https://github.com/canonical/netplan/pull/213]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/netplan.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/netplan.h b/src/netplan.h
+index d2c538b..26574f8 100644
+--- a/src/netplan.h
++++ b/src/netplan.h
+@@ -81,7 +81,6 @@ static const char* const netplan_def_type_to_str[NETPLAN_DEF_TYPE_MAX_] = {
+     [NETPLAN_DEF_TYPE_ETHERNET] = "ethernets",
+     [NETPLAN_DEF_TYPE_WIFI] = "wifis",
+     [NETPLAN_DEF_TYPE_MODEM] = "modems",
+-    [NETPLAN_DEF_TYPE_VIRTUAL] = NULL,
+     [NETPLAN_DEF_TYPE_BRIDGE] = "bridges",
+     [NETPLAN_DEF_TYPE_BOND] = "bonds",
+     [NETPLAN_DEF_TYPE_VLAN] = "vlans",
+-- 
+2.32.0
+
diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
index dab8693c71..0fa6ba48a4 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
+++ b/meta-networking/recipes-connectivity/netplan/netplan/0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch
@@ -8,13 +8,11 @@ Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
  src/util.c | 6 ++++++
  1 file changed, 6 insertions(+)
 
-diff --git a/src/util.c b/src/util.c
-index 7e59985..eb8e573 100644
 --- a/src/util.c
 +++ b/src/util.c
-@@ -23,6 +23,12 @@
- 
+@@ -24,6 +24,12 @@
  #include "util.h"
+ #include "netplan.h"
  
 +/* Don't fail if the standard library
 + * doesn't provide brace expansion */
@@ -25,6 +23,3 @@ index 7e59985..eb8e573 100644
  GHashTable* wifi_frequency_24;
  GHashTable* wifi_frequency_5;
  
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.102.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.102.bb
index 81b58ab904..3328dfbbb9 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.102.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.102.bb
@@ -16,6 +16,7 @@ PV = "0.102+git${SRCPV}"
 
 SRC_URI = " \
         git://github.com/CanonicalLtd/netplan.git \
+        file://0001-Handle-enum-element-override.patch \
 "
 SRC_URI_append_libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
 
-- 
2.32.0

