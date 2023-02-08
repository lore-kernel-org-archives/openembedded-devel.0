Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B33C6379F
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:14:35 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.3833.1675844069121889771
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q5Vnfeqp;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675844072; i=@fujitsu.com;
	bh=u1F3hOFhXFdzYz+thM2KbHV5YKa9Ji3Sm7g/b+vGVvo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=q5VnfeqpT4SuL11c9x5RAxB2XJf2CNLBdf/yQ9a2wyd20DdrrCZ2qiXvb/6P0MZDE
	 sAkkZ960vC4IpvZ2v1bzpdTpbb6MDkgGUhl7mhn5E0pz8IUE7JCcAW7f4GVKO8sTNG
	 3fMqUeEzcm6Gwwjgnb2uqv/0TKid4gLBMv/4siD8a1xMmatuRODm1vuC7FBDWWCk/h
	 OAW/oj9ZwbvEuSSvKD+CFk76mGYbJy26ha0PrNlgPJby8rQDlyyJH7Fwn5xHK8+E+K
	 E83jMU5X4lQHz8K2zGKU3hqodiAQayGc/VtJR96z1YmjrF4GeK7/53stscG4K0pjmV
	 UzX8EdCZ7E2QA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWfd55ON
  kg/6J+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8btA6+ZC+ZwVXy64dDAeJCzi5GLQ0jgIaPE
  rKkf2SGcq0wSx1v2M0I4exglWpt3sHQxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAvMbP3HlgNC1B8+9WXYHFeASeJh+cmMYHYEgIKElMevgfr5RRwljh86jQriC0EVHO0Zw
  kjRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7UqL1wy8oW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRtPi1KKy1CJdE72kosz0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzU
  kk2MwNBNKVY8toPxX+9fvUOMkhxMSqK8nmKPk4X4kvJTKjMSizPii0pzUosPMcpwcChJ8EaEA
  +UEi1LTUyvSMnOAcQSTluDgURLhjQTGkhBvcUFibnFmOkTqFKOilDjvgQighABIIqM0D64NFr
  uXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzBoQBTeHJzCuBm/4KaDET0OIQ1Ycgi0sSEVJ
  SDUwzF8hwSx04Z6b77L64NDsH2wmx2Hy/S6eWxOw1kezdebX5nv6zH2YHlmaoO65MqHqaIdEf
  FmP/t/ZP1LOOhk0/znbnnm7jPX3x7dfJlmaGKydlqF0Jyj5Wo+nO+XX9s9ruUJ3F/xxvnm5xO
  zxd3nWT1Y1O1t57O1eucpGf+SiYZcGlIs/vjP1Lfn5IjEkWv7DFTP1g8rxN2R2hT6vbvj8pDT
  w6q0XnYfn+nV1i68LN9WZVzGA+Jtn95oH14Uwd/k0b6qZfm8SRGn1Q0Pn+2iK+I2+W7l6zIGp
  6XHimDlfden+F2xGT215qf/Y684xno6DLHb8LIkumLdsXFThJ4pOdstX3QyEHOh1v9+rdnjpN
  iaU4I9FQi7moOBEAhwgmylgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-565.messagelabs.com!1675844071!620838!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27141 invoked from network); 8 Feb 2023 08:14:31 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:14:31 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 757CE150
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:14:31 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 692D6142
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:14:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:14:29 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-portalocker: upgrade 2.6.0 -> 2.7.0
Date: Wed, 8 Feb 2023 16:14:12 +0800
Message-ID: <1675844052-11401-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675844052-11401-1-git-send-email-wangmy@fujitsu.com>
References: <1675844052-11401-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100992

From: Wang Mingyu <wangmy@fujitsu.com>

Added fail_when_locked=False support to BoundedSemaphore.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-portalocker_2.6.0.bb => python3-portalocker_2.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python3-portalocker/{python3-portalocker_2.6.0.bb => python3-portalocker_2.7.0.bb} (80%)

diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.6.0.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.7.0.bb
similarity index 80%
rename from meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.6.0.bb
rename to meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.7.0.bb
index 1762ae3a5..03c4f2f40 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.6.0.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_2.7.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=152634da660a374ca18c0734ed07c63c"
 
-SRC_URI[sha256sum] = "964f6830fb42a74b5d32bce99ed37d8308c1d7d44ddf18f3dd89f4680de97b39"
+SRC_URI[sha256sum] = "032e81d534a88ec1736d03f780ba073f047a06c478b06e2937486f334e955c51"
 
 inherit pypi setuptools3
 
-- 
2.34.1


