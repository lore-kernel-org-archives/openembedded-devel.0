Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7458EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 23:39:32 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.2589.1689723565131242134
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jul 2023 16:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WGj7i3jq;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so500516a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 16:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689723563; x=1692315563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYN4UG3I2Avy1blxIQbXwebQqXGhhurkKyHOxA4JCdg=;
        b=WGj7i3jqZoTeV5T4gh/Me730h5fSJmPSdgNyvayJvZcS/fYlwDbK99XZYqpoFdKn0Y
         UrxSFmexEMwFICI/AyprEvOPv7rY11LHut4+qgtf3yAZZ0F1n4ifCYHVzBAnELxvQdDO
         3VN+S4GDOPCUW2bsfT20ai5GlmUrnCzY32dGCnppUlfk/KfuAn1JiYUvRUvfDWY4ZmGW
         1FeGiDipG46MDK/tdO56AEAjNIdffk2DuxFDifMfY/XmuZ0YQ5MMk+MUZs/yLcj1L1nP
         X5r4vonqQMpExW2muGolgyDMS9suSXaF5n5PUpv0onYB35ZvCpKpwd+65WI7TqRJ+qNi
         uzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689723563; x=1692315563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYN4UG3I2Avy1blxIQbXwebQqXGhhurkKyHOxA4JCdg=;
        b=JuTXuOuoBoiRtF8Q6mp+gZI54b178h4UckDdSBWqbXp7inP8AMt/msaDr5+sZXZLEC
         m9yW5QszDkC3HVBBCSNl2rtEUT+Bw32qjnpYhK4H0ReFMgB9qo/+k18ODKf5xagGMbg7
         OAwyX+iSy4brqm0JGp/ljw55ma10Uiz6AZsTAVHSPpCAt3859STw+ZMv8zpbnmeY8/QW
         ZjMVef7KfHfH05Fo4xblw2N0UuQsKYZsaDGT2nWokcudC3MEraIdYBT1fEcy++Wjj9KF
         MvyOb0i7zVxwU2bDzrINjXJ4a6xhfwcvAx7vvtiFURuYxck0pw6prAWZ+0S5yiuFP51V
         A0FQ==
X-Gm-Message-State: ABy/qLZLbc29EeK/XlaNUM24pnIfXfd5bMRSQJy5jKbnApNUkDEbSn5H
	pEQQk/pTOz8GPAVPBFYvuJXki0zlyHw=
X-Google-Smtp-Source: APBJJlE822n8ECn5M2CLNKxI6xomPii/W/pgXKhzF4tlQCFyqHHuFAyabkRy6WJtkHIypqxdPBm/Ig==
X-Received: by 2002:a05:6402:3596:b0:521:ae30:787d with SMTP id y22-20020a056402359600b00521ae30787dmr584550edc.21.1689723563337;
        Tue, 18 Jul 2023 16:39:23 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e19-20020aa7d7d3000000b0051e2a6cef4fsm1855059eds.36.2023.07.18.16.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 16:39:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv3 1/3] libtommath: add recipe for LibTomMath used by dropbear
Date: Wed, 19 Jul 2023 01:38:38 +0200
Message-ID: <20230718233840.2461756-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 23:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103951

* When system-libtom PACKAGECONFIG is used, both libtomcrypt and libtommath
  are used from system and we need a recipes for both.

* libtomcrypt was already added to meta-oe in langdale and PACKAGECONFIG
  was added in dropbear in:
  https://git.openembedded.org/openembedded-core/commit/?id=b7c2edd2d6ded287d8b34dd047ae84d3fd69d4c6

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
v3: add libtool-cross dependency to fix cross compilation (dunfell needs LIBTOOL
    to be set in EXTRA_OEMAKE because of ${HOST_SYS} prefix), but the dependency
    is needed for all releases when cross compiling

 .../libtommath/libtommath_1.2.0.bb            | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb

diff --git a/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb b/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb
new file mode 100644
index 0000000000..1efccdd843
--- /dev/null
+++ b/meta-oe/recipes-support/libtommath/libtommath_1.2.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "LibTomMath is a number theoretic multiple-precision integer library"
+HOMEPAGE = "https://www.libtom.net/LibTomMath"
+SECTION = "libs"
+LICENSE = "Unlicense"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=23e7e0a32e53a2b1d35f5fd9ef053402"
+
+DEPENDS = "libtool-cross"
+
+SRC_URI = "git://github.com/libtom/libtommath.git;protocol=https;branch=master"
+
+SRCREV = "6ca6898bf37f583c4cc9943441cd60dd69f4b8f2"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'LIBPATH=${libdir}' 'CFLAGS=${CFLAGS}'"
+
+do_compile() {
+    oe_runmake -f makefile.shared
+}
+
+do_install() {
+    oe_runmake -f makefile.shared install
+}

