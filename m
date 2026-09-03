Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AECC624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:34 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4200.1788429033797542864
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RHc4mM0O;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84eb992a881so1908937b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429033; x=1789033833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPKhVPpvw6zPqqUd4PTNa4h7g5W+4HHTSZ9W9OFdJjk=;
        b=RHc4mM0OsxF0zoUf8W6KZ+Cj37C1xz74v2uV0/WZFoGxtrLhJ6Aj4IlkmEpaXpvtF8
         gN3+vHI2LH7XOispsLArJ1incw0uvMVgwY/pwpWGOzXkU8CtBHLWIW8fl7Mt9nhZ1cLq
         4sQQiHaJqMnYEyzZSA5YV4AtclPqanaPUJEVfJZx08RVnKCkkc2shhjCSgmaR2B+Ji0c
         krSpwny1zh3kFVVtKFRKgmOfRByvYRxYKT8K3LtaaLxh60JQ+ORPvLFB9RMT93f4Q8QV
         HypOWZDuVXW9tWnAUeIghBsNupYzAiRmttZF2da3Jm0pPk5HRmKLMFWx7QVPP83EJqat
         R5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429033; x=1789033833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPKhVPpvw6zPqqUd4PTNa4h7g5W+4HHTSZ9W9OFdJjk=;
        b=NfuicSoFIkFtilTuhwfSjHZcji0N4VavwVi02i66j9lJPimScucJZg3On0i+f5uurz
         YRfbKLv8OY9FhS83WGGf62VDzpJuWw3bcFBjYnukxVfHCzgJH8rQK/o3YpTR6jTNcK1m
         iCO/62wrUAci/xCM2RKTtagcZRWUzWukWDmFZfaaKtI2WUYmZ3ewg9faBRFCd76oqcrZ
         E8v1vLRldjcvCPOTTiZKnt/b1KLbNigm0GHLXZupgPLUymyc5pjNfnELYCk22UZ+wTQL
         KXLNLiulNEwCCuRl1CBhwFqvFVG9w0NE+e64H1RuURmKhlj9bePdyfOysKemAU2Sxe7y
         /Ciw==
X-Gm-Message-State: AFuF++lC9yfB2bGUxLxQZoEOaec5XpyRQJU3lYls3EO1XNUI8bf/lkb2
	9+j3oG4s9sGBneW3h6xl2I0cuol/NKhV/SbRNQffaTmRqpJIoHmy3flH2YhUZDVF
X-Gm-Gg: AYBFou3z+l1BUjBsnTNYlYzsrRw+53TZKMGAcmBL7WDy3kWyMb4seKxo7XHadpMj/gk
	z7cFpyI+2s3hgkV6keNZhw5Ba/I0FW4BZW/B/1DBWFOTNWsJkufWBjg7rDYftGqSSkm42+37qXj
	HhIZx5WGkePqMz2zhrc/myOMuM5dCJC37Fxw/b8mE6XaIzWVnBZPLFpy2AIVbGpphjCGllAFBvb
	MgoHs/WRRVc6k/LIwL830+hfyJWW2LpLApxJ+8v++h3gttc8CaBtRsax/TmCcA9zWQWNbTkMKsX
	IhmmrqFR8igYDK67aDfjVA5okaykk8rATg7zhkdr27YJ6+4chDxE8rhqh/MDO1cENmNdRo3ru9r
	1VDfj1t4NLNHg8hU21mlPH5kPD/Cf+YmB+TMU1BdTd3Bk9cWaMnzgG9yTg0zzHEI0vSiLIzLys3
	sK8AuySqGpDZGaamtTNtFBPXHfht/VWoY8CMeU0u9LuB2o4P97gpf0OnELjnwpERCdfhWfnC/T
X-Received: by 2002:a05:6a00:bd8a:b0:857:7317:cff2 with SMTP id d2e1a72fcca58-85ed444a110mr17312952b3a.19.1788429033066;
        Thu, 03 Sep 2026 02:50:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 15/22] libiec61850: mark CVE-2024-45969 patched
Date: Thu,  3 Sep 2026 21:49:46 +1200
Message-ID: <20260903094954.3240723-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129731

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

NVD[1] mentions commit[2] for v1.5 but is also present in v1.6[3]

[1] https://nvd.nist.gov/vuln/detail/cve-2024-45969
[2] https://github.com/mz-automation/libiec61850/commit/7afa40390b26ad1f4cf93deaa0052fe7e357ef33
[3] https://github.com/mz-automation/libiec61850/commit/d1ab50298fcba3f87b1e58dabff92f8615b14ee7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-connectivity/libiec61850/libiec61850_1.6.1.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
index c46ed88d83..5a76ba5330 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
@@ -35,3 +35,5 @@ FILES:${PN} += " \
     ${PYTHON_SITEPACKAGES_DIR}/pyiec61850.py \
     ${PYTHON_SITEPACKAGES_DIR}/_pyiec61850.so \
 "
+
+CVE_STATUS[CVE-2024-45969] = "fixed-version: fixed since v1.6.0"

