Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web09.6299.1627542670590215849
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 00:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sO6m1+vy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627542667; i=@fujitsu.com;
	bh=o1l5hfaudah0TWmUF+MQ5xA3Q4KF3RMrO3G/loCDmxk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sO6m1+vyjOj5ws2zerRhSU0n1eKAfTocTOe9gIX/TvRsy7Mcs1o22QVW+R7sKaioQ
	 +HTBiBqvsKW0Z4w5UxXqCztkwEAbz1y8Tfn6pr0GTUZrzFowK707X9VbYqSdnR7j3/
	 fN37aymOkNy4hp9NhYDJ4dH5qAZjUSg4YFuTUmj/+6GqSRW3gaYf5HcCdWjHPKKwR4
	 b0khzZu76y9jI2t+kr+9o3wZBOcBsvSKtXM99QJXrrJ1mIV2hcOaQ2nInLxvUqGjXk
	 i1qjeGUwR210bddgGdvp4lWNheO4O/nFY4ANlLKJX1xGWgU18Eu1gpPRPlQiB1z69w
	 EKapOwx2kAoHg==
Received: from [100.113.6.138] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id F2/09-07224-B8452016; Thu, 29 Jul 2021 07:11:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRqtsdwpR
  ocGqSgsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvF322nGgtUcFR96HjA3MC5m72Lk5BASmM0k
  Me+3UBcjF5B9glHiyt6pLCAJNgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuAWrm4BAWsJOYd
  r0WJMwioCrRvPIVWDmvgJPE1DmLwMZICChITHn4HqyVU8BZorHrORNIqxBQTctzOYhyQYmTM5
  +wQEyXkDj44gUzRKuixOzLzVBjKiRmzWpjmsDIPwtJyywkLQsYmVYxWiYVZaZnlOQmZuboGho
  Y6BoaGuua6RqZGOglVukm6aWW6ian5pUUJQJl9RLLi/WKK3OTc1L08lJLNjECgzGlkO3DDsYp
  bz7oHWKU5GBSEuX9ZceUKMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC90wwUE6wKDU9tSItMwcYG
  TBpCQ4eJRFeoQCgNG9xQWJucWY6ROoUo6KUOK8oSJ8ASCKjNA+uDRaNlxhlpYR5GRkYGIR4Cl
  KLcjNLUOVfMYpzMCoJ8z4KAprCk5lXAjf9FdBiJqDFtSWMIItLEhFSUg1MCb8S5vZ/u8CftUK
  Sz8Q0sHHzlYu8Ne9v7RcUz3jds+iCyBuxEo+7fzi+LS1LOHN+/l6VQM03KfXJV+P+Zhg90uWO
  tZpvdbQ7Kmpt0ObMnI0rrANVjTst8r0Ptp/calB8MHdv08cfE9d0vtS4+uS57eOuX2cP/Oo+c
  bHz1XqOrmy9u+HMBw49V9L5H10ZI/t+Wp1PZ32zhyLH9fmXRDNPZr5Lf+zAkf21UEf/tP0/jj
  3c9/5JmKmLTqkSfLEr195vCcfpW+YHmrouGt2pcJE9/FrFYJOVwfvQhDNm3kxL7u1KmLM9Rsd
  vStOqQOn8x0dfup2bNqkq/NLM+VtYONWEGs0u/H29+Un/LYnGZI+9SizFGYmGWsxFxYkAB1hH
  9kEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-248.messagelabs.com!1627542666!268470!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30050 invoked from network); 29 Jul 2021 07:11:07 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-6.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jul 2021 07:11:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16T7B6sT002732
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 08:11:06 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 29 Jul 2021 08:11:04 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.2.7 -> 2.2.8
Date: Thu, 29 Jul 2021 15:10:48 +0800
Message-ID: <1627542649-24816-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1627542649-24816-1-git-send-email-wangmy@fujitsu.com>
References: <1627542649-24816-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.2.7.bb => gensio_2.2.8.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.2.7.bb => gensio_2.2.8.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.2.7.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.2.8.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.2.7.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.2.8.bb
index f2a2a5fc80..4c85275f47 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.2.7.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.2.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "35c82812f2d6bb41686d49987e052b75e1836afd"
+SRCREV = "78b30dc952512c98db8c2e7e0eded2982b802b93"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=2.2.x"
 
-- 
2.25.1

