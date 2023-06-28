Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6183EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 20:24:29 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.861.1687983868628970611
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jun 2023 13:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZvRgmkNu;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso4895155e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 13:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687983867; x=1690575867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rwqr1b1SW0GsmZOzlN67qzZccnax2DswTWbJWFGIg9w=;
        b=ZvRgmkNuNsBKeQutu2kM40sIqUB3Fl106Gg7mMZ8yRrP/TokOVfI+3movCRusXplps
         YUJJRFuhF/9AYWEjWrCNxsqwmufA2swhXL/pM+0rayMgySsuFpbhzRUxfEOI0SXdFApc
         +JY6BhbN63r7nGIVXuJGtX4sK3HaStLoD8OEAySfuEaEPCnVnTidXHiz84hAjoc2aEVj
         at0mKtFC1yKG2lJyefDqfhmde0gDlzbxBf70mJD/2L2fZgDCN76yPdPY7Nhi2uD+Ksf8
         b61ludvFVqOM2XJrQ0qI07FjIKZ6zidd9C0K7A7hEkqsXROpWPMbBPQgyvhWZeF8zqws
         V8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687983867; x=1690575867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rwqr1b1SW0GsmZOzlN67qzZccnax2DswTWbJWFGIg9w=;
        b=gEDxvE5YYIKjvzNHVdYKaHn4D0vyy6+I3okuZcMwDe8u22XtrrCpl5JzSdsyVMHrYe
         FtJ20XQD0d7+7Y8oK5+kVpjsttBnY9RzHgB6fX4kWtZhFDFo5XXxaTAce3yiaEC7yojI
         /Y7Go8XA5ilMXf5l8gaUPmoNlLLD9ma5+DdFcbrYxspcQx+yfawCpVWqXMiuQ3XW0dt8
         sFXhjOohNZBvcfjxIP7kVfA7ZrWF8G0m8HswNUmSWz2CxM7OK756LN8lv8J4eIUN4cu/
         tesoN/aTHVX9w/Y5uDmWzZ3f658Vy9UB5uEKhoT+3O+sXAE02KqHwcK/IuABooQAzTy+
         2ZXA==
X-Gm-Message-State: AC+VfDxprZ7Mh5ff7lZeyi5QEL5+nKKi4D1751iUY041SfSG1JWd1+wM
	SjmLCbiMm20xXc94TVzJSMJNaQhouA8=
X-Google-Smtp-Source: ACHHUZ7qJT7z29z0AXKCk9fuVJKCAQcifz0aWztSTAFHK5vMYEHbM9ZH+87+6XZ7NEJSilHXgSWTTA==
X-Received: by 2002:adf:ec11:0:b0:313:fe14:1e31 with SMTP id x17-20020adfec11000000b00313fe141e31mr6786831wrn.9.1687983866818;
        Wed, 28 Jun 2023 13:24:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e15-20020adfe7cf000000b0030aed4223e0sm14105412wrn.105.2023.06.28.13.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 13:24:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] raptor2: backport a fix to build with libxml2-2.11
Date: Wed, 28 Jun 2023 22:24:06 +0200
Message-ID: <20230628202406.812262-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 20:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103637

* fixes:
  ../../raptor2-2.0.16/src/raptor_libxml.c:256:12: error: 'xmlEntity' {aka 'struct _xmlEntity'} has no member named 'checked'
  256 |     if(!ret->checked)
      |            ^~
  ../../raptor2-2.0.16/src/raptor_libxml.c:257:10: error: 'xmlEntity' {aka 'struct _xmlEntity'} has no member named 'checked'
  257 |       ret->checked = 1;
      |          ^~

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...s-to-entities-checked-private-symbol.patch | 34 +++++++++++++++++++
 .../recipes-support/raptor2/raptor2_2.0.16.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/raptor2/raptor2/0001-Remove-the-access-to-entities-checked-private-symbol.patch

diff --git a/meta-oe/recipes-support/raptor2/raptor2/0001-Remove-the-access-to-entities-checked-private-symbol.patch b/meta-oe/recipes-support/raptor2/raptor2/0001-Remove-the-access-to-entities-checked-private-symbol.patch
new file mode 100644
index 0000000000..e709616797
--- /dev/null
+++ b/meta-oe/recipes-support/raptor2/raptor2/0001-Remove-the-access-to-entities-checked-private-symbol.patch
@@ -0,0 +1,34 @@
+From da171e12d961b41b89196627ef5e5baae1e637ce Mon Sep 17 00:00:00 2001
+From: David Anes <david.anes@suse.com>
+Date: Thu, 4 May 2023 11:54:02 +0200
+Subject: [PATCH] Remove the access to entities 'checked' private symbol for
+ libxml2 2.11.0
+
+Since version 2.11.0, some private symbols that were never intended
+as public API/ABI have been removed from libxml2, therefore the field
+'checked' is no longer present and raptor fails to build in this
+scenario.
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Backport [https://github.com/dajobe/raptor/commit/ac914399b9013c54572833d4818e6ce008136dc9]
+---
+ src/raptor_libxml.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/raptor_libxml.c b/src/raptor_libxml.c
+index 538c2c8..8bcee13 100644
+--- a/src/raptor_libxml.c
++++ b/src/raptor_libxml.c
+@@ -246,10 +246,11 @@ raptor_libxml_getEntity(void* user_data, const xmlChar *name)
+     
+     ret->owner = 1;
+ 
+-#if LIBXML_VERSION >= 20627
++#if LIBXML_VERSION >= 20627 && LIBXML_VERSION < 21100
+     /* Checked field was released in 2.6.27 on 2006-10-25
+      * http://git.gnome.org/browse/libxml2/commit/?id=a37a6ad91a61d168ecc4b29263def3363fff4da6
+      *
++     * and was later removed in version 2.11.0
+      */
+ 
+     /* Mark this entity as having been checked - never do this again */
diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
index 1699112764..30df8e0648 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
@@ -11,6 +11,7 @@ DEPENDS = "libxml2 libxslt curl yajl"
 
 SRC_URI = " \
     http://download.librdf.org/source/${BPN}-${PV}.tar.gz \
+    file://0001-Remove-the-access-to-entities-checked-private-symbol.patch \
 "
 SRC_URI[sha256sum] = "089db78d7ac982354bdbf39d973baf09581e6904ac4c92a98c5caadb3de44680"
 
-- 
2.41.0


