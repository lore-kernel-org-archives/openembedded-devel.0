Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D59C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 22:02:06 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.4705.1654552915129654187
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 15:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B5DnGesh;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id x5so15491186edi.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 15:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hqfN0Jck7k5aqESZIi40y75kFXqMEXit63YX3djMMRs=;
        b=B5DnGeshX5+4+V46tHqM0r9MtoO6fGDA8XOm2cfptdfvHgi8kgIk+KdRWFOUDU7BRT
         LBH28NzLPxWuqzWMyb0bb6dZBF9eRuSsk1MyLGjzPn1FDgeUXSDkSEYoYik34XMYpJO1
         6nkoFcBvsbyLvmRnOlTUzwLJLPxrvOznE4ZB+LZBVUqzYuVgqV15ujaHzAnhCBRfjT6i
         jAXqVBL6sQJSyTmeWStcTKogNOlLnZeC4QRhfBHHwvyQS23FejiHj69VVSKDQlJr9CUM
         IFoiIRUwTd7wC/dH6e39MCUI+xaT5faR3ovYMqSZmD1ulxImqm2IxLtoxslhXAF5zURj
         auAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hqfN0Jck7k5aqESZIi40y75kFXqMEXit63YX3djMMRs=;
        b=h481e/XkEnEg6ulkazMeU0Ha76LOQNs7xbHTxf3ZJfjMESDavyGeEl52Hn7TZRlEF4
         /xDgYLfKywhPneneLBUGu8E73qmpwx8HtS6m3VpouOiqwa8Qp0F0ZpcfzQ1B8PNicaVJ
         fgQ7UIVaImYbScpZP87G/kjPZzLuW4XYbW3GMbwiToThwT31e9F2UB3ILsRzVtNLSy7H
         BVPjynk9TPRh5/88rLF8jKdbnElYIQ4gewHi1zPcnGdUdUa5TCWMqsEqbiMmbdOt1O/A
         LJzn0fWXK1o4V6KyVL9d8kho+EzwJKPTcf9W+3YNUJVMg9hyfg2tnI9rw+dLltIJyIS+
         yq3Q==
X-Gm-Message-State: AOAM533RsyhrnfsTGfwkPYUa5wh54Pq/r0vggExNq3A047ivEIXC0hJR
	r1pdtRfhJRu2LImoO43J8vfvTocLcfIYgw==
X-Google-Smtp-Source: 
 ABdhPJy3XxOT24E0sAVw7gxRLIOyW0Eo7fSWr4cxofcsLCBRZTw2YiYtk0M1PDcbuZ/2+BiGJDbGLg==
X-Received: by 2002:aa7:d052:0:b0:42d:d114:43f7 with SMTP id
 n18-20020aa7d052000000b0042dd11443f7mr28944917edo.320.1654552913498;
        Mon, 06 Jun 2022 15:01:53 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 d20-20020aa7ce14000000b0042dd4ccccf5sm9134826edv.82.2022.06.06.15.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 15:01:53 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH 4/5] networkmanager: udpate to 1.38.0
Date: Tue,  7 Jun 2022 00:01:36 +0200
Message-Id: <20220606220137.1887491-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
References: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 22:02:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97435

* Add support for route type "throw".
* Fix bug setting priority for IP addresses.
* Static IPv6 addresses from "ipv6.addresses" are now preferred over
  addresses from DHCPv6, which are preferred over addresses from autoconf.
  This affects IPv6 source address selection, if the rules from
  RFC 6724, section 5 don't give a exhaustive match.
* Static IPv6 addresses from "ipv6.addresses" are now interpreted with
  first address being preferred. Their order got inverted. This is now
  consistent with IPv4.
* Wi-Fi hotspots will use a (stable) random channel number unless one is
  chosen manually.
* Don't use unsupported SAE/WPA3 mode for AP mode.
* NetworkManager will no longer advertise frequencies as supported when
  they're disallowed in configured regulatory domain.
* Attempt to connect to WEP-encrypted Wi-Fi network will now fail
  gracefully with a recent version of wpa_supplicant when built
  without WEP support. As long as wpa_supplicant supports WEP,
  NetworkManager will continue to work.
