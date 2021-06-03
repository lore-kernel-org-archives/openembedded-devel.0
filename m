Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web11.5706.1622714323370554474
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 02:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OOyp/qSe;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622714321; i=@fujitsu.com;
	bh=yUv6tGji3LMKkYv2MJqoPAh7ZehrQT2FWhrjCv0JrgA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OOyp/qSeCKooqyQ/OB28KNp5sNQVT9JI+HrDoy22+PcqZgSKjr8W4o2bczCXlN+HT
	 Q/72bM6NlzlhbRXVBoDUeYxJtEjr53GcCEagWE23C//v53Wlnu4r48ANDHwTuHNEwE
	 TnjfX7f9JAHEfjfBMcP9sP2jK/0pCgt3tSRelSD3maSzSi6Fbu+a7yCAWJVVLhyuHP
	 QJsk+rfTfDwLxxlxx/EgsAv3ol41RCCq9AOGwkgL2X27sHs05PefC4lwoGVFviwknB
	 B/QUcMYugMRvR6fgkksGoTbKShljuIDq6BA+iMwWO7Uc/EWPum6zdhu64asZuiq6zk
	 3bGv0nAeqbd9Q==
Received: from [100.112.194.111] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 62/08-02276-0D7A8B06; Thu, 03 Jun 2021 09:58:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYonth+Y4
  Eg6UHVSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owJJwMLNnFUXNq3jbWBcRV7FyMnh5DALCaJ
  L3eNuxi5gOzdjBL/GhazgCTYBHQlzj1eC1YkIqAvsXT2HmYQW1jATmLykWNgNouAisTKw8/B6
  nkF3CVuPmgAsyUEFCSmPHzPDBEXlDg58wlYnFlAQuLgixdAcQ6gGkWJ2dPlIcorJGbM2MY2gZ
  FnFpKOWUg6FjAyrWK0SCrKTM8oyU3MzNE1NDDQNTQ00jW0NNI1MjDRS6zSTdRLLdUtTy0u0TX
  USywv1iuuzE3OSdHLSy3ZxAgMoZSCA2d2MJ56/UHvEKMkB5OSKO+d9h0JQnxJ+SmVGYnFGfFF
  pTmpxYcYZTg4lCR4LZcB5QSLUtNTK9Iyc4DhDJOW4OBREuGdshgozVtckJhbnJkOkTrFqCglz
  lsF0icAksgozYNrg8XQJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvF4gU3gy80rgpr8CWs
  wEtFjAaxvI4pJEhJRUA1OQUvXKO/NyeYuX6IdzB78+rNkm2KS8giNKY1OCyFbN2m2NRsoHL1Z
  Ub1LYIOt6csNq5tq5R+/vyrzSXpPlbJ/XlSK+p7Bs8terWxQXnH9wsW3tH0H7awcfhl6cXrE/
  kEejwCVCsd0ky/yemu/v/8XKXHfeH2jaOlV9/8+tnI94o9tkurW1BQuj9ihP//h/noRK7FRGd
  5abfT825Lg9zC58a6t5mP/kQ5e4k6cXqXXf5gmc/eZc9FnhGqFD9uq/mDfGOZ60Lj2bVxQmr/
  JGurgt9tpvbulF72uOtgZOjzn58XXdr4eKzSIBdeZZlTeNJSqzpD7cXDmdd8YHP27RGSHZX1W
  FxCdZHpuoLVtYp8RSnJFoqMVcVJwIADH4nVAcAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-267.messagelabs.com!1622714320!146060!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32469 invoked from network); 3 Jun 2021 09:58:40 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2021 09:58:40 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1539wX2I029834
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Jun 2021 10:58:40 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 10:58:38 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.2.5 -> 2.2.7
Date: Fri, 4 Jun 2021 02:58:28 +0800
Message-ID: <1622746708-4409-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../gensio/{gensio_2.2.5.bb => gensio_2.2.7.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.2.5.bb => gensio_2.2.7.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.2.5.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.2.7.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.2.5.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.2.7.bb
index 271a668751..f2a2a5fc80 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.2.5.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.2.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "ed307629e067a9ef55d79beec9c9f67b86efbaaf"
+SRCREV = "35c82812f2d6bb41686d49987e052b75e1836afd"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=2.2.x"
 
-- 
2.25.1

