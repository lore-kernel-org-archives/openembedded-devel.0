Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10374.1795753113965691532
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=v1pTuzn8;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3863db981d4so10748641eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753113; x=1796357913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2IKceEu/MIlKQ3XxTaoEUeKYpQr7GVI3+f7d1YCCDI=;
        b=v1pTuzn8uq74YT7lzQb1dPuc2KnVzCthYlKNj4saBSqxBb6T0d6bH9iHSGc3Vgd+zd
         WchAoueR5C1aaszMZhLa/icMpfxELT4d3c/ub5DBl5DZj4qgqxDrti3QkYXQKTnzoVNC
         ePR/QOWsoyYke/TOv+NkG3R0AwrBfg9DXVsYT3K0LO/E/1xzlnHDJJfUhL7qSY79fHBC
         ZbQo48nqauRNQF5rKDNb9DONsKVTRssPiAotwexK9/nWRZSs+LRFgHyG0w0UXYpgkA1g
         aioEp+iFT6pKYivmP5ULWc7t1S5pGTjWjJDmcJNhnnb1yJFOzUosEYNhQTCjnbBqqzBl
         TCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753113; x=1796357913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2IKceEu/MIlKQ3XxTaoEUeKYpQr7GVI3+f7d1YCCDI=;
        b=M/ERwfuV93sUEf4hR530X8IHy2VXAfzM1CpLyO5OUtdZLOLoRuhXaXigMvbrOe6ds7
         E6MnySwIaSBAAxjxlEpbPs6/OYndsyQGixa3CfhgrvQtiXg01iQ41129D6botbE0zLnB
         JnehfGDUV9YT1tAxvy9fJhDeQTSWsy+SjcFQ2Vm9P1GsO5HNcEQOWSL+mxUroXph+C2C
         yc284ekLOwXgg/w9wuMC0xhVyAqm7jo9/8F68iuX7yIHY1KdnaWE7G+Zsag6DJM3uhsJ
         YRFIR9SnuYyf7snQ32cK1AWsGcpdT/XAd0kc1wBdQmedJRC7H2M/uyo2svbpg7REaCfp
         5WZQ==
X-Gm-Message-State: APuU4Z9jhITQJR9R01FjSwUSFAdRtnXGhQM+42vBHsVZO8gu9vScouS8
	4SrHYdoZaEaIrf7Swvp0RAFFWV+ZTmLOeLTn3E8zGz1wHVcyAeU6mprNp+1mozXj
X-Gm-Gg: AZFdTZdHUnjyFx8oZrb0Fsvd0gfkZBlWG8akiLoYhup5xO6HNu/8JtnUVX5MpK9e2nK
	KJNXY196FTYeHQWMlLJzdgTcPprS+tf+frJNkDpq60+Pi1pt452/IRfUhQ4UEunFuIk9KgS/TVS
	riUmVWb0mD2DGDgmRFCS8KZfmoZ1lmbd5RV4hr5GQ+3BIGdNPsZ/kEaIK0BjSgF4LPNqTvwGIiV
	dsHy3Emw1YtGUJjxyL742W0gRUOpk0BfxGSG5qMWZmOUkndKCEj6yOX3Y43xmmMGpZVrmxr1nqZ
	1XHjg5TcA5S8H4lBRUOCLw5o8Rpp/DiJ71FTvxE6aInTlnUV3kAe4WXlgMgob+58fpUa+ienNHV
	HaQAyasp3GXyPSOFG1U4knMJBfTj4SFSJtvZZ8c0t4zlW/xS/6WZIpd+N1LhaZaNacoXVNRQHas
	gly17xPH9IK6HvjFQE/P7i52+l6BZ7yK+nTLKr4kQXqqiVAyLjPkNmEn2NAZrNzA2qFnboDo3bh
	dfHlcgbhMXUl9vrO9NjMcI8kt+zlcTKgOKDOlZvaCt76hmWStk69xlVB2QflrdfUveD4Ea6raWb
	RcfE1ROdVJOZsMh1oTH1Wfao2PxLmtDXRyPxTUKNNEX/kx1uN8wz8M+PgYOERVJjAvXNECHIK1F
	GO7GfUA8TruTq/H9pc8LihQrbcuNs1Heeuxp2Ab2cr9rLbMu3Raadnu7o3cqmY1X4LZn1GPk0jg
	himXyUTnmfkH7AlxQD1fsUADLAJoCgsjgQVAezQhsqIPGIwGMPECVjBGV25wq0e8LBuapfBcL/7
	ChvOmjV/oxJ7jeb0aObYvmR24M6cSvPNPwoxPLYd10pRLOAYAiUFdvQIlPvEp2kPLNVyi1OCHsZ
	zIFc
X-Received: by 2002:a05:7301:2222:b0:384:2662:a7fe with SMTP id 5a478bee46e88-3856c9a1180mr20979048eec.1.1795753113291;
        Thu, 26 Nov 2026 20:18:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm56941116eec.25.2026.11.26.20.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:18:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 03/15] mbedtls: upgrade 3.6.7 -> 3.6.8
Date: Thu, 26 Nov 2026 20:18:15 -0800
Message-ID: <20261127041827.1778052-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
References: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133291
Content-Type: text/plain; charset="utf-8"

Bug fix and security release of the 3.6 LTS branch.

- Security fixes: CVE-2026-50582 CVE-2026-90469 CVE-2026-90470
  CVE-2026-90475 CVE-2026-93776 CVE-2026-93777 CVE-2026-93831
  CVE-2026-93833 CVE-2026-93835 CVE-2026-93842 CVE-2026-93843
  CVE-2026-93844 CVE-2026-93845 CVE-2026-115488 CVE-2026-115489
  CVE-2026-115490 CVE-2026-115491 CVE-2026-115493 CVE-2026-116375
  CVE-2026-116462 (TLS 1.2/1.3 session resumption and SNI client
  authentication bypasses, renegotiation memory disclosure and
  use-after-free, X.509 name handling, Spectre-PHT side channels).
- Use getrandom() for PSA crypto initialization on Linux.
- New CMake options MBEDTLS_CONFIG_BASE_FILE/NAME/SET/UNSET.
- Fix wrong MD5/SHA-1/SHA-256/RIPEMD-160 digests for inputs of 4 GiB
  or more in one call, and revert the RSA keygen hardening from 3.6.7
  that caused a performance regression.
- PEM decryption is documented as deprecated.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../mbedtls/{mbedtls_3.6.7.bb => mbedtls_3.6.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.7.bb => mbedtls_3.6.8.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.7.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.8.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.7.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.8.bb
index e8edfa45e7..bcbaec073a 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.7.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.8.bb
@@ -27,7 +27,7 @@ SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls
            file://run-ptest \
            "
 
-SRCREV = "068ff080b369adfac81509f9b57b2afabaf82dc5"
+SRCREV = "82e69999f91126589a28b70dd75b69fbcabe2711"
 
 # Track the 3.6 LTS branch; 4.x is a new major series with API changes
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>3\.6(\.\d+)+)$"
