Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.5245.1587597503594464184
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 16:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pxEdU0Uy;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id q18so1881837pgm.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 16:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=04HrNqgKby9wpMIjASsLj23Cd2aYLr+r2a5f/qOsQeg=;
        b=pxEdU0Uye1Qe74Sl/P/y26smN+U8HmH5Kp2rd5t8Iz5g1Cyu/lg3XaVT3lbkLac7se
         Wj+wRwUW6VYG455hw0zCN1REVo72mP4uEytxOhamC/U0Y/jRJzlft7dZeWCQZWDrWdQF
         vbhSDNYDxTL4bDAottHUWWNqwixnwIHe2/O7trXP4DXY5xxhauJWrp8VSwVQ/OLmHFkA
         VJbA6EOkxKba2LHYzN24eZuewV9fcPYhpDTf5tVLpVOwuxqVyVpNJ2lXcPGoNNn8JTiI
         xC41EK4zn7X+YdpM6kesfRNA7YBX/mtqFLwU5teuQvu4ookbQFJIjbKT+qOaieZZFnh7
         d1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=04HrNqgKby9wpMIjASsLj23Cd2aYLr+r2a5f/qOsQeg=;
        b=BNZgvA0uwfd9UBZ5Jfl7I1BjhR7zB4cfB7ktMZyeyHL+grngqGFtVoIqXdA96QwZcK
         zg5HDFY63Y1S9rC447w3+Gn/JPKKsJA7Om+gop4XA5lYRchC2WAzYMTY6L0bkqkTfGYW
         oeO163BdULlbVusWAyzWy31xg7hqPWh3aKNTyl6PCPHm6Fv/FnwSEyERA8WJWSqTUF2Q
         qzqwCiKn9EUXqNtAbf25yttHd4MMOKrsTIMRBsgQKuTiSTzQGUHp71JI/dEDA1qouBHr
         48injKPL53iWWLDxdxpq/oHwCLfumuOjPHhfSg1AS4+rbx1JUE3XuApxMpHb8JDnW2MD
         f81w==
X-Gm-Message-State: AGi0PuYco70h0RDxUbIBnfBztR6hQJYenIERLk0XcMKgzXZTGd/ukr4D
	6h8MmH2JiJLkcjNSQoGKJ/Lik7fyRZY=
X-Google-Smtp-Source: APiQypJQoKXskqjDAmlmqQ6uXzyEuVmrn2+sQkfJsI9iOFXcDvws+PJ3257WCiKwgTHARajhuOWEqA==
X-Received: by 2002:a65:62ce:: with SMTP id m14mr1372316pgv.174.1587597502645;
        Wed, 22 Apr 2020 16:18:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1a60])
        by smtp.gmail.com with ESMTPSA id g1sm311213pjt.25.2020.04.22.16.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 16:18:22 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] crash: Do not build on riscv
Date: Wed, 22 Apr 2020 16:18:16 -0700
Message-Id: <20200422231819.1029522-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep mips64 exclusion as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/crash/crash_7.2.8.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.8.bb b/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
index 5fc25f400a..834c92cc46 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.2.8.bb
@@ -38,8 +38,12 @@ inherit gettext
 BBCLASSEXTEND = "native cross"
 TARGET_CC_ARCH_append = " ${SELECTED_OPTIMIZATION}"
 
-# crash 7.1.3 and before don't support mips64
-COMPATIBLE_HOST = "^(?!mips64).*"
+# crash 7.1.3 and before don't support mips64/riscv64
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
+COMPATIBLE_HOST_mipsarchn64 = "null"
+COMPATIBLE_HOST_mipsarchn32 = "null"
+
 
 EXTRA_OEMAKE = 'RPMPKG="${PV}" \
                 GDB_TARGET="${TARGET_SYS}" \
-- 
2.26.2

