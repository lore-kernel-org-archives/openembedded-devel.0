Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A48CF6497
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 19:57:14 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.39304.1727639832649229946
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Sep 2024 12:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FPImXmCr;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20afdad26f5so47482815ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 12:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727639831; x=1728244631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c+bQiFNEIaXIXvd6HLLZD+NghVdAK1jVpj/3L3c/IjE=;
        b=FPImXmCrDewH97x+Ag/6ftymEWltRQ87ry2hA2/t721YEjHEkSkrjzdNhTAVughnnu
         OhuTWvbo8wa+QrbcOV4GCcro8z+6iCz+YeuUzQs9VOqq9s3I0x/ScOX74HP5P+siYLt7
         vleX8DB02slXYFWpCtlni2e3U1GHRKRUSAxWM3gpDqhPmHnFAB8O8dAfVxeQkJAB0GNC
         DGsMK4HoLk7wB0DJ8GqqkE9VsYxaHEmysA1aEZ2Bz9a8jBZlVREoEKTrZKb0lXSzwp9+
         sCsHFy82x6GSUzR70MTk0PgRbz9Jy8Wgg84LVgq5PLzqmFDktW6XS24VLcQr/5kjVGz/
         QrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727639831; x=1728244631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+bQiFNEIaXIXvd6HLLZD+NghVdAK1jVpj/3L3c/IjE=;
        b=dYB+03nv5jKy59wqZ3gc168nur8dewtCqmW/o+G1WJDtWAz8EhZBLNpUg99joA2MK9
         olTiKql2skcA/Lle8O1RRIAZQt5koMXkbreFn2jpPcME6JsX/2pVBUtUIeCPI0l82in2
         CgwH7ovTgYDPF/ZUQ2jyj9GF249eE0JOykYE97+MvNZvsjBvPTL+pyj86FSJMTY/LTEC
         z9TmkieLJeVLbJ1Ci8xDk17jwetsqzMzd8g/OFCfgHrAQ78Jmis6if6Tl8m/q+zlIwwo
         s00Geac35AQNmtgfyAVywtrJ5fFr1t0fgHVjieQgnKv/+gsQa3P9ybOzl9j5lKyIjMZi
         UA0A==
X-Gm-Message-State: AOJu0YwBpZm1EVsw/YLUNY+tpaWQtZLAuJH7oows9he2195tQe/QuHwb
	eGSTuH54s5EcwQodKgFce3MTrM3bg/bVultqxge7YSt0dPpQhOG3rOTGEQ==
X-Google-Smtp-Source: AGHT+IHFcxfsZ1npKElVFiSJcpEbRYcyJMpvWsygTCkxsM6iPZoO1eZWHDv3hhs5BpO6SONpXvAI9Q==
X-Received: by 2002:a17:90b:810:b0:2e0:8bad:6ea4 with SMTP id 98e67ed59e1d1-2e0b8ebee27mr11557063a91.29.1727639831341;
        Sun, 29 Sep 2024 12:57:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ae14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6c74071sm6335984a91.18.2024.09.29.12.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 12:57:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] python3-scapy: Upgrade to 2.6.0 release
Date: Sun, 29 Sep 2024 12:57:08 -0700
Message-ID: <20240929195708.3151070-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 19:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112557

Switch to PEP-517 build backend

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-scapy_2.5.0.bb => python3-scapy_2.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-devtools/python/{python3-scapy_2.5.0.bb => python3-scapy_2.6.0.bb} (95%)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
similarity index 95%
rename from meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
rename to meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
index d57cb977e4..ba21c46055 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 # If you want ptest support, use the git repo
 # UTscapy does not exist in the pypi pkg
 #
-SRCREV = "0474c37bf1d147c969173d52ab3ac76d2404d981"
+SRCREV = "f7a64114b35fd8ee63ce07290f8a2dffd52b215f"
 SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https \
            file://run-ptest"
 
@@ -24,7 +24,7 @@ S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-inherit setuptools3 ptest
+inherit python_setuptools_build_meta ptest
 
 do_install:append() {
         mv ${D}${bindir}/scapy ${D}${bindir}/scapy3

