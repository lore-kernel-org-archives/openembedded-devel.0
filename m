Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.1329.1591500283546819061
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rY/RYPVu;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id g12so5277914pll.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=P+ZlmovUPQ64HUVzGloQPuBtTrYHRITRZU0dSSqgiP0=;
        b=rY/RYPVumskj8S2lwu8DA205xq/8nLVM+H261vnfrsC+3k5KWvga2RwtRPVwMDd+Yh
         ZqZiGUuNeSPkErBot3lB+c2TRLloewSRSO2AmbH2TKSISCNJe6ef61C4ziy/cK893S5Q
         C36HDnovoHuheG8cJjVJejDYVQ2E8BCd7d0Z3q9xiApjWJ7e7w/XSCItlxU9ZjMVQkWy
         CaG5C5h9x6Q2QGZPT+MPNVuqKMAUq4W9SAVzJ0U6X4Ij0nI+qoVYgjythmzR+d+RrD91
         p2hGj/0pQbZxPgHnRJU6G8OuQ3fjz+HO7FcaSU/KPBm0hR+N3EWDRPJ806GoufSW1KwG
         kNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=P+ZlmovUPQ64HUVzGloQPuBtTrYHRITRZU0dSSqgiP0=;
        b=Hjb6dZXJP5dSvpXUTOLM/c+reey0ZkivKp6808CwgWC5iulx6KW2UdFBnwHPaiqirH
         48GZEhRnFNbEC9fUrw2bKzLjm7Nd06SRRwxVmfSCDZEA9F9Lr7PGsgPvAvZsvT7eLraM
         ECh7WzvD9ez5IS9jGQLB8py3J85rtZg9Iyc3cipgBMF4qYKvH3VayJryGzVXSiCVs27P
         uvJLAV7ahvNxlsZOmc/rAdM0VnagfnPTL2HFQb0SrfoTXhepV0gLG0k7cXxpPIou2RpZ
         s+ay19gcz6dRSfdtK0FiBElOCuumzwj9kmOTPmjtDn2C+8IDVi8NCZcVbljXM2GGvA8f
         nQXw==
X-Gm-Message-State: AOAM533GG1YnqugGVxFVT1UXzb5wHS19r5MtoR5MkcmZwj9KiSYEqCx2
	wiU4Uj5DyfNbf2fvpW3VrqqZaRob
X-Google-Smtp-Source: ABdhPJyjT5T3JeqbxTw45EpWQWOd0ppsGBuZX4FjofzuUT61vvM7ONzE821seKGTPwr1FP7aL6reTA==
X-Received: by 2002:a17:90a:d17:: with SMTP id t23mr11097927pja.77.1591500282959;
        Sat, 06 Jun 2020 20:24:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:42 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 02/26] irssi: package libirc_proxy.a in PN-staticdev
Date: Sat,  6 Jun 2020 20:24:12 -0700
Message-Id: <aa986b229abb5db33e2862b53f82d4a81a1159d5.1591500139.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  ERROR: irssi-1.0.4-r0 do_package_qa: QA Issue:
  non -staticdev package contains static .a library: irssi path '/work/core2-64-oe-linux/irssi/1.0.4-r0/packages-split/irssi/usr/lib/irssi/modules/libirc_proxy.a' [staticdev]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8a84a0f802747798c7f35abc4b9e158ee3f30729)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb b/meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb
index da5403e5c8..1c5a912f27 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb
@@ -18,3 +18,5 @@ EXTRA_OECONF += "--with-textui \
                  --with-bot \
                  --with-perl=no \
                  --enable-true-color"
+
+FILES_${PN}-staticdev += "${libdir}/${BPN}/modules/*.a"
-- 
2.17.1

