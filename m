Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC73C6FA8B
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:26 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.2743.1662594077757868600
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JaZr1h+U;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id 145so16176299pfw.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=0an/TEEP3Ywx0IBH9cLWovJyQh39ruRtU87NEqdn3H0=;
        b=JaZr1h+ULctxFdy9gnnW/u5KMlNiKi3RCAC63SkZIDYrETVChzkzD/yWi3tYRFTO6I
         x8l7tGgW+cbd/61CDnLEMVUrdsl0QbjZjzbY/kyD9yVhMN/p57WITz2mcHgtWXNtGIGE
         nIU9tG6SG5kxBUyqpnZiy0CRLlokhvrnwV1O4rkc2cikl5dE3/oxatTRfSBdtqPws96V
         vLH4nrvW7Zo3d9S4KzzLKtYghhAhq5d/ADbKDgtl4ziJqlDUd9fkrykTSfz0nEZD84BP
         /9eT2e4oZ5/GcBSqQKqUa0rs/agrXPpkZ2vy309AnvUz63UfP5PMuUjRAt8+ovBKbt6g
         uwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0an/TEEP3Ywx0IBH9cLWovJyQh39ruRtU87NEqdn3H0=;
        b=pPbYn2Ol4YYkeWLVXEoFQLvzbEpjfNuAsB1eUIK3hz8y1s6MAewvXwE7Pbt8V9HeOg
         edXZ+E/aplVseztLy+FjwW+Kzk6EPIzpubAwwONhfIdy09wMUrQSiCcNC/KuDGO7Nbw8
         aStyd8oRlObGWThiLbmntmPq2Gg0JiGNMu7uVgPIJXmzmdaHSG5+MVyg6SRk9x/ifEmM
         LfaBHfuvy6iOWwRzoKwDnXx9uOzc6QlTDA+H/x/tOwJGu9Xf5DDx17NBIzGs13z5SjY4
         pwnexn2+ONffp1dgPo8HkWwjd5BvT40yYxQzXCehQ+cC0a6MCuAQprLOYMYNNiz9NTXW
         1udg==
X-Gm-Message-State: ACgBeo1YMEQqcM3IVH247eInh9iezpSUhgMu8/EYdtkRjASkjzv75Sbs
	Nhbygz1TaLkvlhw37EDzpIUiaV9rEZ75ow==
X-Google-Smtp-Source: 
 AA6agR6Wh4A1Yyme+kT7HHafFIQ/hxVyM2skx4S/J9lA4FoxMoUG0vnU3rusXUh2jPB2j2o7T9G/Qw==
X-Received: by 2002:a05:6a00:1149:b0:53e:62c8:10bc with SMTP id
 b9-20020a056a00114900b0053e62c810bcmr5991650pfm.49.1662594076927;
        Wed, 07 Sep 2022 16:41:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 15/22] ot-br-posix: Fix unused variable error
Date: Wed,  7 Sep 2022 16:40:55 -0700
Message-Id: <20220907234102.3312797-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98705

Fixes
r: variable 'i' set but not used [-Wunused-but-set-variable]
|     for (uint8_t i = 0;; i++)
|                  ^                                                                                                                                               | 1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openthread/ot-br-posix/unused_var.patch            | 10 ++++++++++
 .../recipes-connectivity/openthread/ot-br-posix_git.bb |  1 +
 2 files changed, 11 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/unused_var.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/unused_var.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/unused_var.patch
new file mode 100644
index 0000000000..9727cbafd8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/unused_var.patch
@@ -0,0 +1,10 @@
+--- a/third_party/openthread/repo/src/cli/cli.cpp
++++ b/third_party/openthread/repo/src/cli/cli.cpp
+@@ -1785,6 +1785,7 @@ template <> otError Interpreter::Process
+ 
+     for (uint8_t i = 0;; i++)
+     {
++    	OT_UNUSED_VARIABLE(i);
+         SuccessOrExit(otThreadGetNextCacheEntry(GetInstancePtr(), &entry, &iterator));
+         OutputEidCacheEntry(entry);
+     }
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index bbec81c27e..ca763d01fa 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -19,6 +19,7 @@ SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=m
            file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch \
            file://0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch \
            file://mbedtls.patch \
+           file://unused_var.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.37.3


