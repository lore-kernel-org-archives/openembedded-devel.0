Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BEACCA47C
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 02:03:45 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.79646.1656986615273343720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 19:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FfVHGAng;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id o26so684942qkl.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 19:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Gnq5bz9FgOafB2b+C5MT7qg1V+EFjsXK4K9QR7t3I8k=;
        b=FfVHGAngyICFsdXw3N+TlvYma6uSLuCPboXDokuE2YYBpWUbwgHuE5AZUVd6y0jCAC
         kxaBFthtSg5ZB7FjkBA/R3Rc88qhZLiaOLRLuZYq4HnxNqSPxa6ATIoaouYVTDTm1WKb
         6O765iK5VgmyNH2+EdJY2V7IByEH9/UtZAdsovRUfU/j9Aj3Qh177gKKqWvi9HfTWbwX
         C1QTHlMAWj4LaSj6l38Aob239pANieG+178BGeOfgzutgAX95sljAOcrbfEHZGzgcXX7
         5bA51eOfXZhaq+WMqG9ETyaVOAQB3z8WQCAZ8GPH1JFq9t2FEOoFMBeF3FDCPBQGI6qr
         RAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gnq5bz9FgOafB2b+C5MT7qg1V+EFjsXK4K9QR7t3I8k=;
        b=XdbUeUiOs7FipTL2qFgDPT6axwFR5bt9w7l/kiEcldZttz+k6CdF8cP52JfsMvEGP4
         x2+Q0Jv6hhQZNIm+RKz6RzgeFzSdLKE4IWvi2FZZ9SA1CD9MVprrAixaeMkOY2Aw6kbk
         gxfjmFaRhngpHNgQzS/KxuSZEEIuAhNox8uR9R6a3bw2VYn4znihA2DxOVCAkZ+xUyvX
         xUZbEhWie+PhYJ72eLVYxsFUfuEPZu9c9y74/Hv8S1sbaa9vfY8m6fZH9IYhCrLDFnkZ
         8Z9fhLCCyzzQU91mbCv6cWi1rJteTnHPvBNPATqbAAkHIWVFGOt+kYIEPLgumWQZ7SFo
         zu9A==
X-Gm-Message-State: AJIora9GY9Wc4e6KMV9dQuj0BhwkX+CQDpoizVZM24d9D7wrZS5rF4V3
	gXgr+drioJ2IyQlyI0TZNCGnTFNhA8k=
X-Google-Smtp-Source: 
 AGRyM1sgx4XrprQPmrd1+YzoeJC5OSBaEahSDmhSoAKXESEdspTSI44Eil/N7Ez1Fv68tACQDCboEg==
X-Received: by 2002:a05:620a:4306:b0:6a9:7122:edb2 with SMTP id
 u6-20020a05620a430600b006a97122edb2mr22027345qko.502.1656986614079;
        Mon, 04 Jul 2022 19:03:34 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:14b1:7390:8d3d:13ec:9f3e:a504])
        by smtp.gmail.com with ESMTPSA id
 br14-20020a05620a460e00b006a6ce613c7csm21725220qkb.89.2022.07.04.19.03.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 19:03:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 1/5] networkmanager: fix build with enabled ppp
Date: Mon,  4 Jul 2022 22:03:25 -0400
Message-Id: 
 <7040cffbb06b2ae0a03b5353b2698a5c5ead9172.1656986538.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656986538.git.akuster808@gmail.com>
References: <cover.1656986538.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 02:03:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97696

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../networkmanager/networkmanager_1.36.2.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
index 6c665d53bb..e3b1296a6b 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
@@ -83,7 +83,7 @@ PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "-Dsession_tracking_consolekit=true,-Dsession_tracking_consolekit=false,consolekit,consolekit"
 PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info"
-PACKAGECONFIG[ppp] = "-Dppp=true,-Dppp=false,ppp,ppp"
+PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=/usr/sbin/pppd,-Dppp=false,ppp,ppp"
 PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
 PACKAGECONFIG[resolvconf] = "-Dresolvconf=${base_sbindir}/resolvconf,-Dresolvconf=no,,resolvconf"
-- 
2.25.1


