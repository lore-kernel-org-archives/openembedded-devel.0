Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67B4CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:42 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5091.1791839501370223830
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JhKhE9Lt;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a8adb68d8bso1491901a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839501; x=1792444301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZOpdh2ofxltEUluA4G5vv652iJgziEy/5DNpaJ57go=;
        b=JhKhE9LtU9Rd44p0fLoBPEYx5I0JAmqdm6NAtCZwto+CJ77h/ZJ+lOXicl74i+gSHQ
         XPxzwAbbYnEEbyZo9BK2A5dTtIVpt+ntC9mCBX6Nr6rrImxHL24C2JvIEiXQsKahuEkt
         /n9tTURZcmQAEaJx6LOD7aaaPOLkv1TESQQUMV0zhW6yNf4bEmiLZECZYYU1ZwAxnE0U
         VPzKsafGEHGO+4ATalCS4xhpnKjlqDv4p4u4E2w525POn2oLWY0L6NnZg9ey6yetSj8v
         JcyBlHab0vUv/FZVpoSP1m+wjLqHAghtOVgv+HYHD/yG6rTiBzSWgPaLSznAjffk2Pp5
         /L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839501; x=1792444301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AZOpdh2ofxltEUluA4G5vv652iJgziEy/5DNpaJ57go=;
        b=Tasp1sfquQ+EsI9oNKW6cRIQ4XL+NarGaQ64Scy74DsyRWYobqhK4sdoB0NHOlzeyX
         gkYzWaHx8a/4++TEUqBd+w6EH15E9ZNJDkQbjj9mN3KWuRxxolvQNIehPoWz2vvCYIhU
         rGqb905f2Hw8k9bp38aKn1yFD5KPCnwuZeOu1NyYeVvrBrqbhKdHeNt5i10aHVnDxDbm
         NFoYq18/Lx3pW8zZP+15nXKQfC4Gt6y3CKrWRrWCxtAGAKhD7cLnQifcgMdgv4VKj0Vm
         BPnCgRzpthQJTJ/qYXfLT5hqDBpuiO+UV1/F8ttntpIUy6Qo5VYuCrknLWZ5DVM2a6qe
         qooA==
X-Gm-Message-State: AFq9FYKCfQSJFm5kS78hLKNht5Z95ne0KxOtvJeSLEaeXU2LAYvBhsll
	by9KUkvE9BUTbcdI8o1CIe9sOBb6gFgaYc/E3uS9CFXn3J2+jDYXe9dnbAwbkKXy
X-Gm-Gg: AYBFou1Bq8eQK262uXOskxqVZQE9qNhrbWYFGo7FGE+N+aNpycz8Z35TiuKUyaeMsFB
	ROY0T9PjiMoG4y/lQ59kloMw5XOEfKpQWJaTjCn7VWrKf8rlRYphaFw1h3cqyX5p1eVdExLHLk4
	khTRTsR6l3mEXnarNUEGBZxF8XAwjTlTKgEzQGb3xRjY9g4oHXr4FDXpqhsVuRorMVaYWQaCcPk
	yTVLbFU3pjNNTTgYXKrXO269ZV9ugxG83jMqjtQMDs9gxH3J4RmuMo2eK35oBTxzXqDPFhK7dqj
	z4NCPCy1hfHS3oqVKF+8b8ieQFKNbjWABVxS48kdZRMmpwmRrTmgIkktmHyHmxYPf599XqE6aBO
	dUgbLkF3BOVrsAnY1YtXlbCjqtoCnx6aJSNO1hMnsY2yyMRjbm3QuC/nM8FLWnlYesGWtCfu3y2
	eguY4wxJqlMWA43uD5O1sp8mbyAykqdZpqO7v5PK8SuBrVaWZTjYYDhbgTeEGQIDLEslKo2At6W
	BPTNKuqiT3dW9jq0xvKsKib0nVTUMmMdgRmzaat3tHF9UnlGg==
X-Received: by 2002:a17:90b:1dc1:b0:3aa:f4af:1e14 with SMTP id 98e67ed59e1d1-3ab3ac7eeb8mr9403911a91.51.1791839500758;
        Mon, 12 Oct 2026 14:11:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 33/43] wolfssl: mark CVEs patched
Date: Tue, 13 Oct 2026 10:09:57 +1300
Message-ID: <20261012211009.3352822-33-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130803

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

CVE-2023-6937[1] and CVE-2024-5814[2] are patched in current version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2023-6937
https://nvd.nist.gov/vuln/detail/cve-2024-5814

[1]https://github.com/wolfSSL/wolfssl/blob/v5.6.6-stable/ChangeLog.md#vulnerabilities
[2]https://github.com/wolfSSL/wolfssl/blob/v5.7.2-stable/ChangeLog.md#vulnerabilities

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit c12fcc9b481d5fcd94db96cd062042301a4f24b1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
index 8fc6068560b..a2b41b2d3c7 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
@@ -72,3 +72,5 @@ CVE_STATUS[CVE-2026-5504] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5507] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5772] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5778] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2023-6937] = "fixed-version: fixed since v5.6.6"
+CVE_STATUS[CVE-2024-5814] = "fixed-version: fixed since v5.7.2"

