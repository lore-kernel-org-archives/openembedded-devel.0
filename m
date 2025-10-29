Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EB3CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 13:40:58 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.6363.1761745253877003303
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 06:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NHJw+U07;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4711b95226dso92094065e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761745252; x=1762350052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OdtslM1FCt1FpBNpd2jze7Rh2nsTuZf1M1+9UUJYMjU=;
        b=NHJw+U070PWB4jL65vW4Pqtn5+U61Rd0LiduJJHXmppokqcSPqsHIde4Cy1CwR3ZIO
         QwSrMSlKeERhdmaw8xpRq3Ib8jHy1fh5sLxJBixKvmlWD7TRNK0s5NtNCesV1J/z/x95
         2cCD4DPMLzxSHLmfhx2x00uerxHirdzsOrxk1u0HI5QwB+H41RVsLmGMM5ybCEvb8cnF
         IUifK6Vl9GkfJj6qGtbcCcJ6DvfVWcAYY/5nCrVxAWqZIz1SLGy3R8PjKeM+v2BuXGod
         1MYs8kW+nRfs4YbXag9nHubVGwj+EGbLRjzyHV8DH9eCFvP07xQmjrFnazonujEwF3TL
         miAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761745252; x=1762350052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OdtslM1FCt1FpBNpd2jze7Rh2nsTuZf1M1+9UUJYMjU=;
        b=m+FiGS4ap0/rb3K9OK10bx0crr4IoqDD29reQ9mn4ULi4s3HPTXF+J+t/SLWL/u2VI
         XlfmJ2CrN+hnwAFHTkL661fnJjmTEPg6YeBakv/M3qF3N7YopT2mWasrwEGvedBoDq/3
         UaI5bcEGZZ2muaEY/mlA5ouf3n5nidVH7a6z59ufGGnw1rXJnZBUHvmuNovY6peXyiUa
         k5a3KuR1Y/fwSntqJZlZqAEIdBJO1iGWsweZ4HRi/FrsdiFYttg9/UFDJIu/hl9j4f/U
         llsoxBqBScO9yl2Lc1gUCt0eex0TQSR0ZnSpxPeI4aIf4NnrrpdHsH+QA197D+D/H8Np
         rXfA==
X-Gm-Message-State: AOJu0YwCg0RJ7Xfvh7XgFjz8QBL5v+/p3rJ71l+yBU3TD3ZoILPJwETV
	aItbQkU2X7xfiE04hNEFwQa/ongdA8UqNIQnQAO97Gu10R+Bh5G24DrSvpxYQl8H
X-Gm-Gg: ASbGncuKeIl6r/c10redIBXqDXesRYAK1V951Q5J48u0XDRMZ12zwjaBtA1btfYALV4
	m+ADfuvNTqpto1fZx8TtNKOdu/Pjn4+TgbDKOa0PGeiH99TT5rLgg96u7hKW43vtwfma3ViJoDz
	liTQlSMWkUFqFMldZNmxBjSa44eG7dhwpPoPhZMRYZC/rt00oPPRHTuqFQqY1a7U9m2N3My/vii
	ahhYegpAfhBrfvX7J1rZBYc6Q8BA7AiERg8GRBDGr3UFDvkDC3VkbPMXj9oQHeomkF8wlxzU6jE
	ZHC5eEYP96tlrZrDWxnBO5SbtL1j2Erbuer20Ae9a6YPRMIs2khJGXwUpJeaL5k+KjU6phCsPBl
	FjL5onmWITVwxIb7its09Z2kAvV2b3cqvIvppgtdGuzTbbshLxNEax74X5X6tamgRJZLBZlUEuH
	LR/JAcZk3x
X-Google-Smtp-Source: AGHT+IGuEuyAFVCU86mE4qF3nBa18Hmkvh0BFGp6GEfCTmGR09ZDbuOGwpcWCZX9NkXZiwMwvlL0sg==
X-Received: by 2002:a05:600c:a55:b0:471:9da:5248 with SMTP id 5b1f17b1804b1-4771e400d8emr22859705e9.26.1761745252042;
        Wed, 29 Oct 2025 06:40:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5678sm25950484f8f.22.2025.10.29.06.40.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:40:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][kirkstone][PATCH 1/5] fuse3: fix ptests
Date: Wed, 29 Oct 2025 14:40:46 +0100
Message-ID: <20251029134050.3455088-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 13:40:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121152

Add run-ptest to SRC_URI, and add missing kernel module that's required
for the tests.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-filesystems/recipes-support/fuse/fuse3/run-ptest | 1 +
 meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3/run-ptest b/meta-filesystems/recipes-support/fuse/fuse3/run-ptest
index b63c4de0d9..680fa0bf33 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3/run-ptest
+++ b/meta-filesystems/recipes-support/fuse/fuse3/run-ptest
@@ -1,3 +1,4 @@
 #!/bin/sh
 
+modprobe cuse
 pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
index 0f379afb92..f39d7fe76c 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
            file://0001-test-test_syscalls.c-allow-EBADF-in-fcheck_stat-631.patch \
+           file://run-ptest \
 "
 SRC_URI[sha256sum] = "b2e283485d47404ac896dd0bb7f7ba81e1470838e677e45f659804c3a3b69666"
 
@@ -34,6 +35,8 @@ RDEPENDS:${PN}-ptest += " \
 	bash \
 "
 
+RRECOMMENDS:${PN}-ptest += " kernel-module-cuse"
+
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/test
         install -d ${D}${PTEST_PATH}/example

