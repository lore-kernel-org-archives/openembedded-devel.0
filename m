Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F3DC54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:33:57 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.19197.1663590833369388415
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E9Ihd+Tm;
 spf=pass (domain: gmail.com, ip: 209.85.219.52,
 mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id j8so10759958qvt.13
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=kjSFcZR1UfaD+9XsRQBHHQn/hKOBipnAxb0LsT9Z558=;
        b=E9Ihd+Tmss/dAgDRLq808Xq31J7mp0YMBV0f2AWFS/7Zxv29JxGeZ0F/Vuxk8JUDTB
         msvm0NIRfip0EBgOexzcfZw7r0LY8FCf31a2N2gbIvDBXTo40hD/v4XPgbLivp9s6Ij4
         JYdk1hlJIRWiWtJxWCYiQhnMb61kDmbGRFjpXZM9LXotJ0lFy70zbw9f5uMX2xIY7HcE
         ima+sZiqWOeqAl7jWirXeT5yNJXTuLsdhK82sIoSLkJHoCrrPifg+TiJwIu1oiVZ6E0+
         QeOkmyZkv3z6/MAkoNJcv+NItmTotHK3hXWRETo+2YNk1yQ3tEbQwzYMIhpvj/ODQwRu
         H/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kjSFcZR1UfaD+9XsRQBHHQn/hKOBipnAxb0LsT9Z558=;
        b=cQTJwRZCd5NLRLzJvDOv0SSL8XxLlfOj0UJAXClvjIJFlERMNjP1B3GGO09/BP/anR
         XbUQsRxWTBE7nhXzpSqKyx2FO7Z1VPQ3dxwypa3a9Ne+cGAMsmNVkZit/a0Wi6rRnB8V
         cgqJ3ac7/GEUqPuZAXamXfppYPvzWJem2oqIISfWevsTKRy1OW/L7ALb8hO/YEr5tvqF
         YA7/ik5Vqab7AxvtTJ84lGTPwNLfdS5F2pKQ8/qraJBliFcBqNeBwtdExeHJtzD1mErP
         hbK6yBzosqsBbPjSp70uBm+57g0cTiA/HtSjZvE6bEH+RTpCkm98YLT7q9QRH3UNsBo9
         Wl/Q==
X-Gm-Message-State: ACrzQf25qx88U8pBqkyWGO3v3Pq2mZxeWqK7VoOt0PE8qZgNoDkmIepQ
	8bs0QV/WW1XDbm7mUYt8m8mxYnkA9uk=
X-Google-Smtp-Source: 
 AMsMyM4v5TxcdWl0imBYjVgYRrFZhfnjeDYWjraoFxbj8vljyAwzPzbtJCatDbVO+9km4LrE9PU05Q==
X-Received: by 2002:a05:6214:29e8:b0:4ad:2f1f:b9c with SMTP id
 jv8-20020a05621429e800b004ad2f1f0b9cmr6883881qvb.8.1663590832117;
        Mon, 19 Sep 2022 05:33:52 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b6ed:2737:547c:2270])
        by smtp.gmail.com with ESMTPSA id
 br41-20020a05620a462900b006ce16588056sm12541040qkb.89.2022.09.19.05.33.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:33:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 10/11] samba: fix buildpaths issue
Date: Mon, 19 Sep 2022 08:33:37 -0400
Message-Id: 
 <13f1e688421fff4b24fbef311f7c47118633f0c5.1663590728.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663590728.git.akuster808@gmail.com>
References: <cover.1663590728.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:33:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98861

From: Yi Zhao <yi.zhao@windriver.com>

The test case tfork_cmd_send in smbtorture fails on target as it
requries a script located in the source directory:

$ smbtorture ncalrpc:localhost local.tfork.tfork_cmd_send
test: tfork_cmd_send
/buildarea/build/tmp/work/core2-64-poky-linux/samba/4.14.14-r0/samba-4.14.14/testprogs/blackbox/tfork.sh:
Failed to exec child - No such file or directory

This also triggers the buildpaths warning:
QA Issue: File /usr/bin/smbtorture in package samba-testsuite contains reference to TMPDIR [buildpaths]

Skip this test case in smbtorture to avoid the warning.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2b8b5dbe03cb83df1bb6c6dc1cfbf5c2bf836cf9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...orture-skip-test-case-tfork_cmd_send.patch | 38 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch b/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
new file mode 100644
index 0000000000..90ee317860
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
@@ -0,0 +1,38 @@
+From 059b517f9ef6cbdc696e0983ce255b1728042827 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 25 Aug 2022 16:46:04 +0800
+Subject: [PATCH] smbtorture: skip test case tfork_cmd_send
+
+The test case tfork_cmd_send fails on target as it requires a script
+located in the source directory:
+
+$ smbtorture ncalrpc:localhost local.tfork.tfork_cmd_send
+test: tfork_cmd_send
+/buildarea/build/tmp/work/core2-64-poky-linux/samba/4.14.14-r0/samba-4.14.14/testprogs/blackbox/tfork.sh:
+Failed to exec child - No such file or directory
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ lib/util/tests/tfork.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/lib/util/tests/tfork.c b/lib/util/tests/tfork.c
+index 70ae975..4826ce6 100644
+--- a/lib/util/tests/tfork.c
++++ b/lib/util/tests/tfork.c
+@@ -839,10 +839,6 @@ struct torture_suite *torture_local_tfork(TALLOC_CTX *mem_ctx)
+ 				      "tfork_threads",
+ 				      test_tfork_threads);
+ 
+-	torture_suite_add_simple_test(suite,
+-				      "tfork_cmd_send",
+-				      test_tfork_cmd_send);
+-
+ 	torture_suite_add_simple_test(suite,
+ 				      "tfork_event_file_handle",
+ 				      test_tfork_event_file_handle);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index cb3678d7b6..53526a26b6 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0004-Add-options-to-configure-the-use-of-libbsd.patch \
            file://0005-samba-build-dnsserver_common-code.patch \
            file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://0001-smbtorture-skip-test-case-tfork_cmd_send.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
2.25.1


