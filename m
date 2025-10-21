Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0859CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 18:32:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.20643.1761071530094912892
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 11:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UniLQVlK;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-471076f819bso47161255e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 11:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761071528; x=1761676328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQ1F3pBH02p5Wxx9oHKTd5jMw/L3ObASinraFmnSya0=;
        b=UniLQVlKtoQujbjAepX1kqPnf+WmebXQjZLVlSHt/T52HdSLhQrXawrv/cnzcDNrnW
         BOGZi3uLGWpyf2RtrVMbl3O2NTdz/wvwC0up0HCM2APliHNSu5oksz48zemisP5C9fGh
         NAib8pK6yulJuEK0ZUJphXD4y5Tp32QhRxo62l4m72FRWw8Qlvn9czZPjXVG/D2OrBBi
         hOpEBMeuiMFpDYJdno7D2WzYsRH3g6K27MYLNrXO1g7XoD3NDtzj7fJROX90GbIfKY5T
         x62Vfw69IZQpUGRoGGiv5Eoriqki8k2COfQDc6vjHcHRiXkUDkmbyppwpJeGvvrgALWF
         p26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761071528; x=1761676328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQ1F3pBH02p5Wxx9oHKTd5jMw/L3ObASinraFmnSya0=;
        b=MixOtRuJeQAyC1Kuk0xWOJrtmZuAwjLHAc/hha9KNZzyQ9c2B2IU3p6KE0OM5Ga+7I
         Z3qwEVzhQLpLIBsIYEWhOtV/CEjeN5pdOtcMAyU08/jNkyjQoPX6eGUapMfpyxyCr/Jt
         rj8J56TYvye1myo3zyXN/zdHxvtf9f1LIn4lcXjrCffdKs+FBCaTSnxX2cVpW1bWmIJD
         vu375L7XnPyp+JYSnyXHZq4ToThuZDApVQ0MB/ItSw175VU49w3jeteYMeJsjuTLIyPG
         bCc13zNdX4biFFmiOjU2lXFMghuHLiyhx2XP6erpLntz+T9/cZ5eBnoF95c5z8HoV+xs
         HukQ==
X-Gm-Message-State: AOJu0YwqezLjTvim2VNPSJIHur9kMCkHLIqj2b3nWRcczzyj8y2Sqjxe
	fEgmJ26YrZAuhNhYDJqZ6+zezegyJdXOZDzrGf/kwgkq4O8dW4clQOKtHyzhlg==
X-Gm-Gg: ASbGncvYGRIwsIfLwCguf/X6OSzCYNjEuyPuXGO/6fQHYvVAMOl2z7hZKG3m/BbwrUO
	P3G+8qpF61mDG0tGF7yT0hhYNC7871eNr2qY1YDkgDaEHYxlddF6fHa1KVnq9ydqbAaNVUhKLPx
	L0+X490XRGpbiRAU293W5y82ZRBObz0PBHYAtrJ0P2JhhIEl+26R7JcZm8bRlPn1p2fUYa6skPs
	lIihbodU3rU6pXIZaz28utznjj9wfepZDPDuPMPjQsdRu3M2E3ksR1p0ENfBZnVGYuNYX3g1k9A
	D+A2QecBYlssBmQeF9Wf5o8BzL/J8E/VR2nVelK34tf7c9grbL9iguthAVg0m3I7Ip9xEFprTtd
	rTT2Zws1f6iyTRtFMjiiGcd6eP7tMjcBF+GAA8pZL0bPLAbsfEzimDagNLxUgcfzZJkSadjcPED
	eXnJD0uR67
X-Google-Smtp-Source: AGHT+IEYbJthmxqjlfm/BkyyEcDFpSgKF6CP2IFCn0NMHdhrgvaxNvr0aA8VYBInDNYq3QNAPVlbBQ==
X-Received: by 2002:a05:600c:a4a:b0:471:145b:dd0d with SMTP id 5b1f17b1804b1-4711790c334mr106759175e9.24.1761071528433;
        Tue, 21 Oct 2025 11:32:08 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496cf3b45sm20984535e9.7.2025.10.21.11.32.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:32:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 5/6] squid: patch CVE-2025-59362
Date: Tue, 21 Oct 2025 20:32:03 +0200
Message-ID: <20251021183204.269102-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251021183204.269102-1-skandigraun@gmail.com>
References: <20251021183204.269102-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 18:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120845

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-59362

Pick the PR content that's referenced in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../squid/files/CVE-2025-59362.patch          | 51 +++++++++++++++++++
 .../recipes-daemons/squid/squid_4.15.bb       |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch b/meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch
new file mode 100644
index 0000000000..1d50cb31e1
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2025-59362.patch
@@ -0,0 +1,51 @@
+From 4b9784928c87225605fd223b6fa0e5b42d039359 Mon Sep 17 00:00:00 2001
+From: Alex Rousskov <rousskov@measurement-factory.com>
+Date: Sat, 30 Aug 2025 06:49:36 +0000
+Subject: [PATCH] Fix ASN.1 encoding of long SNMP OIDs (#2149)
+
+CVE: CVE-2025-59362
+Upstream-Status: Backport [https://github.com/squid-cache/squid/commit/0d89165ee6da10e6fa50c44998b3cd16d59400e9]
+---
+ lib/snmplib/asn1.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/lib/snmplib/asn1.c b/lib/snmplib/asn1.c
+index 8a4e471..0bb1f0b 100644
+--- a/lib/snmplib/asn1.c
++++ b/lib/snmplib/asn1.c
+@@ -771,6 +771,7 @@ asn_build_objid(u_char * data, int *datalength,
+      * lastbyte ::= 0 7bitvalue
+      */
+     u_char buf[MAX_OID_LEN];
++    u_char *bufEnd = buf + sizeof(buf);
+     u_char *bp = buf;
+     oid *op = objid;
+     int asnlength;
+@@ -789,6 +790,10 @@ asn_build_objid(u_char * data, int *datalength,
+     while (objidlength-- > 0) {
+         subid = *op++;
+         if (subid < 127) {  /* off by one? */
++            if (bp >= bufEnd) {
++                snmp_set_api_error(SNMPERR_ASN_ENCODE);
++                return (NULL);
++            }
+             *bp++ = subid;
+         } else {
+             mask = 0x7F;    /* handle subid == 0 case */
+@@ -806,8 +811,16 @@ asn_build_objid(u_char * data, int *datalength,
+                 /* fix a mask that got truncated above */
+                 if (mask == 0x1E00000)
+                     mask = 0xFE00000;
++                if (bp >= bufEnd) {
++                    snmp_set_api_error(SNMPERR_ASN_ENCODE);
++                    return (NULL);
++                }
+                 *bp++ = (u_char) (((subid & mask) >> bits) | ASN_BIT8);
+             }
++            if (bp >= bufEnd) {
++                snmp_set_api_error(SNMPERR_ASN_ENCODE);
++                return (NULL);
++            }
+             *bp++ = (u_char) (subid & mask);
+         }
+     }
diff --git a/meta-networking/recipes-daemons/squid/squid_4.15.bb b/meta-networking/recipes-daemons/squid/squid_4.15.bb
index 2c33d45bbf..ae3b66c7af 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.15.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.15.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://CVE-2022-41317.patch \
            file://CVE-2022-41318.patch \
            file://CVE-2023-46724.patch \
+           file://CVE-2025-59362.patch \
            "
 
 SRC_URI:remove:toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"

