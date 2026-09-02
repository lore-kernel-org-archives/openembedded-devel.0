Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F62C624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:56 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9349.1788343547709249339
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AmSvpIxM;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso1074231a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343547; x=1788948347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8zVPyoCBe+vl7KXLE+AA8t7aRK1svBx1A08i3bRO7c=;
        b=AmSvpIxMRGbI2WEmwfyzog7+C8PJTNUpkSh1daW1Wkkg3j+sSg8kfGbmAmuPBBuUX6
         acLIr4k/ELm9W0aHGYS/MbFu0ubOTzC3uAaeySZ9DhPX8eo+7FqGV+63gVI6+ySaaH77
         eToy/sO1is9z9d55YbPPxmmuqKeLi5FjjWtnJ/6nrHwZUzEsbImMrPQnuFRXLskIy3J4
         OSh698xoT9H2V4N8G0S0aVWvrpqE6SvWb8uKScKKqJZQXc9FkQucseC3jckIhvqWFz64
         tcgnrXyc1+SChLwI4kxk8E4oe+/N0RH9SVSnoFyu21zbyGOIDgTii0MHP17ej6q1+8ej
         Oi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343547; x=1788948347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y8zVPyoCBe+vl7KXLE+AA8t7aRK1svBx1A08i3bRO7c=;
        b=oHKURri4GpO8ihS0SZN9wmGyGhHIAXzIpUx2ebrqZIr3Muhb12PUvpDovf7vntlu+b
         2lAYJASoXC8xBOPE/g6ph04gdeYfdGt56wxqYXXVKfFVb8/oN4ahAD3LmWVlSdBlaFAX
         pSjs96URd0K9OY/TeIzWAlMpe7f4M4WhvcISUQS0sXUfIkQ+TaU/GJjomgnC7M5Z9BNb
         ucyhnFH/DkMJPcWm1lvhKLjkyv7S4apI3oHgy4q75aoPG5KE+Sg2SK39G9rqfzJjlyiR
         Y/bHzl/rUpHQ50ShHrb7bR+nOiY1nGOUy1xqd+O4N2bNqLBkhM8pa0jyLRZj1/liOz+S
         ipWQ==
X-Gm-Message-State: AFuF++ndkTy3Z4o9H0jbM/QMCLbJjVQThRW9zDS/wmjbNdws2Z2WW4tW
	sUc9Jrj6HGyUOBueVp33dQMn6L7hMiR0VibEip5K53T6+MCU6EBKn3z2xHH18g==
X-Gm-Gg: AYBFou00nOn2Q0nft69rwRGh16hsisjGf32XzP8M8LFYPZFIxtdw9kUOW1e5VxbCJDH
	D7KiNf6HRZorpmQoaxfHHrxG/BolQr4k0Rn2ncauOT8J6sA8uORfLn5k9XxcvqrtVl1Mu71c+vZ
	c0qoCgCH2mq38dcsJtkzuebS3Qj56nFW3H1KeJrOlcqEcWxgQkr9gtb5L8+wuOvUz4c8DFmaX3K
	GVhutj0z2EKVFLIj7rJLWN30cW7bw6SRS3KnAickVMiUnci/LwgL/Q03pceYIhnSxOO3CZNAQN3
	Bx9mEB9R4wnlf5ya3myA1A8AcbvHPQ+pvd+579kaLdOhGdG4hkVXUXHIl277vXXpz/YaE1HWhv6
	gvTGmSz4M0l8dBbIOzvQEJPsqbERvwijY7HdY0IMIgbuqqq4YHQcDPrd+hKPInZE7hmjDxSdk4e
	pTidinn3j6wkkCWDm3C613x2V4HjpniJzE9pp7xlsBdHIgN7CRO5j4vFXROEcgSRy1g7mlUSTjw
	+/NzSEM9Hc=
X-Received: by 2002:a17:90b:2649:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-39aee249be6mr5290460a91.25.1788343547038;
        Wed, 02 Sep 2026 03:05:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 11/28] dovecot: ignore already fixed CVEs
Date: Wed,  2 Sep 2026 22:04:53 +1200
Message-ID: <20260902100511.2105916-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129642

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Upstream has confirmed that these vulnerabilities are fixed,
and Debian has also identified the relevant commits:

CVE-2025-59028: https://security-tracker.debian.org/tracker/CVE-2025-59028
CVE-2025-59032: https://security-tracker.debian.org/tracker/CVE-2025-59032
CVE-2026-27859: https://security-tracker.debian.org/tracker/CVE-2026-27859
CVE-2026-27851: https://security-tracker.debian.org/tracker/CVE-2026-27851
CVE-2026-33603: https://security-tracker.debian.org/tracker/CVE-2026-33603
CVE-2026-40016: https://security-tracker.debian.org/tracker/CVE-2026-40016
CVE-2026-40020: https://security-tracker.debian.org/tracker/CVE-2026-40020
CVE-2026-42006: https://security-tracker.debian.org/tracker/CVE-2026-42006

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
index 6cac8de964..1edb8f50e3 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
@@ -86,3 +86,11 @@ CVE_STATUS[CVE-2026-0394] = "fixed-version: fixed since v2.4.1"
 CVE_STATUS[CVE-2026-24031] = "fixed-version: fixed since v2.4.3"
 CVE_STATUS[CVE-2026-27855] = "fixed-version: fixed since v2.4.3"
 CVE_STATUS[CVE-2026-27860] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2025-59028] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2025-59032] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2026-27859] = "fixed-version: fixed since v2.4.3"
+CVE_STATUS[CVE-2026-27851] = "fixed-version: fixed in v2.4.4"
+CVE_STATUS[CVE-2026-33603] = "fixed-version: fixed in v2.4.4"
+CVE_STATUS[CVE-2026-40016] = "fixed-version: fixed in v2.4.4"
+CVE_STATUS[CVE-2026-40020] = "fixed-version: fixed in v2.4.4"
+CVE_STATUS[CVE-2026-42006] = "fixed-version: fixed in v2.4.4"

