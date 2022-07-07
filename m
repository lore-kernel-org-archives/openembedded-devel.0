Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7001CCA483
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 09:08:43 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.3426.1657184921548325679
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VPaWMwZ9;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id y8so16558396eda.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/W2Q+rh6SYC69N4+qRFPXmvsKWm31cKUPxHw/esWu7k=;
        b=VPaWMwZ9X+RxwZHek7Shv/+krRy5cGXUE54hPdkRq5ZTlqL+vY6YT0VuZTxhZnTA5T
         FSQ0KnRnZybnKuyajS0BUn/0w90w7/Pla1BIqVKBajXntqVXe1atuUjoFQKYN9+NsSYh
         tVPFZRvrbsy7kqUE1v0Xb+/12CqyQlj9GHKbd8BfT3kZb/ADrdoZt748FOJ16FEkSFxZ
         +SeAUrxlMt/ttg6tKat5r5S3x+HC/1o4hPyUGN38uD//4ODsE7p7MOIjSurfr/N4Mb2q
         ObkOJxFm26xGwLt+bUSk0h33TmX9jqj0CtThLBYNwz15SkovW2uAxkVTto5u5xA+o2Kn
         8XSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/W2Q+rh6SYC69N4+qRFPXmvsKWm31cKUPxHw/esWu7k=;
        b=p+NUFelD72rHSOeM8Hv0mXaNkITKAjP3qzPWNJfPuOuCoJyW0hBtHMWFG6+H3xEtBS
         RBLd6t9MK3bwKVVc1zxqYy+3TDAMdSUaDbElB0HGuBvYB0bSqLrap6FxD8ixId+aNPrz
         bVNeYtSmZBiFfAtJrGYSGbbVG9Va5aZYun6IgRqBhv+D+MoFcnKNCNI7xiT1nwkmiuza
         Xy8KdTOB+ikJDPNYlT1+tW9VWZXWwxJjhKkKof0p4Qs/+igZsc2vnZnSF7+vWg6vypHn
         yqzCLvufkLEkA4PCgkCjWNi9BWdCox9mrpMFJh3tMUx0U2NjkBWYHaq+lTKj64X1+QAi
         l3qA==
X-Gm-Message-State: AJIora+F8YTYx9JKSDkpAifaG8cQbO5YTVdOp7EEDlWG2orPsVfA6QCg
	KfxRRX2AaPKLqgYYXsjo1mPcVJfD59f/KPM898Q=
X-Google-Smtp-Source: 
 AGRyM1v74GIH0AugZAt+30+78ECcjfi1XwgtCAoUzwEZNdtnmLuS8DG9CAglp7GeRhVsOjvJJB8Z1w==
X-Received: by 2002:a05:6402:1659:b0:43a:1735:e1ce with SMTP id
 s25-20020a056402165900b0043a1735e1cemr33747899edx.196.1657184919919;
        Thu, 07 Jul 2022 02:08:39 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 o19-20020a170906769300b0072b13a10477sm350542ejm.108.2022.07.07.02.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 02:08:39 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Javier Viguera <javier.viguera@digi.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][kirkstone][PATCH 2/3] networkmanager: fix build
 with enabled ppp
Date: Thu,  7 Jul 2022 11:06:52 +0200
Message-Id: <20220707090653.2513017-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220707090653.2513017-1-adrian.freihofer@siemens.com>
References: <20220707090653.2513017-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 09:08:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97767

From: Javier Viguera <javier.viguera@digi.com>

If 'ppp' packageconfig option is enabled, but the build system does NOT
have pppd binary installed, the build fails with:

| Has header "pppd/pppd.h" : YES
| Program pppd /sbin/pppd /usr/sbin/pppd found: NO
|
| ../NetworkManager-1.36.2/meson.build:570:4: ERROR: Assert failed: pppd required but not found, please provide a valid pppd path or use -Dppp=false to disable it

This is due to meson trying to look for the 'pppd' binary in the build
system when it should not. If the build system does not contain pppd,
the build fails.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../networkmanager/networkmanager_1.36.2.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
index ab8fc136a..eb9e1553c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
@@ -83,7 +83,7 @@ PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "-Dsession_tracking_consolekit=true,-Dsession_tracking_consolekit=false,consolekit,consolekit"
 PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info"
-PACKAGECONFIG[ppp] = "-Dppp=true,-Dppp=false,ppp"
+PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=${sbindir}/pppd,-Dppp=false,ppp,ppp"
 PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
 PACKAGECONFIG[resolvconf] = "-Dresolvconf=${base_sbindir}/resolvconf,-Dresolvconf=no,,resolvconf"
-- 
2.35.3


