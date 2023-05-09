Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000FEC7EE37
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:10 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.25901.1683616023726306012
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gSZn0d6b;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30786c87cdaso2990401f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616022; x=1686208022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdPgmCfy1GsYYrPPzT+kkKWReAwWItEV1BJf6fo+R0g=;
        b=gSZn0d6bWZEFti87GnEHmicOxWvkHkjjAPJj5SDsWZ1FiCRdt3a1CQCyU6+vB/1JOA
         j1tyzcZPZnUOQVQEH29TiUlOpYdKw4bJHVGC6lWy9USrF+/ZHqOKWIKkGhaIxtmOU8T8
         FLCUeMFgJybPNuerPdZVTUnIDXMmrgN/sfIov3ZyIJCI0DRaIwMFcx28PjqB6GY9ErMp
         A9cpYbQZs9/rXxjlpysCRe/ZovSuVdc9H9kF0H1wkKx/vRGwICNskE5Qdb/Hzkq1JmHy
         NDgmqsNKAp4NSF5hWt5WTvoa0ijBsg7NK94GrsNWkanPKFmpVXfX2RSu56P6MZvaR6qs
         077Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616022; x=1686208022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdPgmCfy1GsYYrPPzT+kkKWReAwWItEV1BJf6fo+R0g=;
        b=bQlN6qldZwuvL1/MTTrRm+WE438atCCuk8VnZKYtAzHfrH6xvPm1/xWkhlWnfEbj8F
         qPPheUO4rBgFbBGUUkjxy72c4rMSJgAP7N0oQW5DSGvAMS9Xtjl8pUkfg3TTN72Ji1ZZ
         VCLTJymXWML0iBx7U0YXThOXydpmO7v9A51gTv3H7AF3op0SwM19vs6m4fM5Zu+sSYGn
         ZGrXTUYnc3Vcs4pUjnWlX2kKxNVM3iE0oOLehhGtFTKSOF5K1dovxhPHCCJxSqbHqrH5
         +gJIhgHDrRc1JLqITewUS2xHVZ5nYVHxO5w9emmtEl40sYtE4Yklva8mGE55pCwVaZNT
         ibqA==
X-Gm-Message-State: AC+VfDyNt0hXDnpeVsdctZsd4g4JlTTP2f17qpsXM57R+A7YaMDfUEFT
	d1qh0B2x30uNa1h5dPqj6LvOaLrCM1w=
X-Google-Smtp-Source: ACHHUZ7bAiV9kuwTekIrTCdl9K2RE2CisGUxGq8VLkhHxyRMGY9xyTzOD6oVJkm09JFh2sejarzOxQ==
X-Received: by 2002:adf:f64b:0:b0:307:873d:2ea with SMTP id x11-20020adff64b000000b00307873d02eamr7486988wrp.47.1683616022203;
        Tue, 09 May 2023 00:07:02 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r10-20020a056000014a00b00307972e46fasm5053194wrx.107.2023.05.09.00.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 04/16] libxmlb: add missing dependency on glib-2.0 and xz
Date: Tue,  9 May 2023 09:06:43 +0200
Message-Id: <20230509070655.70784-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102472

* without gobject-introspection-data in DISTRO_FEATURES it fails with:

  http://errors.yoctoproject.org/Errors/Details/702774/
  Run-time dependency gio-2.0 found: NO (tried pkgconfig)
  ../git/meson.build:119:0: ERROR: Dependency gio-2.0 not found, tried pkgconfig

  and http://errors.yoctoproject.org/Errors/Details/702777/
  Run-time dependency liblzma found: NO (tried pkgconfig)
  ../git/meson.build:121:0: ERROR: Dependency liblzma not found, tried pkgconfig

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
index 3366b7e7f9..61abd07fda 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
@@ -8,6 +8,8 @@ SRC_URI = "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https \
 SRCREV = "a6cac6a715d57c393bbddee4d0381ad943341af9"
 S = "${WORKDIR}/git"
 
+DEPENDS = "glib-2.0 xz"
+
 inherit gobject-introspection gtk-doc meson ptest-gnome lib_package
 
 PACKAGECONFIG ??= "\
-- 
2.40.1


