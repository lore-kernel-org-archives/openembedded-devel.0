Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A08C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 20:38:16 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.30756.1640637495414024288
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 12:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A+8+fKfj;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id l10so14320636pgm.7;
        Mon, 27 Dec 2021 12:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D/tBBBOB/xTkECPVziG81TKVwm2vr028xvc89wCnKXM=;
        b=A+8+fKfjBVUkLaGOB6ubAKpxzWHOz/EiwQcKlVXO803eyEbFwJOQZrH7Ak6QWETCYi
         SWNN5RtOACiR4w1qA1sujSb5UgYAv26Lu9UjW1YcHfINIaeYGCabhdmFQAjpxMh2hze8
         03Jk7Z7AzMGY4I6OAHkLBbhWYytLJ9P1l/rY4KvcmmqwfIRxjW7Xl5LCxfSrlmxttkhS
         jZoDQ1jtoed2JcQJhHraeOLLgvcYqY8qocW4NzRqWwafbwE9EVvRBkZ5YVTr4pEtT2JZ
         22YkuPkoiyOqSnqTyYPNCEW1Vk9VCjusLDrSS0i1pkUl9KOJEqVpcLeynW2wjn79rBJB
         GRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D/tBBBOB/xTkECPVziG81TKVwm2vr028xvc89wCnKXM=;
        b=VfkDrPIGtB2f05qWAP1XapaquFTtOSeBX9229WdKA8zmZVlMrGb7HgKBHExggWJkoG
         iqsJf6m+Rk3NCA710NVEAIGZk4H/zxgDOtzEVAd4WM0CQX6R/ct/aXDHvxlhZLtyDmvU
         L21f38mlNw6CUmAs3dYEz8OA1v0sPOszNnc+ToAMh7N4BdWcsZxm3BSFyGN8Xlba4LVB
         RWWghhrkrTpX7Qqjs/5l9z/fi6E9N/misjitnmVtn9sKLITIc4tPjpwd9doUs7J9YzJW
         MpKgxoIchkhIi2t5r3zO64aCvXrL59KgK4x153xGpAdVxFP2fjSI9BMjoIENp0jttJL5
         4rGw==
X-Gm-Message-State: AOAM532nW9i0Gmo2pAa0U0iW19dcI/7pKrz1ZZaS8XZ91CDtsoLcLlMz
	K3TWjwEbcZ7Dh/wC+5LSbAif5o7vy34=
X-Google-Smtp-Source: 
 ABdhPJx6TU4Lt0k2EJ0FpRo9ZbqbS4WgjMhyZqepVuPSZx6Uf2XFFQG/nV6Zjab5iSt2+zhCeADvvQ==
X-Received: by 2002:a63:87c7:: with SMTP id
 i190mr16976516pge.93.1640637494748;
        Mon, 27 Dec 2021 12:38:14 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:67e3:bc71:b585:c820])
        by smtp.gmail.com with ESMTPSA id
 br24sm19962896pjb.40.2021.12.27.12.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 12:38:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Armin Kuster via lists.openembedded.org"
 <akuster808=gmail.com@lists.openembedded.org>
Subject: [meta-networking][v2][PATCH 3/4] strongswan: add integrity options
Date: Mon, 27 Dec 2021 12:38:10 -0800
Message-Id: <20211227203811.481782-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227203811.481782-1-akuster808@gmail.com>
References: <20211227203811.481782-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 20:38:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94519

From: "Armin Kuster via lists.openembedded.org" <akuster808=gmail.com@lists.openembedded.org>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../strongswan/strongswan_5.9.4.bb            | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
index 2b63d9566..0466b1d62 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
@@ -27,7 +27,10 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-syst
 PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl curve25519\
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