* Disable WPA3 transition mode for wifi.key-mgmt=wpa-psk if the NIC
  does not support PMF. This is known to cause problems in some setups. It
  is still possible to explicitly configure wifi.key-mgmt=sae for WPA3.
* Add new dummy crypto backend "null" that does nothing. NetworkManager
  uses the crypto library when handling certificates for 802.1x profiles.
* Veth devices with name "eth*" are now managed by default via the
  udev rule. This is to support managing the network in LXD containers.
* The hostname received from DHCP is now shortened to the first dot
  (or to 64 characters, whatever comes first) if it's too long.
* As the insecure WEP encryption for Wi-Fi network is phased out,
  nmcli now discourages its use when activating or modifying a
  profile.
* Fix connectivity checks in case the check endpoint address resolves to
  multiple addresses.
* Workaround libcurl blocking NetworkManager while resolving DNS names.
* nmcli: indicate missing Wi-Fi hardware when showing rfkill setting.
* nmcli: add connection migrate command to move a profile to a specified
  settings plugin. This allows to convert profiles in the deprecated ifcfg-rh
  format to keyfile.
* Set "src" attribute for routes from DHCPv4 to the leased address. This
  helps with source address selection.
* Updated translations.
* Various bugfixes and internal improvements.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 ...t-add-dependency-libnm_client_public.patch | 34 -------------------
 ...ger_1.36.2.bb => networkmanager_1.38.0.bb} |  4 +--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.36.2.bb => networkmanager_1.38.0.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch
deleted file mode 100644
index 6be2d4bed1..0000000000
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-libnm-client-test-add-dependency-libnm_client_public.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7b5dc04e1fcc28dc653fb7bf0e9dda3700d93218 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Tue, 3 May 2022 15:30:37 +0800
-Subject: [PATCH] libnm-client-test: add dependency libnm_client_public_dep
-
-Fix parallel build error:
-| In file included from ../NetworkManager-1.36.0/src/libnm-client-test/nm-test-utils-impl.c:10:
-| ../NetworkManager-1.36.0/src/libnm-client-public/NetworkManager.h:47:10: fatal error: nm-enum-types.h: No such file or directory
-|    47 | #include "nm-enum-types.h"
-|       |          ^~~~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted
-[https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/1206]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/libnm-client-test/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libnm-client-test/meson.build b/src/libnm-client-test/meson.build
-index 8e2fba1130..bcac437702 100644
---- a/src/libnm-client-test/meson.build
-+++ b/src/libnm-client-test/meson.build
-@@ -13,6 +13,7 @@ libnm_client_test = static_library(
-   ],
-   dependencies: [
-     libnm_core_public_dep,
-+    libnm_client_public_dep,
-     glib_dep,
-   ],
- )
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb
index 55eb3e7024..d52ad6e6ce 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.38.0.bb
@@ -30,9 +30,8 @@ SRC_URI = " \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
     file://0001-do-not-ask-host-for-ifcfg-defaults.patch \
-    file://0001-libnm-client-test-add-dependency-libnm_client_public.patch \
 "
-SRC_URI[sha256sum] = "ab855cbe3b41832e9a3b003810e7c7313dfe19e630d29806d14d87fdd1470cab"
+SRC_URI[sha256sum] = "82a4cf07ddfeb0816787b67c0f5058ae6c50d6259c0b0541a24e35156062b2ef"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
@@ -92,6 +91,7 @@ PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
 PACKAGECONFIG[resolvconf] = "-Dresolvconf=${base_sbindir}/resolvconf,-Dresolvconf=no,,resolvconf"
 PACKAGECONFIG[gnutls] = "-Dcrypto=gnutls,,gnutls"
+PACKAGECONFIG[crypto-null] = "-Dcrypto=null"
 PACKAGECONFIG[wifi] = "-Dwext=true -Dwifi=true,-Dwext=false -Dwifi=false"
 PACKAGECONFIG[iwd] = "-Diwd=true,-Diwd=false"
 PACKAGECONFIG[ifupdown] = "-Difupdown=true,-Difupdown=false"
-- 
2.35.3


