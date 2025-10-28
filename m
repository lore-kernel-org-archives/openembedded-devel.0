Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A62CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 20:28:41 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.22751.1761683314807508096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 13:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ogzc65HA;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4711b95226dso81159065e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761683313; x=1762288113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dwm7rTHVSdW36MsCT9l3nVE9ZhwnsV58QFyhFdxj3lw=;
        b=Ogzc65HArlPTtW8sJjJvYo5Hv3DdvZRrI+kh/Ysn8Fff63ngCSHo9N5OnU02PWvkBn
         0eOzawB72voT75N5ZiNx6W9un0+HvPniZ2sfeLRRiEPsQxM/iCUhDa4lGi+PEfRlbMyn
         qPG80tFbJBgTx+mpVHICF5yanL28yI2bVHV0NUPGzAau8zk7CzxuOb8w3C59k8egAXnP
         LkoBpwUJpPT7gnqhRh9+pksuORuIUQ5hxad+NZG5b5IQf4dWpBVanMy7lGFAkYkXvAuF
         guTmzSYBnOgxYc4xEiscoBpyTcg0aMxIQ53oYkM/I9mmZAkRoQyex4+9nYYw65wT98Lb
         6F7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761683313; x=1762288113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dwm7rTHVSdW36MsCT9l3nVE9ZhwnsV58QFyhFdxj3lw=;
        b=iiIH0AFLecokiWEaxGKPu2d4QDJl1vpevQqj4q/+5wxLtdY4m7zwPjSxB5DrERcfrM
         vOz897Yf1GNRbXGEciJHvfx1jX5buVwmOkYNmGeCFxewmMNZ945mnYl/b4eRuB7EpxTj
         UYilMKhl9mqEQAY6mKUF+H2xFDeCpr0WHy7uqPqVD8D4VqaID0yQk98eSwr+AXE+yPrG
         VwaT3TJNN4sNXhxbrUaK56adeyP/2qf6UMrsSn1lkwcRU0UjLHPzj5ovjySqD41QTmZz
         XpfUtmqT+NSzXz1QQ9JPv7LQe9sUDC4oTr+01qxBmBLtgDwzDdjv5Aua/st+VChr4C+W
         NmVw==
X-Gm-Message-State: AOJu0YxJG2tnjh8w8b24rkN0e5LoJ1VHm2E3o7KG90qYC41nZ525TZBH
	totI0nGE0SfA7rryE9oIRCcY0dSl3aIGiMVzw0P+2va7HcNZN6bqd+0roI115fMg
X-Gm-Gg: ASbGncsP7acP1urxXNj/A+lIakotCom47jdo23CGtmjQeGr9Jm4TW/d0RxyhmYciSh2
	Aja0ls4qNi+CYvv3nUL6GsQBTP3LogcW8CfNwjFGCwYN4hDwiKZoPcMD3ZIDZxYUivNB2Hd0jlm
	waN3rOw/hMVPuYrkV2EDcgJkU8lMS5e/hvlE7RutwS+wqUKJEhyRgt2ZPqjG8/E9PzbApiBjgYe
	NwD5+uc5Kp4P9Z6H6FZeWSk7NxvZLX9RbOG9WfWVuVkdIB+pQC383ad7PlFy5fT8P0K04URwJQY
	VdNiTwcVifpg6HhyJmsF0tpoV9pcvJrn9pcGjhgw39SpzvHpmXWCbLMp6Mjm8JAJviJ3DPOslFP
	XWxboz9rCv63MLgZmHaKG5I7QyVmMc5sl/rpRItv26PWl1s6MRuEogXTJCRTtMpVe7IfmJKuVRQ
	==
X-Google-Smtp-Source: AGHT+IGsH0P3R9xi1Nyx8E9SdLKNWMAeVI+RzyDOPRoWuaUk3/YtU9Jbyz+5t/3dMB8P/tw9K9V4Eg==
X-Received: by 2002:a05:600d:8310:b0:477:b83:7d1 with SMTP id 5b1f17b1804b1-4771e84ef93mr2516485e9.40.1761683313105;
        Tue, 28 Oct 2025 13:28:33 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3a88fdsm10093355e9.10.2025.10.28.13.28.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 13:28:32 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][kirkstone][PATCH 3/3] sshfs-fuse: fix ptests
Date: Tue, 28 Oct 2025 21:28:29 +0100
Message-ID: <20251028202829.2311091-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251028202829.2311091-1-skandigraun@gmail.com>
References: <20251028202829.2311091-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 20:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121101

Disable host key checking during tests, so the test can be executed without
human intervention. Also add missing dependency.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest  | 9 +++++++++
 .../recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb   | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest
index b63c4de0d9..b10922d02e 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse/run-ptest
@@ -1,3 +1,12 @@
 #!/bin/sh
 
+trap "[ -d ~/.ssh.bak ] && rm -rf ~/.ssh && mv ~/.ssh.bak ~/.ssh || rm -rf ~/.ssh" INT EXIT
+if [ -d ~/.ssh ]; then
+  mv ~/.ssh ~/ssh.bak
+fi
+
+mkdir ~/.ssh
+echo "Host localhost" >> ~/.ssh/config
+echo "    StrictHostKeyChecking no" >> ~/.ssh/config
+
 pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
index f91e682d24..bde0949992 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
@@ -19,9 +19,11 @@ SRC_URI += " \
 RDEPENDS:${PN}-ptest += " \
         ${PYTHON_PN}-pytest \
         bash \
+        fuse \
 "
 
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/test
         cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+        ln -sf ${bindir}/sshfs ${D}${PTEST_PATH}/sshfs
 }

