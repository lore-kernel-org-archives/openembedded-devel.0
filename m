Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA24CF9C69
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 11:56:23 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.8171.1726919774609514485
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 04:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uMhHC2Ot;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-374bb08d011so1561725f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 04:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1726919772; x=1727524572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ODMZl63Hj55YSrsz9i1tWDfgTYJF3Dm6Vq084K1iFo=;
        b=uMhHC2Ot+HTqLVU80binA3eyoIZPBUrDWiHR76GQWFKOUvRrPP32SCtVMJ0196mr41
         yAVQl32Qj+rC6eZabVsYApu8y5i6avKYZ/y27OMUiB+PFaIYa3711hgqVOvR4b4KzGnz
         G+27Ah1M1LRKSKVA2VCbdKrXA54DOhe6jdSRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726919772; x=1727524572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ODMZl63Hj55YSrsz9i1tWDfgTYJF3Dm6Vq084K1iFo=;
        b=GE0aiHjWFgQYKQOAlskGw/89a0UF9aQNfL+HxT/O1oO0mfM7Em93I/Yo3o9dt+mLAT
         J3k4cKbDt6jbvN0UC67FLphNrxqN/393qfWg3VVeEErN1SsFVquAPOIzP97lrYfquTQK
         6xGMC1c88whgqbo6DiER8DMGfUcY2Dc8hYEKy6tRzeFaaaGp6+DNvF98SRyXykrC3EbW
         AFT6gywZPb4Gpygy0KPTCFLl9Mpw3PMQPYcduUwThHT+WkLajRwEQoUl5i61SHtg1tGY
         9+dre5vUH29nD7D/FUdpUdaN32P00bKCXCmunMAvZ2MUJNuz+OhgnHv55xCgjoxVuTgB
         Cn4w==
X-Gm-Message-State: AOJu0Yzbz/fkBj0bufMm1OnoZpqSNj/tg86UPYarmCHMvTipDHcKKCVV
	ZVEZGDq4F8g2mpOZSaC/J1fGtbM8Nh1rfvEeY9SjcoChQJQFErKrwmqqccSOrRSY15weTbRkmfl
	4
X-Google-Smtp-Source: AGHT+IHcEvHADzX5Y59NI++2NLehnx42NetbkkO8OXvIQXp6lUmM1JZug+oQ8HOO1iF1ZWwbWAmRsg==
X-Received: by 2002:a5d:6d0b:0:b0:374:c1f9:ea79 with SMTP id ffacd0b85a97d-37a4225219emr4732673f8f.5.1726919772172;
        Sat, 21 Sep 2024 04:56:12 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754c5fb9sm74370235e9.43.2024.09.21.04.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 04:56:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH] non-repro-meta-networking: update known non-reproducible list
Date: Sat, 21 Sep 2024 13:55:41 +0200
Message-Id: <20240921115540.1957491-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 11:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112428

From: Yoann Congal <yoann.congal@smile.fr>

Remove packages seen reproducible in the last 3 completed tests:
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/44/steps/28/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/43/steps/28/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/41/steps/28/logs/stdio

Add babeld & babeld-dbg from:
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/44/steps/28/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../include/non-repro-meta-networking.inc     | 33 ++-----------------
 1 file changed, 2 insertions(+), 31 deletions(-)

diff --git a/meta-networking/conf/include/non-repro-meta-networking.inc b/meta-networking/conf/include/non-repro-meta-networking.inc
index 0564e1ced8..c5313416a7 100755
--- a/meta-networking/conf/include/non-repro-meta-networking.inc
+++ b/meta-networking/conf/include/non-repro-meta-networking.inc
@@ -1,34 +1,19 @@
 # List of known non-reproducible package of the meta-networking layer
 # Please keep this list sorted
 KNOWN_NON_REPRO_META_NETWORKING = " \
-    blueman \
-    blueman-dbg \
-    blueman-src \
-    civetweb-dev \
+    babeld \
+    babeld-dbg \
     dhcp-relay-staticdev \
     ettercap-src \
-    fetchmail \
-    fetchmail-dbg \
     freediameter \
-    freediameter-src \
     freeradius \
     htpdate-doc \
-    keepalived \
-    keepalived-dbg \
     libbearssl-staticdev \
-    libfko3 \
-    libfko-client \
-    libfko-daemon \
-    libfko-dbg \
     libmosquitto1 \
     libowfat-staticdev \
     libruli-staticdev \
-    libsamba-util0 \
     mosquitto \
-    mosquitto-dbg \
     ncftp \
-    ncftp-dbg \
-    ncftp-src \
     ndisc6-dbg \
     ndisc6-misc \
     ndisc6-ndisc6 \
@@ -38,23 +23,9 @@ KNOWN_NON_REPRO_META_NETWORKING = " \
     netsniff-ng-doc \
     ntpsec-src \
     openl2tp \
-    openl2tp-dbg \
-    ot-br-posix \
-    ot-br-posix-dbg \
     postfix-cfg \
-    proftpd \
-    proftpd-dbg \
-    proftpd-dev \
-    rdist \
-    rdist-dbg \
     rp-pppoe \
-    samba-dbg \
-    tayga \
-    tayga-dbg \
     udpcast-doc \
     unbound-doc \
-    wolfssl \
-    wolfssl-dbg \
     znc \
-    znc-doc \
 "

