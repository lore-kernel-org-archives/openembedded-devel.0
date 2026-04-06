Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8460F46C4D
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 15:13:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57247.1775488386866218965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 08:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ODm8tJaR;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so38094705e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 08:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775488385; x=1776093185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+8cyGx4i5i4fr5cPIE/0jxs5fNFQb74p767tKXeOmho=;
        b=ODm8tJaRaFMuAVByTSRtxEKdd025ZmrPSqCpvGLr5h2vtEjzNqSJeIuh1RmIuGYgVj
         9iSocLBKN4GAJtZ2HVGk7Vk+M9IyCGdAvIn9DPJO74h38n5Vk8va6+kqXnX55+0jl3Vt
         pT9oIt9d8Lc2efLSqD9hg3+GWVeaS2I5I8rvCxCBgxEzEfzgkDi84u4tjkDtIZLW68EB
         VqsdP+mXCVp4QgoFEdrybrug2gjUG87Q/iexuyrHYeU04ZEIeFhRRb9TxR4imvL0J/HM
         lXhQO3zh+gr7jSbxgFVWWjOIZVRtsWX/FW8q8A6KMjfAWHBTP5xY8IYeZmDSFK1mveBR
         4xDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775488385; x=1776093185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8cyGx4i5i4fr5cPIE/0jxs5fNFQb74p767tKXeOmho=;
        b=cSlj5oz2xbvafHCdGjFD27jxKKTTP/++CabUTjWXvJtyaGYugoPLnYQ2d22m6uNU17
         rujoOCE3rPq94tfYaMM/Erv0nbbji58fMykx09pRyd548U/4YrBgTfCrg03RNLuPs0bW
         wc42FsUg2ClndNSabXgX0w8+HAFvY04CDnT1Myq/UEh/SzHPCyLy89Y+tYLesXHGjelO
         WFV+6x5223UE9SXkERvRn+6JzYURNNc5MMef/H1Ld94afLin2DleQOMtHtmit9BLambS
         +qTazVr89FpF9GteZ38EMRxgxf59KVi/xX23Vo4KO7DkzJK7ud4FqAAtu+U1HPdrjQGb
         5acg==
X-Gm-Message-State: AOJu0Yxp8oQtvBXTlggeFIl3i6QeZV64/4ILvd+ghslqJprLVoSex8bf
	kAUZxIn/SlE9f5Q1j7gMfUsIWsPygT7pOXZCfqGbdThEAhD8xtsSexVhrUD//g==
X-Gm-Gg: AeBDievra5vSnnnIRiK43ZD2EJtOIZ2YRBmC7E6I1R9F64ZQFLGLOiAj8huxezmyMt7
	ZJXqhCQ2EqZcsduJ+8+VbOTiLZ+8tbTpm8d66VQjljb8WC6+C9xVC52y7Khjrtz6SWFHsV7chCC
	U/5yzOwRBV4YgRNdwEFBR3LJjTS8bne/rD/Q+RoN9tl4SPD6pliev562OUkF35BQtEhZOuEqUNp
	xRXtFPAotQR0wxTGdbqdvWvQUvoKkVe+WeX5LpF3GDeXdocF0tShJI1ikv6rGWkfQmgTykZSyVz
	FY7BLYnyi7/2p5jfLFNjeGR//RlMV69EagpciH2xfB7K4Yg3SOM8tSmHEL/DTztcr0aznUGU+xA
	54gNM13a64VfP/56xgq0s0hHMjrUwd4UZAmK0NRbKACAxNu1oNBwIuiBonK9ccPxFwxHQ9tElRZ
	Ofg16n45GTyp2Ho92Qv0ER
X-Received: by 2002:a05:600c:4886:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-488a797f2d4mr60009215e9.28.1775488384954;
        Mon, 06 Apr 2026 08:13:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b6ff70bcsm92848765e9.14.2026.04.06.08.13.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 08:13:04 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] nodejs: ignore fixed CVEs
Date: Mon,  6 Apr 2026 17:13:00 +0200
Message-ID: <20260406151303.3640343-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 15:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126047

All these CVEs are fixed in v22.22.2[1], except for CVE-2026-21712,
which does not affect v22 series, because it was introduced in a
later version[2]. All these CVEs are tracked without version info
by NVD at the time of creating this patch.

[1]: https://github.com/nodejs/node/blob/v22.x/doc/changelogs/CHANGELOG_V22.md
[2]: https://nodejs.org/en/blog/vulnerability/march-2026-security-releases

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
index 8bd5f008af..e6dbc866a1 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
@@ -214,3 +214,10 @@ python __anonymous () {
 }
 
 BBCLASSEXTEND = "native"
+
+CVE_STATUS[CVE-2026-21712] = "cpe-incorrect: only v24 and v25 are affected"
+CVE_STATUS[CVE-2026-21713] = "fixed-version: fixed since v22.22.2"
+CVE_STATUS[CVE-2026-21714] = "fixed-version: fixed since v22.22.2"
+CVE_STATUS[CVE-2026-21715] = "fixed-version: fixed since v22.22.2"
+CVE_STATUS[CVE-2026-21716] = "fixed-version: fixed since v22.22.2"
+CVE_STATUS[CVE-2026-21717] = "fixed-version: fixed since v22.22.2"

