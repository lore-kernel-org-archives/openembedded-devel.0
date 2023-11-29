Return-Path: <dylantdmt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCB7C07CB1
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 16:11:54 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.40818.1701274307448456984
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 08:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V40cU1Wd;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: dylantdmt@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1efb9571b13so4042502fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 08:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701274306; x=1701879106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oNM1tcfywowIfT6GQo20gi3P4AtiFs+EpMsiIJZeh4c=;
        b=V40cU1WdEyqNA3ZK4vtpU6OiUk7kJLBI9ijn/d6owBwEbjsj4uzV7pmQAhVtIm0F78
         n08m0epOGjuxkEnEWKuB5VZ+n6/53H1SgoN8G7grhvvF6TpziZ1UGaf7nyOTuRNRGf/9
         CDhDrGdXdehJ7sUoAaTvtJY+pJJytIegCkuoUHPWLNy6o61T3/CqAkiCUmippLYYDVQs
         g28S0ii/NLLeczGmwaMVWNoOhBqo5Gw6AQnn3oXYEtIhCbBMqxVYSS/8zsFn5IcYb3Bn
         LOguISXNk3u1pSXnZMHcIcwvTLXHd8ufskGF3Y6kuj2zcYgJ6giMC2G0fY5lSy8lEelt
         2F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701274306; x=1701879106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNM1tcfywowIfT6GQo20gi3P4AtiFs+EpMsiIJZeh4c=;
        b=KYQq2YtlUBMc5psQAcpzJFMbMjUSf9o6jwljAsKC8lO8K9R/5Ja3PNhgmAHqBLwdBx
         6m9KwOufgUiFiA9rLt9wZvM+pMbu/OmWdh8DEJd7+qwckmzWgqSUTijsc3siZ3IJyxnx
         n78qIP9z2BG48WoidmbjZ5TROGNxnCfZMYsQm9R40aFZR8OKxhGNCqqpbP22ZX8KrJir
         r1rfccr0jhR0RBfiKE/SIoNgSVj5PT8A+2NJsDp7XwZe6pWsOnH938ARem6s8YDf76Xk
         muIHLqpluTJJVtYrADa/hnHiKMgyYMWeRi1iV412GGDblzWJRTUBzFgj924EjHSuDD50
         NzMQ==
X-Gm-Message-State: AOJu0Yz0VDv1+/FulrgsVFWWCiSs2KaLNTiE3SO0VwtPcHbNDb9mPN7a
	EXlttqIjg9pM0oGjRLUjLUcOZaMBzznozg==
X-Google-Smtp-Source: AGHT+IFNz4TPLjVgUi15NAvx+R/3t9sJh/T9+txNjg1W4sMmNpCWQo64LpTjdmjEBjuYVEG4VfOp1w==
X-Received: by 2002:a05:6870:568d:b0:1fa:26b3:4411 with SMTP id p13-20020a056870568d00b001fa26b34411mr18340693oao.7.1701274306493;
        Wed, 29 Nov 2023 08:11:46 -0800 (PST)
Received: from dturner-linux-box.ni.corp.natinst.com ([130.164.62.208])
        by smtp.gmail.com with ESMTPSA id hx15-20020a056871530f00b001fa1db68eecsm2571882oac.4.2023.11.29.08.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 08:11:46 -0800 (PST)
From: Dylan Turner <dylantdmt@gmail.com>
X-Google-Original-From: Dylan Turner <dylan.turner@ni.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dylan Turner <dylan.turner@ni.com>
Subject: [meta-oe][PATCH] apache2: v2.4.57 to v2.4.58 to fix CVE-2023-43622
Date: Wed, 29 Nov 2023 10:11:42 -0600
Message-ID: <20231129161142.1957158-1-dylan.turner@ni.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 16:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107142

Note that patch 0011-modules-mappers-config9.m4-Add-server... is no
longer needed as it's included within the upgrade as well.

CVE: CVE-2023-43622

Signed-off-by: Dylan Turner <dylan.turner@ni.com>
---
 ...config9.m4-Add-server-directory-to-i.patch | 31 -------------------
 .../{apache2_2.4.57.bb => apache2_2.4.58.bb}  |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb => apache2_2.4.58.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
deleted file mode 100644
index 996eabf58..000000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5c9257fa34335ff83f7c01581cf953111072a457 Mon Sep 17 00:00:00 2001
-From: Valeria Petrov <valeria.petrov@spinetix.com>
-Date: Tue, 18 Apr 2023 15:38:53 +0200
-Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory to
- include path if mod_rewrite is enabled.
-
-Upstream-Status: Accepted [https://svn.apache.org/viewvc?view=revision&revision=1909241]
-
----
- modules/mappers/config9.m4 | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/modules/mappers/config9.m4 b/modules/mappers/config9.m4
-index 55a97ab993..7120b729b7 100644
---- a/modules/mappers/config9.m4
-+++ b/modules/mappers/config9.m4
-@@ -14,6 +14,11 @@ APACHE_MODULE(userdir, mapping of requests to user-specific directories, , , mos
- APACHE_MODULE(alias, mapping of requests to different filesystem parts, , , yes)
- APACHE_MODULE(rewrite, rule based URL manipulation, , , most)
- 
-+if test "x$enable_rewrite" != "xno"; then
-+    # mod_rewrite needs test_char.h
-+    APR_ADDTO(INCLUDES, [-I\$(top_builddir)/server])
-+fi
-+
- APR_ADDTO(INCLUDES, [-I\$(top_srcdir)/$modpath_current])
- 
- APACHE_MODPATH_FINISH
--- 
-2.25.1
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
index 9ffdf3265..749c7e073 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
@@ -16,7 +16,6 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
            file://0001-make_exports.awk-not-expose-the-path.patch \
-           file://0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch \
           "
 
 SRC_URI:append:class-target = " \
@@ -28,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83caecb262e5cf94d2a"
+SRC_URI[sha256sum] = "fa16d72a078210a54c47dd5bef2f8b9b8a01d94909a51453956b3ec6442ea4c5"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.41.0


