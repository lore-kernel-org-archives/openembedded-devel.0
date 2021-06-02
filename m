Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.13763.1622643307768802204
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 07:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=tQDbEONh;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id z137-20020a1c7e8f0000b02901774f2a7dc4so1359665wmc.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jun 2021 07:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gv3A15iOfag9h6p8RdzaboFnQPaxS5PgYuQ0zB79zKY=;
        b=tQDbEONhcFxtp2N9fk7ZbrxYhMsECtR2TBCgJ7mpIhPX5SsN5kwW4n+rbylNJ7Qu8/
         RvJ6Ux+OALbfkSuNCqUtx/U/StcgLyFAGg57FoOTNkQ3IsBo9XXeU84xVNbCMSi3nSr2
         Qfw9V2a6Z7cHrN51KpJSgH3IwI8XwcWQicpQeVDYRtDqibq+ZplScuhpZ/16yEOjQcYG
         Q7l00xKMDQ7E99A2QxOgCDXA/dtshA4cszDASvc+CFmPePPFLvlqibx/oomym/kDOuMM
         UbUnotoYt6BlZL0FpNC5FJPSuqoWROpT8k5g1EzWBRKiclR0Yl9hs3lyOkGiBRlf6pBA
         DP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gv3A15iOfag9h6p8RdzaboFnQPaxS5PgYuQ0zB79zKY=;
        b=Crf4PKEmM4LsUzEi30+DZFkDOWuVe6kFIQxYocgDnsmUmPn1m+pHDYEw7ikle8RHIx
         0EZ31bh4oPCVMorGkaRj/ZeE94Mi+u8kOMxuKuzzy/I9NIoiKm4rmzVAevsUiFxd9ol5
         qp9eiU/NjJVKDcxxGz3sZpypVRko1NBpX9DIot7VkNGcEPb4VDlOl5HHi2hpBdjBQb4+
         tduJmzoy4SqrNmkYh0z6wwGRhz+rmuJcak8RKIgLQ6+UJuh/V9JZxODEGuo3wxGxaYFd
         NzzsqNE/IoyRYlP9wq+VPGe4cgHBnCSW3y9jd1924aQHsdTgPSgHxGuJC7l5GJeIt4wj
         glXg==
X-Gm-Message-State: AOAM5324DwvyOuriKKpCFy27uCy+jKsY9VWGtsm3QoHtEEg8zD/pX2XO
	JWowk2e5iYsVFqK8GP4BXmXtDg==
X-Google-Smtp-Source: ABdhPJzm+BeIheYp37IizbOtXcRBfi/GxH5C0teZdjPpFNtcOQn488sM2myU6BnAfrcwJ3x6q6ukXg==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr5451710wmi.116.1622643306310;
        Wed, 02 Jun 2021 07:15:06 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id i12sm2824697wmq.7.2021.06.02.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:15:06 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH 2/9] libgpiod: list all packages in a single assignment
Date: Wed,  2 Jun 2021 16:14:54 +0200
Message-Id: <20210602141501.6174-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210602141501.6174-1-brgl@bgdev.pl>
References: <20210602141501.6174-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't have assignments to PACKAGES scattered across the recipe - use a
single place for that before assigning FILES.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index f51906a43..e1c0e8922 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -27,11 +27,9 @@ EXTRA_OECONF = "--enable-tools"
 
 DEPENDS += "autoconf-archive-native"
 
-PACKAGES =+ "${PN}-tools libgpiodcxx"
+PACKAGES =+ "${PN}-tools libgpiodcxx ${PN}-python"
 FILES_${PN}-tools = "${bindir}/*"
 FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
-
-PACKAGES =+ "${PN}-python"
 FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
-- 
2.30.1

