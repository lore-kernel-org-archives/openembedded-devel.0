Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A62CC6B03
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:16 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5075.1791839474460962629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ID+3JF7g;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so950570a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839474; x=1792444274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aX58d3wxyfWAj/pKjRcwECLPPmGI4L6iIb86qlI2+8o=;
        b=ID+3JF7g5tIBol7vhRSiTGqxXbQcp2MaesL3JsF0tpqwcLmM5wq+FOLTEHBh8v1z9F
         KI9dTEZhxgmVjMkQA3nwid96VI9K/0AOgFCTkYGK35MIuUdyeqJD97xUpr4n69n9CHcr
         ykyI3tHbGG3dVI9A+9HxObvpUx8OiOUuMEBULrKhqTAeI7I5bUeHErjOeXfJv1guTN57
         Qy817+87Xm24UsQu1WuPr23Sf+SBp03OShvMuKSL48WZ1X3M2/IlQnec/JX5pVY7Nmb+
         HDJRPcKF6Z5fIhJESWLImseS8BSlnuMPcBuI6UJWFDe/hc6TrlcgPtQbyvglPLz1/eu4
         jzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839474; x=1792444274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aX58d3wxyfWAj/pKjRcwECLPPmGI4L6iIb86qlI2+8o=;
        b=pdlTgHKzgpPN19UOzJbxT8WOsdbcFPi1tbR2p9ygFVcnB7x2pwHr5yp9ZtVuheR7kZ
         xflVKfewmGGX9EZI9ETSlES77vGU4ONYeZUnv6xbrQAvEmS+xUX1g4NHJHXU4u/NWpCF
         gi2tA8pOsGimV39WwruiLwBCVidd+rsbh2v++92hxz1hlRyiCXayTVlyuLWm144wTN6i
         WgzhZPjKhsvUZ920caUHv2WoHhAiiWglO+37jF4iPqN/sb9CvR044wNNgZ2r8A58H1Ze
         DgTStnbxhfR5DseJ420m3qF8KvAW5WqyYs5eIEE5xXAfY4sZ7e+pa5lRVqrSEsa87gfG
         jyNA==
X-Gm-Message-State: AFq9FYLGjFaU1x/M30wcOabajq+7e9Qs1jgLDASVc8hPHTIInf7rekid
	B5xLBQoq8aQ+omLFH3Ryucl5gnPnoKH2H3GnPHS3law7m7sKW8SWmDaxwaOahKay
X-Gm-Gg: AYBFou0i2rJ9kwK4kZWbGl3OYIYw0eonPpEkPjQWpkf5ztteSc/0h2Z6FuGzv+Mp0/C
	g4SsqsVNU8NoMsYljbEjIMutIs2602VdLpu+5MMm7zhKgcyQPChUJ8koZ6JIo97T45MUfEPHDdY
	yPy95kIhrD8uRXE95AhzzJQKDh5EI/7uQm6qnT1m9Ar/bGSQ89+808fzcHXlIyP45pJ4YJhzbBH
	usBcZHXiDDQpjY8CHWzxfumqUv5BPdp7yV0Q+XbKEwAJpK5jdf0a2g0cV8hvnzUDYyz/fimfLlF
	bZ90OaB9EjGpmWMNBXGuzJyGxGZNWdEnYWciRmWJvliOD9qe5ra7hCLlKUKXdBOvg2ZKkkirSQZ
	++xmY0NRYT8/PNc1EfsyK8FnuRR/LoeGjCo9O1WeiOQ+l0vUXJA2o0DWxY3dcpVUecgGydLrAIC
	7b8acpQ50xk2bTzuC3tBMpNNNYgRuWcbq6jllbXpkbW3FgHNYBhLyjJ5/hkkgu906juBftj0wKb
	ebxLfiBNciZ6/4Gb95qkWoapCttfXWTfNkeAVjRBDkeAijKzw==
X-Received: by 2002:a17:90b:568b:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3ac017c701bmr2389849a91.19.1791839473795;
        Mon, 12 Oct 2026 14:11:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 22/43] libiec61850: mark CVE-2024-45969 patched
Date: Tue, 13 Oct 2026 10:09:46 +1300
Message-ID: <20261012211009.3352822-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130792

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

NVD[1] mentions commit[2] for v1.5 but is also present in v1.6[3]

[1] https://nvd.nist.gov/vuln/detail/cve-2024-45969
[2] https://github.com/mz-automation/libiec61850/commit/7afa40390b26ad1f4cf93deaa0052fe7e357ef33
[3] https://github.com/mz-automation/libiec61850/commit/d1ab50298fcba3f87b1e58dabff92f8615b14ee7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit a7088b0fda5d269721e5d3f16ae410062b9b2c8e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb
index d2fbbc53fb6..51ceb5cf02f 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb
@@ -35,3 +35,5 @@ FILES:${PN} += " \
     ${PYTHON_SITEPACKAGES_DIR}/pyiec61850.py \
     ${PYTHON_SITEPACKAGES_DIR}/_pyiec61850.so \
 "
+
+CVE_STATUS[CVE-2024-45969] = "fixed-version: fixed since v1.6.0"

