Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2C4C7EE2D
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:08:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.85527.1677485274976910115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xl5rD1KP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485273; i=@fujitsu.com;
	bh=bo1JbFfU5Z4LDMhQRn7eIgCV+IZQLYZKNGwcbOGk31s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xl5rD1KPVHxs4HTM9yAyE/sWXx/O0XXkmeaIyXw6FD9asy5pPFOqq17WkMdynqqgF
	 ynDvUha4E2Bg1G4psokyWDTP4TjJAhLQki2dNruEgacpNGn3EtmDSHFWd8ZifXkiNz
	 L2BAxF/o30oNYnhSFA5ukjTO7tg7Zi+aQkma+WJioF7tmMzQ3YwFDqMH0lK6tRNfam
	 AYVAvFPrUBhSWr8hSY5TpcrS0XYBsUYLA+GehncQs5OZodD4mp7RqrvyGxpBFpNDqV
	 jgo4SLPOwGaI0RUbOg1U/LkItLH/dexJtjnqjJ8UjHuCqrQIR7SqSnTO6wUumTQ+w+
	 fD7lDwIS7VQ6Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpHsj5U+
  ywbs2TYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPWpfdMBWc5Kz4dWsbewHifo4uRi0NI4CGj
  RO+ET+wQzlUmiZU/XzFDOHsZJT7N2QuU4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8es
  BphAQ+JnZfawWwWAVWJ+c83M4HYvAJOEufWzwbrlRBQkJjy8D1YL6eAs8TVlm6weiGgms0Hz0
  DVC0qcnPmEBWK+hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUjaFzAyrWI
  0K04tKkst0jXWSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknRy0st
  2cQIDN+U4kShHYzfev/qHWKU5GBSEuVd5PQnWYgvKT+lMiOxOCO+qDQntfgQowwHh5IE78Eko
  JxgUWp6akVaZg4wlmDSEhw8SiK8zEZAad7igsTc4sx0iNQpRkUpcV6+RKCEAEgiozQPrg0Wv5
  cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNGJQBN4cnMK4Gb/gpoMRPQ4u0Pf4AsLklESEk
  1MO3Qkdr1676B25oITfXKR7FydWt3LtiiqJcRv3BW7VX13TaPdJS+hx300mjPeZlU86iDn/VK
  tefvxKNrVfbeXLh5V9nXZzLscb+2cP4INVzyLtpyF+uTA5/V5rfvuCrmfmFp6RZ1i28y3O2mn
  ZFrKg0W7BcJ+PRiS224ns633/ZdT79/5Ymf8LSuNLTU1pRj61uWXC+hnC3T+SJXfHZ4e+dPUh
  zXAr5sLud61XVlItpMB14wxj0MM0xfMHN+TMHTvHdTbIzrE+4mN7QvSTimnvHl8dOUlUvMefw
  6dvg19sSs2H3609LGjObTd8pnuB2fq2zXfla/9kDc09cfEnMniS8s9t/15frNNXe+BHa6eSqx
  FGckGmoxFxUnAgDH9Jv3WgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-728.messagelabs.com!1677485272!192973!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26560 invoked from network); 27 Feb 2023 08:07:52 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:07:52 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0F1571AD
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:07:52 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 035A01AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:07:52 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:07:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-huey: upgrade 2.4.4 -> 2.4.5
Date: Mon, 27 Feb 2023 16:07:33 +0800
Message-ID: <1677485254-11554-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485254-11554-1-git-send-email-wangmy@fujitsu.com>
References: <1677485254-11554-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101276

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Improves propagation of errors in task results and includes fix for newer versions of pip.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_2.4.4.bb => python3-huey_2.4.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.4.4.bb => python3-huey_2.4.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.4.4.bb b/meta-python/recipes-devtools/python/python3-huey_2.4.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-huey_2.4.4.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.4.5.bb
index 2f433814e..dbddd6cb8 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.4.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "6a27a7862a7a982c0508ad4e548d95765e3b0d97093a51106f07540837a09c86"
+SRC_URI[sha256sum] = "760cf150deff1fa34b852da37701a5a750d1148f03ea07aa2b3764dc6060b4c3"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.34.1


