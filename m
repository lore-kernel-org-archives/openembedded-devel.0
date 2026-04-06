Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F147EF4EDA
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 12:03:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53490.1775477008001255010
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 05:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VktQvMyB;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so2048960f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775477006; x=1776081806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwaagKKHEUGO2q2Oj1LzDdVGw49Eo+7X0uKtnMbjosw=;
        b=VktQvMyBQYkKmjXoto9v/LIe7iizuFtglq2tVcz/w7VSgfxrg+psol7MAfwZJyH+zl
         oF8IL85lhrNdfxy6sq7wfs8S8/paCIqbwZ5RY2ohosmMDWiBg2TJfcJciA/JeCScjAI4
         ty2DYd58UclJAqdMSMFxjdFiKYiIYDWGSESRoHoZEPddkSnPxILbGKcD0gtQT6gM6Dyg
         gqypSRv2ijh6UZwS1z5KA7lRKvXu1uC5yJImMms34aRBlqqRLUfMyLa6qlfqAJsTfPmj
         t9bes8uk3ldcVvyLkeprjLMAOLegBsUHfuS+wT74AzJz8stm2SzI8K0DSIkZfAWRsbNw
         P2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775477006; x=1776081806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WwaagKKHEUGO2q2Oj1LzDdVGw49Eo+7X0uKtnMbjosw=;
        b=UyHw6P8o1JvdDhBoN51YHPKzcbUsTW7zBs/tXTbTEL0iHtrpRHN1oKZ5j7RNX46Fg9
         nsU+N64BXOqmBVW1IRcA75zlmCgpWZZqmWYs8y8fF8vvQaRsitSocUdr7qcRELK5PcvH
         HkOC/eov0hsyy+ThiHya3/FJtwn75oA6OWcvZrpeQXifnQxyfkEiDlmMsGmTi86cvltG
         ZrAX0AKMH/e1kUwqi4UxMVAMnKBx7Ijfv0DLw9LwYOkzpxPrtRM61loJK4HgT5Jr0wcJ
         GGckLTCHJoUXZi42h/ihVs8NFRYl2Znqampsg0lD+zlK7UtYv4ST1NkFUCSp4CB9QXkn
         7C5A==
X-Gm-Message-State: AOJu0YzZ1gy5WIbeoGqGci53QHmoMN8k5q8r1+Xn16Wgz4dTDlV73vBD
	SqUf/HNsGUw8L0cS3/wYP+f4QPreC4AInyok8bsHK1fnwiIupDUynvBtzliOLA==
X-Gm-Gg: AeBDievrSgZCYxMUHrkbH5vMMtxykbQFJbbC2idHQhKWxR211RcH/EcDFDhwgxjvC96
	/QbvYnp8sD67QI4vtoR6piP+V8rdV9JwIK+5aBsOazF1M6Cqj591JU2CfCcWsm2JExNtCJqFkel
	w7oEovACMt+gUUw+mPl9jJx/WcAntnq5ra6yUaQKoRtDPPXdrrMU+zUirSb4N6JLtSvlMLuMoaM
	G7P2HYvoE79nR0kQwb8cjBjAvAQ7Q2rXuHnqbEQqjpjXWYfo2e95u9/TwASX1TpOieuQZesh6K+
	Z20pCtDTXd7bfy3TYblw28MlvRwr/U8haoGZxA6bZ9cvq9DSi2Eg4E0BVmjjcyr/bAvOJUZUz1j
	lRtV0wGEjCHx6OIi1eq3DMwhs0HRVcFwbF57QgZyQIDR1cMAnNz53oBTGWn/X8L1LkGMBtYmrow
	gGzczaYwRkzCuQmX5+KvYM
X-Received: by 2002:a05:6000:2c0a:b0:43d:14cb:8470 with SMTP id ffacd0b85a97d-43d2930630dmr18131997f8f.46.1775477006239;
        Mon, 06 Apr 2026 05:03:26 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f843dsm38673310f8f.37.2026.04.06.05.03.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:03:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/7] giflib: mark CVE-2026-23868 patched
Date: Mon,  6 Apr 2026 14:03:12 +0200
Message-ID: <20260406120314.3514982-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406120314.3514982-1-skandigraun@gmail.com>
References: <20260406120314.3514982-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 12:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126042

The fix[1] that is referenced by the NVD advisory is
already included in the current recipe version.

[1]: https://sourceforge.net/p/giflib/code/ci/f5b7267aed3665ef025c13823e454170d031c106/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb b/meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb
index 77f8905358..9cb2a51879 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb
@@ -26,3 +26,5 @@ FILES:${PN}-utils = "${bindir}"
 BBCLASSEXTEND = "native"
 
 RDEPENDS:${PN}-utils = "perl"
+
+CVE_STATUS[CVE-2026-23868] = "fixed-version: fixed since v6.1.2"

