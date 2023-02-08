Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB15C64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 15:25:55 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.538.1675869949442391499
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 07:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=AX3EAM3c;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f43.google.com with SMTP id bu23so1280870wrb.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 07:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryApW3BI9u5VA1hnBIPLuwck8hwesSlW6XcaboKPujU=;
        b=AX3EAM3chXmdojCe324sV0O2cfcbvJmSpr+M310D9n3UaYChiuurK1gepfTJ/BQTFJ
         gJSukyJqgeqct/xDUsTEVcSYl/ROUWMABjpE6aK+YypzDO8k1H0LC2O6zXD+6mIZOyvV
         foF6I9WRRrSYFQ9DySz8JZblux6cEnL5hx2MBmbuRR4bmh2OVh/Chh8NjjZ5ObHNEjYT
         xShT7R8WXRfOmx8XbCMeie9nhvI5528fSaszRmAqABRJVo7aaCxl17mWkIaDjF1GAo15
         IFWKIeMGkpAF0e8KV4YniRp1PupGSzS4bhDO931IAYZ3fYR+Ds4Nz+wXKRvg/sjxIefb
         Bwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryApW3BI9u5VA1hnBIPLuwck8hwesSlW6XcaboKPujU=;
        b=ASZlVtaRY/eL8VCHvokFhNk7N/QHJ1CWbvc2mQWEpQT8ParCWaNj+NLuuMugPnAKtk
         4v49YP2ATbJprXHu5CrI99fZ2tW0LbA3bSeL32BgmWCc++lAbhI4qhQ0CjZvXAwW4cpL
         J8ewW5j70kdWWFogMFc8N3m2CNQSk6AuF6mwvPH6hBzEngiY2llN3qOm1zz3GoNDPfs9
         DIhnPk4ir0SSqTRRb71OnWwKSZwsTfDOY67Ms3eqhGOgecd1hk+laYVhbXhv02msMCWW
         KperLepHMmTBv1BOMZX7cL6a7NoOGqUIsp2sjpGDL51C+Ww2Oo0Oi79Ud7scAjjlMV1m
         ZOHQ==
X-Gm-Message-State: AO0yUKWVphPCqyhp0aoqBUyI+i9QwQz4WbGLcGdlou5rqRzW7czYV+4O
	XD9tgmWxjDRV2+ngTjPSzkbXAQ==
X-Google-Smtp-Source: AK7set8md+lMevdyHT4jQgqr3tdtkryMQPq1CTDpShvpvcnMOI15YxKnYDF8p5rK7kgYS+TkRuIE/A==
X-Received: by 2002:a5d:4352:0:b0:2c2:6541:7afc with SMTP id u18-20020a5d4352000000b002c265417afcmr7076796wrr.64.1675869947706;
        Wed, 08 Feb 2023 07:25:47 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a9fe:4fba:ab76:6149])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c3b8200b003dfe659f9b1sm6713239wms.3.2023.02.08.07.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 07:25:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 1/3] libgpiod: update to v1.6.4
Date: Wed,  8 Feb 2023 16:25:39 +0100
Message-Id: <20230208152541.136848-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230208152541.136848-1-brgl@bgdev.pl>
References: <20230208152541.136848-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 15:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100998

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a bug-fix release bringing in several fixes for build and
testing issues.

Remove the patch that's already present in this release.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 ...-don-t-expect-automake-to-set-PYTHON.patch | 37 -------------------
 .../{libgpiod_1.6.3.bb => libgpiod_1.6.4.bb}  |  5 +--
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.6.3.bb => libgpiod_1.6.4.bb} (93%)

diff --git a/meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch b/meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch
deleted file mode 100644
index a3dc38188..000000000
--- a/meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 3c461786feb1d5aa1ed2a911942a5f9fbc8b8086 Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-Date: Tue, 24 Jan 2023 17:38:43 +0100
-Subject: [libgpiod v1.6.x][PATCH] build: don't expect automake to set $PYTHON
-
-It seems that the implementation of AM_PATH_PYTHON() changed in automake
-recently and no longer sets $PYTHON variable which breaks the build on
-some systems.
-
-We know we use python3 so use python3-config explicitly.
-
-Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
----
-Upstream-Status: Accepted
-
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3149384..0460810 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -204,9 +204,9 @@ then
- 		AC_MSG_ERROR([python3-config not found - needed for python bindings])
- 	fi
- 	AS_IF([test -z "$PYTHON_CPPFLAGS"],
--		[AC_SUBST(PYTHON_CPPFLAGS, [`$PYTHON-config --includes`])])
-+		[AC_SUBST(PYTHON_CPPFLAGS, [`python3-config --includes`])])
- 	AS_IF([test -z "$PYTHON_LIBS"],
--		[AC_SUBST(PYTHON_LIBS, [`$PYTHON-config --libs`])])
-+		[AC_SUBST(PYTHON_LIBS, [`python3-config --libs`])])
- fi
- 
- AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
--- 
-2.37.2
-
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
similarity index 93%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
index 5164e7e02..70a77c883 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 SRC_URI = " \
     https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz \
     file://run-ptest \
-    file://0001-build-don-t-expect-automake-to-set-PYTHON.patch \
 "
 
-SRC_URI[md5sum] = "28e79f6f70fee1da9079558d8b7b3736"
-SRC_URI[sha256sum] = "841be9d788f00bab08ef22c4be5c39866f0e46cb100a3ae49ed816ac9c5dddc7"
+SRC_URI[md5sum] = "7a2cca6ead9296c27e877070dd8853bc"
+SRC_URI[sha256sum] = "7b146e12f28fbca3df7557f176eb778c5ccf952ca464698dba8a61b2e1e3f9b5"
 
 inherit autotools pkgconfig python3native ptest
 
-- 
2.37.2


