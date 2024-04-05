Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51FCC67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 07:30:55 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.5734.1712302247850000821
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 00:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ksP5WE6x;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-343620589easo888505f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 00:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712302245; x=1712907045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYPFjJEG8G58QOc/k95BvPxBUF05tmJor11PJ79H+rk=;
        b=ksP5WE6xEeiOymPcpBDLUke2w4I+MumD9C5K2z9Kvh+mx17RWtx34Z9jKcjB4dKU4z
         3f3hxZZuf2i6eyg/4owpfyfuztL4bJJX9fXR71jxOLP3rzPjUGo/N5JPozvFUziWuLrW
         WXdHfhn0JzJmPQjMG0GbThaEQbJkl8OOxDBPpr8MrIFkWfmPk+5X2saj9DPdGBBjmVGj
         q8/c7bby3FLYEPaAv8R8lcYRSOUpYbiF8NmIxxYyDlJ8+gNez4cp/um85n26dgpbk05A
         O7KLQOB5QSyO/Tbrs2rn+eomT40MisGZtky7anpPOZxciag/sPwWecp75FV9IO59X+EK
         pkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712302245; x=1712907045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYPFjJEG8G58QOc/k95BvPxBUF05tmJor11PJ79H+rk=;
        b=HxgsDZtXG31UsvPphnCZbYZW28z2CjBHPBpEX0sPE/2dHdSR1sDQPDLxh7PYjFscbq
         0EDELYDu4jIm1s6MrwilsYowAP2+f0n7Zvbtkk7Y2DTmpUCH34OfXu0VwFfRIECqQNVw
         ZAszubyz4X7lcxD9Egmvp+wyv8xui0xueWmqoYh0YTMPIMT1rtTqoAzyWwkBI8fEodnX
         wtZJ/SkzAa4lPAXvkv1BPqzrBSiGEKXsipSGABnTPApz1NTY01CC1u+2lNg6aueY7+PF
         +p+mMbLfK1jGSaooAbgUSjW8uzQAfc/CHfTYHsnG/H0Hkn53FC7ureuim6msEDnwr46V
         mqZA==
X-Gm-Message-State: AOJu0YyS4V7iACemMM3Dy0uD5AEr6UBoK52VJYBsBFf2QE7ZwLvhnMeG
	VBgMIC+/r8inUvG1sZxs98aUcvns5PrVvYf6i3t+evWdxFgRgPNfyF14zG7+mZsk+w==
X-Google-Smtp-Source: AGHT+IEjc+zanAwv7Brm7uCvnF4+HhcI3oY4v2t8j45k1qH2dz0sRNeGgSojMkGddF3GpZbht7eHtA==
X-Received: by 2002:a5d:43cf:0:b0:341:d833:1f7c with SMTP id v15-20020a5d43cf000000b00341d8331f7cmr407963wrr.70.1712302245165;
        Fri, 05 Apr 2024 00:30:45 -0700 (PDT)
Received: from ip-10-0-0-128.eu-west-1.compute.internal ([2a05:d018:db1:fb00:5a7e:56d1:b46:ceaf])
        by smtp.gmail.com with ESMTPSA id y11-20020adff6cb000000b00343d504d7afsm1317558wrp.30.2024.04.05.00.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:30:44 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] mdns: Upgrade 2200.80.16 -> 2200.100.94.0.2
Date: Fri,  5 Apr 2024 07:30:26 +0000
Message-Id: <20240405073025.16939-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 07:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109817

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../mdns/{mdns_2200.80.16.bb => mdns_2200.100.94.0.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_2200.80.16.bb => mdns_2200.100.94.0.2.bb} (99%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2200.80.16.bb b/meta-networking/recipes-protocols/mdns/mdns_2200.100.94.0.2.bb
similarity index 99%
rename from meta-networking/recipes-protocols/mdns/mdns_2200.80.16.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2200.100.94.0.2.bb
index c516eba6ea85..183f05ebc3e2 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2200.80.16.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2200.100.94.0.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0001-Handle-interface-without-ifa_addr.patch \
            file://0001-Fix-SIGSEGV-during-DumpStateLog.patch \
            "
-SRCREV = "5fdc65a52db5c31fdf4b872d912590235b36a4dc"
+SRCREV = "8f70f98fc1d0cf439ca3a6470be6ad8ac2bcc019"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-- 
2.25.1


