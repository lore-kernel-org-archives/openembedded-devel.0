Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61318C6FA83
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:44 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.11492.1662276877018885707
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U6ajqY/r;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id t5so5774789pjs.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RGR38Ei62Fu/57rBqLCMloM5eubwxPfSGBKX3BeQHv0=;
        b=U6ajqY/rcUlXPjZwdi7Bk+i/ye8q4VzVGNSKl6IkTqpiwA6vtk2laqN0ojHAcHTonq
         cEDUPK0PvrDaCNpPfkL1qr/CXiOPs7fbnrDhXG/YZ37hxh6ir5I+QhX4pbGGCr/Etfwx
         XAgWDPPvRCu8E+/vaPzSWkDc3b01GRuNvMBNXEkx0S+tu6E76D2DC992LQ/2X8zmy4Rj
         UW58DGXZRoDfl+wmjscuUmMNDYWB2PmlhIM6m1+7qR7y/v/8LQfaJb2b6JFt+L1/31Kv
         rJvhxEhImaw6WLkZYvShAGVwtSkf4qScj1C8z8t9yslLFsTIbcineesHshsPTtnCpClq
         S+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RGR38Ei62Fu/57rBqLCMloM5eubwxPfSGBKX3BeQHv0=;
        b=ZIQXTOkjX1H4ywsmZt2vtD9WfkzTuZocbyL2U737gw6cqra0U3sFwYBu+MUPFWt9Z+
         2xOI7+j+rs+4EB5KWQLaG4vRkWs2vMo8/bHwQXChWnIvZopFbY8LrhCZmBYnnawgWDD/
         G0ZuV/lq1bT9YM6Nr54W1boFqjXT+jkKTjAX4nEP+CcEaFLaty8i0jHeJltiA9vcm/+a
         BNtqqIYt7BgSjvUD5M4YSzHYgrlvCP3w9kRWoe5edmNbNBdt6DJW9HOkCrUdUfdAG1tK
         FUKcXZVdNOHwtFy1iUKMABQydOqP3l5oL4+Mm39egnig3OvbfYQyfum6WB2CW+SP+0FY
         ZJmg==
X-Gm-Message-State: ACgBeo1BxXHPSsGPoGr5zL6otv2UnnQRRriYa+Xt33IEcMNTfw6NZhNk
	FzJ9vhKy4FzG/65JK2/k8vyP5xe5g6SzfA==
X-Google-Smtp-Source: 
 AA6agR6IyXhcJz+IRHLesT7KU2RNRH5Gv4PLVWDv7yx+tGKfFQx3LEhm8U8zfpXMIafhYE+S4PJazg==
X-Received: by 2002:a17:90b:4c0e:b0:1ff:f8f5:b81c with SMTP id
 na14-20020a17090b4c0e00b001fff8f5b81cmr11495258pjb.9.1662276876204;
        Sun, 04 Sep 2022 00:34:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 15/63] xrdp: Fix build with clang-15
Date: Sun,  4 Sep 2022 00:33:29 -0700
Message-Id: <20220904073417.3251865-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98609

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-mark-count-with-unused-attribute.patch | 31 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-mark-count-with-unused-attribute.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-mark-count-with-unused-attribute.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-mark-count-with-unused-attribute.patch
new file mode 100644
index 0000000000..77a394d556
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-mark-count-with-unused-attribute.patch
@@ -0,0 +1,31 @@
+From 492f74dbea1d9a15fbc3e870e78ab52e7fc5583b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Aug 2022 20:19:32 -0700
+Subject: [PATCH] mark count with unused attribute
+
+This may throw a warning when devel logs are disabled
+Fixed
+../../../xrdp-0.9.19/sesman/chansrv/chansrv.c:198:9: error: variable 'count' set but not used [-Werror,-Wunused-but-set-variable]                                                                                                                     int count;                                                                                                                   ^                                                                                                                1 error generated.
+
+Upstream-Status: Submitted [https://github.com/neutrinolabs/xrdp/pull/2353]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sesman/chansrv/chansrv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sesman/chansrv/chansrv.c b/sesman/chansrv/chansrv.c
+index 4452d998..b818bff3 100644
+--- a/sesman/chansrv/chansrv.c
++++ b/sesman/chansrv/chansrv.c
+@@ -195,7 +195,7 @@ check_timeout(void)
+     struct timeout_obj *tobj;
+     struct timeout_obj *last_tobj;
+     struct timeout_obj *temp_tobj;
+-    int count;
++    int count __attribute__((unused));
+     tui32 now;
+ 
+     LOG_DEVEL(LOG_LEVEL_DEBUG, "check_timeout:");
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb
index 3e2e84f096..b839a68294 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.19.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch \
            file://0001-Fix-the-compile-error.patch \
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
+           file://0001-mark-count-with-unused-attribute.patch \
            "
 
 SRC_URI[sha256sum] = "94017d30e475c6d7a24f651e16791551862ae46f82d8de62385e63393f5f93d0"
-- 
2.37.3


