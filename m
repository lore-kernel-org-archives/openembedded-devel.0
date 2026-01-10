Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39476D277DE
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 10:37:43 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6314.1768041458871389011
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 02:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gDUvhcgC;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so2593244b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 02:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768041458; x=1768646258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llTgHxeSoC7ZYOdIAtacPBR738VpZQDVSkSEuU/E5GE=;
        b=gDUvhcgCjKMm79n1xSLcV7dxtm8QNzXaJBhzWoNDVUYqjXRyLcDWrvs2yYSMsKhCSq
         ff2pIQTC4TVL1O/cVlRdbiJRJljF4ABjTyB4N1OS9ZW3duhatF9aB1eFzDOd5sNKw1Bz
         4DNvVeyGvYyx3fS+NZ3kcOQXTplOL16DRYvMhKmNPEZAjYW4Z7dQtdYWIiam2ne+iwcq
         /5nkBZmxw8GxCwJdjf9ooRkN2vO1CM7LfYtf95f7e5gpOvATvRziHfCaBgcTT4wIAG6P
         ukmSox0Axlj96IMSn0ANy9+E3HGTxYLlhoCv5/Vf6eB2uNmCgSKniM/0vi1RjSbFoZZ9
         DuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768041458; x=1768646258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=llTgHxeSoC7ZYOdIAtacPBR738VpZQDVSkSEuU/E5GE=;
        b=hU0Fp99kM5vWFvObZCAfdEDf/s21wS9eSUzw7DmCgDzsmPQDBkEbl8Bga4sfMzbKgo
         hp2rnyNyI0ihv32uDKLTJjH8YnYSRB7p91m57zb6dbTkSVUTx8bmcqDC9DzLr8zk5lRw
         2DnLdFUEPI4eAFOtQHu3Zbg/3AbrRbs4YtQd7h7P1ZrDSQl///ywQ/77NyeqHqWJQB6O
         CsP71kBh9l0boL8WoQEZ82kjvjzACnK+hPj4BpTZhQ5/9VrvV5yRTjURkzQ/r8JPEM8M
         6h8rQW3Jr/tOr1x6ibF2I1FU+SC19Po/+2RlPYwgEyEoIYrBf5oG9ogQH+eazcgGlCeO
         wxjw==
X-Gm-Message-State: AOJu0YwyvuBV/K2yd/MspKk1AYpPBwIaluF9Ko0QYiIgESdfac68aDDa
	ppnwgYZJIcX1YE64uw5MIJ88wbjmEJ13J98hBM3BmutLIm5jbo52LsP78gpeSg==
X-Gm-Gg: AY/fxX642AAJHylGHvmgBh9wrPF5xQHHHs/2L1BVfteZz+oKxiDaqyCsU/rhos1Zhwi
	3maED1WsVyaGZ+F4/56LVky5xw5DiArSEhv9QcD7kCYRo41snwQvalIQo1keIeO4wWu1iEbPcC3
	KnA4FUu7mJfAp190CYi/+mv3TOLpfR/H1WsBYzB/3IY9EXj+O0LaZTxKc0ksgvhWFqPJyz9Dj4/
	MYSjauLSrqskLt+xTeHYz96bQvyuxa/sZMPOKnImUWCNul3ZRuKJHdPEEhzDpSU8HeMeiixF4z3
	Nylcbam3HYT2k1bCMBL2ScBNG0KZjomOaQClxfij99BqNXbDSLGMf32RnMr24X+/jl1X2r8BHbn
	NB9u9niukJGP5cBDTxbfhYO79C7T/yASITU70wC3msz/Qf8Rl60UFt40BSlDzw/jPgzL8Z3XzUw
	Dws4DjlB9UI/XIKVId8hczjm0=
X-Google-Smtp-Source: AGHT+IHTyoo6IPn2WycoAzNhsxeI5aH6IkOmV9zC8QHXWcMumapUs1EeOXnzZwjJ09JI8o6nNMQW3A==
X-Received: by 2002:a05:6a00:4387:b0:81f:42d7:aba2 with SMTP id d2e1a72fcca58-81f42d7ac86mr617814b3a.11.1768041457861;
        Sat, 10 Jan 2026 02:37:37 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f46882d19sm375715b3a.63.2026.01.10.02.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 02:37:37 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/5] krb5: ignore CVE-2025-3576
Date: Sat, 10 Jan 2026 23:37:14 +1300
Message-ID: <20260110103716.3470419-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260110103716.3470419-1-ankur.tyagi85@gmail.com>
References: <20260110103716.3470419-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 10:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123322

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-3576

As mentioned[1], vulnerability is fixed since upstream 1.21

[1] https://security-tracker.debian.org/tracker/CVE-2025-3576

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
index b38a0768e1..572c33a271 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
@@ -38,6 +38,8 @@ SRC_URI[sha256sum] = "b7a4cd5ead67fb08b980b21abd150ff7217e85ea320c9ed0c6dadd3048
 CVE_PRODUCT = "kerberos"
 CVE_VERSION = "5-${PV}"
 
+CVE_STATUS[CVE-2025-3576] = "fixed-version: The vulnerability has been fixed in the current version (1.21.3)"
+
 S = "${WORKDIR}/${BP}/src"
 
 DEPENDS = "bison-native ncurses util-linux e2fsprogs e2fsprogs-native openssl"

