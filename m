Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78EEC43219
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 08:42:43 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.3911.1667378559161637618
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Nov 2022 01:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qeTSfwjn;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id u7so11971200qvn.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 01:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O5Tw+vaV32q2yw/XgipE2aY1fTuViXUfgciOFn1nog=;
        b=qeTSfwjnE9Gi3Y+kH/9saV9aNGhB7wQwblTBlRTESzMQKiekzi/+IMp3USAzT4Enpu
         7b9YvMyA18GOqj/TSmperVkgmTxUFxRZer6eElAKV6U6l5AbkQ8+rsQ1RBuWdBIph3h3
         DgZb4RtJlVX/WCUWh67nk4Dpp0veHQnzsa8JBYghLb/H93Doz5DQ0dPNWAR+s7R9DoTP
         WlVSkR02BgqxvZIAS2sjUfxwXfK9yodTFt20KC36GpVfbDBT4t6f5cYATLa8cnd19gaO
         hWeOJhk0utnJMUvnqJfKhmm70urG8UnC0izHfevKupTdvfhRg7h1MNnc0cdCJ8kVLu1U
         nhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/O5Tw+vaV32q2yw/XgipE2aY1fTuViXUfgciOFn1nog=;
        b=vbI1Fm7wGNNeXmyID8QjKiwA5Bp9D8rJNQbkW1rodvRH3ffHm6IGfFUz2gVceD2hY9
         o8ljxmU1cPWLr8W8nk+ltbmyCnvt78OjntN0JFkCs6AwEgAOo101pTB/WhvrC8HHhCXU
         oGQVYzqofCjwP7IN1JuL/I9ofVv1s1d6sYsAFo7MSfTYRqPtm7ZBObMAVWUNVLqeh89g
         arc63YlFs38y8AKUjp3/J1z74K1O6NqAZqVFoDEOsfHHETlkRuAuxinInVz/gLdzibiK
         uaOPG0CPkkrnvloj7jvWkTNzjGaQc+TXr7kP/MOdDisR5EfLditoX6pG63ki5H7flFg2
         rAwg==
X-Gm-Message-State: ACrzQf2qXxOJnmBpEyJZiShlyv2E5prLhQrC4r0HctUEoC6/CuSKRX6v
	JvXKLfGGSHlHt6MgGZtBq7FtEZb91Q//vA==
X-Google-Smtp-Source: AMsMyM5zU6QTJhZwVGeAGUboX70hT0Ha5KLgrSXzDN06G3sjXDnSMDmj0zts2JSHCliFqm2ZAFU38Q==
X-Received: by 2002:a0c:979a:0:b0:4b7:4a8c:a80d with SMTP id l26-20020a0c979a000000b004b74a8ca80dmr20588456qvd.42.1667378557964;
        Wed, 02 Nov 2022 01:42:37 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8259:e903:8d8:7eb0])
        by smtp.gmail.com with ESMTPSA id t11-20020a05620a450b00b006fa2b1c3c1esm5631202qkp.58.2022.11.02.01.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 01:42:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chase Qi <chase.qi@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 5/5] kernel-selftest: install kselftest runner
Date: Wed,  2 Nov 2022 04:42:27 -0400
Message-Id: <20221102084227.1210486-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102084227.1210486-1-akuster808@gmail.com>
References: <20221102084227.1210486-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 08:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99414

From: Chase Qi <chase.qi@linaro.org>

Install kselftest runner and the required kselftest-list.txt.

Signed-off-by: Chase Qi <chase.qi@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fd330c4514ae5acefa5e472e6775419066d60385)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index d5e8e4b497..3d97ea0967 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -85,7 +85,13 @@ do_install() {
     for i in ${TEST_LIST}
     do
         oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/usr/kernel-selftest/${i} install
+        # Install kselftest-list.txt that required by kselftest runner.
+        oe_runmake -s --no-print-directory COLLECTION=${i} -C ${S}/tools/testing/selftests/${i} emit_tests \
+            >> ${D}/usr/kernel-selftest/kselftest-list.txt
     done
+    # Install kselftest runner.
+    install -m 0755 ${S}/tools/testing/selftests/run_kselftest.sh ${D}/usr/kernel-selftest/
+    cp -R --no-dereference --preserve=mode,links -v ${S}/tools/testing/selftests/kselftest ${D}/usr/kernel-selftest/
     if [ -e ${D}/usr/kernel-selftest/bpf/test_offload.py ]; then
 	sed -i -e '1s,#!.*python3,#! /usr/bin/env python3,' ${D}/usr/kernel-selftest/bpf/test_offload.py
     fi
@@ -127,7 +133,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
 FILES:${PN} += "/usr/kernel-selftest"
 
-RDEPENDS:${PN} += "python3"
+RDEPENDS:${PN} += "python3 perl"
 # tools/testing/selftests/vm/Makefile doesn't respect LDFLAGS and tools/testing/selftests/Makefile explicitly overrides to empty
 INSANE_SKIP:${PN} += "ldflags"
 
-- 
2.25.1


