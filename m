Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2A6EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 19:56:39 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.158.1687982193620422651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jun 2023 12:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ABG8YCcK;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-991a8eba169so24299666b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 12:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687982192; x=1690574192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhUtctcKEMcj8OUKcLQLVaoSwMWpRVV3tQiGC+kft7E=;
        b=ABG8YCcKJPGkx7db5KuMkEtN5P1weRRyjb3v/6R2RBeohoX34oxBHjsll4ZNx9ZIJg
         Sdt+noGak4WtN2JILcJLaFvwG7AAhf4ZfehiTfhvAgvi2ht4VTP1+AkWY/q/i8hQHjTA
         a8A9pZEvyM6Ufm9NHnzqdtlu0xM6ckOWf0te64r3xf6TFon428hdOhmVfVxnWSpCUHlZ
         +9Vet+doZUB9g5qe7o36MGK6+R87PJvadM2RUc8FF3zcQvTfCBKdFub3BzA70fIA6u4j
         c0zhfVaxns1mwLieYlL8xUreOxkxABNRG0jj9ucUMVzgokEsjeHH6iNuSSBnBArJ7Ieb
         iZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687982192; x=1690574192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhUtctcKEMcj8OUKcLQLVaoSwMWpRVV3tQiGC+kft7E=;
        b=bsd15HFL41RdnsaZGUSLqch0h0Gi5fMrHV0hhSoJtC84Ql4YYFRn7rxSVHij9X11mG
         uY0FTqnJQipAm5FoY53D+Ws/RIq/OYhr5KmJReMol8gVTtuDyLjZN2zDvek0IVN0Ygb4
         NZ+qxmIQA0vLIzP9oOTGR+M4W9/xtdjv30H3ZZwldIrDgj61Jeyg5sq55kJMKTe2M1MZ
         /SN0iPOhRcRZjKusolIK+mT1tmwFmjoZQ/CT/xBgDQQU0bNxhO+cyxnGoZ3sEELkx+/S
         R6cZ0E7RfY0cBnFn+G3M59P9LJGW5CTyAwHfvGTzQH8QQ3dEKYH1VI0nvadlIAt+pXCE
         WgYQ==
X-Gm-Message-State: AC+VfDztJXbnx/xrEaZHxw4EXUYCr4VDqP7K6aLZes5swFgVzmDcmxZH
	KttZtG0j0LMsvBoPmY1SqMCrFvSyfsk=
X-Google-Smtp-Source: ACHHUZ4nfm1vvHwl0V72PyWsJwsXtHQpfw+GfkRcDpVGFFZuaBLaZp2uwhE//OQBcRe2YBK5frZkcA==
X-Received: by 2002:a17:906:c359:b0:98d:63c5:d135 with SMTP id ci25-20020a170906c35900b0098d63c5d135mr14584826ejb.54.1687982191812;
        Wed, 28 Jun 2023 12:56:31 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k25-20020a17090666d900b009821ce1ea33sm6053758ejp.7.2023.06.28.12.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 12:56:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] gupnp: backport a fix not to use deprecated xmlReadMemory
Date: Wed, 28 Jun 2023 21:56:09 +0200
Message-ID: <20230628195610.744894-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230628195610.744894-1-Martin.Jansa@gmail.com>
References: <20230628195610.744894-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 19:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103634

* deprecated since libxml2-2.11 upgraded in oe-core in:
  https://git.openembedded.org/openembedded-core/commit/?id=24860598ba8557ea3a145f249938ea411f1ef1d8

