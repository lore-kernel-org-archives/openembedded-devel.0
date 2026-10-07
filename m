Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00428CA5FFC
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:22 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6896.1791371301604448093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VYjq/IXo;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3a7d9d9b67bso1234312a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371301; x=1791976101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehHwrKGHpKayAi3YhFi59pln+Gn5/U6qTGjrfK1jWAQ=;
        b=VYjq/IXougTlpeTT7yDOuRUHbiWPwUBWabnCR5XP2DRtQK6Om6bypd3XJiFtLjVMK9
         Q2/RCPqKn2f1pKfmZ18X9XOEqHdcCgWoBI6nwaAZldOQfZelNgqlRkXFbpeDpw4Dpx0L
         Pw9gnRoyCFjlksC6LlNMEJSvuMNeTUR8Fxfyne98A5XhCs+ufLcqkIOPiB3oEcVozgGZ
         9++NpZ+vJU96oBev2lD04ZCu7IxoQz8AX+G2ZS7wTPmNV54wxZsYeHlS2cJDbY5L10Ex
         +D3zYNvQcB1ix9YZ15Bcso1kl1q6Hzt62EmXnv+1/jvCTM5bMnia3bBc5P6o3g6ctuG3
         ojqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371301; x=1791976101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehHwrKGHpKayAi3YhFi59pln+Gn5/U6qTGjrfK1jWAQ=;
        b=ov8CVsbskw7N5wE2wl4b7JYFX1sg5f86L+VDmCbFoWk6mV3qI0Kq1I8ZIaCn1mx7iT
         JgGa9Qnd+ytJSb2eiAY0LmvsLqoOVp/LIo/YEA2vGgewyD6WZJsf9pOqyVTNNr6Yxcj4
         el7PPNaeHap7IXJlJ8xxrswdBrBT7rpd8I3HZti2evkCN1MRUSfiQZVEb9Y8vIXj0c/7
         23TahFYt3nH6vzpxw7TxYRVZuiU70e+5MA+hl5Xoyop2qfYlFlKncZtKhA7OKM4KRp1t
         5U6GgWFr3MTVos1r2f2F7f8SpiFieuvAJBdHQ3NCHaKd8DRl7zS2OuJJ+DXxN0yQF3Ug
         +kuw==
X-Gm-Message-State: AFq9FYLJrA/5bqfOSWHKC/vCQesZMPNEGmHs7PPVbm3YUXzIDLoieAlI
	yPOq3hRshO3agxmnrHwYP9NGBTNDio/dk4PxvwWsQm474kZzjOUSXBqKtFaaWA==
X-Gm-Gg: AYBFou3ThC4ZtZWaoI+6RtA9JvqNanOQXxqhoXwGGaAprFxYE5zCGDQ0wz7yXJiwoMG
	EJE1kfYBNnyItSkSz6JdhZHdYM63e955QeLmfF8+m31yvo0Lq2tuOJqpdYXKnRbsVsolisrUY/x
	xwxBvTn+bdLMSorEVI6q45uh1h2Zb1oZlAlOH/wABvhJKnwTOeGhhqw5PthUdjX88V1B2L2+csN
	/Hn8fTlDbcCpkS8PVEU3oSx5nkDhu5H6AjfNG4JoJbWaMt530bR90gbSKVfvvTjgxWnbljNWc4W
	WJ4JE2zPf/E0A4rn/c2NBcGYRSp/8SYJ6ezXsDlmESLCDQplmyHFSVaUDqeQPSKEvlVzJLiItor
	WQdDnqZ1x53xUJY46c1gK/tNiPwQ0HLLC0gJ28AMyL4vxotsFS5NaVM/3RkYXAYRmhKMOX3M7i1
	HHI4MYJvpqWLE5lgsTH218S7rpaxaxUEKsGlBq5TumPBtbVgeaTnfufFDC0EBOG/00qT1y6grM5
	GUNTGwgXWJ6lF7J8xkr9Sg=
X-Received: by 2002:a17:90b:1c06:b0:3a7:8707:a0b9 with SMTP id 98e67ed59e1d1-3a8a0dd3cccmr1439428a91.31.1791371300909;
        Wed, 07 Oct 2026 04:08:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:08:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 11/15] upower: upgrade 1.91.4 -> 1.91.5
Date: Thu,  8 Oct 2026 00:07:36 +1300
Message-ID: <20261007110740.3179543-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130653

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.freedesktop.org/upower/upower/-/blob/v1.91.5/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../upower/{upower_1.91.4.bb => upower_1.91.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/upower/{upower_1.91.4.bb => upower_1.91.5.bb} (95%)

diff --git a/meta-oe/recipes-support/upower/upower_1.91.4.bb b/meta-oe/recipes-support/upower/upower_1.91.5.bb
similarity index 95%
rename from meta-oe/recipes-support/upower/upower_1.91.4.bb
rename to meta-oe/recipes-support/upower/upower_1.91.5.bb
index acd60715dd..859527f371 100644
--- a/meta-oe/recipes-support/upower/upower_1.91.4.bb
+++ b/meta-oe/recipes-support/upower/upower_1.91.5.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 "
 
 SRC_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${PV}/${BPN}-v${PV}.tar.bz2"
-SRC_URI[sha256sum] = "de2cd848c927e267f37d1aa6b52631857055b0a1fc76c0e10e173723d83abeae"
+SRC_URI[sha256sum] = "c465a1c7fc05d00ac2bc7321c19b9b7e479410d8392bd7eb3e714275729629fd"
 S = "${UNPACKDIR}/${BPN}-v${PV}"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/tags"

