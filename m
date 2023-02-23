Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFD4C678D5
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 20:01:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.677.1677182477471760539
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 12:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=Zk6VyHS1;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id m14-20020a7bce0e000000b003e00c739ce4so265462wmc.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5Lz6dBNsWWA6ky6tiJ+Ky0ZzoqdMqzzs2ulsH8UVFc=;
        b=Zk6VyHS1kzECb/WRy9rcDqeT4JC0WHerKQxSYo5JtKnqg7J6/2IrjmDyMmV+mr66sU
         qJkaNSs523fv7EKnSA0snTiTg+aqTn7yHHW3QKz+soVY7z3+o10LRZq9fGp8pr9a0X2B
         pb5szMf/JzPvznrD1/+spvo3l0eLVmAq/c8J4fcxicZHJtYILqQseJi1zSJaMeC0e03q
         RQQVppmOBw/qQSOC69f/Fs9i+D1jZkKwGFMw5XpeRjeR1ZAi4lOlNAYVWElqd7Q2uvOb
         ya2wv0iwZG/eK8JSNNbZXdYrKSwQaYDWmoNSfj529EmPsZ3CzSRhVp9wD2J5T4wHsTR+
         IBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5Lz6dBNsWWA6ky6tiJ+Ky0ZzoqdMqzzs2ulsH8UVFc=;
        b=APEVf44rCJdidfYFL1aZ6nODokKtYO1gNbSRMhI5CAloOjJZKCejBfQuyOMs2PNIPj
         7bTTk4Fcx+Ssb4xLgHJeofs/rm6dDNXfB1k9jAhLefHRpd2aJNJDGTR6ISJJ1mL43/il
         yYiRx6yAosAMHPhG5x4iG74ywZ8xHCbdQJ2jLVAYiWy/k6kiDVxijcx95yVycTq4Z8NB
         V5tIHFz4a+XSSsKRN2qYX/AQcTv1wP9wnWxXSde2LpINqc/sX+G3hEUNgzxYHCm524sO
         t3ARhx2dIp/FZ0a5JKPzknylnHmlMJ1KU+boKdQ1c9QxGgwzv8krUdP3HFmx9xCVnl6R
         Gv3Q==
X-Gm-Message-State: AO0yUKVsJXf+Km0fUxo9THsKx4DvR5L4Cp5llvCTNemOweUF+U+GMLl1
	3Hr5Za/ISx3PiP9XnA5ch7vhkQhn8u9PBe73
X-Google-Smtp-Source: AK7set9DIqMLTm+ZirYqCcVGQHIjLDlWTLzgo61OTf059L0c2ShEQ5clyBdwlyATk5pbDPjgsQXgxA==
X-Received: by 2002:a05:600c:1652:b0:3e0:ffd4:bfb2 with SMTP id o18-20020a05600c165200b003e0ffd4bfb2mr10396924wmn.4.1677182475725;
        Thu, 23 Feb 2023 12:01:15 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8c13:2082:dde1:8880])
        by smtp.gmail.com with ESMTPSA id y7-20020a1c4b07000000b003daf672a616sm324270wma.22.2023.02.23.12.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 12:01:15 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 1/2] libgpiod: bump version to v2.0-rc3
Date: Thu, 23 Feb 2023 21:01:05 +0100
Message-Id: <20230223200106.35281-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230223200106.35281-1-brgl@bgdev.pl>
References: <20230223200106.35281-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 20:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101239

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I decided to make one more RC before the final release as there was one
late minor change to C++ interface (marking public classes as final).
Next week libgpiod v2.0 should be finally carved in stone.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../libgpiod/{libgpiod-2.0-rc2 => libgpiod-2.0-rc3}/run-ptest   | 0
 .../libgpiod/{libgpiod_2.0-rc2.bb => libgpiod_2.0-rc3.bb}       | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod-2.0-rc2 => libgpiod-2.0-rc3}/run-ptest (100%)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.0-rc2.bb => libgpiod_2.0-rc3.bb} (90%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.0-rc2/run-ptest b/meta-oe/recipes-support/libgpiod/libgpiod-2.0-rc3/run-ptest
similarity index 100%
rename from meta-oe/recipes-support/libgpiod/libgpiod-2.0-rc2/run-ptest
rename to meta-oe/recipes-support/libgpiod/libgpiod-2.0-rc3/run-ptest
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc3.bb
similarity index 90%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc2.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc3.bb
index 158175cdb..e56459b96 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
 "
 
-SRC_URI[sha256sum] = "1b931bfabef897911e59d45c80b8930c43fa72f08aab9c03e8dfd4005881c09e"
+SRC_URI[sha256sum] = "1d1756d465525deb668526571dc6ed7e08f7b8e7745b10fc028208a22fb7adf8"
 
 S = "${WORKDIR}/libgpiod-2.0"
 
-- 
2.37.2


