Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F21CFA748
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 04:23:51 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.15276.1728015828510999840
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 21:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OZen/MP1;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-718f4fd89e5so1679203b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 21:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728015827; x=1728620627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RrEoQ+b9LDJNeHOS/7al4y73IEX+Rr+btiVg0V/SyH8=;
        b=OZen/MP1KXuI4oHg+dTG4Jqg56spPn12j+7LM0VQauzkyitX9fhYJAK7y3xoJ+fpMD
         ll+2DHsPyB9CNa/Cr1bs6qzhaIUh1Q46S9/eyZ9CWsIMThoYEL83fFcentCGM1+P5TFS
         8akw2VRcNu+bpMjfevo8d+xmcnDfL6mggozP0WiVYc72A7+6m5hEWFhvpi700DRewoud
         B7VoIqreosL/a4JFBZTTO1uFHukM/1CoQGcX1E8qBpt60/yYFUWK399K23WL6yJORFZb
         9C5aOWg83Q/B8NitftNdeyd+hGtCjw48YBNRhgfVCBoH71c1gxNKmpSk9Yayr6A+pztf
         +rJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728015827; x=1728620627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrEoQ+b9LDJNeHOS/7al4y73IEX+Rr+btiVg0V/SyH8=;
        b=Bjtu+uhhrP4ouqEhMNH+YKvWKUbe3yJkUOk+ByvUWhTVZcBwkMO27ZhpJfPc6LiEM/
         TBTGG5JSIWJRSfXLUUyzWTxWXk5PUdD3l5CkFj4jfBQIWAZdEqmF+m2vcFIRyycDZtT8
         UX2k8Th0pBwR16HgJ5U+hahrfQ29iNRUEZZrcJI7d6MlYOIfeJT/qG1VayvXrGQGAaDs
         +BuXkbXdL8dIe8Yrvyq579wZPVAGWjvrGJ2PeyiEdhY5INluxoag6T45/pLQbsMeLuNn
         PxQVmUb7lFw9brV0dG8E4lc5eKrpvtJigTkgkmwZtDTtj9Dw28yW5c8s0iKeWIUq3vtl
         /blA==
X-Gm-Message-State: AOJu0Yz/W//jqSIJ7DkRZfyU6fVFpA2vMU//U+0YZmwux1YSDD1Ciw5X
	I2t/5CyKe06ReowwZrLtr8M3tF2/Pxo5vaNc2YHoGqBXgCCJqnqiLZ1Xg0zN
X-Google-Smtp-Source: AGHT+IHwcKNvujRbDz5ro4lr2mnYkp/BmjO4vFb47N2E9UlPP4WSMOirC02Z9y2Uy8BM61GR5/uXKQ==
X-Received: by 2002:a05:6a20:c78d:b0:1cf:42ab:5776 with SMTP id adf61e73a8af0-1d6dfadd626mr1782235637.32.1728015827272;
        Thu, 03 Oct 2024 21:23:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::1340])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9dcb1d523sm1558810a12.53.2024.10.03.21.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 21:23:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] sshfs-fuse: Fix ptests
Date: Thu,  3 Oct 2024 21:23:44 -0700
Message-ID: <20241004042344.999232-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 04:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112654

Symlink to sshfs parallel to test dir is needed
during test runs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest         | 2 +-
 .../recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb          | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
index 5a926dac0c..fd5af0b026 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
@@ -20,6 +20,7 @@ SRC_URI += " \
 
 RDEPENDS:${PN}-ptest += " \
         python3-pytest \
+        python3-unittest-automake-output \
         bash \
         fuse \
 "
@@ -27,4 +28,5 @@ RDEPENDS:${PN}-ptest += " \
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/test
         cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+        ln -sf ${bindir}/sshfs ${D}${PTEST_PATH}/sshfs
 }

