Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5CDC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:21 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.9068.1685521558319128912
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=4VTsnsRL;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30adc51b65cso4917449f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521577; x=1688113577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gjkJus4Ab1I95Q+SXPJTVRY+RA6fMzONMJw3ioKx6M=;
        b=4VTsnsRLAnnz/rsGUgVPylSktnTms/i8CqakGLgvGvu1CqRSDS77CFc+Ff2Kbkydd/
         UVPLRTUhCFYZbEKjtU81HddqVCUVXXdBxpQby3kVrCpd0Uxxp/S99FGP+zZhM152Fy9n
         +qi5/t9GsBBDOvwqHabb7+7R70vgQfeVtzoXw7zU7tbhrUBXvBaeQ/oMokBl/efGVFaV
         4VpY3sg7xqyKRl6rVBouB6A0GV1sp+NivloB0M6SkFJy1/1cl9Vh7S7+1qIuS1Cmq/eV
         ImGsmsu47B7UCEdlb3jHDfWZcAv3BbuEj0nLLchbMnV+Z0XF79LYzMil2T/Cahn6EkfY
         Jy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521577; x=1688113577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gjkJus4Ab1I95Q+SXPJTVRY+RA6fMzONMJw3ioKx6M=;
        b=Tx6TA+sluaOPuEAE6UFcxV9/8paMpmBddBoYuqwfppht6xt4YA74M7maLjQIaxrLDa
         +jfmuALO9Gc1VtjR3CuCYmh+SAt2KvpluGI7mu1K9BgQJoq/ktQqHNoq/29WUdZFDRvL
         jk+Yjo7dJG6jy7K7n7sh0sOMTVm+6URvv2k0z39ULxIFmt95cBuR8PreqixI/S4g2Mzq
         4QsD+YdmVis4y1TjplZ18xS5NVnQfIqccUkE/zSd5KIz6MDue5pEuSGED/YvthV4woAZ
         bqvP+rF5HEG93DFy17vUrPJVL//PTymzo66lcCdQzT+enEPWb/wv1jVqnjPkEuyBw3vp
         qKaA==
X-Gm-Message-State: AC+VfDxT4lpW7vhp81rOsQfByujCTiwiyV97fqswDtjB1N5MdgmdmvUa
	Ra2EyK0BTQW/SxeLe3KBTD+4GA==
X-Google-Smtp-Source: ACHHUZ4UIrC0ydHqTROzqRRgnqT/MEGhGkVdYX4KLSiifjtZxiGkeQ2RkifMk4qYOyvLVO0YaKk+7Q==
X-Received: by 2002:a5d:6a04:0:b0:307:8718:7891 with SMTP id m4-20020a5d6a04000000b0030787187891mr3989493wru.54.1685521577250;
        Wed, 31 May 2023 01:26:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 063/149] python3-pytest-mock: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:11 +0200
Message-Id: <20230531082437.10646-64-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102990

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-pytest-mock_3.10.0.bb   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
index c4e672f33..bf5bc250a 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.10.0.bb
@@ -18,6 +18,12 @@ inherit setuptools3 ptest
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
+RDEPENDS:${PN} += " \
+    python3-asyncio \
+    python3-pytest \
+    python3-unittest \
+"
+
 S = "${WORKDIR}/git"
 
 do_install_ptest() {
-- 
2.39.2


