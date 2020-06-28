Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.7229.1593383757202976136
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2020 15:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EnR1LKgb;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id h28so11311668edz.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2020 15:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=25Xch5r85LPzdISnCXh4/J080A9ylaHYNZEq5Asa+c4=;
        b=EnR1LKgbc1peZHmpuBvR3gWs2aAAgOGpg5QS+8gCL5IaitqtH2xut/1xXZM48s3ag+
         Wa8bnVwpmDsdjwyr82Uf3daWKIADg2L5pI9BXA6uT0R2U/7tCKzSvNknpXDXKXoHOkQ6
         thoTliTmMbZlwsf2bLLMQz8BPKiPDxrXPQ0H6nbHXKpNyjDLMfZMTEqSAo3YxuYhgAoE
         lsayJ2KBxZXRFf2XMuc5Rb1Uv7iZDlNFR8vKPTUkBLXRfjNQXL3Ug6r5O38aBbSINMCF
         d0JXQxw3qFhOQbJ0T92CCm4+pWytXAJvOine4uw5KMukajvyw8SEyHtzuBN9GwrenoaJ
         btCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=25Xch5r85LPzdISnCXh4/J080A9ylaHYNZEq5Asa+c4=;
        b=OsAdNN8WyfSvmnSCSo+MbKfbcoHoNmvvMYRx9c/rA7X5ZpHHfxA695FO3kdTnp7IzE
         bhNK6sEcFgxgbmXUl1f0NOQUPQDxdVASWnJhCbcWurX5tmi9vdJe3W6QWh6yia8Me4an
         olnsfYy4sqxyZIjAx/fx7wPSOTP7AUa+/wr5OVl+BJ/cXxDrGFWN9QprzbPtSc4Jl4yf
         Du5cJ8XaBf2xRPf3BUSS3vkYiOH30iydCRNRxDNibnb+9dIiw94VcvVWisZQeCAs/AcM
         f7nsuEe0ufgar28sc3ff9y9SKBhc+6uj3MIBPFmBLkmnrZU+W7OTbO4fCKurqdFHfsVI
         YYfw==
X-Gm-Message-State: AOAM532W4ktgRDxOt9O61teuZbI4/dnVJKNPoCuuMugNDa+eoA8DFQLs
	DkHC4akIe574uEbrmdk/JrUj+zyf
X-Google-Smtp-Source: ABdhPJy/KY0+Pl0XwpRpAoz0lI2UAQRS0wLzLI8R9cZ6mufoGpmmuZF8fcMPvzJetX2CaugFC43xmw==
X-Received: by 2002:aa7:c545:: with SMTP id s5mr2732852edr.19.1593383755076;
        Sun, 28 Jun 2020 15:35:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f4b8e33cbb401a015e6742d.dip0.t-ipconnect.de. [2003:f0:7f4b:8e33:cbb4:1a0:15e6:742d])
        by smtp.gmail.com with ESMTPSA id q25sm7602169ejz.97.2020.06.28.15.35.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 15:35:54 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/5] networkmanager: upgrade 1.22.10 -> 1.22.14
Date: Mon, 29 Jun 2020 00:35:41 +0200
Message-Id: <20200628223545.3853840-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

================================================
NetworkManager-1.22.14
Overview of changes since NetworkManager-1.22.12
================================================

This is a new stable release of NetworkManager.  Notable changes include:

* ifcfg-rh: handle "802-1x.{,phase2-}ca-path". Otherwise setting this
  property silently fails and a profile might accidentally not perform
  any authentication (CVE-2020-10754).
* ifcfg-rh: handle 802-1x.pin properties.

================================================
NetworkManager-1.22.12
Overview of changes since NetworkManager-1.22.10
================================================

This is a new stable release of NetworkManager.  Notable changes include:

* Fix a bug preventing lease renewal in the internal DHCP client.
* Add a new build option 'firewalld-zone'; when enabled,
  NetworkManager installs a firewalld zone for connection sharing and
  puts interfaces using IPv4 or IPv6 shared mode in this zone during
  activation. The option is enabled by default.
  Note that NetworkManager still calls to iptables to enable
  masquerading and open needed ports for DHCP and DNS. The new option
  is useful on systems using firewalld with the nftables backend,
  where the iptables rules would not be sufficient.
* Support changing the MTU of OVS interfaces.
* Better handle a restart of ovsdb process.
* Support the 'no-reload' and 'trust-ad' resolv.conf options.
* Various minor bug fixes and improvements.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{networkmanager_1.22.10.bb => networkmanager_1.22.14.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.22.10.bb => networkmanager_1.22.14.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
index 33a2b7c0c..30c6ebe6f 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
@@ -33,7 +33,7 @@ SRC_URI_append_libc-musl = " \
     file://musl/0003-Fix-build-with-musl-for-n-dhcp4.patch \
     file://musl/0004-Fix-build-with-musl-systemd-specific.patch \
 "
-SRC_URI[sha256sum] = "2b29ccc1531ba7ebba95a97f40c22b963838e8b6833745efe8e6fb71fd8fca77"
+SRC_URI[sha256sum] = "c6893971936a1ce252ba4fdff830c972d2ae93fec6751b57dcfd3ad9f0c949dd"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
@@ -106,6 +106,7 @@ FILES_${PN} += " \
     ${libexecdir} \
     ${libdir}/NetworkManager/${PV}/*.so \
     ${libdir}/NetworkManager \
+    ${libdir}/firewalld/zones \
     ${nonarch_libdir}/NetworkManager/conf.d \
     ${nonarch_libdir}/NetworkManager/dispatcher.d \
     ${nonarch_libdir}/NetworkManager/dispatcher.d/pre-down.d \
-- 
2.26.2

