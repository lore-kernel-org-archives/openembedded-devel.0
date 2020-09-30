Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.65.1601506920199492643
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 16:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eeJmRMEe;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id x123so2470097pfc.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 16:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BMGakTMbI7afhBCeYdsutqooWXZOAgsmc1k2czOFjnA=;
        b=eeJmRMEeXVV3UpUIfpFx9UQfWsrdgXeW3hVo0HxWq6mT2JY1389uLDP6tGHrzvbnZ1
         rgYeaFCy4FH6RCHA4I6bJlDVpj+rPdvoGHSj5/KePTikRsaMMmPEe8wqp3tcGrMniUOr
         djupX0Dn1HknpH2Qhz2SrcxM1DZ+nQZuiDL8RKkHuUkKt0UhKT3ZLJxEUyIjxkPTphC2
         2bTEvM4DNdYbJKkUuArzW+gg/1ecDQnVzQrqlyvOdOlhAWxy4J1vn7wienWoZdL9NqQR
         URa0vl45gOFAmUyb0A+pXXinEGEJRbD/ZVSUt5rjwoGtzd6SZWvEDKl3/ICqxvZZZa+M
         +yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BMGakTMbI7afhBCeYdsutqooWXZOAgsmc1k2czOFjnA=;
        b=TWNIuzjktfN48EJ4DXIyjzXeZkpMwhkX06QhFC/twKfc8K8VC8pqPJLpc7tRnR1/Bl
         uTBF97eUqDBGvx2uOVOwBQeYu+nl8fsMCeKu6s4KQfL6IajK3c6sG//dpJCkr6AcowqG
         76ONdBArRpD1Jc03EmEtL+7wMO9J12ILhdhNfhTVqJf5QjDInN7p1JwqZi9VzfL5qQOU
         dmLmtM7DB6L8l3jZSot99ScRy7KDI/vQec6xp6kY6R4o7gjwlpnQEUHk4OT0Lj1EbW5f
         lAs3+WqiuOvk61DZsZB/kyobz4/kKF4ij1Pxp61tzxix+bWUEVuddQqcDymp597WIUnS
         smIw==
X-Gm-Message-State: AOAM5333xjEzFHCqgadfW54LJ3NdYhK4zgbF/SG8KLnVR31Ebg36L6h/
	zTqe05iSEUUZ3RHHDgfho5f9Uk4vrFIG7g==
X-Google-Smtp-Source: ABdhPJzRo73k1tOdTExIxFosASrcpr9egk0u1w81Pr4e4NrDPEEY/DWF+ibRiXvkuMk8w/CPKGmZHQ==
X-Received: by 2002:a62:fc51:0:b029:142:4506:9a7b with SMTP id e78-20020a62fc510000b029014245069a7bmr4376203pfh.28.1601506919299;
        Wed, 30 Sep 2020 16:01:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0:923a:5c32:ada4:3e27])
        by smtp.gmail.com with ESMTPSA id b11sm3514939pfo.15.2020.09.30.16.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 16:01:58 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] numactl: Link with libatomic on rv64
Date: Wed, 30 Sep 2020 16:01:56 -0700
Message-Id: <20200930230156.3686808-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
riscv64-yoe-linux/10.2.0/ld: ./.libs/libnuma.so: undefined reference to `__atomic_fetch_and_1'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/numactl/numactl_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
index 75e4435db0..2fadff1956 100644
--- a/meta-oe/recipes-support/numactl/numactl_git.bb
+++ b/meta-oe/recipes-support/numactl/numactl_git.bb
@@ -25,6 +25,8 @@ S = "${WORKDIR}/git"
 # ARM does not currently support NUMA
 COMPATIBLE_HOST = "^((?!arm).*)$"
 
+LDFLAGS_append_riscv64 = " -latomic"
+
 do_install() {
     oe_runmake DESTDIR=${D} prefix=${D}/usr install
     #remove the empty man2 directory
-- 
2.28.0

