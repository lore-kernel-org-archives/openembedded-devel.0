Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4DEC2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 22:31:25 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.18273.1700519481675463271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Nov 2023 14:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=zj9caUlv;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4083ac51d8aso20652745e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 14:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700519479; x=1701124279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mOn3xrJs8GqYoMz3iVOeq5OPbtBQMR0DT8EscCD5Sdo=;
        b=zj9caUlvmZ2qmM2njULCVe+ZWHhTGFH7oWwz7mDylqyqFRc63fZV7SlXnKnld6f4EF
         lsI1PWxzS/zJBwhs4sN3E0AZXVe5RWzV18AsD02Q34Np2wy7YejLjz+U7lRd87ar8p88
         ONqiO6LeIqnWC4WGcemZFofjECph0+BGNdM4uLwguze5gzqY3ZIlk4M+GcSTwmNoI5R8
         xG9OMYhei5g804ilz0sUzNM6v2AQwec2664JYgFa5aFNXW+kqRzLc0by+FjXHIWPq3BQ
         zGbfYKSLspoGI9PYASnl+2K1GbF0yojPIGLBkJCiKFxsZT1iR3FKRaGOqlWI+vS00AXZ
         4gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700519479; x=1701124279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOn3xrJs8GqYoMz3iVOeq5OPbtBQMR0DT8EscCD5Sdo=;
        b=nvH/GA34bbquix4/teQSLQVZljXW/16RSlwxr71xtPYTWUgotGJ/IEjhL5SOb3HfK+
         fGB47BvxpMktUwL1DwcfafCC4WxHaC5YNY4SFoll+jZ7eBk8xb3bwH4U3UhWYj+Y5JV8
         5cswN8eQfQMC+GkrkMH/niAzxNbM62Al2M3hCAQzjWw4LUUedDVUgF2+8cRI8MyOij6y
         91Vzr9G0QCI5zXUHYrDLo6j2/dFutxUC3wEGuNdxGF2h2kvC16Hy+JF6ngVd4CkAlSAH
         dI6lKScmuEoNKmN8tguC3PP52/nphmzxaBqirC1SZxPGGGmLcvbeQi9yAdYgQ50brMFz
         igJA==
X-Gm-Message-State: AOJu0Yx6jKV/iAypHRO6YpB3meFlbY+d7fBXCWcnD54WqRvzIma4z53D
	m34VY6WBN9XstVoc+3HzG9e+zkpwTfcpHn6Jpfo=
X-Google-Smtp-Source: AGHT+IGyUJ02M9CouJoC5pyQTocjjp68BOCJVmE5j4aWA0dhch3QJ/+dC4hyjLTZ+6Syv4Tbw0e3mg==
X-Received: by 2002:a05:600c:4445:b0:407:8e85:899f with SMTP id v5-20020a05600c444500b004078e85899fmr7559288wmn.16.1700519479331;
        Mon, 20 Nov 2023 14:31:19 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id x7-20020a1c7c07000000b0040684abb623sm18831181wmc.24.2023.11.20.14.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 14:31:19 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-perl][dunfell][PATCH] meta-perl: Drop broken BBCLASSEXTEND variants
Date: Mon, 20 Nov 2023 23:31:10 +0100
Message-Id: <20231120223110.2396876-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 22:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106968

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The command "bitbake universe -c fetch" currently throws a ton of warnings
as there are many 'impossible' dependencies.

In some cases these variants may never have worked and were just added by copy
and paste of recipes. In some cases they once clearly did work but became
broken somewhere along the way. Users may also be carrying local bbappend files
which add further BBCLASSEXTEND.

Having universe fetch work without warnings is desireable so clean up the broken
variants. Anyone actually needing something dropped here can propose adding it
and the correct functional dependencies back quite easily. This also then
ensures we're not carrying or fixing things nobody uses.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 79e0a9d237343ad0af0a40128494155ccaa131ec)
Backported:
* Adapted paths to follow PV changes
* Adapted modified recipes to the ones generating warnings
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb     | 2 +-
 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.068.bb     | 2 --
 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb           | 2 --
 meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.66.bb          | 2 --
 meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb    | 2 --
 5 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
index afd26fa1c..40bb58644 100644
--- a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
@@ -38,4 +38,4 @@ S = "${WORKDIR}/Config-AutoConf-${PV}"
 
 inherit cpan ptest-perl
 
-BBCLASSEXTEND = "native nativesdk"
+BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.068.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.068.bb
index fc9786bec..9322db408 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.068.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.068.bb
@@ -43,5 +43,3 @@ do_install_ptest () {
     cp -r ${B}/t ${D}${PTEST_PATH}
     cp -r ${B}/certs ${D}${PTEST_PATH}
 }
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb
index 8994f692b..6d300ea9f 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb
@@ -62,5 +62,3 @@ python __anonymous () {
        raise bb.parse.SkipRecipe("incompatible with %s C library" %
                                    d.getVar('TCLIBC'))
 }
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.66.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.66.bb
index 26c7c389d..77c91c86c 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.66.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.66.bb
@@ -41,5 +41,3 @@ RDEPENDS_${PN}-ptest += " \
     perl-module-perlio \
     perl-module-test-more \
 "
-
-BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index a1bb4a399..c281dfa5f 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -34,5 +34,3 @@ SRC_URI[sha256sum] = "16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669b837745f3ea6
 S = "${WORKDIR}/Unix-Statgrab-${PV}"
 
 inherit cpan pkgconfig ptest-perl
-
-BBCLASSEXTEND = "native"
-- 
2.30.2


