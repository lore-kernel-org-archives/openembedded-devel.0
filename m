Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.13813.1622643308272020897
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 07:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=02luTbuX;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso1337358wmc.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jun 2021 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FXwQC96Vt9sVKZnYTjgvjI4sKEzRadg7CB0LlhiPTV8=;
        b=02luTbuXHAxJwwk7FxzTa4wuhy2HtMvRrVvOJo5vAwHTg2U3XogR/LrZnc1mHzw8fu
         LFHE0bEPsmQYeiiDBadP8jc5ZeDNOAog1xJGRTspZpLESKW7ZYHEhmMRQYV+0BPQ/oYe
         wJGHxk64x0bb0XZofMfenVNKoRwUzJiwLafICtkxLUVWBO6RV2jFrY/mPwj0eqiQ2yVt
         T29vPC0ci5JczgNSkyttWjWuoY/QY2bBTZZWBAkLIraGebuMPg2rL8gE3YnStXO0CM3l
         78nm4g1Ercmg7pdBO38nxjQSgjSRnd3pnKrUJI0i6V6OSKn9kOnKEzzKiQN/o4a0nWwb
         ldTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FXwQC96Vt9sVKZnYTjgvjI4sKEzRadg7CB0LlhiPTV8=;
        b=LJZ+ShtPDsYesNpydgh1tAp3kj10wMXY82x2PSxn/Y9UeWCjfn/QNaK6uGUHRgN19T
         2A9SIH7WBUqZgXQjZCrK4YuuzRVpzpILeYVLYrUvk5SoIwLUl2hXei9+iAyWxcb3v821
         4Yeef2XYK8NybRasjIRqWccI9NYYNu66YsWjbe8efChejpXwwbqCQs8TBCTVkPJAjA0v
         iLWrEl5KInvzm68SGrA3d2jDwtU6+/mWqhzonBF/TKkynpse18jVGQujkz5EgVQ2VTDT
         yKDd0bRDZDb6ZdTjJqZJfjJXlgn+igynzP+COdLZYHTCJH3BxOjGLo2rmABoNXBnU1lr
         VhVg==
X-Gm-Message-State: AOAM531UbrdOu1s125tcaxKIDYomvNF5kH5CjazQb/WuXfm1TBFjjMYo
	+0l0aJcNRL32tUG2QX4sNmvpAg==
X-Google-Smtp-Source: ABdhPJxA1wMIZIGUgtuPkpdY/RAktbpTizjH8KR7cITvqOiqvQ5yVf255rFMO6LUDAOhYY4KuLweGQ==
X-Received: by 2002:a7b:c3d8:: with SMTP id t24mr5440609wmj.77.1622643306941;
        Wed, 02 Jun 2021 07:15:06 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id i12sm2824697wmq.7.2021.06.02.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:15:06 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH 3/9] libgpiod: fix RRECOMMENDS for python bindings
Date: Wed,  2 Jun 2021 16:14:55 +0200
Message-Id: <20210602141501.6174-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210602141501.6174-1-brgl@bgdev.pl>
References: <20210602141501.6174-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RRECOMMENDS for the python module doesn't work because it specifies
the module itself as its own RRECOMMENDS. Fix it to recommend the python
package if python3 is in PACKAGECONFIG for the main package.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index e1c0e8922..43264782e 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -32,8 +32,8 @@ FILES_${PN}-tools = "${bindir}/*"
 FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
-RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
-RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
+
+RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '', d)}"
 
 PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
 
-- 
2.30.1

