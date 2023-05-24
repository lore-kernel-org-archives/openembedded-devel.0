Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2353C7EE32
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.3705.1684914791048177504
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qj6uqDfN;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9700219be87so97230966b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914789; x=1687506789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWKH80Y5QLxh8xcBj3HiWZYJ707wpI8qGf63DjwBQ2k=;
        b=qj6uqDfNqVpwLUZHDUYsw7aHPTGtt+ORhgTghBG6JHNgmYEeGVQ13hau5DFhDaF1Kh
         KkbYejwhAT6gCQQssmfsj4d2/e44iKpDHDnutAhUMO7N5HzDtzQuUIsISXwzVjrvaNF9
         qZJLBZ2Ppj05Xb7iH+Yo3q53v8SzKjqpjjvKS4NJMYZnAkPPuSfUuiFt/gpzHNujHX9P
         6zWjORrkLPS1LJGvk5ut5J/WzZZlcj+8ulJZ2nNFkY4+f6xfzJaiKlxt4KR4TWbtY7ci
         fvv8aKjne24xZc+DE5Ydq/MMI9qt4auh7ZuuA/eDQ3Ct8/IC203aYozPofx/mJQAZgiW
         lT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914789; x=1687506789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWKH80Y5QLxh8xcBj3HiWZYJ707wpI8qGf63DjwBQ2k=;
        b=Et4NHe9eCKOYSyKEnd+etBKLQ6uZlNJjkQ7g73+3fLnpb0JRy/gTicVYFohTybZA4H
         kHCwDEkjyInZJ7Qn7mT7oYwRb0W/IPXOTH2rnYW8AntQsCEzwMfS1IG3NiABCYZshbe4
         rg4oQlHOUWOWjN78DhEBdIM6x+HXMLMLsCNc8ArDSEZ1tKJ/v4PWGHW9sZ128wkT8Ibl
         DlVI1+QLYrb2qg7XxDB4BLy0HVP2huz5wr3h75G2Rex6g9jr1to+Z4xpIobUMOFdjZQZ
         +Brld2EzCrTreUMPXOmNptUKbsogJUcfof+5y44RDp7FYs63timDzAMhkAp9nUGSxhMh
         h4+g==
X-Gm-Message-State: AC+VfDzj3QLJgG6agvsbWNTf909VBRL4YDCPIt5F9cjfqQ8ui5JX3Bqm
	9a50MNp+tVowy+9GMXIweMtWhVymHTM=
X-Google-Smtp-Source: ACHHUZ7UFTKu7CXiack0vymJu0Ka5gqYzj7iup0yeNE5HTqDEz692Bf5VXbHrrIXwF878NwRN6LXfA==
X-Received: by 2002:a17:907:78da:b0:96b:559e:7f2f with SMTP id kv26-20020a17090778da00b0096b559e7f2fmr15118773ejc.38.1684914789281;
        Wed, 24 May 2023 00:53:09 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p6-20020a17090664c600b00965e1be3002sm5348961ejn.166.2023.05.24.00.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/20] glibmm: remove unused remove-examples.patch
Date: Wed, 24 May 2023 09:52:45 +0200
Message-Id: <20230524075253.1033593-12-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102766

* it was removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=1dde9990b8ce4f9a679a666b00f932aab20c3db2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../glib-2.0/glibmm/remove-examples.patch     | 40 -------------------
 1 file changed, 40 deletions(-)
 delete mode 100644 meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch b/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
deleted file mode 100644
index 42f2520175..0000000000
--- a/meta-oe/recipes-core/glib-2.0/glibmm/remove-examples.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 52360260c0d73a00082d867bc416225fbc2b657e Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 12 Jul 2011 11:46:37 +0200
-Subject: [PATCH] glibmm: add 2.28.2
-
----
- Makefile.am  | 7 +------
- configure.ac | 1 -
- 2 files changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 1b366b4..0ff58b5 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -23,12 +23,7 @@ src_subdirs = glib/src gio/src
- else
- src_subdirs =
- endif
--if ENABLE_DOCUMENTATION
--doc_subdirs = docs
--else
--doc_subdirs =
--endif
--SUBDIRS = tools $(src_subdirs) glib/glibmm gio/giomm tests examples $(doc_subdirs)
-+SUBDIRS = tools $(src_subdirs) glib/glibmm gio/giomm tests
- 
- glibmm_includedir = $(includedir)/$(GLIBMM_MODULE_NAME)
- glibmm_include_HEADERS = glib/glibmm.h
-diff --git a/configure.ac b/configure.ac
-index e706687..198e0d0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -166,7 +166,6 @@ AC_CONFIG_FILES([Makefile
-                  gio/src/Makefile
-                  gio/giomm/Makefile
-                  tests/Makefile
--                 examples/Makefile
-                  docs/Makefile
-                  docs/reference/Doxyfile
-                  MSVC_NMake/glibmm/glibmm.rc
-- 
2.40.1


