Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9D5CCA479
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 09:08:43 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.3463.1657184921098744699
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KYeZgZlu;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id h23so31232417ejj.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4f8xVTNKjxxJEFEMRaasWicSkppElP25vukVHdSXMkY=;
        b=KYeZgZlufWHDNM6WrCe0Rno//Ins2sRvz4/lcd/+ofIsbXeOVT5Fhu38AV3PVSzz/s
         DQngAhgsROkDZi3oy58mHJzzG8Wm25G/fyTFKmuxGrbrPg4MKkgSkJmpmNpLg+RRgXmF
         5zWzcd5ejBy5jO5T2CfiDG08ALFREcJwaclf3uowCwWFWDVd4EBgNvNxQLxOaJUN5Mwc
         JFRj+9NBSQXSOp5MO6ANlPfNuKTxKPhJKcXKUFuEA3n2cEaBRu44TQF/q0LklNdT4A2a
         /fT8D359v/nl0pHzfYAJ6OA+T6G85l/Mb96T+cQvkLBmEhryO3MKYEql4sBQmsjE7VHL
         8MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4f8xVTNKjxxJEFEMRaasWicSkppElP25vukVHdSXMkY=;
        b=PoZs+puXBr+7wgeuNzPxgSxwRgDMWA89qmgtVXWDdl2CEO+p3JweR6l7P96knUhX37
         rcbfAoMMirvxiTp6O4AXiuiroUEzawQ3rt+ZJuQ6HLvJ9WiaJswdy3odx7XTMdFCplJK
         of4u8MKOu0vTPpQjkw6KvEWtC4vG+OUjFjthaqUhflQsNR6wxWm0TcLhdKXJ/Lmkiium
         wIYovpBdFB9GzMxUQNYwDa93UC0ubkVpdmJeflSrRCuE/4wkkwtT27DjCXvEwejRnbGS
         KQeGPJnefeicl5ZsqcS5mDU13qSaxwfNQ0OyKzTxEJJp78G8/x5U0L8oRGLVcfYoB+Z3
         Gk4w==
X-Gm-Message-State: AJIora+D8q7uVx7/JajTkr+iLaqRqGcUSFY3oWRaIiRE47rt4lWciWQz
	LsGAV+ZT6KBDbZSveqrd2pZQJkiJUFcrBRljXXQ=
X-Google-Smtp-Source: 
 AGRyM1sfc1bVBj8hA9H83X3jK7vttAOnsksisZZBs85a1wQuNzXb+qhCBR9jSjnvCn+FRH7MC0F9zQ==
X-Received: by 2002:a17:907:60c8:b0:726:d5c1:385c with SMTP id
 hv8-20020a17090760c800b00726d5c1385cmr41759980ejc.490.1657184919158;
        Thu, 07 Jul 2022 02:08:39 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 o19-20020a170906769300b0072b13a10477sm350542ejm.108.2022.07.07.02.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 02:08:38 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][kirkstone][PATCH 1/3] networkmanager: improve
 dependency handling
Date: Thu,  7 Jul 2022 11:06:51 +0200
Message-Id: <20220707090653.2513017-2-adrian.freihofer@siemens.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/97766

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Plugins of networkmanager redpends on related services. If for example
modemmanager or wpa-supplicant is not installed but the related
networkmanager plugin is, the plugin writes error messages to the
syslog.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../networkmanager/networkmanager_1.36.2.bb   | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
index 6c665d53b..ab8fc136a 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
@@ -83,7 +83,7 @@ PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "-Dsession_tracking_consolekit=true,-Dsession_tracking_consolekit=false,consolekit,consolekit"
 PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info"
-PACKAGECONFIG[ppp] = "-Dppp=true,-Dppp=false,ppp,ppp"
+PACKAGECONFIG[ppp] = "-Dppp=true,-Dppp=false,ppp"
 PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
 PACKAGECONFIG[resolvconf] = "-Dresolvconf=${base_sbindir}/resolvconf,-Dresolvconf=no,,resolvconf"
@@ -153,12 +153,26 @@ FILES:${PN}-nmtui-doc = " \
     ${mandir}/man1/nmtui* \
 "
 
-FILES:${PN}-wifi = "${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-wifi.so"
+FILES:${PN}-wifi = "\
+    ${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-wifi.so \
+    ${libdir}/NetworkManager/conf.d/enable-iwd.conf \
+"
+def get_wifi_deps(d):
+    packageconfig = (d.getVar('PACKAGECONFIG') or "").split()
+    if 'wifi' in packageconfig:
+        if 'iwd' in packageconfig:
+            return 'iwd'
+        else:
+            return 'wpa-supplicant'
+    else:
+        return ''
+RRECOMMENDS:${PN}-wifi += "${@get_wifi_deps(d)}"
 
 FILES:${PN}-wwan = "\
     ${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-wwan.so \
     ${NETWORKMANAGER_PLUGINDIR}/libnm-wwan.so \
 "
+RRECOMMENDS:${PN}-wwan += "${@bb.utils.contains('PACKAGECONFIG','modemmanager','modemmanager','',d)}"
 
 FILES:${PN}-ovs = "\
     ${NETWORKMANAGER_PLUGINDIR}/libnm-device-plugin-ovs.so \
@@ -173,6 +187,7 @@ FILES:${PN}-ppp = "\
     ${NETWORKMANAGER_PLUGINDIR}/libnm-ppp-plugin.so \
     ${libdir}/pppd/*/nm-pppd-plugin.so \
 "
+RRECOMMENDS:${PN}-ppp += "${@bb.utils.contains('PACKAGECONFIG','ppp','ppp','',d)}"
 
 FILES:${PN}-dev += " \
     ${libdir}/pppd/*/*.la \
-- 
2.35.3


