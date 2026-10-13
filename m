Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302D1CC6B09
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 04:40:41 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.353.1791866439645521245
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 21:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hjToQAc9;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4b1f7e8f4so1364108a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866439; x=1792471239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ruEFNvF/oog/e3udKVsp4XeOS530kqu1POusOijh2F8=;
        b=hjToQAc9/mfCkEABhmxCZuMfMQlT27fOu5uafGJylX4M7ltvYiQzlTi0MLDxjoaI2k
         ZH5Ot8hws3mnmXorik96KmsjZ9y9rdDjiMVPW+yxlQj6g36ip600mSYh8nIL6I6vZK8L
         SSmdjimx6vmJHSSq16JQsprduejPVHziaVPIcZ2BGQOPjsv7N9xZP8G4njOu9H92s1tu
         bAP8ltoum7GAuPieFEl59CnF5fpg9d1KNFsTyPC9pg2gXYRlJSlMX2GIOyxXZqL4zp7Y
         bHC22Ue1sDH3H2x/dtySiMzuNGKesC1oQdLfDozbNSVZ/Pl84VRibKe/ttDkibibY7Vi
         QBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866439; x=1792471239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ruEFNvF/oog/e3udKVsp4XeOS530kqu1POusOijh2F8=;
        b=LA0FDXhEyCmJnMZZKn51h4kGcu21nvLAoO7S0Ec5Fr+sMIo8tFxlLW6wXlve67GBvN
         POvW6rI1Lw7uZRI62Nm77YBdCDX0QCkGtiDuL1lqjb9jMqXCW08ycerE1f+WVfFE/0xK
         yjIfHNW14LCkKeHBREbvP1rvUvS+o+YT9PtFTH/qKoV6WiTZBoDlLVhxAjLsWmID9LN5
         Rueq01l4ey6IvUTvtFOA6ZwRilkW4+s4DeAsukyVuKSUXXN7njLretmDUm21PFvLtsh3
         SRQm++9VQogD5DYdfIP/xRbsIIzRPyJlw/r3qIv6MYMV3zCgv/1dD4bsRH9xK7US5OAH
         LZmQ==
X-Gm-Message-State: AFq9FYKAY4VdHG4uuofdBNZJMiB7OAlKKmwvRY9vrPGO5ujZZUzAN2q1
	Q6Vk7gjjTwTEs5/jlZ4RI3TphJF8pdDwyIIRrfZAloboj7U98SEjPpX9Vz5oCg==
X-Gm-Gg: AYBFou009pbzE0E1wdJYpAsrBigXEg7dEv2Gk2ANu28Zld2P7qGlHAhg6Hxld7FOKnh
	JbaU+PHmwP1RZY9/8Z+b7bu/PdfVRGVVEgGaQAw2FFipROhHspeR2tWnsITOqDx5i5tfEVpYKqB
	S2SjFM7gLGQegvQEjulkWG3+MWU1qfsoVbwuXn+KlQ7/OBfm6RUszvlWefh9G07L0wIz3eK4CYR
	ko852J+iJmeND4sYRPciGIMT0WcpbivqGmQ/2mwgZfso+HTyPx+szKeFtiCA07gCIv8GQ895XiK
	QJi8XVHfoiGMRwgR42SH9+f5EM5pLMINXVbl0p+t/eTLo7eNfoCBSwUGStABuIUiK4d0uERJLan
	iSgQFi3kMrEbuxKnFlHfmnGp9iM6RmQ3R+3irsh7hG7prya4LH1WYMvDozm/9pqIl7OqYspG446
	scOjY4968Ot2SJ8RuiSZ3fMzisfR+0/+P1aoUTR/YhzcbIKb/70yO8w4F/PYNSw0YRkYZAY/jxU
	gQwRa0+B9qVtQtH7bK+9M1RCVAoN7Du3QI4Y08=
X-Received: by 2002:a17:90a:e09:b0:3ab:3d8e:f29 with SMTP id 98e67ed59e1d1-3ab3d8e36e0mr6000062a91.46.1791866438976;
        Mon, 12 Oct 2026 21:40:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm11672757a91.1.2026.10.12.21.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:40:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 8/16] strongwan: upgrade 6.0.7 -> 6.1.0
Date: Tue, 13 Oct 2026 17:39:58 +1300
Message-ID: <20261013044006.834868-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
References: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 04:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130822

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Remove PACKAGECONFIG entries for soup, tnc-ifmap, tnccs-11, tnccs-dynamic
- Include xauth-generic in default PACKAGECONFIG. This preserves default
  plugin as upstream disabled IKEv1 by default.