* fixes:
../gupnp-1.4.1/libgupnp/gupnp-service-info.c: In function 'got_scpd_url':
../gupnp-1.4.1/libgupnp/gupnp-service-info.c:595:17: error: 'xmlRecoverMemory' is deprecated [-Werror=deprecated-declarations]
  595 |                 scpd = xmlRecoverMemory (msg->response_body->data,
      |                 ^~~~
In file included from /OE/build/luneos-nanbield/webos-ports/tmp-glibc/work/cortexa8t2hf-neon-webos-linux-gnueabi/gupnp/1.4.1-r0/recipe-sysroot/usr/include/libxml2/libxml/globals.h:18,
                 from /OE/build/luneos-nanbield/webos-ports/tmp-glibc/work/cortexa8t2hf-neon-webos-linux-gnueabi/gupnp/1.4.1-r0/recipe-sysroot/usr/include/libxml2/libxml/threads.h:35,
                 from /OE/build/luneos-nanbield/webos-ports/tmp-glibc/work/cortexa8t2hf-neon-webos-linux-gnueabi/gupnp/1.4.1-r0/recipe-sysroot/usr/include/libxml2/libxml/xmlmemory.h:222,
                 from /OE/build/luneos-nanbield/webos-ports/tmp-glibc/work/cortexa8t2hf-neon-webos-linux-gnueabi/gupnp/1.4.1-r0/recipe-sysroot/usr/include/libxml2/libxml/tree.h:1310,
                 from ../gupnp-1.4.1/libgupnp/gupnp-service-introspection-private.h:12,
                 from ../gupnp-1.4.1/libgupnp/gupnp-service-info.c:26:
/OE/build/luneos-nanbield/webos-ports/tmp-glibc/work/cortexa8t2hf-neon-webos-linux-gnueabi/gupnp/1.4.1-r0/recipe-sysroot/usr/include/libxml2/libxml/parser.h:872:17: note: declared here
  872 |                 xmlRecoverMemory        (const char *buffer,
      |                 ^~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-all-Drop-xmlRecoverMemory.patch      | 107 ++++++++++++++++++
 .../recipes-connectivity/gupnp/gupnp_1.4.1.bb |   4 +-
 2 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-all-Drop-xmlRecoverMemory.patch

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-all-Drop-xmlRecoverMemory.patch b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-all-Drop-xmlRecoverMemory.patch
new file mode 100644
index 0000000000..a3941f345f
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-all-Drop-xmlRecoverMemory.patch
@@ -0,0 +1,107 @@
+From 46f13d9929c81ec2340a1a5d48f596b1892c5a81 Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Thu, 4 May 2023 19:14:29 +0200
+Subject: [PATCH] all: Drop xmlRecoverMemory
+
+use xmlReadMemory, also use NONET flat
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Backport [https://github.com/GNOME/gupnp/commit/80e68995b745a5900eaaa1d0c424d3a9d354e42d]
+---
+ libgupnp/gupnp-control-point.c        | 7 +++++--
+ libgupnp/gupnp-service-info.c         | 7 +++++--
+ libgupnp/gupnp-service-proxy-action.c | 7 +++++--
+ libgupnp/gupnp-service-proxy.c        | 7 +++++--
+ libgupnp/gupnp-service.c              | 7 +++++--
+ 5 files changed, 25 insertions(+), 10 deletions(-)
+
+diff --git a/libgupnp/gupnp-control-point.c b/libgupnp/gupnp-control-point.c
+index dc04732..99ebda5 100644
+--- a/libgupnp/gupnp-control-point.c
++++ b/libgupnp/gupnp-control-point.c
+@@ -608,8 +608,11 @@ got_description_url (SoupSession           *session,
+                 xmlDoc *xml_doc;
+ 
+                 /* Parse response */
+-                xml_doc = xmlRecoverMemory (msg->response_body->data,
+-                                            msg->response_body->length);
++                xml_doc = xmlReadMemory (msg->response_body->data,
++                                         msg->response_body->length,
++                                         NULL,
++                                         NULL,
++                                         XML_PARSE_NONET | XML_PARSE_RECOVER);
+                 if (xml_doc) {
+                         doc = gupnp_xml_doc_new (xml_doc);
+ 
+diff --git a/libgupnp/gupnp-service-info.c b/libgupnp/gupnp-service-info.c
+index 9a9f4de..d468801 100644
+--- a/libgupnp/gupnp-service-info.c
++++ b/libgupnp/gupnp-service-info.c
+@@ -592,8 +592,11 @@ got_scpd_url (G_GNUC_UNUSED SoupSession *session,
+         if (SOUP_STATUS_IS_SUCCESSFUL (msg->status_code)) {
+                 xmlDoc *scpd;
+ 
+-                scpd = xmlRecoverMemory (msg->response_body->data,
+-                                         msg->response_body->length);
++                scpd = xmlReadMemory (msg->response_body->data,
++                                      msg->response_body->length,
++                                      NULL,
++                                      NULL,
++                                      XML_PARSE_NONET | XML_PARSE_RECOVER);
+                 if (scpd) {
+                         introspection = gupnp_service_introspection_new (scpd);
+ 
+diff --git a/libgupnp/gupnp-service-proxy-action.c b/libgupnp/gupnp-service-proxy-action.c
+index 4d9336c..ef8a808 100644
+--- a/libgupnp/gupnp-service-proxy-action.c
++++ b/libgupnp/gupnp-service-proxy-action.c
+@@ -86,8 +86,11 @@ check_action_response (G_GNUC_UNUSED GUPnPServiceProxy *proxy,
+         }
+ 
+         /* Parse response */
+-        response = xmlRecoverMemory (action->msg->response_body->data,
+-                                     action->msg->response_body->length);
++        response = xmlReadMemory (action->msg->response_body->data,
++                                  action->msg->response_body->length,
++                                  NULL,
++                                  NULL,
++                                  XML_PARSE_NONET | XML_PARSE_RECOVER);
+ 
+         if (!response) {
+                 if (action->msg->status_code == SOUP_STATUS_OK) {
+diff --git a/libgupnp/gupnp-service-proxy.c b/libgupnp/gupnp-service-proxy.c
+index 25d5ef6..af2fd46 100644
+--- a/libgupnp/gupnp-service-proxy.c
++++ b/libgupnp/gupnp-service-proxy.c
+@@ -1560,8 +1560,11 @@ server_handler (G_GNUC_UNUSED SoupServer        *soup_server,
+         }
+ 
+         /* Parse the actual XML message content */
+-        doc = xmlRecoverMemory (msg->request_body->data,
+-                                msg->request_body->length);
++        doc = xmlReadMemory (msg->request_body->data,
++                             msg->request_body->length,
++                             NULL,
++                             NULL,
++                             XML_PARSE_NONET | XML_PARSE_RECOVER);
+         if (doc == NULL) {
+                 /* Failed */
+                 g_warning ("Failed to parse NOTIFY message body");
+diff --git a/libgupnp/gupnp-service.c b/libgupnp/gupnp-service.c
+index 67b3d43..0ebfb26 100644
+--- a/libgupnp/gupnp-service.c
++++ b/libgupnp/gupnp-service.c
+@@ -985,8 +985,11 @@ control_server_handler (SoupServer                      *server,
+                 *end = '\0';
+ 
+         /* Parse action_node */
+-        doc = xmlRecoverMemory (msg->request_body->data,
+-                                msg->request_body->length);
++        doc = xmlReadMemory (msg->request_body->data,
++                             msg->request_body->length,
++                             NULL,
++                             NULL,
++                             XML_PARSE_NONET | XML_PARSE_RECOVER);
+         if (doc == NULL) {
+                 soup_message_set_status (msg, SOUP_STATUS_BAD_REQUEST);
+ 
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
index 708e3844ff..c21e7a05bf 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
@@ -7,7 +7,9 @@ DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2"
 
 inherit meson pkgconfig vala gobject-introspection
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz \
+    file://0001-all-Drop-xmlRecoverMemory.patch \
+"
 SRC_URI[sha256sum] = "899196b5e66f03b8e25f046a7a658cd2a6851becb83f2d55345ab3281655dc0c"
 
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
-- 
2.41.0


