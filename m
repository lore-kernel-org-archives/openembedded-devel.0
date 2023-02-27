Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A53C7EE2D
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:10:11 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.85508.1677485395397076349
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:10:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LZxopzUI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485401; i=@fujitsu.com;
	bh=2XOeSuj5ljciThAlV68RacBa2wOkszbaZHQXHYaHZfk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LZxopzUIuQmxzJjrCTZdamxT1StsqvuReMj29/4G25KFNAUhV2If3Q6fMX7EOARqE
	 gpLkM8K7HDkFx/8OTIosGz0SjzUo4JlSa0glVeqkjAr3nUwOKbNN3goE+AjLkmvOIS
	 W0xq4nT5g4kjkWMSDuq9K1maHqtFLUmrN6pWXU+MoaC2g70kMz4LsRssSVuAfIQ6vr
	 jfz3QuYaRVWDwpYYKCuP4KSAq9AaRezTtztMmYrSYM4xMbU/H1A+QK5VRs/PA0rk3R
	 fd7rRdhtn3R1SYJqKK0Bf2PkFMF2PGCD4P5H5JWBh6sh2gaTQ67qmUSbw7eHMw2Nj+
	 pC5X1fB2FAFqw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpBuR+if
  Z4G+frsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrH1yA32gnfcFY+u3GNuYLzH1cXIxSEk8JBR
  Ys3DXiYI5wqTxKs9D5khnL2MEjf/rALKcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAncbv1ByuIzSKgKrF2cTtjFyMHB6+Ak8T1adwgYQkBBYkpD9+DtXIKOEu8WTwNrFwIqK
  TlfjPYGF4BQYmTM5+wQIyXkDj44gUzRK+ixOzLzSwQdqVE64dfULaaxNVzm5gnMArOQtI+C0n
  7AkamVYxmxalFZalFuqZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBwZtSnMywg7Gz76/eIUZJDiYlUd5FTn+ShfiS8lMqMxKLM+KLSnNSiw8xynBwK
  EnwHkwCygkWpaanVqRl5gAjCSYtwcGjJMLLbASU5i0uSMwtzkyHSJ1iVJQS5+VLBEoIgCQySv
  Pg2mDRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG9UAtAUnsy8Erjpr4AWMwEt3v7wB8j
  ikkSElFQD0+Tad6a/d525NtGDY/L8qWZ+GtKpk5ye9y27zvtDSIDtsNqxd//uBfx1rti8VPX7
  1TczhNK8D/VU3OdVLwwOFn4fq/jgtM3Zg5cuM4gXN6YkunBqxTrcaM6xOrAheH1wYE5Ro8ifu
  DvymVoy33evepUmHrp4h/xBZ7V+qdT8L1dtuywcLdx+fEhcnuEdfSRm0rGo6v0/HojL7wycdG
  brg5lzu805TCTubzW0/vjxzyWdvf4e5dF3JQSS+mO+Ln6eOqNq4tq8ln1+86QzPW6Gn9QTYG0
  O1A6TXhKY0vGuP/CeWEnM8k8sj6/feZO2MjxlukGT70cON8PWvTIXunkCU7Sl9B/zRP70fSK8
  fVOQEktxRqKhFnNRcSIA1p7E71kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1677485400!211654!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29434 invoked from network); 27 Feb 2023 08:10:00 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:10:00 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2042E1AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:10:00 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1449A7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:10:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:09:58 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 1.10.4 -> 1.10.5
Date: Mon, 27 Feb 2023 16:09:40 +0800
Message-ID: <1677485381-11595-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485381-11595-1-git-send-email-wangmy@fujitsu.com>
References: <1677485381-11595-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101281

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 Fix broken parametrized bases handling with GenericModels with complex sets of models
 Invalidate mypy cache if plugin config changes
 Fix RecursionError when deep-copying dataclass types wrapped by pydantic
 Fix X | Y union syntax breaking GenericModel
 Switch coverage badge to show coverage for this branch/release

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydantic_1.10.4.bb => python3-pydantic_1.10.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_1.10.4.bb => python3-pydantic_1.10.5.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.10.4.bb b/meta-python/recipes-devtools/python/python3-pydantic_1.10.5.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pydantic_1.10.4.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_1.10.5.bb
index c17f3024c..77e94a9bb 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_1.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_1.10.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c02ea30650b91528657db64baea1757"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b9a3859f24eb4e097502a3be1fb4b2abb79b6103dd9e2e0edb70613a4459a648"
+SRC_URI[sha256sum] = "9e337ac83686645a46db0e825acceea8e02fca4062483f40e9ae178e8bd1103a"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-typing-extensions \
-- 
2.34.1


