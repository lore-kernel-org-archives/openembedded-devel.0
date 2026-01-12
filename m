Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A4DD25055
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:36:22 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29251.1768206976270374429
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QjQtBvIc;
 spf=pass (domain: konsulko.com, ip: 209.85.218.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b872f1c31f1so5917766b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 00:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768206974; x=1768811774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DQZCazxiu52gzh36EewPV6lnuy1GVge/HQdPPMaXBI=;
        b=QjQtBvIcaRvVoZQ+DxhGlNF2w0Vb+xVNeFqQtgNyuQ1wz4kp6KWer8ZemXTqqdgZkO
         /SB8vmtDR4CVro6njybSMYCRkQzPsLu+Utz05yi+eaPXxEgFahIGOzrmrfZ9UpQ8LvFG
         7bZYSl1EcLM+U5P9OKbH+DN7/VfUNs33OtjVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768206974; x=1768811774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5DQZCazxiu52gzh36EewPV6lnuy1GVge/HQdPPMaXBI=;
        b=PsSwsvaEk01uvvno5Qe4KAurEJkEtYcvzcwMMJtli5Yw77zaMtkbVg2nox5PQI0Slt
         ve3Nj+2OCTy5lZ4Zqk+GkeZCv/DPwkHO6M7Fm957EidTx5bzrvnG3G91UcefUQBfAPty
         ge6oSg1zn8Uoh/e14jAy1gMvBfFBt6nryKCUe5A+x0/+fHenZTGgpma17JQ0a86R80zR
         At5vdkUfiVMtb8uYn31hetsZVYqkf29eMP1/cUBYlMuivXSh2MWE5KGCO39lVc0a1KGq
         QmCp4x+VXnZgufymdesL34DiqGSTU1l5H1aCp9I1M1iqe2x1it8ijisMTvSOYclfTjEA
         QlJw==
X-Gm-Message-State: AOJu0YzMDDAYBg6usYT0Zb5q7uP1H+72ueCzEJzAnUSWntEyL1h8Li3/
	ZelbhcStc6j+ry2eI2PoWswmtNSot8TMP0OcmqF6SOOzIGZJjEhe8BWqCsYR8D2sVVncwIl8xlx
	tK2DT
X-Gm-Gg: AY/fxX61yWdM3h8wRcV4iK0lYOZziKrelQL1LvPCSAjrRjX9xIsxueIGD7AsqbYT+Wz
	RmSyGBy4jHB5SFUxKtEE+qqr5h9+TcXfzEg2dO65eUZysfdTlRwc9XQsL7ZF4IXVHb754zqPFgP
	7b48OAMKn+1vNgPcHpENLH17BMivZd0NwyhnsB4Ut9rjNsKLRFm8ONX7WZRdlfXgvyghPOiD2SQ
	ralvKIOwyoujiWPs2b6zMUndUYBXkSoJ7Bank/NuD1NnfLJ7WDgNw6guswfc/rBWwPYNcKjvHR0
	r5pU0jPa+s5o6qGqOz7yA6/g+/2tCJuecsaXSJZ7tPv8Ig4GssKh0GB0wY1hAbwe26RMW5bUEO8
	9tGZtfJKRF9mICUEiMdUJ+iynlabuvrEUjYE8IYsPRdXZASDEimnUkwEqfiP2c8k0vUI6ipTnXU
	p2B9DKxyC1F6oBYucyGDGmHPJA
X-Google-Smtp-Source: AGHT+IEBbByJN6SrxPABKADLNlfGn5WAHPjl93iHgCVENP5TtHsaKa9mW0RCER/MatB3li4HihkuYw==
X-Received: by 2002:a17:907:25c4:b0:b83:15cb:d491 with SMTP id a640c23a62f3a-b844541e387mr1646917366b.53.1768206974245;
        Mon, 12 Jan 2026 00:36:14 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6648fsm16971938a12.28.2026.01.12.00.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:36:13 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-langtable: Upgrade 0.0.68 -> 0.0.69
Date: Mon, 12 Jan 2026 10:36:09 +0200
Message-ID: <20260112083611.4017493-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112083611.4017493-1-leon.anavi@konsulko.com>
References: <20260112083611.4017493-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 08:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123366

Upgrade to release 0.0.69:

- Add Georgian console fonts
- Add Adlm script to SN
- Add dra, Tutg, ath, cmc, Cham, tai
- Remove License classifier (license tag with SPDX license
  expression is already there)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-langtable_0.0.68.bb => python3-langtable_0.0.69.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.68.bb => python3-langtable_0.0.69.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.68.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.69.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.68.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.69.bb
index 64eb57dd38..27ab97cd9b 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.68.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.69.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "3965a4d57a066a595ea8a87f6a5295412e65a7f39dbaad95c7327d48b11799fe"
+SRC_URI[sha256sum] = "f0a51870cf837fd689094ce73a420efa0b9b470facda551090f9a93d1e16510c"
 
 inherit pypi setuptools3 python3native
 
-- 
2.47.3


