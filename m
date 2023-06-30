Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6595DEB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 10:36:57 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.8968.1688121415392549342
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jun 2023 03:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NRdU8SPn;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b80ddce748so9858465ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jun 2023 03:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688121414; x=1690713414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bFJVbJpfhIgH0buFtu24ydr61dfW9lS4vz/GjvFB4k=;
        b=NRdU8SPnw9LmNI6dqHNnrv5jsMkuh6D2yHPtRS60ZOmzM0ISCb+2yjRLbngUmRCZLj
         KgqtF7L0nSF55cXwJq7S96Oeh2uQgv6t6q+zStHOHSAqo8nKswgwZwFpWm1e6CsEFsLd
         CPF5e0jbXURgYVOUZ3lBLKsvtuUUEsHYW8qhaJX43A7dtD1GKl1aiXGFPu4di9uyi1GW
         TlD8u8liOEaY1z7No/qvgxdXrO5ATEiY6UxnqBKCWr1tGxeXYttAppXT1M729e4B3Ld8
         DqISC5RzV1+Nt+0SbzYzqWjwyTogF9Zj6OVu6qGDgeJ8FSUav3BUK/Pjm0tlLoc9dAZS
         Wanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688121414; x=1690713414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bFJVbJpfhIgH0buFtu24ydr61dfW9lS4vz/GjvFB4k=;
        b=WXYVb3BfrAUN7UhIBBK9fymxMU8J9tqt6BZn6XljFUlTY74Ws/a1H7DN5xAsMUkfT5
         o7rAtyKvL0hpzrwISk+y9yQdyq8ehuk4MJnXKvJpWQ0+f63AaXtd9tMCOb83OByvxZN+
         +63Yf9CU06B5kD2cBs5r1HMEyWW0osVqpG7UhaONzggS5w/FqJO8QqXBItNP3XiWsyDt
         9Q8azVLn1nefbdOVMVwqC8Oj9m6PMDQXDsr0oeA2YOSxMBPHlVbjYjcn/i7D/e9LvXJ+
         PcYENkxUVOjaSgqF3mfatgxSi8JwjTUrcfHBwrdDdmorXnn/muQmunzGdZlRpl6aIkDy
         9j/g==
X-Gm-Message-State: ABy/qLavL1s9LEiTlkXEclNk0kFwULLro0a4URu9BY85xL7sse9ktzNo
	K3XrhbNQXgkVlQB6I5n0y/x0vPKmJft58w==
X-Google-Smtp-Source: APBJJlFmCfsCqS8w6eHfPm0aQt9sj5Y+z0XxV9icwZBa0Oc3tTKFIliD/qd66R4vGL2fIPLnw7YbsQ==
X-Received: by 2002:a17:903:2307:b0:1b6:8a99:4979 with SMTP id d7-20020a170903230700b001b68a994979mr1751580plh.22.1688121414317;
        Fri, 30 Jun 2023 03:36:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::8b4b])
        by smtp.gmail.com with ESMTPSA id g11-20020a170902868b00b001b80d399730sm7611774plo.242.2023.06.30.03.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 03:36:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [gupnp-av][PATCH] gupnp-av: Fix build with libxml2-2.11 and newer
Date: Fri, 30 Jun 2023 03:36:51 -0700
Message-ID: <20230630103651.2751590-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jun 2023 10:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103644

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-all-Drop-xmlRecoverMemory.patch      | 44 +++++++++++++++++++
 .../gupnp/gupnp-av_0.14.0.bb                  |  4 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-av/0001-all-Drop-xmlRecoverMemory.patch

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av/0001-all-Drop-xmlRecoverMemory.patch b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av/0001-all-Drop-xmlRecoverMemory.patch
new file mode 100644
index 0000000000..92b52ad98a
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av/0001-all-Drop-xmlRecoverMemory.patch
@@ -0,0 +1,44 @@
+From d99f71a4a52da7582d5e26992a1ab303b280d28a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Jun 2023 03:23:12 -0700
+Subject: [PATCH] Drop xmlRecoverMemory
+
+newer libxml has deprecated xmlRecoverMemory therefore replace it with xmlReadMemory
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gupnp/-/commit/80e68995b745a5900eaaa1d0c424d3a9d354e42d]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gupnp-didl-lite-parser.c    | 2 +-
+ gupnp-feature-list-parser.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gupnp-didl-lite-parser.c b/gupnp-didl-lite-parser.c
+index 3a5727f..840d718 100644
+--- a/libgupnp-av/gupnp-didl-lite-parser.c
++++ b/libgupnp-av/gupnp-didl-lite-parser.c
+@@ -230,7 +230,7 @@ gupnp_didl_lite_parser_parse_didl_recursive (GUPnPDIDLLiteParser *parser,
+         GUPnPAVXMLDoc *xml_doc = NULL;
+         gboolean       result;
+ 
+-        doc = xmlRecoverMemory (didl, strlen (didl));
++        doc = xmlReadMemory (didl, strlen (didl), NULL, NULL, XML_PARSE_NONET | XML_PARSE_RECOVER);
+         if (doc == NULL) {
+                 g_set_error (error,
+                              G_MARKUP_ERROR,
+diff --git a/gupnp-feature-list-parser.c b/gupnp-feature-list-parser.c
+index 16208b5..f804fe7 100644
+--- a/libgupnp-av/gupnp-feature-list-parser.c
++++ b/libgupnp-av/gupnp-feature-list-parser.c
+@@ -114,7 +114,7 @@ gupnp_feature_list_parser_parse_text
+         xmlNode      *element;
+         GList        *feature_list = NULL;
+ 
+-        doc = xmlRecoverMemory (text, strlen (text));
++        doc = xmlReadMemory (text, strlen (text), NULL, NULL, XML_PARSE_NONET | XML_PARSE_RECOVER);
+         if (doc == NULL) {
+                 g_set_error (error,
+                              G_MARKUP_ERROR,
+-- 
+2.41.0
+
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.0.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.0.bb
index b253c54d92..48de5868de 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.0.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.0.bb
@@ -8,5 +8,7 @@ DEPENDS = "gupnp"
 
 inherit meson pkgconfig gobject-introspection vala
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/0.14/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/0.14/${BPN}-${PV}.tar.xz \
+           file://0001-all-Drop-xmlRecoverMemory.patch \
+          "
 SRC_URI[sha256sum] = "20aed546fc882e78a3f186a0c8bce5c841cc3a44b7ea528298fbdc82596fb156"
-- 
2.41.0


