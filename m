Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35931E82CCF
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 20:08:48 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.27427.1695845319080448189
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 13:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MdSnjxHT;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99c136ee106so1502539166b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 13:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695845317; x=1696450117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOKW/1Y2I/8SO0IYCkTj1yFdAXon4FLi485saAuso3U=;
        b=MdSnjxHTCWfUU0Orf+PxdLGaOPJrdSgeFN3QgtVG7TP+R3OS8k59C0pHJtgGOQWtUQ
         H8T6unQX+Qh6IYjidBfSU46SwSAK3+jS6FtQrm/XUbEugu3LJ4xp06fv7SXBZjUnSrsa
         8qYjoFqOxO200mxMXfRsWVUhd/U2bClb2ervSJ2iLMgJ0avD7kbUG9hmRdmFmj+psPed
         yOgx7IFIc2E223PBhVroNWkYfLpjC2ncrdM5tryFPg7yrUVRcUV8mS0dsJHSXNgZO206
         QN088CKzlo/fnN2qk6oQVopoxYI6U9NLgPJC+ISqXHlDeFmqLaIi1tI+iIFtxZGK9znH
         NKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695845317; x=1696450117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOKW/1Y2I/8SO0IYCkTj1yFdAXon4FLi485saAuso3U=;
        b=HAMrdSBIEvlCHS39OzAYceh+1OkudOXWWx+azUyGsAkjtASwiiqbt9AiXGm/4QFb/T
         dIl3T/MvN4Ad1l500h6Nft2jLqOnAEmff8yYZwRffWhiFEJm1lLRES6wXsgcqI5Isrp7
         Vs5Eju6r3V9iOsxtt1g+Sw89EkFnRgmyzmQ/qjTZiD0narqE+PyN1DyRQWXo4nNWixZ9
         ezVHzHudrTKodc5IrBR710sUTEUkTUqmOEI7Od+ZP/Z9sP66+aAqOpJSNDLJdFULl2tw
         fs/z0eZZs+PaSgvEUZuRd0BGG7CjZAp4hkK2JABKM1p1AL4P8Oca8rAM5tk7TbYbZJBa
         kLww==
X-Gm-Message-State: AOJu0YzTcHIZ+dZmuaFsNeazdNjtkBv6XZZIxFkufOJeMcwvXamAnvGi
	qdydKxNBjjexg/LHomnGcqgCTqBJCPk=
X-Google-Smtp-Source: AGHT+IHLnLhW2CwxBLN7+P71PyCAbpWMUTorvaYQoZspp+pxgN2+nl9ng5lBW089uNwCHQ6TrIUBIQ==
X-Received: by 2002:a17:906:51d3:b0:9ae:5120:5141 with SMTP id v19-20020a17090651d300b009ae51205141mr2878533ejk.37.1695845317489;
        Wed, 27 Sep 2023 13:08:37 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z19-20020a1709063ad300b009a1a653770bsm9837866ejd.87.2023.09.27.13.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 13:08:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] mozjs: use PV in MULTILIB_SCRIPTS
Date: Wed, 27 Sep 2023 22:08:29 +0200
Message-ID: <20230927200830.2296905-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230927200830.2296905-1-martin.jansa@gmail.com>
References: <20230927200830.2296905-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 20:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105202

* to avoid possible issue next time new mozjs version recipe is
  introduced (as multilib isn't as well tested as other build configs)

* this depends on oe-core change to expand script name in MULTILIB_SCRIPTS:
  https://lists.openembedded.org/g/openembedded-core/message/188301

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: just rebase on top of master-next

 meta-oe/recipes-extended/mozjs/mozjs-102_102.15.1.bb | 7 ++++---
 meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb  | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.1.bb b/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.1.bb
index 38e4128d6a..3a7b51c145 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.1.bb
@@ -66,12 +66,13 @@ do_install() {
 
 inherit multilib_script multilib_header
 
-MULTILIB_SCRIPTS += " ${PN}-dev:${bindir}/js102-config"
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 1)}"
+MULTILIB_SCRIPTS += "${PN}-dev:${bindir}/js${MAJ_VER}-config"
 
 do_install:append() {
-    oe_multilib_header mozjs-102/js-config.h
+    oe_multilib_header mozjs-${MAJ_VER}/js-config.h
     sed -e 's@${STAGING_DIR_HOST}@@g' \
-        -i ${D}${bindir}/js102-config
+        -i ${D}${bindir}/js${MAJ_VER}-config
     rm -f ${D}${libdir}/libjs_static.ajs
     # remove the build path
     sed -i -e 's@${WORKDIR}@@g' `find ${B} -name Unified_c*.c*`
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
index b029c5f4ec..fcdf64c932 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
@@ -66,12 +66,13 @@ do_install() {
 
 inherit multilib_script multilib_header
 
-MULTILIB_SCRIPTS += " ${PN}-dev:${bindir}/js115-config"
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 1)}"
+MULTILIB_SCRIPTS += "${PN}-dev:${bindir}/js${MAJ_VER}-config"
 
 do_install:append() {
-    oe_multilib_header mozjs-115/js-config.h
+    oe_multilib_header mozjs-${MAJ_VER}/js-config.h
     sed -e 's@${STAGING_DIR_HOST}@@g' \
-        -i ${D}${bindir}/js115-config
+        -i ${D}${bindir}/js${MAJ_VER}-config
     rm -f ${D}${libdir}/libjs_static.ajs
 }
 

