Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CF4CD8C85
	for <webhook@archiver.kernel.org>; Sun,  7 Jun 2026 00:39:37 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25925.1780792774462563501
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2026 17:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iGAT9FII;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7e0fc8ead7eso35135637b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2026 17:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780792773; x=1781397573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBJCHqOqB04NsKPfZQ0xK6fAF6ypKMHCNzCoJR+OHg4=;
        b=iGAT9FIIDDYiS/x5FiemzEO66LUZeLP5GvZzYNfwtJvu4hlBxkyi9rhiwXhGb920BD
         WRr2gNhrQC/hkLGaeSUB3fohm7SI2f9WQFaTaaTrFpkKhDWi4GPM8HR/A9KwyWEqGNuW
         8Yl4vDUxHARb512wCfdvupsGhpUxnup5m+RBihdoTlQqFJ/oIhgVjpnGfKB+bYQAO4Dj
         bWB1RquXT3tH6H6SFBJ+nEpVUVQePvoOP89QN85fKCTvIrLjRwaXxWj8y0a8sUP1uc6C
         35PkkwuIdjFvTgZ5yh/qtEtyaWlz2OkZ9DeDbVmhiUm57Kl2zM5kuKU4E/w7D2O2+9eA
         kQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780792773; x=1781397573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gBJCHqOqB04NsKPfZQ0xK6fAF6ypKMHCNzCoJR+OHg4=;
        b=i3P28ax4+0J6F1oA9BWp4v6vZem+aj1YHuL4t5bWM7Mi6X4QS4ZgrSTJ8dt+RzHs0Z
         gi+UwNdKQy7SBB+2snUjJRii2uvBj+Tu1GC0uV5ocdGqrdSfFql+a2ViUEqI9CaBqsxR
         IBcHOQvnA3KbyZW3V1YaAb6PIjgDxv6ZwhoRycwwd+USeIMocEItA/eCwHhNQXROt3xs
         gJJxctQEigOVCwO/K403GotQOIbsazrzWau+pPFe67FdTneTgwcVKi86KlGp1wUNO1dg
         /49oAmZIAZJRhNPa6GqesxliJtvRINi7Ly9ddNo2bT8uUZGf3vpFw70yx2GESs7TxFOe
         zDMQ==
X-Gm-Message-State: AOJu0Yz2u9AyyFk41xH6FYwIADxNFiYs3+mDcrm9ucl+wXAuHb1x0blw
	UrpKclZXAumS+D2KnrlcFCigQhfoqMvny9Cdj76jNo16hsI2U0fNEF8CDNM1wsdg
X-Gm-Gg: Acq92OG3TcZe1v6hNmt6kzFi/asNxXKkXpauHhCTHWgV7DWwqsaYKrn+yTBz0xrx/r6
	T99QYIrgQF33Ww4SeCCvUn4/JJJy4L9DdE0sz4A3kxO2mUltfGyM/igxjRHMckq4Z9TXvgwGruR
	0uko3yHjih/Hifj/vGSsz3cdmrFYa3B8sbkX2AG3CruD6kDDFsLLmRKZ9Av4g3dQHIoLlEpnM5F
	BY+CM/thd/iBR+WeKlN8GHs7hF6ZEYlICulFl5qqIdIncFJe5FOHzSF8CtHupRpThNfP94tgBPG
	f5FD5O/buph7r31bJTZE2E9v6RleC9t9wPRJMJs7KoeVKsDXbYPFn0yd7ZyNHaW/RmCSOztMV6+
	5V3mLnnnV9Oq0qMqQmeyL2XIxuwU3YrEncaFMLSAL+XdB3KiD7sai8SRxcc1QqSLKM24OFd/aFU
	SQ3LgYzbg+37TM/tSAOefBRA94snZQr9BPfuxf0Vf+/AepbDHI0FVyiXD4U5taSKSmu+Tr0ZNvL
	ndthFit0eMYqtlGftVXLSyHOcYCnRETGTiZpLtgosruFcvzT2Nl3tXYlc0gBg==
X-Received: by 2002:a05:690c:67c3:b0:7bd:6114:4002 with SMTP id 00721157ae682-7ed0e865f51mr97989437b3.40.1780792773380;
        Sat, 06 Jun 2026 17:39:33 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7ef63767910sm5568487b3.30.2026.06.06.17.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 17:39:33 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] php: upgrade 8.5.6 -> 8.5.7
Date: Sat,  6 Jun 2026 20:38:52 -0400
Message-ID: <20260607003852.5315-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607003852.5315-1-schonm@gmail.com>
References: <20260607003852.5315-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2026 00:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127411

This is a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.7

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.6.bb => php_8.5.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.6.bb => php_8.5.7.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.6.bb b/meta-oe/recipes-devtools/php/php_8.5.7.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.6.bb
rename to meta-oe/recipes-devtools/php/php_8.5.7.bb
index db5bba9ccc..7c714c17a1 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.7.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "4457240f65f0c59a620920d66cdab1b12100a431e03ad9febe38b13a1b25957f"
+SRC_URI[sha256sum] = "4ef9355f784d4b320151eb3f31c5941c0da297025eedb97f2838b2ce73dd59bf"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


