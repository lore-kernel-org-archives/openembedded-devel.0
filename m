Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC7CC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 02:50:30 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.22786.1640573429473148140
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Dec 2021 18:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mEKd768p;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id h6so6655701plf.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Dec 2021 18:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LZDHmjncyueSl6KK9/nTJxbzeSz9Ao839iL6pvoh5VY=;
        b=mEKd768plvDxKQqCd2FGgk96hPpUZ8/2IJK7LaNk5jhKNogPiHXdegSxBLSokvcjYt
         DVkcWr8j0j4NcFkN1lClz5/XftFkm7OaRzuInEEg0WOBh9+0JH0F13J9Ut6DIlO2GICh
         AHMzfpovPFC3YQdXCqOzywOmBZ3N60glEFncXFqkYRyh+N2qEXl1SwKR8Yxd+6hscp+/
         uNbI6HAgwut/SeHolOyVQAnp3cBhQIJKP3ACGOy7lkJwNbkTzjxbldTXhvpzecFTL1lr
         wj5ey9Wium75gpZ64n5E32+b2p2QWkRwvAoRh+ruh11HmysfGCKSt7twvs3jgZq/6PAc
         bkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LZDHmjncyueSl6KK9/nTJxbzeSz9Ao839iL6pvoh5VY=;
        b=e5JKxvuv1l+3+620PeDMYXPuTZF68nWfCyyR8vLrOe/M3dNM0UZ9wjFycqvFNSmMvj
         1tDNxoVVMm+yih6yj35AZF2fGHPzqeaKCn4x3W07JxiwmBu1bDhM+945TtzgysNHQaOV
         S49D52F2V69g9nYQfTpiOHig+iZ9KtQmEdeKt1i29jebRfse0pWeYC5e2OTa51ZHlNtj
         Yp/YmrUkvmWXva51VqTyTqCG4qrePs98fcQXtPn4bXbC9aMQd04//Cs8wWVfcTr1bvG7
         mwZNE+olNdzOBWy7kbVZ2wUfQLNx2SDk55Z4lj0RWZfcY3cO+e4xBrZJKbM35NDZf8PZ
         aAtQ==
X-Gm-Message-State: AOAM531GnpzVkmGdzWeC4fH7TmMmC7fJjgpcJzdHwVO4pgnlkaUcVgx5
	NnfxZBC4tMPx0in+ueQs8Xou3fo7QFw=
X-Google-Smtp-Source: 
 ABdhPJwLKEwj9+BOPIlgrKRTiFB4rEIALSe8lyk4PVm0UUfr7hsEtotDXkXhg8toDY3Hl46O8C0igg==
X-Received: by 2002:a17:90b:4b0c:: with SMTP id
 lx12mr19391672pjb.146.1640573428656;
        Sun, 26 Dec 2021 18:50:28 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:9a12:d2b4:2175:e337])
        by smtp.gmail.com with ESMTPSA id
 e29sm12744268pge.17.2021.12.26.18.50.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 18:50:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/4] strongswan: add integrity options
