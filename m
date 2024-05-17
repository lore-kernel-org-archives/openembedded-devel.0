Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27ABC25B79
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 15:12:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.43201.1715958766157167631
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 May 2024 08:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=vCb96J6x;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4202c1d19d5so1873085e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 08:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1715958764; x=1716563564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yjXfc9ZtttW/OnOdWPMO3SZe3lMwX+K2MEu3gZOHUPU=;
        b=vCb96J6xUQpIjrZVkNDwgL0fxS3n/5mqyo4gKQdzei9DwuAh1O7/g9cXPMEsSlSpa7
         JlxuQE0L5TCBLqUnAz8rSFnpV9sejiQVV+avrwKvmdzDQ543hiRLco8rZITFedOsgnWC
         B2h2WztRF0Ko4S68dkOh0w35i9KJtQgrIF4+oGbpedZfHmK7HNAe+d8NguetYXMlgVDB
         He5BpNP411d4tlU6DmigazMAN2j08GqRfolNd866x6tPxoZWEDFrFyANbGhc+ehrzmDq
         vPXpvuBwwZbYN8vnMkHIgbHVW/zU7K2xY1EXwtGiQOhLatRBqjyfKqJpjRT/5hXRL+0T
         12Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715958764; x=1716563564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjXfc9ZtttW/OnOdWPMO3SZe3lMwX+K2MEu3gZOHUPU=;
        b=CqsBTpbx/JDqO6+5QLzCul0A7vb1Q5cTwQIqc1lP5e+ldKzSMLzu58ybRAg/sIgUQZ
         YgF2WRS46Y2I9Ib8zT1EMW1mIBddsn478dsikMIMj847Kdd0kAdhKR9I/aov4jpKjHhv
         6k/Xa0NNslMbJix6Flc/I8RsiqsBD0j1GdjSn/P38lvLiQaFRvyswWrIyxtd7Wg2Eudc
         SbhBm/VA0O+eoN6EZgjOdXiR1Rp+ox/e2UGb0G/373DD8yz2aiR3Frw/j4k2k0LZSXtW
         TF+o7aPKW1Jgp5BRVwACSKAlWRoLN7sET7fpRyvJjTi47GimAGSL1uQmv1b29HMCn/y+
         txeg==
X-Gm-Message-State: AOJu0YxGqn7l3V/k6KgW82FNpcrZJdumoTeTLPrHgGNy+C6w1bMFcss3
	JhctfePVgDaYw2XpMmoFVMkGP4KmlPHFRgFF5HzQN7X4VjRjd0Ynu1txbeS6EYfvnL65wNlu3iv
	Y474=
X-Google-Smtp-Source: AGHT+IHVYom1vYZq/1eBGtEVg51p1bAgoOV01acxsBFDTKPMZiqv8a2ixGrDL+R9E1Izq6+53eaT4g==
X-Received: by 2002:a05:600c:1d21:b0:41a:c592:64ff with SMTP id 5b1f17b1804b1-41fead61bfbmr172575635e9.35.1715958763985;
        Fri, 17 May 2024 08:12:43 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f88110f3esm345754935e9.29.2024.05.17.08.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 08:12:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Alexandre Truong <alexandre.truong@smile.fr>
Subject: [meta-networking][PATCH] squid: workaround a build failure with native gcc10
Date: Fri, 17 May 2024 17:12:15 +0200
Message-Id: <20240517151215.162628-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 15:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110431

When build on Debian 11 (gcc10), squid fails to build[0] because of a
bug[1] in the configure step (it mixes options between old native compiler
and recent target compiler: the former needs the std=c++17 option, the latter
doesn't).

The workaround is to force the "-std=c++17" option for the native build.

NB: Our Buildroot friends have the same workaround[2].

[0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/23/steps/28/logs/stdio
[1]: https://bugs.squid-cache.org/show_bug.cgi?id=5376
     Bug closed as invalid by upstream
[2]: https://github.com/buildroot/buildroot/blob/932b52fad87d79d9f26a343edafe2981079de16e/package/squid/squid.mk#L24

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>
---
I'm not 100% sure that all the host compiler of all the supported
distributions take the "-std=c++17" option. I've tested it only on
Debian11&12.
---
 meta-networking/recipes-daemons/squid/squid_6.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.9.bb b/meta-networking/recipes-daemons/squid/squid_6.9.bb
index f0663a5e04..33d286e122 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.9.bb
@@ -68,6 +68,11 @@ EXTRA_OECONF += "--with-default-user=squid \
                  --with-logdir=${localstatedir}/log/${BPN} \
                  'PERL=${USRBINPATH}/env perl'"
 
+# Workaround a build failure when using a native compiler that need -std=c++17
+# with a cross-compiler that doesn't.
+# Upstream issue closed as invalid : https://bugs.squid-cache.org/show_bug.cgi?id=5376
+BUILD_CXXFLAGS += "-std=c++17"
+
 export BUILDCXXFLAGS="${BUILD_CXXFLAGS}"
 
 TESTDIR = "test-suite"
-- 
2.39.2


