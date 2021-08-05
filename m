Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web09.3693.1628129071690419051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 19:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MDdGahwj;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628129069; i=@fujitsu.com;
	bh=1wg9NN9BpEa+eQpwrNGES8Py4NDuuV1BuwWlow2AUz8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MDdGahwjWhytQS/3efNxIcMQY0USY/WNQETWKAdpQcDkG1l3U6UV/ofUilWFCjyMV
	 8uP9i1WTu511umXSgZlimKiUWW893ybIXjPKxirSYNHR7ULIvxhZvU3YRgc5ykmH++
	 Iv8MBRtvZXLCyTBmOzM2JlhBVyZL92mxJD/44mYhiKuy0cbcIrXqS0G5np98Pi2dIw
	 4fE7oTbpvp2zcmOAj4xoBW5hvKLIz58qoWNVotYBb6tOANc6kJsuq6lBOe6Wmr0BPO
	 PUSHvP0HAOJvB4p/Dbcn4p8Mc5Z1bK1XfjV9O6COdpo+d+I7rIWBMo8y0OJ1F7qtya
	 y/+hCUVOgkpug==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 20/3C-13315-C274B016; Thu, 05 Aug 2021 02:04:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRqqvjzp1
  ocPG5hMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjGhdR5rwU2OisOH3zI2MH5j72Lk4hASmMUk
  0Xj8BiuEc5xRouP4BsYuRk4ONgE1iem3QBKcHCIC+hJLZ+9hBrGZBVQkXvzuAerm4BAW8JbYu
  MscJMwCFO6eco4FxOYVcJSYe+wgWLmEgILElIfvmSHighInZz5hgRgjIXHwxQuoGkWJ2ZebWS
  DsColZs9qYJjDyzkLSMgtJywJGplWMlklFmekZJbmJmTm6hgYGuoaGxrpA0thAL7FKN1EvtVQ
  3OTWvpCgRKKuXWF6sV1yZm5yTopeXWrKJERhgKYUMTTsY3736oHeIUZKDSUmU94MEd6IQX1J+
  SmVGYnFGfFFpTmrxIUYZDg4lCd42V6CcYFFqempFWmYOMNhh0hIcPEoivPzOQGne4oLE3OLMd
  IjUKUZFKXHedDeghABIIqM0D64NFmGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz5oBs58
  nMK4Gb/gpoMRPQ4guxnCCLSxIRUlINTPO+qQsUFzkx7P4191m1ypq+EJOYsILi9Ytn/ux+c2X
  lqwPywW+NrQ5o1ZfFvT8Z9ObHJH/emhnOJY9cQvaxWywS+ixt5bzjTOcFt4Nn8l48U22Mvbjg
  QNxZk+ZZPgWmXx6zbToQdjfmw/7oZ9mO1kwzzz5wYrnDIuY5r06vvX/Vkvslh52ncblWt7+W0
  f4+rbIvXiPceLFzzbYP5jlTZdK5BfgYuGyXLEvh+uxu9bvnjLrBvo27i4Kv7Er0UjiREnRpne
  QxPfaidOZi77arvTZSjWzNvBGpXkbfpqTNXRwV8iz+olF5yzSRd43FxcoZuz1OPTezcw0WWp4
  nH2P6vs2Fc9qa+ELNvHvpd2YrsRRnJBpqMRcVJwIAd4a0xSsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-232.messagelabs.com!1628129067!86991!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6703 invoked from network); 5 Aug 2021 02:04:28 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-3.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 02:04:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17524MtG008057
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 03:04:27 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 03:04:20 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] fetchmail: upgrade 6.4.19 -> 6.4.20
Date: Thu, 5 Aug 2021 10:04:08 +0800
Message-ID: <1628129049-4619-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fetchmail/{fetchmail_6.4.19.bb => fetchmail_6.4.20.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.19.bb => fetchmail_6.4.20.bb} (91%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.19.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.20.bb
similarity index 91%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.19.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.20.bb
index 8fc9b5d10..13d91b4d5 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.19.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.20.bb
@@ -12,7 +12,7 @@ DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "cd8d11a3d103e50caa2ec64bcda6307eb3d0783a4d4dfd88e668b81aaf9d6b5f"
+SRC_URI[sha256sum] = "c82141ae2e8f0039ceb0c5c2eda43c5e93ad0bf7f9c6bb628092b3be74386176"
 
 inherit autotools gettext python3-dir python3native
 
-- 
2.25.1

