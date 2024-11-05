Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F75AD2B945
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:00 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.19536.1730817414955105461
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mwU7eRtX;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e290e857d56so4958488276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817414; x=1731422214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMBi7oPP6GWzWV7eVwDFByjYfFlY5Y8UKwLnBP6MwBY=;
        b=mwU7eRtX0FQkldp3bQm1aA8VKY3JSrHAf2q5sCGmbYOSuRaNXIXKJZgmIoCSZKmmSs
         L6bag3cKXqGO2OghIGnWafdAvb5vFX0goi3NW8flNtYWOsmBiyp/1J4bzyBW2w6ZhFS6
         OoIB8qbHmR+WILM1yfv1kyii06kVrVDwF6GB6B1or+z7cqhBl/jwDEsNbI/NQZZuNHNv
         o4A2UI+hpqi0aD3MApWeF+7JwsIgV/3nCNYwZWK216+2ZhKWHzUMN1rwLhcHoop0sQy4
         1HyB0eFgwfXymKeFHT6Wi5uKMBpls/VNNKtcuD9/BKLTLE6JX/hwwWebcXJy19FUOuZV
         ESig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817414; x=1731422214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMBi7oPP6GWzWV7eVwDFByjYfFlY5Y8UKwLnBP6MwBY=;
        b=FvaF9TnQI0XMxCLhL1ayo/ZNb8naQjwhDbpZ3ufFMrNn7HjrZof+krf5ijvTA6Pgsj
         TW1r4PZcR0lJ8OI4YFL+PNGOxkFHGqUcFdKdM1Kkc2xQMhEPFJ/o+Q6k+sNnZrEUrP6o
         3VmUoDJARUIPCNsqA68dAAu2HojJErFguhZc+MnK0Bk8j+N6EetiA7aGnADKOqwYlJYs
         QuLaCs0+UF4mepsl4diLuOUSCJryvy42X0w5S+mpJkb2gHmDqPEYCwdjCNDcVJCh7sge
         UhnBzOyye5MfGg3/yU6BJpH1u6JXWuxlzCiKWl83hjnPliFF+GbCZDzV2UGRMkGsJez9
         LgfQ==
X-Gm-Message-State: AOJu0YxrmAfYAfBoVsLVw85/qT8xjevjo8mhXbtv+plD8ddV8iNB4z+/
	aMWwRppRxNPIKLbJAqe7X7YJAFBAe26+csofrwgR56nsnEIvUI/nhE8O5g==
X-Google-Smtp-Source: AGHT+IHPapAF8nlm1kMjvwNIINuAvUxFaiyvSC8UMZtTZ130K+SWSB2XtT2Ue3Iz9wpmqAPQplifcA==
X-Received: by 2002:a05:690c:61c9:b0:6e3:31ee:23ab with SMTP id 00721157ae682-6e9d899d1c2mr364430297b3.25.1730817413979;
        Tue, 05 Nov 2024 06:36:53 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 33/90] non-repro-meta-networking: update known non-reproducible list
Date: Tue,  5 Nov 2024 09:34:58 -0500
Message-ID: <20241105143638.2301245-34-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113451

From: Yoann Congal <yoann.congal@smile.fr>

Remove packages seen reproducible in the last 3 completed tests:
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/44/steps/28/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/43/steps/28/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/41/steps/28/logs/stdio

Add babeld & babeld-dbg from:
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/44/steps/28/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
-- 
2.43.0


