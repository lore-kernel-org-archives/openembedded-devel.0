Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5464BC433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 18:05:22 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.959.1642442721283947317
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 10:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=s+i55uvs;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sfNz22xk3vTfApkfmYdM+EiKO6gWx0hWml7uSzqe7JA=; b=s+i55uvsDn0o8rc2uLEoKVpz6o
	ip9wMQqi6dBa5oEOhoYtWv7lBuSh1hMnGbxP484ZPpVzMh9dS44hLo/ukopeDPtUkNKkeGKAxX7Kc
	cAKWqG7cl4Ptfo4s3NH9GjAvH9+1lp2cdBO7p8ZMYk/KyVxlud+nMrqTqP6NNH0SzVLlLLTEdDPrV
	imJFunGu4S6PgryDCZz+2djEV+1I0vv65rYPlfYyuilSsAM9i8f1Mqwl9DgS248ntIVzRCfGxHBUe
	w9226nJ2z0RYTlVWuDJIW8UNCjWG827nQ71U7OnV0GRfO1gp474TsAuBhoTyFOnvnIe1YP+PqKI4Y
	tx0j21xQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:57514 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n9WNs-0006Ib-Rg; Mon, 17 Jan 2022 20:05:20 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-croniter: Upgrade 1.1.0 -> 1.2.0
Date: Mon, 17 Jan 2022 20:05:05 +0200
Message-Id: <20220117180505.571730-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220117180505.571730-1-leon.anavi@konsulko.com>
References: <20220117180505.571730-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 18:05:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94904

Upgrade to release 1.2.0:

- Enforce validation for day=1. Before this release we used to
  support day=0 and it was silently glided to day=1 to support
  having both day in day in 4th field when it came to have
  6fields cron forms (second repeat). It will now raises a
  CroniterBadDateError.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_1.1.0.bb => python3-croniter_1.2.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.1.0.bb => python3-croniter_1.2.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.1.0.bb b/meta-python/recipes-devtools/python/python3-croniter_1.2.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.2.0.bb
index 6ae657fe3..13dbf155c 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "4023e4d18ced979332369964351e8f4f608c1f7c763e146b1d740002c4245247"
+SRC_URI[sha256sum] = "094422f6aeb9ed646714393503fa388afe4f846e110e1997fea5794e2085c2d7"
 
 inherit pypi setuptools3
 
-- 
2.30.2


