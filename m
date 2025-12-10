Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B05D3C554
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:26:33 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15320.1765373183920461029
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:26:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jTk+209V;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso6072432b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373183; x=1765977983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaKQYwr4PsIZdqqTDsyJFZPSAyDvl3cxcw3rKzDIpM8=;
        b=jTk+209V898+mWvROZhESSDeKinu6eh/4iUiZcTQ6BJkmTXhQPeBiCv8IrEtji2f7T
         HykN+sPa+czgJ5t5fpZQBgOXmdPGBY38aeKyXa8j4WhOyW9oqkJ/tQzAxI17wjjsaByk
         jz5FNAsZ+KWqyifp1+c48uu/9OBL+7R6ayU3mOyHOX7FeM9zkVt3Nmc1YPmnRq6SipiD
         /JKOHTkD/Zfi4bz4x3zwqiR2yahEKCAQtxCmBtN6bnSxRB0juhi2IHyKV9ey1OyfiyVl
         /otBaMpOI8dz3acQ6HcqZX8jVqq/lwEW8FpmkfYbwSbMPMPlQcLLDChXNH0bqbs4uaGB
         ncYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373183; x=1765977983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aaKQYwr4PsIZdqqTDsyJFZPSAyDvl3cxcw3rKzDIpM8=;
        b=Ochxff9bvnuCKtLYx/+1km4jDRZ393Rqd5YDa86M1Yx7nBIHR8q4gvfG9EAAr7UL/G
         68dH0bqPmdfTRD14Sn3olfo8RsxhakNbb0lexSWNrMFGt71ugk1ADjU8s0CpCqwUMYBm
         lprXI8grqHc91sCsfYSeQmV/olLRRXRKpSeSmlQ5CCUzEPWk/62L6+9aqSEacpdo3rqx
         IAsjUfmW95ohL+jrIb3PJUj3HUUFFh8AYu7e9IntvRFqUjYaf4aPDMVjeUiMDlEVAkHC
         olm34fbG70U5SDEWM02CozNfCN1vwtvhM72FXZMUGE2qKQEsROgBYBaB0xWCl1ACqHBv
         ZPgA==
X-Gm-Message-State: AOJu0YxJHn1NWisdC0o4cZ2zkHFisAnwMjtpiYlIylJmsIFthBjg3gYq
	QUk2wNt5DN0NXrxRXFU2jwO83nTxYCr7ncllxGZS5aZZs6ni/ZcCF24rnxfRmA==
X-Gm-Gg: ASbGncv5D4keM09cMEwtXfctqHVUuu66u5YCGZQobLWRH1RxHnU5XdNuBzuxjP/InjJ
	fJ39J7eq8BHixk3swM5LNbpr/E+qY6lPoRXVZCHJXpji9HWLrlgRug3H/NFMKyt1Au+aUW5uJ5O
	74im95j1ZGH0l9FXNEmzmitdKJVS2P/Puxvj0zOOJC7PAR/+o730M6euF9rK89jvJIfwqmDRs2r
	g1v13mf0xHlQcU3vA9LbluPiD/AjPIwR9cxSGJRideIjjCPPpjFqQe07GM9vjOd9q9U7kgT9SkR
	uRZyV97ZwUXCLV3UN722ZiJAxfiWly18WUGMMMsfDe46iKlXiK4U1gWW6XHtIOZ3y52ncEc7I2m
	2Ga72sjq2EwP3jFsSRa1tyWvVAQbWadSU0k1iPQPTJLLbcpjx4RicoCSAk/Zkm7S49fegIq6FC/
	bjtWCRRESEHD/pUwERPH5QPyg=
X-Google-Smtp-Source: AGHT+IGaYlMv+k7BkJ3I1i4/gHCjlX0/PIGiGVCZVHbEfTIrohUTqzvEp9dBtlXfBoSAosdlW8NObw==
X-Received: by 2002:a05:6a20:7f91:b0:334:7bce:8394 with SMTP id adf61e73a8af0-366e2fb5cf5mr2507047637.51.1765373183010;
        Wed, 10 Dec 2025 05:26:23 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a7092b1c1sm2550009a91.15.2025.12.10.05.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:26:22 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 25/43] dbus-broker: rework EXTRA_OEMESON opts to PACKAGECONFIG
Date: Wed, 10 Dec 2025 18:56:04 +0530
Message-ID: <20251210132604.317279-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132604.317279-1-ankur.tyagi85@gmail.com>
References: <20251210132604.317279-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:26:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122529

From: Gyorgy Sarvari <skandigraun@gmail.com>

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 75fad30c62491d0246374cffd3a10b94499524ba)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_37.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_37.bb b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
index c531f555d2..ae9c8f2fcd 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 DEPENDS = "\
     expat \
     systemd \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit (>= 3.0)', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux (>= 3.2)', '', d)} \
 "
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz \
@@ -23,9 +21,11 @@ SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 
 inherit meson pkgconfig systemd features_check ptest
 
-EXTRA_OEMESON += "-Daudit=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
-EXTRA_OEMESON += "-Dselinux=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
-EXTRA_OEMESON += "-Dtests=${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit selinux', '', d)} \
+                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'test', '', d)}"
+PACKAGECONFIG[audit] = "-Daudit=true, -Daudit=false, audit (>= 3.0)"
+PACKAGECONFIG[selinux] = "-Dselinux=true, -Dselinux=false, libselinux (>= 3.2)"
+PACKAGECONFIG[test] = "-Dtests=true, -Dtests=false"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 

