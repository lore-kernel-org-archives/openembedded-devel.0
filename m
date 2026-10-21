Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7494.1792574946005947752
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sKO1//lS;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-157fe9d771bso659490c88.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574945; x=1793179745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dcDQN3b53a6MHz1FFFFYGmijN0jK+jJ9QC8CTjP1Sus=;
        b=sKO1//lSFrHDtDlxv+/HHOPobrZUoDhM9TGecZe4qHb8HejuLkUo69IKHXaR61COwu
         OnL97iYf770haogxBFKj9RGvNvXQm4uL9iyXRoTG6A3FccrcV76O6aqsA3VGfb6Uu9RZ
         +E7tXAazkGe2R7G5IEjQlUsqQ/6dtbU2hzJ2G7te7d97zU2y59J4Wgm2FK1KuAJsKveH
         QXMntfDv0I6gd/uE1rNMabI1Adf4Z0W/t2vwaCX1ibmP9XW2uWQEPd1TEEnE7a+JYBtC
         f1byhQOnKTTosWuWgSwLDLZGxHeL7nbuXR/kguD91NUnx9QlLorODALXlnB/6a3cJt8y
         A+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574945; x=1793179745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcDQN3b53a6MHz1FFFFYGmijN0jK+jJ9QC8CTjP1Sus=;
        b=VThg6q3DcDCx1CDZO+a4vf4hX9BvgqcR4eM3AVFIOMtS//On0itJzFD97upc/+wFPx
         bpbwwms4h+e9BD8J2NVwVNV+p5b9BFWb11APrytWXKeS+XBopnqjAQHEHGQYgLGRaK4h
         B5mAXTRpMPF61KC07zEpBll3UMwvaZqkDHIJCHDY2sTImcvrIMbWmBc1mvcTa5IKjW8N
         PnxbldbmIWnj/XHhqtoyGYFv7ISXqEy2e9j2Zm05C0ivw6vb0Jk1TstGSurFrBboqTH4
         NpPaVZlL/XegzM3YAL/b90GA98+KctYrlfsndWgU2nPSY5BNKtQoySeOUJdfH5slBWPA
         dQow==
X-Gm-Message-State: AFq9FYLNSZ4wnm3eDE6iVgyJCDxiCSeEOYlq5LEeTfbzBnUv53flwKnL
	GRypJfmjvF5jyVCF1llIFp2Y0K5FuaOwZYluQvGmu+HqG4/oe35qBNVYsDf8AQ==
X-Gm-Gg: AYBFou0f3YmNuijoyLAWaOnVmwTVDvY6tcfaKZbwX2wDJyKSNRS50o0NaZRfh5LmBkT
	FjZnq1gG2cl+jnK0t/Ld3SIkE6LhXV1wMNyHQxauVfWZ76123hxiynWLNkuJu4wj4VbQpPGCuV/
	6gaEbuedkKK1M8C+i0KKuZo9/Ndzu5Wsb5wN1UjmtBofYFGvn5yVnpAxRX8l8AG11IG/xziunir
	+GN3uUlgg01AmMPFD85Q8Fn+ZvfwzjHqA+3kU86/M1YGXNn5RTMTabOjhIeLNzljqtA+vRu4fFG
	p3mYhIfbiNEE4lqLsIHIAXdEF9OrwCFZdUd2arwjoMXrjHxrqCyV6P08Pj0Q2Viv82vY2XttwK8
	vCIqTCUiz45JWC6E2Qep1vc9TYPidr5nTmBRwIMdJ98Sas+tGdnaQDJCoqfASWHpNaOOBTTyNON
	U9siNpYqNk/4KqdvaPTaqOnsCsaQ5wGmVs/CVE906B3K3yTYFXHkzsckwiC7XQy8iaQ0nbmGpA5
	03CahM0Gkx0xH4veDQCB2OsK1TEF+zOqVoeawNYIK9Y6howRmT6N4pv7+ZwyI4uzSuHTUPshYnr
	1nOSABj4tojPsXrLkWZrh5AKYIrdqxc=
X-Received: by 2002:a05:701a:ca01:b0:181:5cac:8f27 with SMTP id a92af1059eb24-190a6dbd80amr2209130c88.35.1792574945257;
        Wed, 21 Oct 2026 02:29:05 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][blacksail][PATCH 1/44] zeroconf: ignore CVEs
Date: Wed, 21 Oct 2026 22:28:14 +1300
Message-ID: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131188
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-47180
https://nvd.nist.gov/vuln/detail/cve-2026-47183
https://nvd.nist.gov/vuln/detail/cve-2026-47184
https://nvd.nist.gov/vuln/detail/cve-2026-48045
https://nvd.nist.gov/vuln/detail/cve-2026-48487

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
index cb26699212..a9c19cb38f 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
@@ -35,3 +35,9 @@ do_install () {
     install -c -m 755 ${UNPACKDIR}/debian-zeroconf ${D}${sysconfdir}/network/if-up.d/zeroconf
     install -c ${UNPACKDIR}/zeroconf-default ${D}${sysconfdir}/default/zeroconf
 }
+
+CVE_STATUS[CVE-2026-47180] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-47183] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-47184] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-48045] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
+CVE_STATUS[CVE-2026-48487] = "cpe-incorrect: this vulnerability is for Python Zeroconf library"
