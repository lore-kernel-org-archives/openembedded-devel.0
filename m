Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C467EC7EE3A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.3577.1684914785785538264
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=CQ22K9fP;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-96fab30d1e1so159504066b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914784; x=1687506784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3yDw7qtj5ZvSM7E7QtvxrjNxv3/DTIuK244ZBWQe+g=;
        b=CQ22K9fPSpERBjKLFzQvdoB9YfV8650ipZEswBZoRFAtr3rLK6XHExsHVik6ZR4iu/
         TDvhmnbZ+5WxALhOQ5UsjhuegfTYOZNQpHFiVF3OMXNeB2z19R7+azk+p0VmmAFRhE/9
         5JWl4udL2hx+pbxmwmkJEoRUfKWD/CGS524owFc+RKYhe9GINZSqsFC+gZYV32ox+SeB
         178cSB5AW5OCefEZp8AejcUF1PrZ6EzH451yEGt/0aixrGoYFlTJPjjEHsVaA8OtCDHi
         PYeJWkwoTCFCJDnXRZfuppYNsX6HBnNE9KTALFOIesnkLm227s7tHAYNUhdMPBgqXXS1
         c9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914784; x=1687506784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3yDw7qtj5ZvSM7E7QtvxrjNxv3/DTIuK244ZBWQe+g=;
        b=jsjATZjTON8yQbqP/P6UqDagW/3rAO71zUge/jVJiWRHn7R2KNzZOuIZOT3Y4vxAK4
         X43gQUfLphNlGaL6bWU7iRNgJbqIO6HXyxsYCZxMNCBAhO6JHyE7j80tlfs3v2QuVkna
         zqbzHQJEoXNLOOm6Gq2iHjh8em+AIUoOX5cCgCVBOnaS3wLZD4kaej9RwfENVRQoS+00
         SP+ghZJPf14XnTq9nYqOVqWsnMpt4VDf2xVGP5BBrNQuFRDLf7nrIQinoReSCast/onJ
         lzDYdfJgswYMHf89CdQaYhW36F2kL5r/hOe91sfgjYTyFZ0weuiw7YpLDuVag/XDnH8f
         AMMQ==
X-Gm-Message-State: AC+VfDxH/nElbXO3F2bYSsNo3bKcwV+cE39x8zId1bVtTirMb0k71XEZ
	x/SRf5cUxxiZsjtDmnqfmkCRXTMTrJk=
X-Google-Smtp-Source: ACHHUZ4oyei7s6mYxLSFFTT4FryiSn9oM5XSVebjYf2/+IcRV48onU3hWcAPzh9o4gcWRS98CUTzTQ==
X-Received: by 2002:a17:907:a40f:b0:973:8edc:5a57 with SMTP id sg15-20020a170907a40f00b009738edc5a57mr526012ejc.4.1684914784242;
        Wed, 24 May 2023 00:53:04 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id rv25-20020a17090710d900b00965f6ad266bsm5408355ejb.119.2023.05.24.00.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/20] monkey: remove unused patch file
Date: Wed, 24 May 2023 09:52:38 +0200
Message-Id: <20230524075253.1033593-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102759

* it was removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=45b327ba1620febf3dd8a8b415d601c9c9e78bc5
---
 ...igure-Respect-LIBS-variable-from-env.patch | 30 -------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch

diff --git a/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch b/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch
deleted file mode 100644
index 3eb3067394..0000000000
--- a/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b0526a9b5325bd4758dad8d14efd85c98ef2ebff Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 14 Jul 2017 18:25:23 -0700
-Subject: [PATCH] configure: Respect LIBS variable from env
-
-For musl we need to pass -lexecinfo from env
-this change accomodates that
-
-Upstream-Status: Inappropriate [OE-specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 4286c34..f1c65db 100755
---- a/configure
-+++ b/configure
-@@ -620,7 +620,7 @@ LIBDEFS = -DSHAREDLIB -fPIC \$(DEFS)
- INCDIR  = ./include
- LDFLAGS = $LDFLAGS
- DESTDIR = ../bin/monkey
--LIBS    = -ldl $libs
-+LIBS    = -ldl $libs ${LIBS}
- OBJ     = monkey.o mk_method.o mk_mimetype.o mk_vhost.o mk_request.o \\
-           mk_header.o mk_config.o mk_signals.o \\
-           mk_user.o mk_utils.o mk_epoll.o mk_scheduler.o \\
--- 
-2.13.3
-
-- 
2.40.1


