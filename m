Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FD2C47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:03:00 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.155475.1703876571612958938
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GF9u16aI;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5e3338663b2so49466357b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876570; x=1704481370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nraFOswcVvo0ICNR0SkI/f/Li8RibE9w13fC51lUdkQ=;
        b=GF9u16aI0It0BdsRn6amUu0EoKXGurgfa0+qrB+7jvijqXUUHBQSPKrchf5KH415pB
         CX/L8NIvK+DcomRKwyO1a+07Cf9senCoHnp9KAZlByyftglfNRqNsJXp0LUJTHem+80Q
         1X62Q17mengrSDOVCJcnKl7qYrw5LsHkzIpXTbVfKkbmkqa7UZm/hfoJ2Eu6o8ATZaKS
         nhEPTDg9i6D+3eVYIB948FWj1P4P9pM/kX9wyLmy6V93TF6ND8DQ469XeXDCNnoG3uDT
         D/7BqmtlN4blkavzY3peJFA3AEY2V4V0iteHFsHdpvsNW1PRinIB+oQVu8qttFz+kDVc
         CCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876570; x=1704481370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nraFOswcVvo0ICNR0SkI/f/Li8RibE9w13fC51lUdkQ=;
        b=h5gEkBX2OMDswY2kWLrq+77y3FfVi12RCQ0/NhV1AWnJumwZXpJ+pDNaiqova2BzO8
         U5CJTBBSxlEvf9NvFkAM8T0wL/jg717y49ugiW/Usg+n9VbrNwcDW1MAVdfSIuaAOIzl
         mfx705ehZgEgMpOera0nDilptpiz+555xtHFj75dZZ50wUnWvb1TtfHpewH4kYReS6qT
         eJ5g0Eqz5HY/MofnfS66pgwbyQmjAzNBvhIHm1TNYGmcRojCZVlGBScTaZTwRU5mcXjN
         3SJ6kMJWXYprt3a8r4Yjp/kEpz8P1J7VET+2Sw8HzbVludCVXIwdmFtyr6R50PMUG1im
         Hm6Q==
X-Gm-Message-State: AOJu0YzlbxxFhBpgeLQKrZvenushr9e0luVCj6ClvxFuk1fXRwPm/lEU
	vRRntvjnx2T/aPtXSASUaEiCfZ6hyBZpdQ==
X-Google-Smtp-Source: AGHT+IEWaN/51qSYIcir7dinMtWJ9DutM/zs/9jxMSnHwjYdUEMxFaRhC9vTT28V747rNxiF46MUkg==
X-Received: by 2002:a81:88c2:0:b0:5d7:1941:aa8 with SMTP id y185-20020a8188c2000000b005d719410aa8mr8432122ywf.67.1703876570630;
        Fri, 29 Dec 2023 11:02:50 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dylan Turner <dylan.turner@ni.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 17/17] apache2: v2.4.57 to v2.4.58 to fix CVE-2023-43622
Date: Fri, 29 Dec 2023 14:02:30 -0500
Message-Id: <20231229190230.135480-18-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107899

From: Dylan Turner <dylan.turner@ni.com>

Note that patch 0011-modules... is no longer needed as it's included in
the upgrade as well.

CVE: CVE-2023-43622

Signed-off-by: Dylan Turner <dylan.turner@ni.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9f0b5053410d5958e089351b93199efd3473d3de)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...config9.m4-Add-server-directory-to-i.patch | 31 -------------------
 .../{apache2_2.4.57.bb => apache2_2.4.58.bb}  |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb => apache2_2.4.58.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
deleted file mode 100644
index 9accbf18a1..0000000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5c9257fa34335ff83f7c01581cf953111072a457 Mon Sep 17 00:00:00 2001
-From: Valeria Petrov <valeria.petrov@spinetix.com>
-Date: Tue, 18 Apr 2023 15:38:53 +0200
-Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory to
- include path if mod_rewrite is enabled.
-
-Upstream-Status: Backport [https://svn.apache.org/viewvc?view=revision&revision=1909241]
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
index bbc1c6c48a..e4f7e1ceb8 100644
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
2.34.1


