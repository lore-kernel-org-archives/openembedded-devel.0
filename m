Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074E0C77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 10:36:32 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.28462.1683628588665585511
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 03:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=B2jWM3MP;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-b9d9dad9edfso7554059276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 03:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683628587; x=1686220587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NiA4ZDHMQVxIzsm6fU8X+7h3xm9zNvHWhLv+Z0EcQsg=;
        b=B2jWM3MPQ559w07vFnlPZ8q6joWAvFt/4WWVCfi81t0sYr4Ee8kYoEuH56RmpiaZCf
         Evwkqhr+wt4q04p+I1eQzzY0AEnneOy6z8s8HWx2FZQ6wzSEXw1lpkR/9TtS7jyWB6On
         zBJXvum6a8esEnRkCgLVMKNVJwXtkqksIsVimARhp5KZYiqWw29/b++oSNYKaR5z3v8w
         LKQGmXpgpRD3Ni9yOsqUNYF84n0Yk3erSC44SM6RW+vI40GBUrmcqDZ92C6l8SuPY1pe
         XaHlSjsKdroyf5JMojdgJkadJGiJNeRC9T2+DtChEEm+Cx3fdl1knXmbUzm3qe+XXHKA
         XqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628587; x=1686220587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NiA4ZDHMQVxIzsm6fU8X+7h3xm9zNvHWhLv+Z0EcQsg=;
        b=S1pdflKIiQaN6oylzT7yStL7O51z/BeAmnqmNF1WRqLK9aCTSpFUdi9PfZj5dmjBGq
         2+CgdOTc+d6OC/k5G0KrcIQsrIHTnhmgABVTE3zm+uiXVmnOsw9c0ho/Q4YPbBUyOcZT
         fCVTLm6jFNyFQIEaghyTqBF2tW3aO3BhU8pb3prpbeHuP/jezdEJztwhf7GKRUT0Jxxc
         coyGrns/Q31Il2S5Ap2y9Vri4o8FckGISwQ9/kmw8j95RAYB9TukmZp9/1MnDWErDQ8t
         MterwR8ZOuEAX+YPSCsi0MRPpdFz0Vu0N0X8bNDkNluP8Vz7+LOpP2h/piGp5pxdNHyY
         SGJA==
X-Gm-Message-State: AC+VfDy1QwkvCpvHfVH4t+ehYJM2cTSogC6sm5tnWX3uc8cEjPr3f7Ed
	iI6eJ3tq6yfiPV/IpkQdaDzEueuUMSU=
X-Google-Smtp-Source: ACHHUZ59HPgyTRllu1LUMiwF6aeSNqb9Zn646PE3h7B/TSaWS45EijaDhFCAUP4R6BE32Ry9AbHmSw==
X-Received: by 2002:a25:aa47:0:b0:ba1:ca8a:c740 with SMTP id s65-20020a25aa47000000b00ba1ca8ac740mr14161595ybi.38.1683628587562;
        Tue, 09 May 2023 03:36:27 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:183a:1604:2591:7a1e])
        by smtp.gmail.com with ESMTPSA id 207-20020a2502d8000000b00b8f3b826e58sm2978424ybc.19.2023.05.09.03.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:36:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Valeria Petrov <valeria.petrov@spinetix.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH 1/2] apache2: upgrade 2.4.56 -> 2.4.57
Date: Tue,  9 May 2023 06:36:23 -0400
Message-Id: <20230509103624.10328-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 10:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102496

From: Valeria Petrov <valeria.petrov@spinetix.com>

Changelog:
Changes with Apache 2.4.57

  *) mod_proxy: Check before forwarding that a nocanon path has not been
     rewritten with spaces during processing.  [Yann Ylavic]

  *) mod_proxy: In case that AllowEncodedSlashes is set to NoDecode do not
     double encode encoded slashes in the URL sent by the reverse proxy to the
     backend. [Ruediger Pluem]

  *) mod_http2: fixed a crash during connection termination. See PR 66539.
     [Stefan Eissing]

  *) mod_rewrite: Fix a 2.4.56 regression for substitutions ending
     in a question mark. PR66547. [Eric Covener]

  *) mod_rewrite: Add "BCTLS" and "BNE" RewriteRule flags. Re-allow encoded
     characters on redirections without the "NE" flag.
     [Yann Ylavic, Eric Covener]

  *) mod_proxy: Fix double encoding of the uri-path of the request forwarded
     to the origin server, when using mapping=encoded|servlet.  [Yann Ylavic]

  *) mod_mime: Do not match the extention against possible query string
     parameters in case ProxyPass was used with the nocanon option.
     [Ruediger Pluem]

New patch:
0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
Accepted in upstream, expected to be removed at next apache2 2.4.58 update.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0b9305faa29f6e26871e7662391efbaae4ae92d9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...config9.m4-Add-server-directory-to-i.patch | 31 +++++++++++++++++++
 .../{apache2_2.4.56.bb => apache2_2.4.57.bb}  |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.56.bb => apache2_2.4.57.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
new file mode 100644
index 0000000000..996eabf586
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
@@ -0,0 +1,31 @@
+From 5c9257fa34335ff83f7c01581cf953111072a457 Mon Sep 17 00:00:00 2001
+From: Valeria Petrov <valeria.petrov@spinetix.com>
+Date: Tue, 18 Apr 2023 15:38:53 +0200
+Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory to
+ include path if mod_rewrite is enabled.
+
+Upstream-Status: Accepted [https://svn.apache.org/viewvc?view=revision&revision=1909241]
+
+---
+ modules/mappers/config9.m4 | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/modules/mappers/config9.m4 b/modules/mappers/config9.m4
+index 55a97ab993..7120b729b7 100644
+--- a/modules/mappers/config9.m4
++++ b/modules/mappers/config9.m4
+@@ -14,6 +14,11 @@ APACHE_MODULE(userdir, mapping of requests to user-specific directories, , , mos
+ APACHE_MODULE(alias, mapping of requests to different filesystem parts, , , yes)
+ APACHE_MODULE(rewrite, rule based URL manipulation, , , most)
+ 
++if test "x$enable_rewrite" != "xno"; then
++    # mod_rewrite needs test_char.h
++    APR_ADDTO(INCLUDES, [-I\$(top_builddir)/server])
++fi
++
+ APR_ADDTO(INCLUDES, [-I\$(top_srcdir)/$modpath_current])
+ 
+ APACHE_MODPATH_FINISH
+-- 
+2.25.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
index 1ad222ace4..00f8aaa415 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.56.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
@@ -16,6 +16,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
            file://0001-make_exports.awk-not-expose-the-path.patch \
+           file://0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch \
           "
 
 SRC_URI:append:class-target = " \
@@ -27,7 +28,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5442d41afdb2d7c"
+SRC_URI[sha256sum] = "dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83caecb262e5cf94d2a"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


