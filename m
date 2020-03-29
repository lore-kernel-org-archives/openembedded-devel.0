Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.23449.1585468357003094367
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 00:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bdA7QC5q;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id m15so5864311pje.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2020 00:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qXtRriGCvw8iXEY2+iFnJ+nnZK3WyNYfoAyKLy6AfCs=;
        b=bdA7QC5quc2CDGWTiIT6oBLFJYkhyAeprwU+WE96ABgAfUoWsybd4RorLeqm/cc+Fu
         tP3w7KCwGeWy/L/X0wj6w+xAppmteVqbI0XvAK+G41wF9SUikI1RKrFQYc6AONTxgCNg
         NEPYjyuiL0M5ninkLxfqLikN15ZDpH5eFEswM9YPmpKdSAya49/6bu9strYXicvpIzpg
         CgmwpY79p2Oq6NUEGgfDYCSGxaEJcM55HR/zy/XMmkkRps7C1/2zhq5K8KkIPYQc31q/
         CU+uHL+b5GIMlc+nPVEH+MLRevUtt9yFu50/gtFxBeONcEZmsh0phWY1MOfb/p2rpWC/
         peHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qXtRriGCvw8iXEY2+iFnJ+nnZK3WyNYfoAyKLy6AfCs=;
        b=oiPM/5ZRI3CJHlx2Z90GmWlPnd99+0uv+MP2G5OmYdcS5zguAVaJAdCpns0x7V6jcN
         hlH34UdqRlynfiaLW3x5EvBDFvGRahF9AC9VnpxaNov7tIka/R/1a7o2LfTAN9O4jmUc
         gvQ8uqcIO/CPoOEm7eSjPVsfrCSY1HNkwmv5tvWoxaMEL4m889XOFpkjmMdv0THh0c7H
         uZdSFk/nmPuonPFkLe/F5MOIaztlkAQ4glLwsoYyUuDUa7h8iklgjq+jwNslLBtJFkb1
         9XzOBsURJe49PvjqyV5MgMMzFjMQbK5p+8Zy6bCMZM4qbSH27D2U/A6tBL2r5Z6lMr/a
         oReQ==
X-Gm-Message-State: ANhLgQ1j3qahSueqfkdzGZPbolXoUnzPssoAXngNdXmBD5LflZFCN7gc
	LitBwQ18ap4nx7tD66sFFSdMgcR3c3o=
X-Google-Smtp-Source: ADFU+vtwTjr+LGGuiF+T2D9IFAj7F5hHwpGH04AM6YAJP0XZhSGsqzVslSO/FhSvyacWy4xpwgKS+w==
X-Received: by 2002:a17:90b:4d04:: with SMTP id mw4mr9112095pjb.180.1585468356088;
        Sun, 29 Mar 2020 00:52:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49c5])
        by smtp.gmail.com with ESMTPSA id gi2sm2823099pjb.30.2020.03.29.00.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 00:52:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] xfsprogs: Set OPTIMIZER based on global opt level
Date: Sun, 29 Mar 2020 00:52:47 -0700
Message-Id: <20200329075247.1590898-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

default is -O2 -g and it overrides the value passed via OE's global
optimization flags.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
index 34b3386405..433ce47739 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
@@ -35,6 +35,7 @@ EXTRA_OECONF = "--enable-gettext=no \
                 INSTALL_GROUP=root \
                 ac_cv_header_aio_h=yes \
                 ac_cv_lib_rt_lio_listio=yes \
+                OPTIMIZER='${SELECTED_OPTIMIZATION}' \
 "
 
 DISABLE_STATIC = ""
-- 
2.26.0