root@qemux86-64:~# swanctl --stats
uptime: 38 seconds, since Oct 13 03:27:29 2026
worker threads: 16 total, 11 idle, working: 4/0/1/0
job queues: 0/0/0/0
jobs scheduled: 0
IKE_SAs: 0 total, 0 half-open
mallinfo: sbrk 1503232, mmap 0, used 552176, free 951056
loaded plugins: charon-systemd random nonce x509 revocation constraints pubkey pkcs1 pkcs7 pgp dnskey sshkey pem openssl pkcs8 xcbc cmac kdf drbg curl sqlite attr kernel-netlink resolve socket-default vici updown xauth-generic

Changelog:
https://github.com/strongswan/strongswan/releases/tag/6.1.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{strongswan_6.0.7.bb => strongswan_6.1.0.bb}       | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_6.0.7.bb => strongswan_6.1.0.bb} (94%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.1.0.bb
similarity index 94%
rename from meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
rename to meta-networking/recipes-support/strongswan/strongswan_6.1.0.bb
index 117c148865..f6dac33c0f 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.1.0.bb
@@ -10,7 +10,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"
+SRC_URI[sha256sum] = "fe6c97481298767213cfc2e9a1da29fdd8018d481ff4cb9cf0283099654f20d4"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -21,7 +21,7 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ?= "curl openssl sqlite3 swanctl \
+PACKAGECONFIG ?= "curl openssl sqlite3 swanctl xauth-generic \
         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
         ${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', 'tpm2', '', d)} \
         ${@bb.utils.contains('DISTRO_FEATURES', 'ima', 'tnc-imc imc-hcd imc-os imc-scanner imc-attestation', '', d)} \
@@ -48,10 +48,10 @@ PACKAGECONFIG[pkcs12] = "--enable-pkcs12,--disable-pkcs12,,${PN}-plugin-pkcs12"
 PACKAGECONFIG[rc2] = "--enable-rc2,--disable-rc2,,${PN}-plugin-rc2"
 PACKAGECONFIG[sha1] = "--enable-sha1,--disable-sha1,,${PN}-plugin-sha1"
 PACKAGECONFIG[sha2] = "--enable-sha2,--disable-sha2,,${PN}-plugin-sha2"
-PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup,${PN}-plugin-soup"
 PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,${PN}-plugin-sqlite"
 PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,,${PN}-plugin-stroke"
 PACKAGECONFIG[swanctl] = "--enable-swanctl,--disable-swanctl,,libgcc"
+PACKAGECONFIG[xauth-generic] = "--enable-xauth-generic,--disable-xauth-generic,,${PN}-plugin-xauth-generic"
 PACKAGECONFIG[curve25519] = "--enable-curve25519,--disable-curve25519,, ${PN}-plugin-curve25519"
 
 # requires swanctl
@@ -80,12 +80,9 @@ PACKAGECONFIG[imv-attestation] = "--enable-imv-attestation,--disable-imv-attesta
 PACKAGECONFIG[imv-swima] = "--enable-imv-swima, --disable-imv-swima, json-c,"
 PACKAGECONFIG[imv-hcd] = "--enable-imv-hcd, --disable-imv-hcd,,"
 
-PACKAGECONFIG[tnc-ifmap] = "--enable-tnc-ifmap,--disable-tnc-ifmap, libxml2, ${PN}-plugin-tnc-ifmap"
 PACKAGECONFIG[tnc-pdp] = "--enable-tnc-pdp,--disable-tnc-pdp,, ${PN}-plugin-tnc-pdp"
 
-PACKAGECONFIG[tnccs-11] = "--enable-tnccs-11,--disable-tnccs-11,libxml2, ${PN}-plugin-tnccs-11"
 PACKAGECONFIG[tnccs-20] = "--enable-tnccs-20,--disable-tnccs-20,, ${PN}-plugin-tnccs-20"
-PACKAGECONFIG[tnccs-dynamic] = "--enable-tnccs-dynamic,--disable-tnccs-dynamic,,${PN}-plugin-tnccs-dynamic"
 
 inherit autotools systemd pkgconfig
 
@@ -174,7 +171,6 @@ RDEPENDS:${PN} += "\
     ${PN}-plugin-updown \
     ${PN}-plugin-vici \
     ${PN}-plugin-x509 \
-    ${PN}-plugin-xauth-generic \
     ${PN}-plugin-xcbc \
     "
 

