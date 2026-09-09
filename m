Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEECC79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 19:51:40 +0000 (UTC)
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21416.1788983494070432139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 12:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G3qp5Lr4;
 spf=pass (domain: gmail.com, ip: 74.125.230.76, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a3156692c6so5621811fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 12:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788983492; x=1789588292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1DUJSDGvdZI4ExSQOV+UFqCR/imf9Ulkr7J4Szng+w=;
        b=G3qp5Lr4dUGvYvcurR0YYAG/dnaVuNPa5PRNCrDb5zL5GT6OqMaPnxTG4euOBrIk7o
         6EEsdyey2ZjkIIWnkhSEHhsSOcQhEhVC1sTZZRY8LcSs/8n84CMfQhPYu8z86jHBltNl
         0JJ3aXNM1clEgLLS0ZQOabYPH6MM4a15lMVnqsShCOrA7MheQ4SyLMyNVA+f1qtb+r1e
         vnqD++W+gT22JJlcv9sEiPOKFCO/bGmOVaZ0qcfnrQZIk/zD6r2StRQyjxHrB0wF6xUW
         5kvoBl7LFnf7ncYx2b/z9TMc7VVDnkcVLK8AxcPWpp8QCUv1aK4cnxcOY9omPzmcGvpF
         HG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788983492; x=1789588292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1DUJSDGvdZI4ExSQOV+UFqCR/imf9Ulkr7J4Szng+w=;
        b=T3FjUlPgkywbuXNJhBQ9ixdLMnWSsNhEI5mAtPrGev4PTsvrQWjmtTIiJja31809BC
         piNIo4BmC1TZbaNeguFpWe0sU8bV/IaSLSb6HJR56NS/1m4xtvNti2EYFoIw9OWO7IsD
         YqrvPA0d4Fr+VqOYHt+VP/ZU7yRE/RbOv0rGE+kxt9wiw0iIzS8FrOjYNolCXcDSJhSW
         CCjDD2IRFJtPnsSfXbn3xTAA+6UI3D4Tnbxj//qraEC3QlYfxHQPmo0V2hrgknhs21UP
         2TJuG2UnJo5Or+E/xV/uDB+kAzie+7bXjpGol/A4hBj0GQbkmskp7qfmWucyY3IGmWXq
         0nCw==
X-Gm-Message-State: AFuF++mYGtuez/UJ46v+psb15vmxfHOgJNyOhsEZWoNVW0DCNtqXPsJ4
	xfyJnogVTtmtX1CUs0i8O6s2a2M1lqAzMjnlmwI9LB0vDGecBTNgN2xmt3vMdA==
X-Gm-Gg: AYBFou147kSPcekgbu+6I7/LLDvHfKVYawkZtnK957RyvWLpJm8ICjtx7YQbv2T5OTD
	S6b28zMfN5bXIXt5M0uUpLG6rXCjdm5cca1gwBcuNke8W65j6+oI+xTzYCBi36mkJPrrnSUWL1c
	gs5FPQwFmgotTNyKmF61X9L1Ea8moVM0tH4bxtEBXt/JGHFDSLzrWHEohV1w0S5TeT3a+ybVek/
	DponBveTp541KDGbZ5gCx+4M5uCkm/PWIlDMv7odDJ3XFSoyPwc6EHQuKAG130AMQrFt9GZ65MH
	9hkpiKfdkX84KfEvFEUao+wSld5tacFxQgMNA7I/WOpW/eYiXcVhh4W+94EBY6eLeES6Bzha0UA
	BGe12dnC0ZRrQZZcO/po/1FMdPCXM0Il+s/OP1bci2DpNO5NFEF9eOpIuCSEXOYNQg2lCBjBPu/
	j9bItSqIyXHABIfQdBsoIgEMMhFkpCih1OXclRHdsqFNqqLmRAOHudRVtecduXcPRB1sSMfbCkZ
	jfkX2pbiNu4S20y2bLj+4wm31ICLZtTg0pkdJqY8uQmS3WWX92Bx+AAn/eWw08vBrrrbQCnYOkp
X-Received: by 2002:a05:651c:19a0:b0:3a3:3170:5420 with SMTP id 38308e7fff4ca-3a58d33c3f5mr4041991fa.3.1788983491576;
        Wed, 09 Sep 2026 12:51:31 -0700 (PDT)
Received: from localhost.localdomain ([176.88.90.107])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a370599810sm45706921fa.24.2026.09.09.12.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:51:31 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] loudmouth: remove recipe
Date: Wed,  9 Sep 2026 22:51:18 +0300
Message-ID: <20260909195118.191319-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 19:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129897

do_compile fails with OpenSSL 4.0:

  lm-ssl-openssl.c:281:92: error: invalid use of incomplete typedef
  'ASN1_IA5STRING' {aka 'struct asn1_string_st'}

This break is a three line change to the ASN1_STRING accessors, but
upstream is dead. The last release is 1.5.4 from January 2021 and the
last commit in the mcabber fork is from June 2022, so every future
toolchain or dependency change is ours to carry.

Nothing in any layer depends on it, the only reference was the meta-oe
packagegroup.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../loudmouth/loudmouth_1.5.4.bb               | 18 ------------------
 .../packagegroups/packagegroup-meta-oe.bb      |  1 -
 2 files changed, 19 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/loudmouth/loudmouth_1.5.4.bb

diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.5.4.bb b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.5.4.bb
deleted file mode 100644
index 83a366a8df..0000000000
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.5.4.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Loudmouth is a lightweight and easy-to-use C library for programming with the Jabber protocol."
-HOMEPAGE = "http://www.loudmouth-project.org/"
-
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-DEPENDS = "glib-2.0 libcheck openssl libidn"
-
-GNOMEBASEBUILDCLASS = "autotools"
-
-inherit gnomebase gtk-doc
-
-SRC_URI = "https://github.com/mcabber/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
-UPSTREAM_CHECK_URI = "https://github.com/mcabber/loudmouth/releases"
-UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
-SRC_URI[sha256sum] = "31cbc91c1fddcc5346b3373b8fb45594e9ea9cc7fe36d0595e8912c47ad94d0d"
-
-EXTRA_OECONF = "--with-ssl=openssl --with-compile-warnings=no"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 084d5a201f..225cd95604 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -147,7 +147,6 @@ RDEPENDS:packagegroup-meta-oe-connectivity = "\
     libuv \
     libwebsockets \
     linuxptp \
-    loudmouth \
     modemmanager \
     mosh \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "obex-data-server", "", d)} \
-- 
2.43.0