Date: Sun, 26 Dec 2021 18:50:24 -0800
Message-Id: <20211227025025.1211176-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227025025.1211176-1-akuster808@gmail.com>
References: <20211227025025.1211176-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 02:50:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94502

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../strongswan/strongswan_5.9.4.bb            | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
index 265528851..6bdd5e3ab 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
@@ -27,7 +27,10 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-syst
 PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl cureve25519 \
         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
         ${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', 'tpm2', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'ima', 'tnc-imc imc-hcd imc-os imc-scanner imc-attestation', '', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'ima', 'tnc-imv imv-hcd imv-os imv-scanner imv-attestation', '', d)} \
 "
+
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
 PACKAGECONFIG[bfd] = "--enable-bfd-backtraces,--disable-bfd-backtraces,binutils"
 PACKAGECONFIG[charon] = "--enable-charon,--disable-charon,"
@@ -51,6 +54,33 @@ PACKAGECONFIG[systemd-charon] = "--enable-systemd,--disable-systemd,systemd,"
 # tpm needs meta-tpm layer
 PACKAGECONFIG[tpm2] = "--enable-tpm,--disable-tpm,,${PN}-plugin-tpm"
 
+
+# integraty configuration needs meta-integraty
+#imc 
+PACKAGECONFIG[tnc-imc] = "--enable-tnc-imc,--disable-tnc-imc,,  ${PN}-plugin-tnc-imc ${PN}-plugin-tnc-tnccs"
+PACKAGECONFIG[imc-test] = "--enable-imc-test,--disable-imc-test,,"
+PACKAGECONFIG[imc-scanner] = "--enable-imc-scanner,--disable-imc-scanner,,"
+PACKAGECONFIG[imc-os] = "--enable-imc-os,--disable-imc-os,,"
+PACKAGECONFIG[imc-attestation] = "--enable-imc-attestation,--disable-imc-attestation,,"
+PACKAGECONFIG[imc-swima] = "--enable-imc-swima, --disable-imc-swima, json-c,"
+PACKAGECONFIG[imc-hcd] = "--enable-imc-hcd, --disable-imc-hcd,,"
+
+#imv set
+PACKAGECONFIG[tnc-imv] = "--enable-tnc-imv,--disable-tnc-imv,, ${PN}-plugin-tnc-imv ${PN}-plugin-tnc-tnccs"
+PACKAGECONFIG[imv-test] = "--enable-imv-test,--disable-imv-test,,"
+PACKAGECONFIG[imv-scanner] = "--enable-imv-scanner,--disable-imv-scanner,,"
+PACKAGECONFIG[imv-os] = "--enable-imv-os,--disable-imv-os,,"
+PACKAGECONFIG[imv-attestation] = "--enable-imv-attestation,--disable-imv-attestation,,"
+PACKAGECONFIG[imv-swima] = "--enable-imv-swima, --disable-imv-swima, json-c,"
+PACKAGECONFIG[imv-hcd] = "--enable-imv-hcd, --disable-imv-hcd,,"
+
+PACKAGECONFIG[tnc-ifmap] = "--enable-tnc-ifmap,--disable-tnc-ifmap, libxml2, ${PN}-plugin-tnc-ifmap"
+PACKAGECONFIG[tnc-pdp] = "--enable-tnc-pdp,--disable-tnc-pdp,, ${PN}-plugin-tnc-pdp"
+
+PACKAGECONFIG[tnccs-11] = "--enable-tnccs-11,--disable-tnccs-11,libxml2, ${PN}-plugin-tnccs-11"
+PACKAGECONFIG[tnccs-20] = "--enable-tnccs-20,--disable-tnccs-20,, ${PN}-plugin-tnccs-20"
+PACKAGECONFIG[tnccs-dynamic] = "--enable-tnccs-dynamic,--disable-tnccs-dynamic,,${PN}-plugin-tnccs-dynamic"
+
 inherit autotools systemd pkgconfig
 
 RRECOMMENDS:${PN} = "kernel-module-ah4 \
@@ -68,6 +98,12 @@ CONFFILES:${PN} = "${sysconfdir}/*.conf ${sysconfdir}/ipsec.d/*.conf ${sysconfdi
 PACKAGES += "${PN}-plugins"
 ALLOW_EMPTY:${PN}-plugins = "1"
 
+PACKAGE_BEFORE_PN = "${PN}-imcvs ${PN}-imcvs-dbg"
+ALLOW_EMPTY:${PN}-imcvs = "1"
+
+FILES:${PN}-imcvs = "${libdir}/ipsec/imcvs/*.so"
+FILES:${PN}-imcvs-dbg += "${libdir}/ipsec/imcvs/.debug"
+
 PACKAGES_DYNAMIC += "^${PN}-plugin-.*$"
 NOAUTOPACKAGEDEBUG = "1"
 
-- 
2.25.1


