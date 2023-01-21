Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699B5C38A23
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:47 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.2062.1674324091113259352
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mL8AY3Rs;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id y3-20020a17090a390300b00229add7bb36so7761083pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIwWbM/CP0OSkVNOhpWQ1JEetUePZCIWGGu6en4swK8=;
        b=mL8AY3Rsxo9azlcRPAg/bs9eI/FLNm+BjbpwXLYzTQSvRLnuZu3DaQCOqUuzqeU6OG
         lOHUDFpsOMcOaWs1+QudAxm1NvasE3L25T5ZB3mb/vXg0Oy7T0oV0yQcPeiCk6XJB4QR
         gN4s8HeiP+UaDQTd/O4AYOn9r/5OpS9M6UmUeRJhhBMHdH9inO/T+u5LSOqoszMfzHjb
         KHMsWZI0wELIs/Xp5p2YVLGTSOW/8S/zNNpHlAUHeyIohpxm7GGd9RN5UV1Rvvr+io/B
         h4fe4qwe2aJ/Fb+llXCz0Ynams7g7UHYgpb9OUYBHz0dVkjNRBxAr6W+YTZxPTZk+ejK
         bP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIwWbM/CP0OSkVNOhpWQ1JEetUePZCIWGGu6en4swK8=;
        b=P13CvJl/40nrx/A4+BTOBzqJCsnls6XzLqqunlCf3N071TRjUxFLS4gn6dnxxrNfYm
         QXc1kXZcd64hKIDpftgWJWBvPE24Lwj6lZB+bOdtFiE5/wlTWtWPJRdWTQ5EDlXTVvQW
         DD/AYzgim4jVlSUZuPkPdAZo5bkzgdQtvYmhy3ta9z8h4rFai8uSBGB1rfXbgowHwuih
         rAZiIMCLKwhIWehvEJhVmntiM3B315Ggyy93Z9GjISMElSlrXGJ7nHgkjkOOPey6tXkC
         /fKP9AIOiC9QUMLNTo46EQY0AZLulL1B1jiH3ALnnzECbsKuTXHah2tMtkwhTjjn2I7z
         aJRQ==
X-Gm-Message-State: AFqh2koKHItLxHTBaob6VIsAG6dl+7VkFyxniszzaZcoW69qc2qIz/EJ
	PXFWq/j1XYcp/We7RogtNqFO+OeEHtgXSw==
X-Google-Smtp-Source: AMrXdXtSLcRGMx/QMq6idjsZvArvTKLixjQ4kgoUz68LVMMrDnlgaPmWGjqroiNI5yW49m9iwP3CgQ==
X-Received: by 2002:a17:90b:3c0c:b0:226:eac4:b22e with SMTP id pb12-20020a17090b3c0c00b00226eac4b22emr20664851pjb.8.1674324099334;
        Sat, 21 Jan 2023 10:01:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 19/30] xmlstarlet: Fix build with clang16
Date: Sat, 21 Jan 2023 10:01:10 -0800
Message-Id: <20230121180121.1229895-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100686

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-hash_key_put-signature.patch     | 33 +++++++++++++++++++
 .../xmlstarlet/xmlstarlet_1.6.1.bb            |  4 +--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/xmlstarlet/files/0001-Fix-hash_key_put-signature.patch

diff --git a/meta-oe/recipes-support/xmlstarlet/files/0001-Fix-hash_key_put-signature.patch b/meta-oe/recipes-support/xmlstarlet/files/0001-Fix-hash_key_put-signature.patch
new file mode 100644
index 0000000000..2a766dbb87
--- /dev/null
+++ b/meta-oe/recipes-support/xmlstarlet/files/0001-Fix-hash_key_put-signature.patch
@@ -0,0 +1,33 @@
+From 64cb138aaaafc87c8462885d502c9323be86a003 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Jan 2023 14:50:08 -0800
+Subject: [PATCH] Fix hash_key_put() signature
+
+Fixes
+
+../xmlstarlet-1.6.1/src/xml_elem.c:271:27: error: incompatible function pointer types passing 'void (void *, void *, xmlChar *)' (aka 'void (void *, void *, unsigned char *)') to parameter of type 'xmlHashScanner' (aka 'void (*)(void *, void *, const unsigned char *)') [-Wincompatible-function-pointer-types]
+        xmlHashScan(uniq, hash_key_put, &lines);
+                          ^~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://sourceforge.net/p/xmlstar/code/merge-requests/6/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/xml_elem.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/xml_elem.c b/src/xml_elem.c
+index 024e62a..a73038a 100644
+--- a/src/xml_elem.c
++++ b/src/xml_elem.c
+@@ -186,7 +186,7 @@ typedef struct {
+  * put @name into @data->array[@data->offset]
+  */
+ static void
+-hash_key_put(void *payload, void *data, xmlChar *name)
++hash_key_put(void *payload, void *data, const xmlChar *name)
+ {
+     ArrayDest *dest = data;
+     dest->array[dest->offset++] = name;
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
index e28fd61a03..930fbdd6c7 100644
--- a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
+++ b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
@@ -14,8 +14,8 @@ DEPENDS = "libxml2 libxslt"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/xmlstar/${BP}.tar.gz \
            file://configure.ac.patch \
-           file://0001-usage2c.awk-fix-wrong-basename-regexp.patch"
-SRC_URI[md5sum] = "f3c5dfa3b1a2ee06cd57c255cc8b70a0"
+           file://0001-usage2c.awk-fix-wrong-basename-regexp.patch \
+           file://0001-Fix-hash_key_put-signature.patch"
 SRC_URI[sha256sum] = "15d838c4f3375332fd95554619179b69e4ec91418a3a5296e7c631b7ed19e7ca"
 
 inherit autotools
-- 
2.39.1


