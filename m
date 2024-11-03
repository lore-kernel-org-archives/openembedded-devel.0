Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A4BD1118B
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 18:31:37 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.41200.1730658692948021746
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Nov 2024 10:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jlbBS2x1;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e983487a1so3071554b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 10:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730658692; x=1731263492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3DEbfWnbSJnQBKnSMW+vpudOvXfZ0l3G2OsqtlCsVL4=;
        b=jlbBS2x17ky3kswlBlSzalQkNqoLCZpd8UF1E/ldEqYK+84rQCIO+DU2dza3YCSAqW
         xeMWjGfrveMuVeMKaV32PMHiSKFY+Mq2T1qaa96yriJPO3aqVuSRZhkzlMlvF9Nvb/xu
         6lokbu2XBTBkIb38/N0k6G9bEPqP5OEYI1202mDQHwBTvlq9VjXwUpDV2n5+pncyEk70
         6TChEUqRYtaL1PM+fAaVD0697OoZ/4rJfFXfBefaLSdsIPAdognr/5dNWGUtTm70mllC
         ca0JgtSoxQCBM+ue7fQo4e+LfNrbnGRKz+dacwbiJLzyIYWlloAggyulzzAafm5CA+Dv
         lozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730658692; x=1731263492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DEbfWnbSJnQBKnSMW+vpudOvXfZ0l3G2OsqtlCsVL4=;
        b=tK7HP3EYzebLktoZQz/Fey1EE7XLz2QE7Kw68948iiKn0aRl3RgmHM7pZjsuhSes75
         1PbZMu0yJUgDGyceg0JB6oDYfFfPDMuhr81f4fAqM+2KuLiuTW8F2wvdSQg40rvmU/BY
         /XWDzZpQ6qaQhamAAeBHyVVquCIs6nOoIfqmml18IvauvtO8cxlZmpI1eqdpi5ew5aFk
         u0be//FKJ8f/U/qX70F5FIgdfaezvIVoiIB/xRxOWyQ6FQgB1es32cbu2K+uYt7tYv8C
         zMYrB0rvdivhtHFnRg39eXyFoHUdssIiAoNr4uPVvWy4gmKHe5MmeKRGogx5VG0KANR1
         zUOg==
X-Gm-Message-State: AOJu0Yy/C5JqgK0wU8YPbRk2hIYgtpSpChkGL4t6KUM/iYFCVWXso1vH
	6zWSsN8/CrWgS7RumUbRshuUs7KkciEaWhs2OBGaRupHoEowy6A4Vqe8GUg2
X-Google-Smtp-Source: AGHT+IHYk/wTBpfGSOTHlH4xxobWTW02LoCf6rn2gVzGQgiaXRDEU0FzH/8kd7ImRNcRSBCqrysalQ==
X-Received: by 2002:a05:6a00:a1f:b0:71e:4c01:b3da with SMTP id d2e1a72fcca58-720b9bb3f0dmr18079285b3a.5.1730658692019;
        Sun, 03 Nov 2024 10:31:32 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a7c0:1be5:78d:7a64:653a:de2d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c3dc6sm5906664b3a.102.2024.11.03.10.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 10:31:31 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hiago De Franco <hiago.franco@toradex.com>
Subject: [meta-oe][PATCH] drm-info: add recipe
Date: Sun,  3 Nov 2024 15:31:01 -0300
Message-Id: <20241103183101.27559-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 18:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113398

From: Hiago De Franco <hiago.franco@toradex.com>

This recipe provides information about DRM devices, useful for debugging
and checking information about DRM.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb

diff --git a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb b/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
new file mode 100644
index 000000000000..9f1cbb47fbfd
--- /dev/null
+++ b/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Small utility to dump info about DRM devices"
+HOMEPAGE = "https://gitlab.freedesktop.org/emersion/drm_info"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
+
+SRC_URI = "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https"
+SRCREV = "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+DEPENDS = "json-c libdrm"
-- 
2.39.5


