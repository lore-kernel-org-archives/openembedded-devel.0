Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.13558.1622643311293027778
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 07:15:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=dUm/NCj9;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.50, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f50.google.com with SMTP id g204so1397548wmf.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jun 2021 07:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hfi2AWrQ8LIzVSh9nfTMepzkYtPHy7VRrrC8DlGV6pI=;
        b=dUm/NCj9xoout/IFOQ1cCxCi5uakMDCQUxW3ZjIGoStQ+hWVcqQWKP9z5C06hYFrBm
         Lk6ynTEYjzqRTC1VdyZWrx2uKWrveatFF3fX+FctfAWQc22eim2eyu4neEvHaV1EABtM
         dS5Lw2mLtHPfQf3ZlYqHoCGU5csFPohsiC59sNgjQi0vO54jY7dkp4cix50qO0uqbbQr
         X9BFUEGv0l2ec/RW23Lit59xPvoubvqhWmQO8GtFjmwlcHSnZS1fdFqt6EbOkDGv9KV8
         8gbPMOacFMmVdbdR+0Pfbx8j07GT3lieBpXumN89RQZxcz0x+IZj6oV/qVpLLUPTjFU6
         3TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hfi2AWrQ8LIzVSh9nfTMepzkYtPHy7VRrrC8DlGV6pI=;
        b=bZ6bZ0v/sj0TLGKpcFapIDHkdLSGTgr+38ipITPWUpy6LUyoV8G3VFSVu7wu6C+cmz
         GdqTMJNR8vFGYajL9Mi7kHI52RQ5CwZG9qSSr/mgiBH6M/4Zsy0HSxPBzz7FetuM4joe
         bjVW3ChUh3y42BoCWJy35oWrxpY2lh74uYQqrj7tLAOTUx2jyuzNf8mLBmsUy22VWzoR
         b1v1eeg7R4dSzEfjAioHp1UyfAsYEGDmuGr/JeHj4VBqyOA1e0e7EZx2nl55cha3en7h
         Z5Kisi8pfr0GXhewg+QAckH5jj+MpxeP+KwL+Z6Ysyn7BBfM16j/kBzyCBTchb4gkJe3
         Dr+Q==
X-Gm-Message-State: AOAM5318eoCsLJysKcjPT83vFlM/eDOS5J1Fvy2RlYsq5zKhrZrOSSOC
	W6y+MqPI5An2gvikB4ePE34J4g==
X-Google-Smtp-Source: ABdhPJyJxp2l6kgvbLruPo+BbaVOHQR+VXb14C5E6uO6k9HoH4GsCtfiDAjHjRLPkzTEJrymVtnapw==
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr15196956wma.70.1622643309973;
        Wed, 02 Jun 2021 07:15:09 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id i12sm2824697wmq.7.2021.06.02.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:15:09 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH 8/9] libgpiod: ptest: warn if the gpio-mockup kernel module is not selected
Date: Wed,  2 Jun 2021 16:15:00 +0200
Message-Id: <20210602141501.6174-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210602141501.6174-1-brgl@bgdev.pl>
References: <20210602141501.6174-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libgpiod test-suites work with the gpio-mockup kernel module. When using
linux-yocto, it's enabled using the gpio/mockup.scc kernel feature. Check
if this feature is present in KERNEL_FEATURE and warn if not.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index 874453fbd..febf625a6 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -52,6 +52,13 @@ RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-py
 PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
 
 do_install_ptest() {
+    if [ "${PREFERRED_PROVIDER_virtual/kernel}" = "linux-yocto" ] && \
+       ${@bb.utils.contains('KERNEL_FEATURES', 'features/gpio/mockup.scc', 'false', 'true',d)}; then
+        bbwarn "libgpiod test-suites need the gpio-mockup
+module and will not work without it. Consider adding
+'features/gpio/mockup.scc' to KERNEL_FEATURES"
+    fi
+
     install -d ${D}${PTEST_PATH}/tests
 
     # These are the core C library tests
-- 
2.30.1

