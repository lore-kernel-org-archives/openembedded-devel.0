Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.604.1597269849163327761
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 15:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nmNNxYtJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id t10so1705475plz.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 15:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=asZQ9tjOR68Ln1O73KGkEcPBhCaCNumVlIIF2mwZjrY=;
        b=nmNNxYtJASgwgvRYlhqWsn39d/hgqCtydifLdq198v6dlik4q6HlRhiPYSXhfS6rWn
         tHcpThckN98niXtjMndnBWNLcfSh8pNFdDWSxPJ14In28TF1vH+cL9Z1VpaHjO+urKNn
         4NB9g+kMModU0lT0B+eBY4JpemIGyo4giui1iXdc3F5xh6YK8eEVFyS6Va1T4+qplvKY
         TqEVHvDedqdcZfE5kK1HxS+2Z1j6M2Y6mI/W+rfYKf4bqppWt3JGmi67R9SNCw8mPeVk
         VL4A5DHv8M5P1FIiTWQZfnlZrm2qUxhnEcrvTdTqKKQRtT9ofwIszcMOyP/1b9vHGhYn
         V17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=asZQ9tjOR68Ln1O73KGkEcPBhCaCNumVlIIF2mwZjrY=;
        b=XRyutnKlX2ZOhnrKjT3SY0mUZ0gJxiKmtOzcaAc1KuLeWC60Bzs7Tt0pZjoVAFJYvk
         9zVpNlv6KjflfRg/UO4Zo7RWzHNm8fCYqn++zZI6fet9gtGcFRwOqMk5IQdzYiMQn+S9
         ml/8PD/n4pcrxeaDkHCxeA4Y6Jl0ukJjc3END8vi36acCw4FV5CnJlPKUV/QW4YjgZO9
         L7NK/igo67amMInyc8Ki+ggoBwRYCLYXTuyvKgG9p/2v99iVNPjYf4N14JrthMQ82QP0
         phVEkjMD2KB7P0KdMMHHbN7X08KHpXzPzckizkvHNfXrQ31FC7BOSNg5ATZm8Q8jnATo
         9NnQ==
X-Gm-Message-State: AOAM5318YiIkwmB2Lz01797AFU2YJbBdvYyXM1W70SS1Wcu6yR4Y6+UM
	VClqgofhDwYrWHp21lM6bIZf1ismrAE=
X-Google-Smtp-Source: ABdhPJy6JDnBAAU7TNYBnbUK7GWj55EnOoc5z0zq8Kqzpgx11tU2DgOBQ1Q0H36CaWiAJC4ZxspXKA==
X-Received: by 2002:a17:90a:3ad1:: with SMTP id b75mr1938835pjc.25.1597269848296;
        Wed, 12 Aug 2020 15:04:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id x136sm3390745pfc.28.2020.08.12.15.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:04:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 3/3] imsettings: Upgrade to 1.8.2
Date: Wed, 12 Aug 2020 15:03:58 -0700
Message-Id: <20200812220358.1690080-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812220358.1690080-1-raj.khem@gmail.com>
References: <20200812220358.1690080-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a patch to fix build with -fno-common

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../imsettings/imsettings-gcc10.patch         | 31 +++++++++++++++++++
 ...msettings_1.8.1.bb => imsettings_1.8.2.bb} |  7 +++--
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta-xfce/recipes-extended/imsettings/imsettings/imsettings-gcc10.patch
 rename meta-xfce/recipes-extended/imsettings/{imsettings_1.8.1.bb => imsettings_1.8.2.bb} (85%)

diff --git a/meta-xfce/recipes-extended/imsettings/imsettings/imsettings-gcc10.patch b/meta-xfce/recipes-extended/imsettings/imsettings/imsettings-gcc10.patch
new file mode 100644
index 0000000000..53280581b0
--- /dev/null
+++ b/meta-xfce/recipes-extended/imsettings/imsettings/imsettings-gcc10.patch
@@ -0,0 +1,31 @@
+Fix build with -fno-common
+
+Imported from https://src.fedoraproject.org/rpms/imsettings/raw/master/f/imsettings-gcc10.patch
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+diff -pruN imsettings-1.8.2.orig/imsettings-daemon/imsettings-proc.c imsettings-1.8.2/imsettings-daemon/imsettings-proc.c
+--- imsettings-1.8.2.orig/imsettings-daemon/imsettings-proc.c	2019-01-18 20:52:58.000000000 +0900
++++ imsettings-1.8.2/imsettings-daemon/imsettings-proc.c	2020-01-29 13:33:07.051676780 +0900
+@@ -84,7 +84,7 @@ static gboolean _stop_process
+ 
+ G_DEFINE_TYPE_WITH_PRIVATE (IMSettingsProc, imsettings_proc, G_TYPE_OBJECT);
+ 
+-guint signals[LAST_SIGNAL] = { 0 };
++static guint signals[LAST_SIGNAL] = { 0 };
+ 
+ /*< private >*/
+ static gboolean
+diff -pruN imsettings-1.8.2.orig/imsettings-daemon/imsettings-server.c imsettings-1.8.2/imsettings-daemon/imsettings-server.c
+--- imsettings-1.8.2.orig/imsettings-daemon/imsettings-server.c	2019-11-14 14:08:03.000000000 +0900
++++ imsettings-1.8.2/imsettings-daemon/imsettings-server.c	2020-01-29 13:32:50.827832726 +0900
+@@ -91,7 +91,7 @@ GDBusInterfaceVTable __iface_vtable = {
+ 	NULL,
+ 	NULL,
+ };
+-guint signals[LAST_SIGNAL];
++static guint signals[LAST_SIGNAL];
+ 
+ G_DEFINE_TYPE_WITH_PRIVATE (IMSettingsServer, imsettings_server, G_TYPE_OBJECT);
+ G_LOCK_DEFINE_STATIC (logger);
diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.2.bb
similarity index 85%
rename from meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb
rename to meta-xfce/recipes-extended/imsettings/imsettings_1.8.2.bb
index c8f495edb7..bb7ff42355 100644
--- a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb
+++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.2.bb
@@ -16,9 +16,10 @@ DEPENDS = "gtk+3 libnotify"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "c04341a008d8c60e1532f033f4020f44"
-SRC_URI[sha256sum] = "ebf578299a10c6a1fea9047be6577df6d2b6470d3cc9d40f8a6589a3c13c4c8b"
+SRC_URI = "https://bitbucket.org/tagoh/imsettings/downloads/${BPN}-${PV}.tar.bz2 \
+           file://imsettings-gcc10.patch \
+          "
+SRC_URI[sha256sum] = "412abf3165dbee3cbe03db0c296bab103569a49029429d038569c586ebe9efa9"
 
 EXTRA_OECONF = "--with-xinputsh=50-xinput.sh \
                 --disable-static \
-- 
2.28.0

