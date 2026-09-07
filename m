Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B34C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:24:29 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31703.1788776664072562844
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LboeHzt5;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2681635a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776663; x=1789381463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zh3VldVVWs3fsInDJtlX5zVLvn81jvikUkZ/QTExdW0=;
        b=LboeHzt5LseQkWgQIRR6fc64A+ilnZnSvsYoRbJG3NZpM8XmxLT/4+eMgDHoCnl630
         Du5Z2BxeNh3VsLv2kSwL16lq+kF3cmh5PjJMGLpC+3Nv3QSKzmKshOYc/M9eN3B8J/4H
         oMnKBcnopncGGGoDJ5+GvGi/wbiHLIl8WFBGdKZ+Mw5HbYUmhXBPQNLGzK1OxZS4A6HA
         XkmZoWJE69WhmNVyV0/To+mbYqozK0tSMYro71jbfaeTdfCcqZWmIGTtdtzrTDhyhGkA
         oeKxaiCrpFlxkBsLEouKfpriwrpLtIJyuNTm+ro0Pf5L9GgqT3JBX25MfaXKU4BNPArh
         6/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776663; x=1789381463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zh3VldVVWs3fsInDJtlX5zVLvn81jvikUkZ/QTExdW0=;
        b=DdB3iQyAl2A4uNK5OU54wFEWoGgS1PRYN/AU5zAQMV02bvBcrnp1jwm1Ae6ZDR7a2L
         JeHEk5BQvVp0AZ1+Z4u1qLmIhfg+zJ90WAtYeFBzk3GMBE55hBbmoz2OrDEYJH/k7m5l
         eCTXKkungPqJD8b1VivlhspCZkfjIzFdEn+0o8/95gOG70E9kxuOWAZjau8/m6cZQuYE
         8LinxvWXjmq7loh8Z/vy7DGPsoeFTJlK1I7x2oKsmqlTwbTr3+6C1gP5yYzSaG1H6mVi
         6WXAPaAPx8xgQ09UVI0I+V7dq3GjBOrFlmOEgY6oal2kDgymMZ0XhoD4yQVm4dC3DDdW
         BWRA==
X-Gm-Message-State: AFuF++lgWV3+fY4pPHjeLEfwJGdFqfPh1YyxGMT0+nL8zvmCPT6pNjTV
	cT9CPeuMXNRQjZzrNLTb9nFDaxfqz+bFoOO5dq0K4Zt2UHmKrNV+gvO2uwa2BKuM
X-Gm-Gg: AYBFou1oMhfXUASnGjQOvH5Zug76A2ViS8DNU+8+JeIPR7rCZ0UzRfJJUG6c8lx//2a
	tfTOg4e5i6DbukiOUTwxu+6+CLlUa/i8scE3RRQnpfgRAsLFKL//8YWDMSnLzG7nNH5Q1kEPybU
	8nHF19ykxmfvRfSO/Vjf8Le2gQpOw/mFfNw+X8LOg7VQlDSWQYIDAyJZUcKj0z04664+EwPyiT4
	g8BqY29TeWtUZIl1rrtM7wRv76ZkYJY590LQBjvAYAAs21cBQkHUoUXs1Pfu/24GfFZUkp5ssIW
	yC8Dw5jUhJTCVnx6PrUg2dajAQMVfZ0SHFch3yZqGcY9X6P7IZ3orKhjXtRuaq9ruoHwFv18JrS
	9JQcmvJxJxaPnx6uyOE/OavnXe0Hp0jYiYm+zuJOcjTTX3Qt01ERfdQ9KOWtp9Y6yYxZw2rLUef
	wpcllRuXY1qRYqmAu3zze46ezCKGZnxx/AEg4nTLhGeNHYVZjRQlpUqa9i3T4e/bFL1tu0CNMl
X-Received: by 2002:a17:90b:5826:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39b261b07b6mr34858412a91.10.1788776663387;
        Mon, 07 Sep 2026 03:24:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:24:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 20/33] wolfssl: mark CVEs patched
Date: Mon,  7 Sep 2026 22:23:04 +1200
Message-ID: <20260907102318.2459883-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129832

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

CVE-2023-6937[1] and CVE-2024-5814[2] are patched in current version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2023-6937
https://nvd.nist.gov/vuln/detail/cve-2024-5814

[1]https://github.com/wolfSSL/wolfssl/blob/v5.6.6-stable/ChangeLog.md#vulnerabilities
[2]https://github.com/wolfSSL/wolfssl/blob/v5.7.2-stable/ChangeLog.md#vulnerabilities

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
index 2978ff1cc1..295029246c 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.1.bb
@@ -69,3 +69,5 @@ CVE_STATUS[CVE-2026-5504] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5507] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5772] = "fixed-version: fixed in 5.9.1"
 CVE_STATUS[CVE-2026-5778] = "fixed-version: fixed in 5.9.1"
+CVE_STATUS[CVE-2023-6937] = "fixed-version: fixed since v5.6.6"
+CVE_STATUS[CVE-2024-5814] = "fixed-version: fixed since v5.7.2"

