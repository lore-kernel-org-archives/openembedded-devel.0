Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.13780.1622643311911016566
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 07:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=CgI8Zl2h;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f53.google.com with SMTP id p13-20020a05600c358db029019f44afc845so1769020wmq.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jun 2021 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0vMVZWD+p9/QJvYo1xhOP79J+B7N1PeOOJUSd/MrEk8=;
        b=CgI8Zl2haHAuq8QKG9dnXmrbB2t1wSl6V7Jehrjmbs8ZeYRLNehDWuprXpLW7qB8jY
         pt8ARe5/u/drAx+urMdoP1Gaf7RfSoPU+vwsZRNVL87j6dYXCJvBejdpt9SYY45d73GU
         kkIisPo+nFAxaQPNMpmb/l/zdJSKV9giIbIf+33DRGIuYa05fFZlo3LUEd/770v9fMfY
         t0d+s/sOWLFaDXXftBS2l77eHm41kK6uWzwdV0LIAIZLRzdFW7gwroKhMhCvfc/MBkuJ
         Ll49tX/BvpOmYziEA1D752VHotS+OhcaMaudJLqzdKk3NbdjgNAXqEtiNAah7QXFVDPY
         iAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0vMVZWD+p9/QJvYo1xhOP79J+B7N1PeOOJUSd/MrEk8=;
        b=hEGrjODMZMFi9i8xlhQNuUDgxeY1sFy5nzfDFO3FWreloLnH+8YuWKuDuFKiFdd295
         9hhkApfdzZQHhsVU5B5u5BMUqQIlkeRqWC2iYY35GyiHWRNHsSeBsHsTngA8EMHXbHe5
         /pWoEYjIZ3NIGQBqAyhMAveBze7z9ZtOIvmmeP61e1ngNj/YntPKNTf2pLLZ+BXh8Alk
         9vZavIT5lj9YnGfpUDaIME6et+3QMawi2yrNDHad6jAIUTwjA7QWSRIUJHDFAQ5vQGfA
         EQR8phTllVRYXTYS1fQQgY0MS2/AV6lhjDE0i3dfYlrm5JPzkFRv0blCwlbVhMxFVusi
         LPHg==
X-Gm-Message-State: AOAM533x3M5CliHVqSethRP7r8zIauNI1TTp/ys+zGJ66P3qigRojDPI
	AzHhkgTdfrVPTafk0L1GRQOX3A==
X-Google-Smtp-Source: ABdhPJw6PnvFATL0vECxQQeg3COj4TDCG6RHcqfUNr/u+48wOp/2UZihMgMIuXKJK6Xa9lqB4nvFlA==
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr5401849wmg.19.1622643310554;
        Wed, 02 Jun 2021 07:15:10 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id i12sm2824697wmq.7.2021.06.02.07.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:15:10 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH 9/9] libgpiod: ptest: add kernel-modules to RRECOMMENDS
Date: Wed,  2 Jun 2021 16:15:01 +0200
Message-Id: <20210602141501.6174-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210602141501.6174-1-brgl@bgdev.pl>
References: <20210602141501.6174-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libgpiod needs the gpio-mockup kernel module to be loadable (not
built-in). Add kernel-modules to RRECOMMENDS.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index febf625a6..8dda8a2a6 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -48,6 +48,7 @@ FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 
 RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '', d)}"
+RRECOMMENDS_${PN}-ptest += "kernel-modules"
 
 PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
 
-- 
2.30.1

