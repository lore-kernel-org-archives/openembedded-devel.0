Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CFCC98320
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 09:46:18 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5752.1768643177615201251
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 01:46:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RHvG3KXA;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bc29d64b39dso977116a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 01:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768643177; x=1769247977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19ZlMrjgjJ2dzMqrOHnTNThms21przPO/K8lMKw2Avk=;
        b=RHvG3KXAXlx+q8CdzC7SIRzEJzLJpBGjBSBAbTpbIZBWpBQX7oCwxGxw4GOztXypq0
         5HplQW1a+1vR41/59tKfkjDqHiiMdljuvRJeea1JYgIxRKdj1PhzBwT92dvkWbVOCY7l
         /DMQuIR4VYFOO94u9RrEvn4az8fN9CjF6LhbD/gpmFjmgKkUXIowWQN46iEAFisCqR/q
         66UQqB2UHIi5e7UnWAiOmTR0nO5ntp9dXy6gvjFeB1vyTQR8cCoGniHtgUS8PIXRyvng
         3S0jyqz9nZkAj2YFes7zN6q0hTQ8XrGaWpCUOhbxgGkg6srqs2beiHXLz1riE/sWnWwD
         u0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768643177; x=1769247977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19ZlMrjgjJ2dzMqrOHnTNThms21przPO/K8lMKw2Avk=;
        b=LpRdsNB5GUcpT0eJSN3u2dTGihPCcAPHdYBb9dAI1aRp1g0w1BB7s83XMDFsGZvm9O
         BRtc19p1jE95iNaDzx1nn/v5Wa0reJY26PWPKq7g9teWyNwB+xbj4gYxI2DjXPSCyiYw
         ZQwO3Tfj9x9hh+iBIdWpUpIcvqIQShL4B6Xw953FJpFnRNbxov+M2B1NP3R4GZtDXpke
         pHEw2ShV6X22ktVw4pmSbrCdA61gD/ppsySodh1oDH7NMWEaU92zUQ4yAssvt5llkLAU
         RrMM3A8aySIxbH4jlUImW/ADiyYW16l6VPcKtGv4aeJJ46zeWxDEJMRPBVDTkDizWNOT
         CqZQ==
X-Gm-Message-State: AOJu0YxpOEffxf63zU8Sz77ZYK/mDrzr6KUWS+2TOd8PwPvn/rSuXDLO
	1woYQplMIKBS8ei47txDbYqFJLclRwjh1+8WWv7AXgeu5J+QAt4DxkY2TMGnl03h
X-Gm-Gg: AY/fxX5adWOayy7AfuuF1uhvPsynYRYlcbGODIqXgJhMDZJW4duqI1MuRCmDX8uf3jc
	pn/WYqOqvPk8mjs3zeXRMevLPqseW32+zmhqlQ9vq/bg1hsSX34hIStYcyyJVSKa7QzlhRdXPoc
	gfULcKlk0os/r7c/KPCSxlZTzv3itYKuHvZnT5v/qH5Um7a1Lv1GTzOlOdlJ5jquHh5vNNEvDBT
	8fLACdx7lyf9ed14F+YD3Y5byF5vNrdw/Pv1OWxFX9EXZPj1eOIVRNtPZoHhe0Gpg3RE4XqKDQo
	mBRDryjizpoHc1bgsCMJuUIkYP3fIJj/XJ9eADWehdkZ6uw+MrXJ4TEf95mbsuXv+vYJ0nxaNPA
	E1+0QGpwFhO45k4Ywy7/DiLCHkT8RAac2r+zBKRmQQ9y3IkmdHCkUZFENjWsKgZol3u8wNhW7YF
	YL6IhEAXBoi31CFthxGjHzzes=
X-Received: by 2002:a17:903:18c:b0:2a0:dabc:1383 with SMTP id d9443c01a7336-2a718883888mr47183065ad.14.1768643176809;
        Sat, 17 Jan 2026 01:46:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9ee9sm42289845ad.22.2026.01.17.01.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 01:46:16 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 5/6] boinc-client: mark CVE-2013-2018 patched
Date: Sat, 17 Jan 2026 22:45:34 +1300
Message-ID: <20260117094535.4191231-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117094535.4191231-1-ankur.tyagi85@gmail.com>
References: <20260117094535.4191231-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 09:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123551

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2013-2018

According to oss-security email[1], version 7.0.45 included
the fixes[2][3][4]

[1]: https://www.openwall.com/lists/oss-security/2013/04/29/11
[2]: https://github.com/BOINC/boinc/commit/6e205de096da83b12ffb2f0183b43e51261eb0c4
[3]: https://github.com/BOINC/boinc/commit/e8d6c33fe158129a5616e18eb84a7a9d44aca15f
[4]: https://github.com/BOINC/boinc/commit/ce3110489bc139b8218252ba1cb0862d69f72ae3

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2a78ad8813845677132ad0f1552fcaa4961c3e15)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index f995fa443f..0b17b71137 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -31,6 +31,7 @@ DEPENDS = "curl \
 "
 
 CVE_PRODUCT = "boinc_client"
+CVE_STATUS[CVE-2013-2018] = "fixed-version: fixed in version 7.0.45 and later"
 
 SRCREV = "4774e1cbe0ad13cb9a6f7fffbb626a417316f61d"
 BRANCH = "client_release/7/7.20"

