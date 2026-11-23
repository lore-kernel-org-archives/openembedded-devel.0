Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48533.1795411862624352810
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VYFdmAfo;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a315ed211so3737130eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411862; x=1796016662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3+PxF0vWSih2FI60CpGKteTm3ill+jLSxWHu0w7NXE=;
        b=VYFdmAfoDivDteG8FVQbIHMkSlC8phTOP5GzC1RLxEOjlVgNEMXk0Se5SDneUlslGb
         84OtWoviJxACG2ccxDTJzok0isYGGeAziYu8ed8L5TKCwyrKOevIKggh4dkI9jQ3Ow+e
         RlpbljFRJ3BLT7ctJkW/s4BbV6IYhjhOICpqYSKaB4VuAvlNydlVIqkCB9P5gBeHbMKF
         Oj50hHDfou9WLFMyF4B5kDv+DcyZu+Xq1nishztQgvy0KKzLTJbJph4WMCDaAu/StJGs
         Aek2Kqa2SvSAoKBIss+oSdJ0GI4RALwtm2pOkwPNO2qZRK8O0i/Pmj9b6LeJ6voKH9T7
         EmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411862; x=1796016662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3+PxF0vWSih2FI60CpGKteTm3ill+jLSxWHu0w7NXE=;
        b=v63QOkYUl6vj2wC5euyCWe8y8ntbe2yzNGkCSGmgfUAGGo13rzqBUVfydT4w9WtvKj
         iSXEkK4rBAGl63dzrJWu+wLUCtZgCQZrjveeuxTa2bUvSfR1av7mU1oSG0rmT1LmHdCd
         gj5YCbKr30fjL7Rk6djJAQrAvzJgt8P1on7QwX1fKetDyJIkd8S5ghKyIvHKWdzltXgU
         WBhF2XnYw9m+MKnoiWThVDSUJpqm6vIDthx3x+Iei+lw2+xO9lDSGU9s9hImkWHOkBEN
         IYGM9jEaz/4Kb7enkXtZfdofbl5efE0p01MFqxq2elIVrwxNWC2rlfNGB0Q2tRYFGzan
         K6cw==
X-Gm-Message-State: APuU4Z8XWJtJDli34hh9JrJGuvjo7Np/4laX2aNhKfqEwtML38NS92s6
	8OJ4BaumvRADJVG7K1nTXjupFNwbMOMY6G5nVEQDsY305yid8UxzJrv/3dZwSjrBKbs=
X-Gm-Gg: AZFdTZdfR2j2NGEySGVFpXu+GPpaUiDvDIx0CHtLKz9XU7bXLTTruYwdmYcxqiY/WxM
	D0SNcAI7ynUYY3wwgAcOVUtPzCPTMo7nXGM/h/95Fq567dkQaom8rRBgZt/cH+Xwm7TXGa1FDbo
	O2J9Hr7pnSkUm3W0Y7RMFwX1fwygYLQhbuTMjJTOA7uZ22ANApTEj9EoLJklL7CMkQykQroyHGK
	5w54w046WNr14dVXtuaxMK8cJXr6Ab67/edq7kEQ3yb0IkU08tN9PjCirmcIS6T22Iw8vHGMFHD
	Eix0v8fBP+3bqx0IHe7OVcLK1xCu1ct+ENM7we2ejdKbedi0muG8i9YYHRh27Ldn2nciReyGrZe
	ZSL2E4SNoRvuu8IFw+8TZr/SA4cd45HPW6WEkRrQKJbqD6V9568aG/6nM0OmJipoHtF1twfjAy0
	dGySz5OLLO+T9NbNXNlfVoIXkBTyfBuWRW88mKKTk2hxkmb+ZVNNgST9xTp762A3dn59Aly8cjA
	H2xhYgf0heJT2ck0drXT11g0+laqk11+6MR75pKTa7LbFgxS7tfoRlTWOw3AzRy2/5AHM/qoFEi
	qGkD8pkTU/B54sH2KcfSEpN2lHIMEwxD9Rt7V+tH0qGO7JzMl7VphmsaY6maieBc4dwMw4tFBFq
	ro+ZVJDt1JK9tkbDL7Xz9KwxWLbsX6yizrDHHtuMIIj2XkiWqDef53c24wW3wh2Og/weVfBuOpI
	naVigUpDPe5SM8u3mtamh3yv28TLIWlwtk383TZecykJr6e8Rp5DlGe522pB0ouSeaWpyunKiOF
	HoCDjPUE1ykEcPj7bh7eNJKWhoKzoiY4Pvy13HdzuMmcGg2jO+ZemnbOJeVY7sI1em7+p13llm4
	W9Dk
X-Received: by 2002:a05:7301:6a05:b0:386:a0dc:2e2d with SMTP id 5a478bee46e88-386a0dc3082mr7772918eec.16.1795411861861;
        Sun, 22 Nov 2026 21:31:01 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 26/42] nss: upgrade 3.133 -> 3.134
Date: Sun, 22 Nov 2026 21:29:10 -0800
Message-ID: <20261123052953.3658549-54-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132841
Content-Type: text/plain; charset="utf-8"

- Enable ML-DSA signature verification in mozilla::pkix chain
  validation; support ML-KEM end-entity keys in certutil
- TLS fixes: per-record write cipher spec selection during KeyUpdate,
  server session cache cert binding, ephemeral key freeing
- Validate Ed25519/X25519 key lengths and curve parameters
- Remove libjar; C++ code is now built as C++17
- Root store (nssckbi 2.94): remove Buypass Class 2/3 roots, adjust
  trust bits for DigiCert, IdenTrust, emSign, Certigna and others
- Requires NSPR 4.41

3.134 exports the mozpkix headers in a subdirectory, which the flat
header install failed on; install them under nss3/mozpkix.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/nss/{nss_3.133.bb => nss_3.134.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.133.bb => nss_3.134.bb} (97%)

diff --git a/meta-oe/recipes-support/nss/nss_3.133.bb b/meta-oe/recipes-support/nss/nss_3.134.bb
similarity index 97%
rename from meta-oe/recipes-support/nss/nss_3.133.bb
rename to meta-oe/recipes-support/nss/nss_3.134.bb
index b7481bd13e..d575178642 100644
--- a/meta-oe/recipes-support/nss/nss_3.133.bb
+++ b/meta-oe/recipes-support/nss/nss_3.134.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "4d752526b9846a1d962588cfbd09b7cc2a4f6a4effbd9157d58a30e8a2573065"
+SRC_URI[sha256sum] = "bb3b300b457f44da9a9486917c3b33bbc5935ae3cdf60aa759a6880889439c50"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
@@ -207,7 +207,9 @@ do_install() {
     done
 
     install -d ${D}/${includedir}/nss3
-    install -m 644 -t ${D}/${includedir}/nss3 dist/public/nss/*
+    install -m 644 -t ${D}/${includedir}/nss3 dist/public/nss/*.h
+    install -d ${D}/${includedir}/nss3/mozpkix
+    install -m 644 -t ${D}/${includedir}/nss3/mozpkix dist/public/nss/mozpkix/*.h
 
     install -d ${D}/${bindir}
     for binary in ${TD}/${bindir}/*; do
