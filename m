Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BD1CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 22:01:56 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.4704.1654552912507215823
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 15:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eHjR4wOw;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id fu3so30059648ejc.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 15:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fQvIsw9dcxMPUqLkRaIE3bFLA2jhp0fuW8f5Hf8ujAY=;
        b=eHjR4wOwH+K5TBgB7LU+W02SolCKyy7icYypLpSsw/clqLDfnzNp6T2sMjnvuCB5eo
         ZvG5dQ4XA8uXFhWNj9EE4oImIvgYviE4wpmJ9doGGUF4dX0ZalgkbgBKYVaXHAO0GMo+
         wHPOnG8juPptGKQ+yaY32iUic8sWwNeLRtI04XQbO/GIfXRnx97Ct4ZXJUqOy35vIa79
         4EFfnJwUWBl8I5WosUGJCs92t7srFLcQ+5OTlX/f5E0gftiEbwR0CLehDvZzGBW7/1Na
         fKatJrQnQl29DV3kdMYVugk8+Shu5Abs7h90jFMLlh6BYiDngUvrf5V2LTZDfvz+62wD
         Hhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fQvIsw9dcxMPUqLkRaIE3bFLA2jhp0fuW8f5Hf8ujAY=;
        b=mszQHufglTXJtRlLP+2dsn1AYq3Sd/U40f2FrRf7PJyoB4J99TjHjc6vnTcIKlAVrh
         ppTR92WQo0xEl5Wk1IMIJhBUedIw7KfQUKpGsHi3OcxUgfs+t1NB9lTwags9JuI7HAme
         SD7FXQkDqN6NqUDUulnyi+l311RbocPfyTahb5RY5z+pk4nWG6Xrzl9jOUMGRAp4rrjx
         20OH6/SaJ2soQaAicQojEmnz2oKNVDzE+6B0EgNsduWf6brQ0MA9eENtHtu+N5tWc1oZ
         63ZDx5eDOSvOphUH5idLmCvHPRTJ7pzgEVv2xrcKBMOdI3BrS93L2czfd76i3gbiT4KZ
         5Ivw==
X-Gm-Message-State: AOAM5335C/vY4Wci82SFDf580vhdHJ0k6W975t2JbhgWf14VAlVmMdOs
	+MkaTq0I6+/MKiBwqqEM/Cf8JkBjyvz9vg==
X-Google-Smtp-Source: 
 ABdhPJzymylQrfqqA+kt1sGsA4VmQDz9REzHgsffQ5A5MqQzEM2JNkVzA/Unr+qmvw9Ze6G1CB9FSA==
X-Received: by 2002:a17:906:90cf:b0:70b:43a2:658b with SMTP id
 v15-20020a17090690cf00b0070b43a2658bmr21369003ejw.450.1654552910895;
        Mon, 06 Jun 2022 15:01:50 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 d20-20020aa7ce14000000b0042dd4ccccf5sm9134826edv.82.2022.06.06.15.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 15:01:50 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH 1/5] networkmanager: improve dependency
 handling
Date: Tue,  7 Jun 2022 00:01:33 +0200
Message-Id: <20220606220137.1887491-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
References: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 22:01:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97432

Plugins of networkmanager redpends on related services. If for example
modemmanager or wpa-supplicant is not installed but the related
networkmanager plugin is, the plugin writes error messages to the
syslog.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../networkmanager/networkmanager_1.36.2.bb   | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
index 6c665d53bb..ab8fc136a9 100644
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


